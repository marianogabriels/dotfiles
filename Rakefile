desc "install all dotfiles in home directory aggresive script"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  replace_all = true
  skiped_files = %w[Rakefile README.md cliboard LICENSE oh-my-zsh]
  files = Dir['*'] - skiped_files
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  #elsif file =~ /zshrc$/ # copy zshrc instead of link
  #  puts "copying ~/.#{file}"
  #  system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    if file =~ /subtitle/
      system %Q{ln -s "$PWD/#{file}" "$HOME/#{file}"}
    else
      system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
    end
  end
end


def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    optional "switch to zsh? (recommended)" do
      puts "switching to zsh"
      system %Q{ chsh -s /usr/bin/zsh }
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    optional "install oh-my-zsh?" do
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    end
  end
end

def optional(answer)
  print "#{answer} [ynq]"
  case $stdin.gets.chomp
  when 'y'
    yield
  when 'q'
    exit
  else
    puts "skiping #{answer}"
  end
end
