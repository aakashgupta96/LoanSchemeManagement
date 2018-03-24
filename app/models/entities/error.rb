module Entities
  class Error
    attr_accessor :message, :code

    def initialize
      self.code = ErrorCodes::FAILURE
      self.message = "Something went wrong!"
    end

    class ErrorCodes
      FAILURE = 0
      SUCCESS = 1
    end


  end


end