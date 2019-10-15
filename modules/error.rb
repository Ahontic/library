# Defining Module error
module Error
  # Defining NotFoundSuchEntity class
  class NotFoundSuchEntity < StandardError
    def initialize
      super( puts 'Such entity was not found')
    end
  end
end
