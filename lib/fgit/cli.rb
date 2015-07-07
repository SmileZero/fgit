require "thor"

module Fgit
  class CLI < Thor
    desc "list BRANCH FILE_NAME", "list file in the given branch from origin"
    def list(source_branch=nil, file_name)
      branch = source_branch.nil? ? "HEAD" : "origin/#{source_branch}"
      command= "git ls-tree -r --name-only #{branch} | grep '#{file_name}'"

      real_file_paths = `#{command}`

      if real_file_paths.empty?
        puts "[Error] File:#{file_name} can not be found！"
      else
        puts real_file_paths
      end
    end
  end
end
