# coding: utf-8

module IssuePriorityPatch
  
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do     
      has_and_belongs_to_many :projects, :join_table => :project_priorities
    end
  end
  
  module ClassMethods
    def foo
      p 'foo'
    end
  end
  
  module InstanceMethods
    def bar
      p 'bar'
    end
  end
end