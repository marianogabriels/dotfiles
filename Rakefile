desc "Install all dotfiles in home directory (aggressive script)"
task :install do
  install_oh_my_zsh
  switch_to_zsh
  install_vim_plug
  install_fzf

  replace_all = true
  skipped_files = %w[Rakefile README.md spec clipboard LICENSE oh-my-zsh]
  dotfiles = Dir['*'] - skipped_files

  dotfiles.each do |file|
    process_dotfile(file, replace_all)
  end
end

def process_dotfile(file, replace_all)
  ensure_directory_exists(file)

  if file == "init.vim"
    link_nvim_init(file)
  elsif File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
    handle_existing_file(file, replace_all)
  else
    link_file(file)
  end
end

def ensure_directory_exists(file)
  system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
end

def handle_existing_file(file, replace_all)
  target = File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
  
  if File.identical?(file, target)
    puts "identical ~/.#{file.sub(/\.erb$/, '')}"
  elsif replace_all
    replace_file(file)
  else
    prompt_replace_file(file)
  end
end

def prompt_replace_file(file)
  print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
  case $stdin.gets.chomp
  when 'a'
    replace_file(file)
  when 'y'
    replace_file(file)
  when 'q'
    exit
  else
    puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def install_fzf
  fzf_dir = "#{ENV['HOME']}/.fzf/"
  unless File.directory?(fzf_dir)
    system %Q{git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install}
  end
end

def install_vim_plug
  if File.directory?("#{ENV['HOME']}/.vim/bundle")
    puts "Vim Plug bundle already exists, skipping installation."
  else
    system %Q{curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim}
  end
end

def link_file(file)
  target = ".#{file.sub(/\.erb$/, '')}"
  if file =~ /.erb$/
    generate_file_from_erb(file, target)
  else
    create_symlink(file, target)
  end
end

def generate_file_from_erb(file, target)
  puts "generating ~/.#{target}"
  File.open(File.join(ENV['HOME'], target), 'w') do |new_file|
    new_file.write ERB.new(File.read(file)).result(binding)
  end
end

def create_symlink(file, target)
  puts "linking ~/.#{target}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/#{target}"}
end

def link_nvim_init(file)
  nvim_config_dir = "#{ENV['HOME']}/.config/nvim"
  source_path = "#{Dir.pwd}/#{file}"

  target_path = "#{nvim_config_dir}/init.vim"
  if File.symlink?(target_path) && File.readlink(target_path) == source_path
    puts "identical #{target_path}"
  else
    system %Q{mkdir -p "#{nvim_config_dir}"}
    system %Q{ln -sf "$PWD/#{file}" "#{target_path}"}
    puts "linking #{file} to #{target_path}"
  end
end

def switch_to_zsh
  if ENV["SHELL"] =~ /zsh/
    puts "using zsh"
  else
    optional "switch to zsh? (recommended)" do
      puts "switching to zsh"
      system %Q{chsh -s /usr/bin/zsh}
    end
  end
end

def install_oh_my_zsh
  zsh_dir = File.join(ENV['HOME'], ".oh-my-zsh")
  if File.exist?(zsh_dir)
    puts "found ~/.oh-my-zsh"
  else
    optional "install oh-my-zsh?" do
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    end
  end
end

def optional(question)
  print "#{question} [ynq] "
  case $stdin.gets.chomp
  when 'y'
    yield
  when 'q'
    exit
  else
    puts "skipping #{question}"
  end
end
