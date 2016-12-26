module Ruboty
  module Handlers
    class Jobcan < Base
      on(
        /remember my jobcan code (?<code>[0-9a-f]{32})\z/,
        description: "Remember sender's JOBCAN code",
        name: "remember_code",
      )

      on(
        /remember my jobcan group id (?<group_id>\d+)\z/,
        description: "Remember sender's JOBCAN group ID",
        name: "remember_group_id",
      )

      on(
        /register my jobcan group alias (?<group_name>.+?) -> (?<group_id>\d+)\z/,
        description: "Create alias to JOBCAN group ID",
        name: "register_group_alias",
      )

      on(
        /clock (?<in_out>in|out)(?: at (?<group_name>.+))?\z/,
        description: "Clock in/out on JOBCAN (at group)",
        name: "clock_in_out",
      )

      def remember_code(message)
        Ruboty::Actions::Jobcan.new(message).remember_code
      end

      def remember_group_id(message)
        Ruboty::Actions::Jobcan.new(message).remember_group_id
      end

      def register_group_alias(message)
        Ruboty::Actions::Jobcan.new(message).register_group_alias
      end

      def clock_in_out(message)
        Ruboty::Actions::Jobcan.new(message).clock_in_out
      end
    end
  end
end
