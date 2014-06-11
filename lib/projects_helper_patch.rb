# coding: utf-8

module ProjectsHelperPatch
  
  def self.included(base)
    base.send(:include, InstanceMethods)
    
    base.class_eval do
      unloadable
      
      alias_method_chain :project_settings_tabs, :priorities_tab
    end
  end
  
  module InstanceMethods
    def project_settings_tabs_with_priorities_tab
      tabs = project_settings_tabs_without_priorities_tab
      tabs << {:name => 'issue_priorities', :action => :manage_issue_priorities,
        :partial => 'projects/settings/issue_priorities', :label => :project_issue_priorities}
    end
  end
end