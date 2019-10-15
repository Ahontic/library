# Save/read module
module Storage
  PATH = './db'.freeze
  def save
    FileUtils.mkdir_p(PATH) unless Dir.exists?(PATH)
    File.open(File.join(Dir.pwd, PATH, 'data.yml'), 'w') { |file| file.write(self.to_yaml) }
  end

  def read
    YAML.safe_load(File.read('data.yml'))
  end
end
