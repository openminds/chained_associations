module Defv
  module ChainedAssociations
    module Scopes
      def self.included(base)
        base.alias_method_chain :method_missing, :association_chain
      end
      
      def method_missing_with_association_chain(method, *args)
        if proxy_scope.reflections.include?(method)
          ids = find(:all, :include => method).map(&method).flatten.map(&:id)
          proxy_scope.reflections[method].klass.scoped(:conditions => {:id => ids})
        else
          method_missing_without_association_chain(method, *args)
        end
      end
    end
  end
end

ActiveRecord::NamedScope::Scope.class_eval { include Defv::ChainedAssociations::Scopes }