require 'redmine'
require 'settings_helper'

ActionDispatch::Callbacks.to_prepare do 
  IssuesController.send(:include, IssuesControllerPatch)
  
  require_dependency 'issue'
  require_dependency 'issue_priority'
  require_dependency 'project'
  require_dependency 'project_patch'
  require_dependency 'issue_priority_patch'
  require_dependency 'projects_helper'
  require_dependency 'projects_helper_patch'
  
  unless IssuePriority.included_modules.include? IssuePriorityPatch
    IssuePriority::send(:include, IssuePriorityPatch)
  end
  
  unless Project.included_modules.include? ProjectPatch
    Project::send(:include, ProjectPatch)
  end
  
  unless ProjectsHelper.included_modules.include? ProjectsHelperPatch
    ProjectsHelper::send(:include, ProjectsHelperPatch)
  end
end

Redmine::Plugin.register :project_priorities do
  name 'Project Priorities plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
