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
        /punch the clock\z/,
        description: "Punch the clock on JOBCAN",
        name: "punch_clock",
      )

      on(
        /punch the clock at (?<group_name>.+)\z/,
        description: "Punch the clock on JOBCAN with gourp alias",
        name: "punch_clock_at",
      )

      on(
        /clock in\z/,
        description: "Clock in on JOBCAN",
        name: "clock_in",
      )

      on(
        /clock in at (?<group_name>.+)\z/,
        description: "Clock in on JOBCAN with gourp alias",
        name: "clock_in_at",
      )

      on(
        /clock out\z/,
        description: "Clock out on JOBCAN",
        name: "clock_out",
      )

      on(
        /clock out at (?<group_name>.+)\z/,
        description: "Clock out on JOBCAN with gourp alias",
        name: "clock_out_at",
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

      def punch_clock(message)
        Ruboty::Actions::Jobcan.new(message).punch_clock
      end

      def punch_clock_at(message)
        Ruboty::Actions::Jobcan.new(message).punch_clock_at
      end

      def clock_in(message)
        Ruboty::Actions::Jobcan.new(message).clock_in
      end

      def clock_in_at(message)
        Ruboty::Actions::Jobcan.new(message).clock_in_at
      end

      def clock_out(message)
        Ruboty::Actions::Jobcan.new(message).clock_out
      end

      def clock_out_at(message)
        Ruboty::Actions::Jobcan.new(message).clock_out_at
      end
    end
  end
end
