class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :summary, length: { in: 6..60 }
  validates :detail, length: { in: 6..3000 }
  validates :issue_type, presence: true
  validates :priority, presence: true
  validates :assigned_person, presence: true
  validates :status, presence: true

  mount_uploader :image, ImageUploader

  enum priority: { Low: 0, Medium: 1, High: 2, Urgent: 3 }
  $statuses = ['Init', 'Assigned', 'Doing', 'Done']

  scope :search, ->(project, summary, type) {
    @project = project
    @leader = User.find(@project.owner_id)
    @pmembers = ProjectMember.where(project_id: @project)
    @summary_param = summary.to_s.downcase
    @type_param = type.to_s.downcase

    if @summary_param.present? && @type_param.blank?
      @project.issues.where("lower(summary) LIKE ?", "%#{@summary_param}%")

    elsif @type_param.present? && @summary_param.blank?
      @project.issues.where("lower(issue_type) LIKE ?", "%#{@type_param}%")

    elsif @summary_param.present? && @type_param.present?
      @project.issues.where("lower(summary) LIKE ? AND lower(issue_type) LIKE ?",
                                "%#{@summary_param}%", "%#{@type_param}%")
    end
  }

end
