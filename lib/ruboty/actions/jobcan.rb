require "faraday"
require "faraday_middleware"
require "faraday-cookie_jar"
require "jbcn"

module Ruboty
  module Actions
    class Jobcan
      NAMESPACE = "jobcan"

      attr_reader :message

      def initialize(message)
        @message = message
      end

      def remember_code
        user_data["code"] = message[:code]
        message.reply("I remember.")
      end

      def remember_group_id
        user_data["group_id"] = message[:group_id]
        message.reply("I remember.")
      end

      def register_group_alias
        user_data["alias_#{message[:group_name]}"] = message[:group_id]
        message.reply("I registered alias #{message[:group_name]} to ID #{message[:group_id]}.")
      end

      def clock_in_out
        unless client
          message.reply("I don't know your JOBCAN login info.")
          return
        end

        if (group_name = message[:group_name])
          unless (group_id = user_data["alias_#{group_name}"])
            message.reply("I don't know that JOBCAN group alias '#{group_name}'.")
            return
          end
        else
          unless (group_id = user_data["group_id"])
            message.reply("I don't know your JOBCAN group ID.")
            return
          end
        end

        result = client.clock(message[:in_out].to_sym, group_id: group_id)
        unless result.is_a?(Hash) && (current_status = result["current_status"])
          message.reply("I got unknown response from JOBCAN: #{result}.")
          return
        end

        message.reply("OK, your current status is #{current_status}.")
      end

      private

      def client
        unless instance_variable_defined?(:@client)
          if (credentials = code_credentials || user_credentials)
            @client = Jbcn::Client.new
            @client.authenticate(credentials)
          else
            @client = nil
          end
        end
        @client
      end

      def code_credentials
        if (code = user_data["code"])
          Jbcn::CodeCredentials.new(code)
        else
          nil
        end
      end

      def user_credentials
        if login_env_present?
          Jbcn::UserCredentials.new(
            client_id: ENV["RUBOTY_JOBCAN_CLIENT_ID"],
            username: ENV["RUBOTY_JOBCAN_USERNAME"] || ENV["RUBOTY_JOBCAN_EMAIL"],
            password: ENV["RUBOTY_JOBCAN_PASSWORD"])
        else
          nil
        end
      end

      def user_data
        brain_space = message.robot.brain.data[NAMESPACE] ||= {}
        brain_space[message.from_name] ||= {}
      end

      def login_env_present?
        !!(
          ENV["RUBOTY_JOBCAN_CLIENT_ID"] &&
          ENV["RUBOTY_JOBCAN_PASSWORD"] &&
          (ENV["RUBOTY_JOBCAN_USERNAME"] || ENV["RUBOTY_JOBCAN_EMAIL"])
        )
      end
    end
  end
end
