class Mailer

  @creds = YAML::load_file(File.expand_path("../../../config/.creds.yaml", __FILE__))

  def self.send_mail()

    sender = @creds['sender']
    date = Time.now.strftime("%A %B %e, %Y")

    options = {
      :address        => 'smtp.gmail.com',
      :port           => 587,
      :domain         => 'gmail.com',
      :user_name      => @creds['username'],
      :password       => @creds['password'],
      :authentication => 'plain'
    }

    Mail.defaults do
      delivery_method :smtp, options
    end

    $chore_tasks.keys.each do |key|
      Mail.deliver do
        to $chore_tasks[key][:contact]
        from sender
        subject "Daily Chore for #{date}"
        body "#{key},\n \n Your chore for today is to #{$chore_tasks[key][:chore]}.\n \n Your Daily Chore Nanny"
      end
    end

  end

end

