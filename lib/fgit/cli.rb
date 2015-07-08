require "thor"

module Fgit
  class CLI < Thor
    include Common

    desc "ls BRANCH FILE_NAME", "list file in the given branch"
    def ls(source_branch=nil, file_name)
      branch = source_branch.nil? ? "HEAD" : "#{source_branch}"

      real_file_paths = `#{ls_command(branch, file_name)}`

      if real_file_paths.empty?
        $stderr.puts "[Error] #{file_name} can not be found！<branch: #{branch}>"
      else
        puts real_file_paths
      end
      real_file_paths
    end

    desc "cp BRANCH FILE_NAME", "copy file from the given branch, with --force -f option: force to copy all files"
    method_option :force, :type => :boolean, :aliases => "-f"
    def cp(source_branch, file_name)
      if !options[:force] && status = local_changes
        puts "[Warning] There are unstaged local changes."
        puts status
        print "Copy files may override these changes. Continue? [yN]:"
        return unless !!(STDIN.gets.chomp =~ /^\s*[yY]\s*$/)
      end

      real_file_paths = ls(source_branch, file_name)

      if !options[:force]
        file_count = real_file_paths.split.compact.size
        file_string = file_count <= 1 ? "file" : "files"
        print "Copy #{file_count} #{file_string} above to current branch? [yN]:"
        return unless !!(STDIN.gets.chomp =~ /^\s*[yY]\s*$/)
      end

      unless real_file_paths.empty?
        puts "Handling..."
        `#{cp_command(source_branch, file_name)}`
        puts "Done."
      end
    end
  end
end
