require 'pathname'
require 'fileutils'

Dir.chdir(__dir__)

def mk_pairs(list, src_prefix = '', dest_prefix = '')
  list.map do |name|
    {
      src: "#{__dir__}/#{src_prefix}#{'/' unless src_prefix.empty?}#{name}",
      dest: "#{Dir.home}/#{dest_prefix}#{'/' unless dest_prefix.empty?}#{name}"
    }
  end
end

simple = ['.tmux.conf', '.tmux', '.zshrc', '.zsh', '.emacs.d', '.vimrc', '.vim', '.gitconfig']
simple = mk_pairs(simple)

scripts = Pathname.glob('scripts/*').map(&:basename).map(&:to_s)
scripts = mk_pairs(scripts, 'scripts', '.local/bin')

config = Pathname.glob('.config/*').map(&:basename).map(&:to_s)
config = mk_pairs(config, '.config', '.config')

dotfiles = simple + scripts + config

def colorize(s)
  "\033[38;5;86m#{s}\033[0m"
end

label = colorize('[setup]')

def yN(msg)
  print msg
  ok = STDIN.gets.chomp
  ok == 'y' || ok == 'Y'
end

task :install do
  puts "#{label} submodule updating..."
  sh 'git submodule update --init --recursive'
  puts "#{label} symboric link setting..."
  dotfiles.map do |dotfile|
    if File.symlink?(dotfile[:dest])
      puts '  symlink exists: ' + dotfile[:dest]
    elsif File.exists?(dotfile[:dest])
      puts '  file exists: ' + dotfile[:dest]
    elsif File.directory?(dotfile[:dest])
      puts '  dir exists: ' + dotfile[:dest]
    else
      FileUtils.mkdir_p(File.dirname(dotfile[:dest]))
      File.symlink(dotfile[:src], dotfile[:dest])
    end
  end
  if RUBY_PLATFORM =~ /darwin/
    if yN("#{label} Are you ok to run `brew bundle`? (y/N) ") then
      Dir.chdir('brew')
      sh "./install.sh"
      Dir.chdir(__dir__)
    end
  end
  puts "#{label} done."
end

task :uninstall do
  puts "#{label} uninstalling..."
  dotfiles.map do |dotfile|
    if File.symlink?(dotfile[:dest]) && File.readlink(dotfile[:dest]) == dotfile[:src]
      File.unlink(dotfile[:dest])
      puts "  unlink: #{dotfile[:dest]}"
    end
  end
  puts "#{label} done."
end

task :update do
  puts "#{label} dotfiles updating..."
  sh "git pull"
  puts "#{label} submodules updating..."
  sh "git submodule update --init --recursive"
  puts "#{label} done."
end

task :upgrade do
  submodules = `git submodule status | awk '{print $2}'`.split
  if ARGV[1] == "all"
    if yN("#{label} Would upgrade all submodules. ok? (y/N) ")
      sh "git submodule foreach git pull origin master"
      sh "git submodule foreach git submodule update --init --recursive"
      puts "#{label} done."
    else
      puts "#{label} abort."
    end
  else
    puts "#{label} Please choose which submodule you want to upgrade:"
    submodules.each_with_index do |m, i|
      puts "  #{i}: #{m}"
    end
    print "#{colorize("number>")} "
    n = nil
    begin
      n = Integer(STDIN.gets.chomp)
    rescue ArgumentError
    end
    if n != nil && submodules[n] != nil
      Dir.chdir(submodules[n])
      sh "git pull origin master"
      Dir.chdir(__dir__)
      puts "#{label} done."
    else
      puts "#{label} Please select from (0..#{submodules.size - 1}). abort."
    end
  end
end

task :clean do
  sh "git clean -n -d -X"
  if yN("#{label} These files whould be removed. ok? (y/N) ")
    puts "#{label} cleaning..."
    sh "git clean -f -d -X"
    puts "#{label} done."
  else
    puts "#{label} abort."
  end
end

task default: [:install]
