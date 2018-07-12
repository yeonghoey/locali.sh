brew bundle --verbose --file=<(cat <<EOF

tap 'caskroom/cask'
brew 'r'
cask 'rstudio'

EOF
)

defaults write org.R-project.R force.LANG 'en_US.UTF-8'

readonly PACKAGES=(
  '"car"'
  '"caret"'
  '"ISLR"'
  '"faraway"'
  '"ggplot2"'
  '"leaps"'
  '"lmtest"'
  '"mlbench"'
  '"rmarkdown"'
  '"servr"'
)

readonly PKGS="c($(IFS=','; echo "${PACKAGES[*]}"))"
Rscript -e "install.packages(${PKGS}, repos = 'https://cran.rstudio.com')"


localrc 'R' << EOF
alias rmdv2='Rscript -e "servr::rmdv2()" -b'
EOF
