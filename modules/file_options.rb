# Save/read module
module FileOptions
  def save_data
    File.open('data.yml', 'w') { |file| file.write(data.to_yaml) }
  end

  def read_data
    data = YAML.safe_load(File.read('data.yml'))
  end
end
