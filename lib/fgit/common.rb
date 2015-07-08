module Fgit
  module Common
    private

    def local_changes
      status = `git status -s`

      return nil if status.empty?
      status
    end

    def ls_command(branch, file_name)
      ls_commands = []
      ls_commands << "git ls-tree -r --name-only #{branch}"
      ls_commands << "grep -E '^(.*/)*#{file_name}$'"
      ls_commands.join("|")
    end

    def cp_command(branch, file_name)
      cp_commands = []
      cp_commands << ls_command(branch, file_name)
      cp_commands << "xargs git checkout #{branch}"
      cp_commands.join("|")
    end
  end
end
