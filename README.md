# LearningHaskell
Self-learning Haskell.
Simple and pretty stupid, extremely not useful, software for fun and learn.

## Content

* [Goals](#goals)
* [Project](#uml)
  * [Use cases](#uml-use_cases)
  * [Activities](#uml-activities)
  * [Statecharts](#uml-statecharts)
* [Development environment (made from scratch)](#dev-env)
  * [First need commands](#dev-cmds)
* [Test environment](#test-env)
  * [First need commands](#test-cmds)
* [Runtime environment (soon)](#run-env)
* [Knowledge source](#knowledge)

### <a id=goals></a> Goals

 | Goals ||[emoji]|
--- | --- | --- | :-: |
main | **self-learning Haskell** |||
 | monads | as much as possible ||
secondary|well designed software|UML charts||
 | well documented software |||
 | testable code |[Hspec]|:white_check_mark:|
 | design-patterns everywhere | state ||
 |  | event sourcing ||
 |  | CQRS (maybe) ||
 |  | circuit breakers ||
 | "single-click" deploy |||
 | WebUI/html5 as front end |||
 | browser-in animations with html5/canvas |||
 | self-learning TypeScript | probably ||
 | self-learning Markdown ||:white_check_mark:|
 | and maybe many more but later...|||

### Project<sup>([draw.io])</sup><a id=uml></a>

#### Use cases<a id=uml-use_cases></a>

![Use cases][uml-use_cases]

#### Activities<a id=uml-activities></a>

![Light switch activity][uml-activity-lswitch]

#### Statecharts<a id=uml-statecharts></a>

![Light switch states][uml-statechart-lswitch]

### Development environment (made from scratch) <a id=dev-env ></a>

* Operating system:
  - Host OS: Microsoft Windows 10
  - Hypervisor: Microsft Hyper-V
  - Guest OS: [FreeBSD] 10.2-RELEASE (deployed into VM from i386-bootonly.iso)
  ```shell
  $ uname -a
  FreeBSD hyaena 10.2-RELEASE FreeBSD 10.2-RELEASE #0 r286666: Wed Aug 12 19:31:38 UTC 2015     root@releng1.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC  i386
  ```
* Haskell platform:
  - **[ghc]** (It is also available as port `lang/ghc` but installation fails. That's why it is installed from packages.)
  ```shell
  $ pkg install ghc
  $ ghc --version
  The Glorious Glasgow Haskell Compilation System, version 7.10.2
  ```
  - **[cabal]** 
  ```shell
  $ cd /usr/ports/devel/hs-cabal-install && make install clean
  $ cabal --version
  cabal-install version 1.22.6.0
  using version 1.22.4.0 of the Cabal library 
  $ cabal update # It is required to initialize packages list.
  Downloading the latest package list from hackage.haskell.org
  ```
  > Why not **[stack]**?

  > Officially [stack] is not yet available nor in [FreeBSD] ports tree nor in binary packages.

  > For more information, please see http://docs.haskellstack.org/en/stable/install_and_upgrade/#freebsd
* Third-party tools installed extra
  - **[curl]**
  ```shell
  $ cd /usr/ports/ftp/curl && make install clean
  $ curl --version
  curl 7.47.0 (i386-portbld-freebsd10.2) libcurl/7.47.0 OpenSSL/1.0.1p zlib/1.2.8
  Protocols: dict file ftp ftps gopher http https imap imaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
  Features: AsynchDNS Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz TLS-SRP UnixSockets 
  ```
  - **[git]**
  ```shell
  $ cd /usr/ports/devel/git && make install clean
  $ git --version
  git version 2.7.0
  ```
* Editor (inspired by [PRACTICAL HASKELL - EDITOR SETUP WITH STACK](http://seanhess.github.io/2015/08/05/practical-haskell-editors.html))
  - **[vim]**
  ```shell
  $ cd /usr/ports/editors/vim && make install clean
  $ vim --version
  VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb 20 2016 17:13:39)
  Included patches: 1-1229
  Compiled by sebi@hyaena
  Big version without GUI.  Features included (+) or not (-):
  +acl             +farsi           +mouse_sgr       +tag_old_static
  +arabic          +file_in_path    +mouse_sysmouse  -tag_any_white
  +autocmd         +find_in_path    +mouse_urxvt     -tcl
  -balloon_eval    +float           +mouse_xterm     +terminfo
  -browse          +folding         +multi_byte      +termresponse
  ++builtin_terms  -footer          +multi_lang      +textobjects
  ++builtin_terms  -footer          +multi_lang      +textobjects
  +byte_offset     +fork()          -mzscheme        +title
  +channel         -gettext         +netbeans_intg   -toolbar
  +cindent         -hangul_input    +path_extra      +user_commands
  -clientserver    +iconv           -perl            +vertsplit
  -clipboard       +insert_expand   +persistent_undo +virtualedit
  +cmdline_compl   +jumplist        +postscript      +visual
  +cmdline_hist    +keymap          +printer         +visualextra
  +cmdline_info    +langmap         -profile         +viminfo
  +comments        +libcall         -python          +vreplace
  +conceal         +linebreak       -python3         +wildignore
  +cryptv          +lispindent      +quickfix        +wildmenu
  +cscope          +listcmds        +reltime         +windows
  +cursorbind      +localmap        +rightleft       +writebackup
  +cursorshape     -lua             -ruby            -X11
  +dialog_con      +menu            +scrollbind      -xfontset
  +diff            +mksession       +signs           -xim
  +digraphs        +modify_fname    +smartindent     -xsmp
  -dnd             +mouse           -sniff           -xterm_clipboard
  -ebcdic          -mouseshape      +startuptime     -xterm_save
  +emacs_tags      +mouse_dec       +statusline      -xpm
  +eval            -mouse_gpm       -sun_workshop    
  +ex_extra        -mouse_jsbterm   +syntax          
  +extra_search    +mouse_netterm   +tag_binary      
     system vimrc file: "/usr/local/etc/vim/vimrc"
       user vimrc file: "$HOME/.vimrc"
   2nd user vimrc file: "~/.vim/vimrc"
        user exrc file: "$HOME/.exrc"
    fall-back for $VIM: "/usr/local/etc/vim"
   f-b for $VIMRUNTIME: "/usr/local/share/vim/vim74"
  Compilation: cc -c -I. -Iproto -DHAVE_CONFIG_H   -I/usr/local/include  -O2 -pipe  -fstack-protector -fno-strict-aliasing   -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1      
  Linking: cc   -Wl,-rpath=/usr/lib:/usr/local/lib -fstack-protector -L/usr/local/lib -Wl,--as-needed -o vim               -lm -lelf  -ltermlib                     
  ```
    - **[hdevtools]**

    ```shell
    $ cabal install hdevtools
    $ hdevtools --version # probably PATH must be updated. Maybe $HOME/.cabal/bin should be added.
    hdevtools: version 0.1.2.2 (ghc-7.10.2-i386-freebsd, cabal-1.22.4.0)
    ```
    - **[pathogen.vim]** (~/.vimrc must be updated, see [pathogen.vim])

    ```shell
    $ mkdir -p ~/.vim/autoload ~/.vim/bundle && \
      curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    ```
    - **[syntastic]** (~/.vimrc must be updated, see [syntastic])

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/scrooloose/syntastic.git
    ```
    - **[vim-hdevtools]** (~/.vimrc must be updated, see [vim-hdevtools])

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/bitc/vim-hdevtools.git
    ```
    - **[ctrlp.vim]**

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/ctrlpvim/ctrlp.vim/
    ```

    - **[tabular]**

    ```shell
    $ cd ~/.vim/bundle && \
      git clone https://github.com/godlygeek/tabular
    ```

#### <a id=dev-cmds />First need commands

```shell
$ cabal install --only-dependencies # It installs all expected requirements.
$ cabal build                       # It builds project to folder `dist` as output folder
$ cabal run                         # Easy way to run the code. It builds project and runs the result
```

### Test environment <a id=test-env></a>

* Testing framework
  * **[Hspec]** 

    Recommended source-code tree supported nicely by [Hspec] can be found [here: hspec-discover](http://hspec.github.io/hspec-discover.html). The link describes very useful solution to automagically discover specs with only one-time edited `Spec.hs` file.

#### <a id=test-cmds />First need commands

```shell
$ cabal configure --enable-tests       # It's self-explanatory.
$ cabal test                           # It runs all tests but output is a little too much rich.
$ runhaskell -isrc -itest test/Spec.hs # Long command but it gives very nice output.
```

### <a id=knowledge></a> Knowledge sources

| [Haskell language](https://www.haskell.org)
| [Cabal User Guide](https://www.haskell.org/cabal/users-guide/)
| [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters)
| [Practical Haskell](http://seanhess.github.io/2015/08/04/practical-haskell-getting-started.html)
| [State monad](https://wiki.haskell.org/State_Monad)
| [Hspec](http://hspec.github.io)
| [UML](https://sourcemaking.com/uml)
|

[cabal]: https://www.haskell.org/cabal/
[ctrlp.vim]: https://github.com/kien/ctrlp.vim
[curl]: https://curl.haxx.se
[FreeBSD]: https://www.freebsd.org
[ghc]: https://www.haskell.org/ghc/
[git]: http://git-scm.com
[hdevtools]: https://github.com/bitc/hdevtools
[Hspec]: http://hspec.github.io
[pathogen.vim]: http://github.com/tpope/vim-pathogen/
[stack]: http://www.haskellstack.org/
[syntastic]: http://github.com/scrooloose/syntastic/
[tabular]: https://github.com/godlygeek/tabular
[vim]: http://www.vim.org/
[vim-hdevtools]: http://github.com/bitc/vim-hdevtools/

[uml-use_cases]: https://iesmkg.bn1302.livefilestore.com/y3m6gvj-uMl0AfZnvu22om8GPbcb2Tz9JjI6KHRg_aEOLIQLg_5yxQ3hlg4ercdUzZYm1lsSs1MflGP6e0D-jthhA177tA4tgAdtql8J5GiNYdkUN_LsC19o1Q9xNW6RhD00oHfs6wylNvQNKpKndAw1w?width=450&height=283&cropmode=none
[uml-activity-lswitch]: https://ies7na.bn1302.livefilestore.com/y3m96kLeEycPR92qOoc-4J_bzB3cFZV1dktJKM9JjrSHYv-vrpl1_sdTuXTzOlHdKlM4zjsDsKhC5yHIa0Na4GTWOH2EEJFkA5OP5_WOpIlSZQ7kYUUIEU6DHqTQipxNaxpJiQ0eMOTmYJBYn1IQG_91A?width=443&height=333&cropmode=none
[uml-statechart-lswitch]: https://ievd7w.bn1302.livefilestore.com/y3mKE5WJGoeOEW0cGXVNFCGw4R242ZTJK5JIiKRKbrim5qpyA4onOCHCMEXIbYPKKDFoANAB1qvd928t1P3XG2FUzevy7CHPFoDnPxRCXKtFh0vKgtGDFR8WCvJNN69y8xlqTLNeRfgvXfjmB7KBL7-zA?width=366&height=199&cropmode=none

[draw.io]: http://www.draw.io/ "Drawings are made on-line with draw.io."
[emoji]: http://www.emoji-cheat-sheet.com "Emoji (emoticons/pictograph) supported by Github."
