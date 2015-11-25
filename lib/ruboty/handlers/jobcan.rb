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
        /punch the clock\z/,
        description: "Punch the clock on JOBCAN",
        name: "punch_clock",
      )

      on(
        /clock in\z/,
        description: "Clock in on JOBCAN",
        name: "clock_in",
      )

      on(
        /clock out\z/,
        description: "Clock out on JOBCAN",
        name: "clock_out",
      )

      def remember_code(message)
        Ruboty::Actions::Jobcan.new(message).remember_code
      end

      def remember_group_id(message)
        Ruboty::Actions::Jobcan.new(message).remember_group_id
      end

      def punch_clock(message)
        Ruboty::Actions::Jobcan.new(message).punch_clock
      end

      def clock_in(message)
        Ruboty::Actions::Jobcan.new(message).clock_in
      end

      def clock_out(message)
        Ruboty::Actions::Jobcan.new(message).clock_out
      end
    end
  end
end
