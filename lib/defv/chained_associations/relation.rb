module Defv
  module ChainedAssociations
    module Relation
      def method_missing(method, *args, &block)
        if @klass.reflections.include?(method)
          ids = includes(method).map(&method).flatten.map(&:id)
          @klass.reflections[method].klass.where(:id => ids)
        else
          super
        end
      end
    end
  end
end

ActiveRecord::Relation.class_eval { include Defv::ChainedAssociations::Relation }