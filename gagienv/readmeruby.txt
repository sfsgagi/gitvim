Startuje se:
cd pf3
bundle install
bundle exec rake jobs:work
rails s

Po novom:
cd pf3
bundle install
foreman start

Morao sam da promenim u v2/printfriendly lokaciju za local na tri mesta jer vuce na 10.0.0.100
Promenio sam je na http://localhost:3000

Ovo resetuje prckanja da bi se komitovale promene:
git reset --hard HEAD
git pull

Revert na neki prethodni komit (ako nije otisao na remote)
git reset --hard commithash

Ovo resetuje neki fajl koji je mrckan
git checkout imefajla

Trenutno stanje stavlja u novi branch
git checkout -b ime_brancha 

Kreiranje remote brancha uz podesavanje upstream (tj. da mogu da uradim pull ako neko izmeni)
git push -u <remote-name> <branch-name>
git push -u origin imebrancha

# remote na heroku
git ls-remote production

Pre komita
git difftool HEAD -- .

za deploy readability.js:
cap production deploy:upload FILES=public/javascripts/v3/readability.js

za deploy
cap production deploy

za pretragu
grep -rin --include=*.rb nekarec .

za diff
git difftool path/to/file.txt

za ono sto je menjano (sa ili bez -p)
git whatchanged -p

Updetovanje master kad je u toku editovanje:
git stash
git pull 
git stash pop

git add . // dodaje sve fajlove za commit
git add -u // dodaje i promene koje se odnose na brisanje fajlova u commit

git reset HEAD // vraca fajlove koji su dodati za commit
git reset HEAD path/to/file // izbacuje neki fajl iz commita


$ git blame -L10,+1 src/options.cpp
^fe25b6d (Ben Gardner 2009-10-17 13:13:55 -0500 10) #include "prototypes.h"
git blame -L10,+1 fe25b6d^ -- src/options.cpp // fe25b6d^ je parent od fe25b6d

// backup database
mysqldump -u [username] -p [database_name] > /path/to/file.sql
// za vece baze
mysqldump -u pnicer_stats -pprcx347 stats --quick | gzip > stats.sql.gz
mysqldump -u [username] -p[password] [database_name] --quick | gzip > [filename.sql.gz]
// Restore baze
gunzip < stats.sql.gz | mysql -u pnicer_stats -pprcx347 stats
gunzip < [filename.gz] | mysql -u [username] -p[pass] [databasename]

// fugitive
https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt
gq - izlaz iz blame

:Gblame [flags] Run git-blame on the file and open the results in a
                        scroll bound vertical split. Press enter on a line to
                        reblame the file as it was in that commit. You can
                        give any of ltwfsMC as flags and they will be passed
                        along to git-blame. The following maps, which work on
                        the cursor line commit where sensible, are provided:

                        A resize to end of author column
                        C resize to end of commit column
                        D resize to end of date/time column
                        q close blame and return to blamed window
                        gq q, then |:Gedit| to return to work tree version
                        i q, then open commit
                        o open commit in horizontal split
                        O open commit in new tab
                        - reblame at commit
                        ~ reblame at [count]th first grandparent
                        P reblame at [count]th parent (like HEAD^[count])

Komentari
(usually CTRL-V or CTRL-Q), type "I" (CAPS - EYE) type the comment character '//' and ESC. 
This gives me the flexibility to change my comment character (for instance make it /// for later searches) and is straight-forward. 
To uncomment, simply select the comment characters is visual-block mode, and delete them.

Za difftool:
do - uzmi iz drugog prozora
dp - postavi u drugi prozor
http://stackoverflow.com/questions/5288875/vimdiff-what-are-the-most-frequently-used-commands-shortcuts-that-could-get-a-n

zo -- open folded text
zc -- close folded text 

% - matching bracket u Vim

git za remote branch
git push origin ime_brancha
http://www.mariopareja.com/blog/archive/2010/01/11/how-to-push-a-new-local-branch-to-a-remote.aspx

// ako nije drugacije oznaceno na remote git-u
https://gist.github.com/eed6bbbd1759e279ce28

// Nadji fajlove sa imenom ime.ext
find . -name ime.ext


// U okviru vimdiff 
zR Prikazuje ceo fajl
za Folduje opet

// Poredjenje verzija iz istorije
git difftool 6b3f70 9ab4274 app/views/print/_js.html.erb

// Generisanje po fajla
http://www.lxg.de/code/playing-with-xgettext

// Razlika pre i posle pull-a
git difftool @{1}..

// On merging and rebasing
http://stackoverflow.com/questions/4556467/git-pull-or-git-merge-between-master-and-development-branches
# ukratko
# koristi git merge master # ako je vec pushovan branch
# koristi git rebase master # ako je u pitanju lokalni branch pa je master u medjuvremenu updateovan pa da se pomeri tacka grananja na taj novi master


// Exceptioni stampanje
http://coderrr.wordpress.com/2008/11/07/the-simple-way-to-print-exceptions-in-ruby/
# $! -> exception (nije lose ponekad $!.inspect da se vidi i tip exception-a)
# $@ -> backtrace ($!.backtrace je isto sto i ovo)
primer: puts $!, $@
# ili:
logger.debug $!.inspect
logger.debug $@.join("\n")



// Ako ima remote branch pa da se podesi da moze pull
git branch --set-upstream foo upstream/foo

// Valjda double onda ne mora se escapuje html npr.
sed -i "s/old-word/new-word/g" *.txt
// Nezgodno za escape ali moze valjda regex
sed -i 's/old-word/new-word/g' *.txt


// Resetuje merge prethodni
git reset --hard HEAD^

// Dodavanje konfiguracije
git config --global user.name "Your Name Comes Here"

// Kad mergujes
git merge --squash

// VCSCommand (svn)
:help VCSCommand
<leader>cv // vim diff samo su obrnute strane

// Resetuje svn folder
svn revert -R .


// Vim
// Replace multiple tabs i space with single space
%s/\s*\t\+/ /gc

// Ako se zeli da se iskopira neka od vim komandi prikaze se istorija komandi pomocu:
q:

// Startovanje single testa (rake izgleda nekad ne radi dobro za to)
b ruby -Itest test/integration/email_spam_test.rb -v
// za test sa fixtures da rekreira bazu
rake db:test:load
// nisam siguran sta radi rake db:test:prepare

// preview onoga sto ce da mi se desi sa pull
git fetch
git difftool HEAD...origin

// Pakovanje ovde
zz ime.tar.gz folder

pnicer_stats
prcx347

// Da vidim gde je sta instalirano
dpkg-query -L ime-paketa
dpkg-query -L apache2
// Lista instalirane pakete
dpkg --list | grep -i 'chrom'
// Uklanjanje paketa sa svim zavisnim
sudo apt-get --purge remove chromium-browser

// saving if readonly (not sudo) ali kasnije ukapiram
:w !sudo tee %

// na serveru (jer koristimo production environment)
export RAILS_ENV=production

// scp
scp fajl user@host:/path/for/uploading
scp user@host:/path/for/download /local/path

# na osnovu instrukcija odatle: http://stackoverflow.com/questions/179123/how-do-i-edit-an-incorrect-commit-message-in-git
# If the commit you want to fix isn’t the most recent one:

   git rebase --interactive $parent_of_flawed_commit

#    If you want to fix several flawed commits, pass the parent of the oldest one of them.
#     An editor will come up, with a list of all commits since the one you gave.
#        Change pick to reword (or on old versions of Git, to edit) in front of any commits you want to fix.
#        Once you save, git will replay the listed commits.
#    Git will drop back you into your editor for every commit you said you want to reword, and into the shell for every commit you wanted to edit. If you’re in the shell:
#        Change the commit in any way you like.
#        git commit --amend
#        git rebase --continue
# Most of this sequence will be explained to you by the output of the various commands as you go. It’s very easy, you don’t need to memorise it – just remember that git rebase --interactive lets you correct commits no matter how long ago they were.

# drupal dumpvar (1 je u stvari true)
print('<pre>').print_r($variable_name, 1).('</pre>');


# error sa linecache na osnovu: http://stackoverflow.com/questions/10916784/error-installing-debugger-linecache-in-ruby-1-9-3
bundle update debugger
bundle install

# za kapistrano treba jos
gem install rvm-capistrano

# za mysql na ubuntu (gem)
sudo apt-get install libmysqlclient-dev

# cherrypicking
https://ariejan.net/2010/06/10/cherry-picking-specific-commits-from-another-branch

# traceroute za moj ruter koji filterise
sudo traceroute -I -n phptest.printfriendly.com

# creating symlink
ln -s <destination> <linkname>

# testing local chrome extension
Open the extensions page chrome://extensions/ and click "pack extension". Choose the directory of your extension code and it will save a .crx file to your computer. Double click this file to install and test..

# http://blog.readypulse.com/2012/01/19/setup-webrick-to-serve-ssl-https-as-well-as-non-ssl-http-traffic-side-by-side/
# http://www.akadia.com/services/ssh_test_certificate.html 
# https ssl locally (u pf3 folderu)
thin start --ssl --ssl-verify --ssl-key-file /home/ubuntu/ssl-stuff/local-printfriendly.cert.key --ssl-cert-file /home/ubuntu/ssl-stuff/local-printfriendly.cert.crt -p 3001
# edituj ssl/main.js ovaj deo da bude:
if(pfProtocol == 'https') {
    pfCdnDomain = pfDomain = pfEmailDomain = pdfDomain = 'https://local.printfriendly.com:3001';
  }



# groovy classpath
groovy -cp .:jmatharray.jar:jmathplot.jar dyadic.groovy
groovy -cp .:lib/* dyadic.groovy

# --> Ako se kasnije doda gitignore za fajlove koji vec usli u 'pracenje'
git rm -r --cached .  //This removes everything from the index, then just run:
git add .
git commit -m ".gitignore is now working"
#### endof

// Za line endings
//On Linux and Mac OS, the following works, where ^V^M means type Ctrl+V, then Ctrl+M.
:%s/^V^M//g
# bolje je
:%s/\r\(\n\)/\1/g

// status aplikacija i proces
top

# delete remote branch
git push origin --delete <branchName>
# stare verzije gita: git push origin :<branchName>

# delete na heroku
git push staging --delete <branchName>

// delete local branch
git branch -d branchname

// show remote branches
git branch -a

// git global configuration alias
git config --global alias.s status


// da se spreci: Unable to create Ubuntu Menu Proxy: Timeout was reached
// .bashrc na kraju (https://bugs.launchpad.net/ubuntu/+source/vim/+bug/776499)
export UBUNTU_MENUPROXY=0

// creating eclipse/android icon
Open a terminal and execute:

  sudo gedit /usr/share/applications/EclipseADT.desktop

In the gedit editor window, copy and paste the following text:

[Desktop Entry]
Version=21.0.0-531062
Type=Application
Terminal=false
StartupNotify=true
Icon=/home/(username)/adt-bundle-linux-x86/eclipse/icon.xpm
Name=Eclipse ADT
Comment=Eclipse and Google Android Developer Tools
Exec=/home/(username)/adt-bundle-linux-x86/eclipse/eclipse
Categories=Application;Development;

Use launcher, start application, ... right click icon and: lock to launcher


//To install a .deb file, simply double click on it, and then select Install Package
//Alternatively, you can also install a .deb file by opening a terminal and typing:
sudo dpkg -i package_file.deb

// install java oracle
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

// setup java home
sudo gvim /etc/profile
// add at the end
JAVA_HOME=/usr/lib/jvm/java-7-oracle/
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export PATH
// logout and then login again

// push local repo to github
git remote add origin [github_url]
# nekad trazi prvo pull (kad ima readme.md a kad nema moze bez pull)
git pull origin master
git push origin master

# twitter bootstrap scaffolded resource
# when scaffold use --no-stylesheets
rails g scaffold Setting user:references autoresponder:text dispatcher_url:string support_email:string template:text thankyou_message:string --no-stylesheets
rails g bootstrap:themed products -f

#installing curb error (treba se instalira ovo ispod prvo)
sudo apt-get install libcurl4-gnutls-dev

#command-t
# compile against the same ruby version as gvim:
# see: https://wincent.com/forums/command-t/topics/425

#rmagick installation trouble
sudo apt-get install libmagickwand-dev
bundle install

# heroku reset db
heroku pg:reset DATABASE
# clear session
# signout signin a ako su sesije u bazi heroku db:sessions:clear
heroku db:migrate
heroku db:seed
heroku restart # nije hteo da mi resetuje semu bez toga

# Procedura za instalaciju
sudo apt-get purge google-chrome-stable
sudo apt-get autoremove
rm -rf ~/.config/google-chrome #tek ovo ga opravi kako treba
# this will remove apt repo so add it again
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
sudo apt-get install google-chrome-stable

# Google chrome update (bolja procedura)
# prvo fix ako ima duplicate sources (obicno ima google.list i google-chrome.list koje su iste pa se obrise google-chrome.list): http://askubuntu.com/questions/120621/how-to-fix-duplicate-sources-list-entry 
sudo apt-get update
# onda na osnovu: http://superuser.com/questions/130260/how-to-update-google-chrome-in-ubuntu 
sudo apt-get --only-upgrade install google-chrome-stable
sudo pkill -15 google-chrome


# Koristiti ovo iznad a ovo ispod je za referencu
# add google chrome (instructions from: http://www.ubuntuupdates.org/ppa/google_chrome)
Setup key with:
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
Setup repository with:
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
Setup package with:
sudo apt-get update 
sudo apt-get install <package name>
where <package name> is the name of the package you want to install.

# update google chrome (instructions from: http://superuser.com/questions/130260/how-to-update-google-chrome-in-ubuntu)
(have to have repo from above) Now open a terminal. Type following -
sudo apt-get --only-upgrade install google-chrome-stable
This will install the current stable version of it. Now you have to kill all instances (may be hidden) of old Google Chrome.
sudo pkill -15 google-chrome


# vim macro
q<taster> # startuje snimanje
q # u modu za kretanje zaustavlja
@<taster> # ponavlja makro
3@<taster> # ponavlja makro 3x

# git vracanje u istoriju na commit xxxx
git reset --hard xxxx
git push --force

# maintenance
heroku maintenance:on
heroku maintenance:off

# rvm create use with conf
rvm --create --versions-conf use 1.9.3@test


# heroku backup db
heroku pgbackups:capture
curl -o latest.dump `heroku pgbackups:url`
# za production
curl -o latest.dump `heroku pgbackups:url --remote production`
# za restore (moze lakse ako je backup na serveru a sa lokalnog prebaci se negde gde ima http)
heroku pgbackups:restore DATABASE 'http://www.expertaya.com/files/latest.dump' --remote staging
# lakse prvo heroku pgbackups (da bi izlistao brojke backupova b001, ...)
heroku pgbackups:restore DATABASE b###

# create seed afterwards:
rake db:drop
rake db:create
# heroku restore locally to development database
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U myuser -d myapp_development latest.dump
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U mf2 -d cpanel_prod_test latest.dump

# checkout the same commit as on heroku
rake db:seed:dump FILE=db/heroku_dump.rb


# POSTGRE instalacija
sudo apt-get install postgresql postgresql-contrib libpq-dev

We need libpq-dev to be able to install the Ruby pg gem. After the setup completes, then run the following commands:

sudo -u postgres createuser --superuser mf2
sudo -u postgres psql postgres

postgres=# \passsword mf2
# choose mf2rules for password when asked
\q # exit from postgre console

# Na osnovu uputstva
# https://devcenter.heroku.com/articles/multiple-environments
# imamo staging
git push staging master
# different branch: git push staging branchname:master
# git push production master
heroku run rake db:migrate --remote staging
heroku ps --remote staging
# setup staging to be default
git config heroku.remote staging
# ako ga renamujes posle promeni u .git/config u novo ime

# debugging bash shell scripts
# http://www.cyberciti.biz/tips/debugging-shell-script.html
set -xv # start
set +xv # stop
# or
bash -xv <script>
# or
#!/bin/bash -xv

# kill
kill -9 pid

# cannot login
# CTRL+ALT+F1
sudo chown -R $USER:$USER $HOME
# CTRL+ALT+F7 to login again

# heroku rollback
heroku rollback
# ili za konkretnu verziju
heroku rollback v40

# postgre commandna linija
heroku pg:psql


# backup lokalne baze
sudo -u postgres pg_dump dvvdb_development > pera.db

# za instalaciju stampaca
sudo hp-plugin

# za tagovanje
git tag -a 0.6.1-trials -m 'v0.6.1 with addition of trials feature'

# drajveri nvidia gui ako se javi fliker http://askubuntu.com/questions/309239/nvidia-driver-install
sudo apt-get isntall nvidia-current-updates

# mysql user creation with all privileges on dbname 
grant all on dbname.* to username@localhost identified by 'password';

# za dispatcher treba lighttpd (apt-get)
# i config u /etc/lighttpd/lighttpd.conf

# restart:
ps aux | grep fcgi
kill -7 pid
rundj

# djapp/gateway/settings.py
MySql = True

# syncdb
python manage.py syncdb
python manage.py migrate locker
python manage.py migrate apps

# local gateway
user cpanel1
pass 12345678

# ssh 
ssh-copy-id -i ~/.ssh/id_rsa.pub user@server.example.com

#.ssh/config
Host sb
  HostName scratchboard.mainframe2.com
  User scratchboard
  IdentityFile ~/.ssh/id_rsa

# after that we can use:
ssh sb

# scratchboard copy subfolder dashboard
scp -r sb:/home/scratchboard/scratchboard.mainframe2.com/dashboard/ /home/gagi/sb/

# delete swap files
find . -name *.swp -delete

# ssl addon
heroku certs:add ~/cert/492d22b431c38.crt ~/cert/mainframe2.key --remote mrk
# ssl update
heroku certs:update ~/cert/new242423.crt ~/cert/mainframe2.key --remote mrk


# paperclip update images
rake paperclip:refresh CLASS=Screenshot --trace

# list all files that ever existed on git (add: | grep filename )
 git log --pretty=format: --name-status | cut -f2- | sort -u

# forgotten files
# stage them ->
git add .
git commit --amend

# restore pg dump to sql
pg_restore file.dump > file.sql


# S3cmd (to install use: brew install s3cmd)
# if not configured call configure first and fill the access codes when asked
s3cmd --configure
# lists buckets
s3cmd ls 
# make bucket
s3cmd mb s3://bucket-name
# lists content of the bucket
s3cmd ls s3://bucket-name

# git stash pop on wrong branch (merge conflict and stash lost)
git log --graph --oneline --decorate --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )
# find stash hash - search for line containing (refs/stash)
# reset merge conflict
git reset HEAD --hard
# go to proper branch
git stash apply hash_you_found_before

# delete local branches that are merged into master
git branch --merged master | egrep -v 'master|develop' | xargs -n 1 git branch -d

# list local branches that are merged into master with info whether they exist remotely
git branch --merged master | egrep -v 'master|develop' | awk '{gsub(/ /,"",$0);mrk="LOCAL";{if(system("git branch -r --contains " $0 "| grep " $0 " >/dev/null") == 0) mrk = "LOCAL AND REMOTE" };print$0,mrk}'

# lists and deletes local and remote
git branch --merged master | egrep -v 'master|develop' | awk '{gsub(/ /,"",$0);mrk="DELETED LOCAL";system("git branch -d " $0);{if(system("git branch -r --contains origin/" $0 "| grep " $0 " >/dev/null") == 0) {mrk = mrk " REMOTE"; system("git push origin --delete " $0) }};print$0,mrk}'

# lists remote branches merged to master
git branch -r --merged master | egrep -v 'master|develop' | awk '{gsub(/ /,"",$0);mrk = " " $0;frk = " " system("git show -s " $0 " --pretty=format:\"%ai %an\"");print mrk frk}' | sort -n

# deletes remote branches merged to master
git branch -r --merged master | egrep -v 'master|develop' | awk '{gsub(/origin\//,"",$0);print $0}' | awk '{mrk = $0;system("git push origin --delete " $0);print mrk, $0}'




# restarting delayed job
heroku ps:scale worker=0 --remote staging
heroku ps:scale worker=1 --remote staging

# reverting a single migration
rake db:migrate:down VERSION=20150120233320

# ~/.gemrc
gem: --no-document

# squash commits or rebase stuck (edit the file below)
gvim .git/rebase-merge/git-rebase-todo
git rebase --continue


# small snippet to find out where is irritating log coming from
module Kernel
  def p(*args) 
    puts(caller[0])
  end
end

# stash untracked files as well
git stash save -u

# reset last commit and turn it to unstaged changes
git reset HEAD^

# abort rebase/merge
git merge --abort
git rebase --abort


# Fixing detached HEAD: (reference: http://stackoverflow.com/a/5772882/177154)
# Tried git checkout release/staging and got this:
# 
# Note: checking out 'release/staging'.

# You are in 'detached HEAD' state.
# ...

git checkout -b fix_head # create a tmp branch that reattaches current detached head to it
git branch -u origin/release/staging # link the new branch with origin/release/staging
git pull # sync with remote branch
git branch -f release/staging fix_head
git checkout release/staging
git branch -u origin/release/staging
git branch -d fix_head
# still gettign ambiguous so:
# git show-ref | grep staging
# had some directory under .git due to bad usage of update-ref so this fixed it:
git update-ref -d release/staging
# the same command should be used for other ambiguous refnames (in general you should have only one refs/heads per branch e.g. develop -> refs/remotes do not count)
# in my case I had (git show-ref | grep develop): 
61be8a7755e2ce1867a51ff837439934bf5ae3d4 refs/heads/develop    <----- 1
b14d76e3a77822c7986893960f2a9ae0bb8497dd refs/heads/feature/test-branch-develop
f478222a50e6443207bb77d67a922d64e11dfcca refs/heads/origin/develop    <----- 2
b052d2822877924d011e70a433b900855714c5bf refs/remotes/develop/master
89ae77eb5571157e1247d248ded1c1347fa00843 refs/remotes/origin/develop
fceb85e96e9559f5f07bfb7eb88d81e36253f335 refs/remotes/origin/release/develop
7e5647b9c4341f70c3a1423668c39aa30acd0548 refs/remotes/origin/release/pre-develop
# the command below fixed the issue:
git update-ref -d refs/heads/origin/develop


# if postgre service cannot run for some reason, delete: /usr/local/var/postgres/postmaster.pid
brew services restart postgresql

# heroku logs
heroku drains --remote appname
heroku drains:add https://logs-01.loggly.com/bulk/TOKEN/tag/heroku --app HEROKU_APP_NAME
heroku drains:add https://logs-01.loggly.com/bulk/xxxxxx/tag/cpanel_staging --remote staging

# Last commit date change
git commit --amend --date="Fri Jul 29 22:02 2016 -0700"


# messing withe PG sequences
ActiveRecord::Base.connection.execute("ALTER SEQUENCE #{table}_id_seq RESTART WITH #{last_id + 1}")
# get all sequences
ActiveRecord::Base.connection.execute("SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';").each { |r| p r; };
# last value SQL:
SELECT last_value FROM test_id_seq;
# multiprocess errors on uniqueness (has_one), use gem consistency_fail
gem install consistency_fail
consistency_fail # returns potential relationships missing unique index

# Command-t RVM and ruby update
1. Vim and Command-T must be built with same version of Ruby. 
2. For people using RVM, you need to install a version of Ruby like this rvm install VERSION --enable-shared
3. Then, you need to reinstall Vim, brew uninstall vim && brew install vim
4. Finally, re-compile Command-t, make clean && ruby extconf.rb && make
