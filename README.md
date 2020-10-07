# README

# Tracker

## Overview

Issue tracking service that specializes in tracking issues and bugs for the software projects. You can state issues and feature request.

### concept

Issue Tracking System

### version

Ruby 2.6.5 Rails 5.2.4.4

## Catalog design

<https://docs.google.com/spreadsheets/d/1kYtQSW86ZoTOPtnzgrpwVtif05IgUs5wtGHZEzym81c/edit?usp=sharing>

## List of Functions

- [ ] Login function
- [ ] User registration function
  - [ ] Username, email address and password required
- [ ] Project list display function
  - [ ] Show the number of issues
  - [ ] Show the number of members
- [ ] Project creating function
  - [ ] Project name and description required
- [ ] Project member invitation function
- [ ] Project editing function
- [ ] Project deletion function
  - [ ] Project editing and project deletion can only be performed by the project leader
- [ ] Issues list display function
  - [ ] Show the name of the associated project
  - [ ] Show the members of that project
- [ ] Issue posting function
  - [ ] Issue summary, type, priority, assigned person, status, due date required
- [ ] Issue editing function (mainly for status)
- [ ] Issue closing function (if the issue is fixed)
  - [ ] Issue closing function can only be performed by issue submitted person
- [ ] Comment posting function
  - [ ] Comment for the associated issue
- [ ] Comment editing function
- [ ] Comment deletion function
  - [ ] Comment editing and comment deletion are possible only for the commenter

## table definition

## ER diagram

## Screen transition diagram

## Screen wireframe

## Use predetermined gem

- devise
- bcrypt
- carrierwave
- mini_magick
- rspec
