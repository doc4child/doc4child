install.packages("pacman")
install.packages("downlit")
install.packages("bookdown", dependencies = TRUE)
install.packages('knitr', dependencies = TRUE)
library("pacman")
library("bookdown")
p_load(rmarkdown, bookdown, servr)

tinytex::install_tinytex()

install.packages("rmarkdown")
install.packages("bookdown")
install.packages("tinytex")
tinytex::install_tinytex()



list.of.packages <- c(
  "tidyverse",
  "timetk",
  "tibbletime",
  "tidyquant",
  "xts",
  "lubridate",
  "R6",
  "here",
  "rprojroot")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/ ', dependencies = TRUE)

for (i.pack in 1:length(list.of.packages)){
  suppressMessages(require(list.of.packages[i.pack], character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
}

update.packages(ask = FALSE)
remotes::install_github("noamross/redoc")


redoc::dedoc("R:/R/Bookdown/Manuscript.docx")



# Debugging
# If an error occurs when compiling a LaTeX to PDF, and the error message is not clear, please follow these steps one by one until the problem is gone.

# Update all your R and LaTeX packages:

  update.packages(ask = FALSE, checkBuilt = TRUE)
tinytex::tlmgr_update()
# If you see an error message like “tlmgr: Remote repository is newer than local (2018 < 2019)” when updating LaTeX packages, it means your TinyTeX is too old now, and you need to reinstall it for a newer version:

  tinytex::reinstall_tinytex()
# If neither updating nor reinstalling solves the problem, set the option in R:

  options(tinytex.verbose = TRUE)
# before you compile the document. This may show additional messages to help you debug the problem. If you are using R Markdown and the Knit button in RStudio, you should set the option in a code chunk in the R Markdown document.

```{r, include=FALSE}
options(tinytex.verbose = TRUE)
```
# You can, and perhaps should, remove this option after you finish debugging (to silence LaTeX, because you no longer need to read the full log).

# If none of these steps work, please follow the guide to report your problem. In case you are too busy, please remember the most important thing when reporting problems: a minimal reproducible example.



#Upon building book following error was occuring
# Warning message:
#   In grSoftVersion() :
#   unable to load shared object '/usr/local/lib/R/modules//R_X11.so':
#   libXt.so.6: cannot open shared object file: No such file or directory

# Did following which fixed this error--->
#
# Fist became root in the docker container runing rstudio
#
# docker exec -it rstudio /bin/bash
#
# apt update
# apt install libxtst6 libxt6
# ln -s /usr/local/lib/R/lib/libR.so /lib/x86_64-linux-gnu/libR.so

# also install Latex components for creating pdf files

# sudo apt-get install -y texlive-xetex


# setup doc4child git nicumanual repository
#
#
#change here

###########################################

# To run git through R studio on oraclecloud

############################################

#git setup from within rstudio terminal
git config --global user.name "Jaimin Patel"
git config --global user.email "29556646+doc4child@users.noreply.github.com"
git config --global init.defaultBranch main
git config --list

copy file using winscp to /volumes/rstudio/home directory
then go to terminal connected to oc
docker exec -it rstudio /bin/bash
apt-get update.
sudo apt install openssh-client
cd /home/doc4child
mkdir .ssh
chown doc4child:doc4child . # this is needed so that host finderprint can be written to known hosts file.


copy id_rsa to .ssh directory # from /volumes/rstudio/home directory and then delete id_rsa from home directory

ssh -T git@github.com # to check if the ssh works it worked.

now go navigate to /volumes/rstudio/home and then copy

  # copy them to rstudio user's ssh directory.
  # root@rstudio:/home/rstudio# cp /home/rstudio/id_rsa /home/doc4child/.ssh/id_rsa
  # root@rstudio:/home/rstudio# cp /home/rstudio/id_rsa.pub /home/doc4child/.ssh/id_rsa.pub

##USE GIT STASH

git stash list # to list all stashes
git stash save stashchange
git stash apply n  # where n is the number

git stash clear # to remove all stashes


# docker cp id_rsa rstudio:/home/rstudio/.ssh




# click on Git tab through rstudio > More > Shell to get Terminal.
# Then run following command through R in terminal

# doc4child@7aa78cdkjs:$ git config --global user.email "29556646+doc4child@users.noreply.github.com"
# doc4child@7aa78cdkjs:$ git config --global user.name "doc4child"

# First look for id_rsa and id_rsa.pub files in the ubuntu server.
# gladiator@main-server:~$ cd ~/.ssh
# gladiator@main-server:~/.ssh$ ls
# authorized_keys  id_rsa  id_rsa.pub  known_hosts

# Now copy those files to the hosted directory in rstudio
# gladiator@main-server:~/.ssh$ cp ~/.ssh/id_rsa.pub /volumes/rstudio/home
# gladiator@main-server:~/.ssh$ cp ~/.ssh/id_rsa /volumes/rstudio/home

# Now become root in rstudio. the same files are hosted under /home/rstudio inside that container since that folder is mapped on host directory /volueme/rstudio/home
# gladiator@main-server:~/.ssh$ docker exec -it rstudio /bin/bash

# install ssh-client
# apt update
# apt-get install ssh-client

# Look for those files
# root@7aa78c9e1e6d:/# cd /home/rstudio
# root@7aa78c9e1e6d:/home/rstudio# ls
# id_rsa  id_rsa.pub  projects

# copy them to rstudio user's ssh directory.
# root@7aa78c9e1e6d:/home/rstudio# cp /home/rstudio/id_rsa /home/doc4child/.ssh/id_rsa
# root@7aa78c9e1e6d:/home/rstudio# cp /home/rstudio/id_rsa.pub /home/doc4child/.ssh/id_rsa.pub

#####################################################

# On host machine (Ubuntu) install calibre
#
# sudo apt install calibre
# ebook-convert NICU-Manual.epub NICU-Manual.mobi


# This one I did not try:
#   docker exec -it rstudio /bin/bash
# Then
#   apt update
#  apt install calibre
# once this one is done may be following command will work from Rstudio on website
# calibre('NICU-Manual.epub', 'mobi')


