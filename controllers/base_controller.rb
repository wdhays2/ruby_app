LOG_DIR_PATH = File.dirname(__FILE__) + '/../logs/'

class BaseController
  def self._log(file_name, data)
    file_path = LOG_DIR_PATH + file_name + '.txt'
    File.open(file_path, 'a') { |file| file.write(data + "\n") }
  end
end
