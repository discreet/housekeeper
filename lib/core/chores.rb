class Chores

  def self.get_chores()

    housemates = YAML::load_file(File.expand_path("../../../config/config.yaml", __FILE__))

    $chore_tasks = Hash.new

    housemates.keys.each do |key|
      chore_count = housemates[key]['chores'].count
      randomize = Random.new
      chore_number = randomize.rand(0...chore_count)
      chore_name = housemates[key]['chores'][chore_number]

      $chore_tasks[key] = Hash.new
      $chore_tasks[key][:contact] = housemates[key]['contact']
      $chore_tasks[key][:chore] = chore_name
    end

  end

end
