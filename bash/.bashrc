source ~/Scripts/bash_env/language.sh
source ~/Scripts/bash_env/paths.sh
source ~/Scripts/bash_env/platform.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/david/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /home/david/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/david/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /home/david/.config/yarn/global/node_modules/tabtab/.completions/sls.bash