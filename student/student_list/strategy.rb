require 'json'
require 'yaml'

class Strategy
	def read(filepath)
		raise NotImplementedError, "Метод должен быть реализован в подклассе"
	end

	def write(filepath, data)
		raise NotImplementedError, "Метод должен быть реализован в подклассе"
	end
end