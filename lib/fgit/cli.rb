require "thor"

module Fgit
  class CLI < Thor
    desc "ls BRANCH FILE_NAME", "list file in the given branch"
    def ls(source_branch=nil, file_name)
      branch = source_branch.nil? ? "HEAD" : "#{source_branch}"
      command= "git ls-tree -r --name-only #{branch} | grep -E '^(.*/)*#{file_name}$'"

      real_file_paths = `#{command}`

      if real_file_paths.empty?
        puts "[Error] File: #{file_name} can not be found！"
      else
        puts real_file_paths
      end
      real_file_paths
    end

    desc "cp BRANCH FILE_NAME", "copy file from the given branch"
    def cp(source_branch, file_name)
      real_file_paths = ls(source_branch, file_name)
      real_file_paths.split.compact.each do |file_path|
        copy_command = "git checkout #{source_branch} #{file_path}"
        system copy_command
      end
    end
  end
end
