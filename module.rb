module ModuleOne
  class << self
    def name
      'This in name inside ModuleOne'
    end
  end
  module ModuleModuleOne
    class << self
      def name
        'This is name inside ModuleModuleOne'
      end

      def call_outside
        ModuleOne.name
      end

      def call_inside
        name
      end
    end
  end
end

