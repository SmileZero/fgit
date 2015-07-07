require "thor"

module Fgit
  class CLI < Thor
    desc "ls BRANCH FILE_NAME", "list file in the given branch"
    def ls(source_branch=nil, file_name)
      branch = source_branch.nil? ? "HEAD" : "#{source_branch}"
      command= "git ls-tree -r --name-only #{branch} | grep -E '^(.*/)*#{file_name}$'"

      real_file_paths = `#{command}`

      if real_file_paths.empty?
        $stderr.puts "[Error] #{file_name} can not be found！<branch: #{source_branch}>"
      else
        puts real_file_paths
      end
      real_file_paths
    end

    desc "cp BRANCH FILE_NAME", "copy file from the given branch"
    def cp(source_branch, file_name)
      status = `git status -s`

      unless status.empty?
        $stderr.puts "[Warning] Please commit or stash your local changes."
        $stderr.puts status
        return
      end

      real_file_paths = ls(source_branch, file_name)
      unless real_file_paths.empty?
        copy_command = "git ls-tree -r --name-only #{source_branch} | grep -E '^(.*/)*#{file_name}$' | xargs git checkout #{source_branch}"
        puts "Handling..."
        `#{copy_command}`
        puts "Done."
      end
    end
  end
end
