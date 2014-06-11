# coding: utf-8

module ProjectPatch
  
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      has_and_belongs_to_many :issue_priorities, :join_table => :project_priorities
    end
  end 
  
  module ClassMethods 
  end
  
  module InstanceMethods
  end
end