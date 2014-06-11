# coding: utf-8

class ProjectPrioritiesController < ApplicationController
  unloadable
  
  before_filter :find_project
  before_filter :require_admin
  
  def update
    if request.put? && params[:issue_priorities]
      Project.transaction do
        @project.issue_priorities.clear
        params[:issue_priorities].each do |priority_id|
          priority_obj = IssuePriority.find priority_id
          @project.issue_priorities << priority_obj
        end
        flash[:notice] = l(:notice_successful_update)
      end
    end
    
    redirect_to settings_project_path(@project, :tab => 'issue_priorities')
  end
  
  def destroy
    if request.delete? 
      Project.transaction { @project.issue_priorities.clear }
    end
    
    redirect_to settings_project_path(@project, :tab => 'issue_priorities')
  end
end