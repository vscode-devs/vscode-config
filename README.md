# <font size=3>一、vscode简介</font>

## <font size=3>1. 官网</font>

[Visual Studio Code - Code Editing. Redefined](https://code.visualstudio.com/):

<img src="README/img/image-20250516221934408.png" alt="image-20250516221934408" />

怎么安装？直接主页点击下载即可，或者通过以下链接（[Visual Studio Code FAQ](https://code.visualstudio.com/docs/supporting/faq#_previous-release-versions)）：

```shell
# Windows x64 System installer	
https://update.code.visualstudio.com/{version}/win32-x64/stable
# Windows x64 User installer	
https://update.code.visualstudio.com/{version}/win32-x64-user/stable
```

## <font size=3>2. 版本</font>

目前用的是这个版本：[VSCodeSetup-x64-1.100.2.exe(System Installer)](https://vscode.download.prss.microsoft.com/dbazure/download/stable/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/VSCodeSetup-x64-1.100.2.exe)

<img src="README/img/image-20250516222434671.png" alt="image-20250516222434671" />

版本信息：

```shell
版本: 1.100.2 (user setup)
提交: 848b80aeb52026648a8ff9f7c45a9b0a80641e2e
日期: 2025-05-14T21:47:40.416Z
Electron: 34.5.1
ElectronBuildId: 11369351
Chromium: 132.0.6834.210
Node.js: 20.19.0
V8: 13.2.152.41-electron.0
OS: Windows_NT x64 10.0.19044
```

## <font size=3>3. 相关目录</font>

主要是是在windows下开发，所以这里主要关注一下windows中vscode相关的目录

- 临时文件、配置文件等

```shell
%USERPROFILE%\AppData\Roaming\Code\
# 即
C:\Users\<user_name>\AppData\Roaming\Code\
```

- 插件目录

```shell
%USERPROFILE%\.vscode\extensions
# 即
C:\Users\<user_name>\.vscode\extensions
```

> Tops：卸载的时候目录中的文件不会被删除。

# <font size=3>二、插件安装</font>

## <font size=3>1. 插件安装位置</font>

- windows

```shell
%USERPROFILE%\.vscode\extensions
# 即
C:\Users\<user_name>\.vscode\extensions
```

- linux

```shell
/home/<user_name>/.vscode/extensions
```

## <font size=3>2. 插件安装</font>

### <font size=3>2.1 插件市场安装</font>

<img src="README/img/image-20250516104228388.png" alt="image-20250516104228388"  />

### <font size=3>2.2 官网安装</font>

[Extensions for Visual Studio family of products | Visual Studio Marketplace](https://marketplace.visualstudio.com/)：

<img src="README/img/image-20250516104355099.png" alt="image-20250516104355099"  />

### <font size=3>2.3 vsix安装</font>

<img src="README/img/image-20250516104626672.png" alt="image-20250516104626672"  />

### <font size=3>2.4 直接安装</font>

还有一种方式，就是直接把已安装好的插件的目录打包压缩，放到要安装的地方去：

<img src="README/img/image-20250516105152211.png" alt="image-20250516105152211"  />

windows下可以在文件资源管理器输入以下路径打开插件安装目录：

```shell
%USERPROFILE%\.vscode\extensions
```

## <font size=3>3. VSIX下载</font>

### <font size=3>3.1 [Open VSX Registry](https://open-vsx.org/?search=office&sortBy=relevance&sortOrder=desc)</font>

[Open VSX Registry](https://open-vsx.org/?search=office&sortBy=relevance&sortOrder=desc)：

<img src="README/img/image-20250516105351042.png" alt="image-20250516105351042"  />

### <font size=3>3.2 [Visual Studio Marketplace](https://marketplace.visualstudio.com/)</font>

还有一个地方就是官网，之前还是有vsix文件下载的地方的，但是后来就没了，是直接安装到vscode了，但是没网的环境就没办法了，但是还是可以通过下面的方式获取到下载链接，以 One Dark Pro 为例。

#### <font size=3>3.2.1 获取插件信息</font>

- 在有网的环境下安装 One Dark Pro 插件，然后获取插件信息：

<img src="README/img/image-20250516110003275.png" alt="image-20250516110003275"  />

就会得到以下内容：

```shell
名称: One Dark Pro
ID: zhuangtongfa.material-theme
说明: Atom's iconic One Dark theme for Visual Studio Code
版本: 3.19.0
发布者: binaryify
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme
```

或者也可以不安装，直接去vscode插件市场或者官网的插件市场搜这个插件，可以看上图，图中右侧安装部分就有这些信息：

```shell
安装
标识符 zhuangtongfa.material-theme
版本 3.19.0
上次更新时间 2025-05-16, 14:09:29
源 VSIX
大小 1.40 MB
```

#### <font size=3>3.2.2 下载链接</font>

其实vscode之前的vsix下载链接格式是：

```shell
https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage
```

以上面的 One Dark Pro为例就是：

```shell
发布者: zhuangtongfa
插件名: Material-theme
版本号: 3.19.0
```

最后得到的下载链接就是 [One Dark Pro 3.19.0](https://marketplace.visualstudio.com/_apis/public/gallery/publishers/zhuangtongfa/vsextensions/Material-theme/3.19.0/vspackage):

```shell
https://marketplace.visualstudio.com/_apis/public/gallery/publishers/zhuangtongfa/vsextensions/Material-theme/3.19.0/vspackage
```



# <font size=3>三、常用插件</font>

## <font size=3>1. One Dark Pro</font>

### <font size=3>1.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: One Dark Pro
ID: zhuangtongfa.material-theme
说明: Atom's iconic One Dark theme for Visual Studio Code
版本: 3.19.0
发布者: binaryify
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.Material-theme

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/zhuangtongfa/vsextensions/material-theme/3.19.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/zhuangtongfa/vsextensions/material-theme/3.19.0/vspackage

### <font size=3>1.2 插件配置</font>

## <font size=3>2. Material Icon Theme</font>

### <font size=3>2.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Material Icon Theme
ID: PKief.material-icon-theme
说明: Material Design Icons for Visual Studio Code
版本: 5.22.0
发布者: Philipp Kief
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/PKief/vsextensions/material-icon-theme/5.22.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/PKief/vsextensions/material-icon-theme/5.22.0/vspackage

### <font size=3>2.2 插件配置</font>

## <font size=3>3. Hex Editor</font>

### <font size=3>3.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Hex Editor
ID: ms-vscode.hexeditor
说明: Allows viewing and editing files in a hex editor
版本: 1.11.1
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/hexeditor/1.11.1/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/hexeditor/1.11.1/vspackage

### <font size=3>3.2 插件配置</font>

## <font size=3>4. Chinese (Simplified)</font>

### <font size=3>4.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Chinese (Simplified) (简体中文) Language Pack for Visual Studio Code
ID: MS-CEINTL.vscode-language-pack-zh-hans
说明: Language pack extension for Chinese (Simplified)
版本: 1.100.2025051409
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=MS-# CEINTL.vscode-language-pack-zh-hans

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-CEINTL/vsextensions/vscode-language-pack-zh-hans/1.100.2025051409/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/MS-CEINTL/vsextensions/vscode-language-pack-zh-hans/1.100.2025051409/vspackage

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-ceintl/vsextensions/vscode-language-pack-zh-hans/1.100.2025051409/vspackage



### <font size=3>4.2 插件配置</font>

## <font size=3>5. Remote - SSH</font>

[Remote Development using SSH](https://code.visualstudio.com/docs/remote/ssh)：

<img src="README/img/architecture-ssh.png" alt="SSH Architecture"  />

### <font size=3>5.1 插件安装</font>

这里在有网的环境下，安装了 Remote - SSH 插件后，会自动安装另外两个插件，没网的话，可以手动下载VSIX文件后安装。

#### <font size=3>5.1.1 Remote - SSH</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Remote - SSH
ID: ms-vscode-remote.remote-ssh
说明: Open any folder on a remote machine using SSH and take advantage of VS Code's full feature set.
版本: 0.120.0
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-ssh/0.120.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-ssh/0.120.0/vspackage

#### <font size=3>5.1.2 Remote Explorer</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Remote Explorer
ID: ms-vscode.remote-explorer
说明: View remote machines for SSH and Tunnels.
版本: 0.5.0
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ms-vscode.remote-explorer

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/remote-explorer/0.5.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/remote-explorer/0.5.0/vspackage

这个插件安装之后在活动栏会出现一个远程资源管理器的图标，后续可以通过这里方便的管理远程服务器：

<img src="README/img/image-20250516210242321.png" alt="image-20250516210242321"  />

#### <font size=3>5.1.3 Remote - SSH: Editing Configuration Files</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Remote - SSH: Editing Configuration Files
ID: ms-vscode-remote.remote-ssh-edit
说明: Edit SSH configuration files
版本: 0.87.0
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-ssh-edit

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-ssh-edit/0.87.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode-remote/vsextensions/remote-ssh-edit/0.87.0/vspackage

这个插件安装好像是个语法高亮的插件，反正安装完，编辑ssh配置文件的时候就有语法高亮了。

### <font size=3>5.2 Visual Studio Code Server</font>

[Visual Studio Code Server](https://code.visualstudio.com/docs/remote/vscode-server)：

<img src="README/img/server-arch-latest.png" alt="The VS Code Server architecture"  />

我们想要通过ssh连接到远程服务器，远程服务器中需要有Visual Studio Code Server，有网络的情况下在登录的时候可以自动下载，可以跳过这一部分。

> 参考资料：[vscode 远程 linux(包括离线vscode-server安装，免密登录方法)_vscode-server-linux-CSDN博客](https://blog.csdn.net/qq_43623902/article/details/136258880)

#### <font size=3>5.2.1 获取vscode的提交记录</font>

如果是在有网的环境下，我们可以直接在vscode中向linux服务器端安装Visual Studio Code Server，但是对于没有网的环境，我们可以这样做，点开vscode【帮助】&rarr;【关于】可以得到vscode的版本信息：

<img src="README/img/image-20250516203615179.png" alt="image-20250516203615179"  />

我们记下当前使用的vscode的提交信息：

```shell
版本: 1.100.2 (user setup)
提交: 848b80aeb52026648a8ff9f7c45a9b0a80641e2e
日期: 2025-05-14T21:47:40.416Z
```

#### <font size=3>5.2.2 下载vscode-server-linux</font>

从1.86.1版本开始，vscode-server在linux中的目录结构就发生了变化了。从1.86版本开始，glibc库版本需要在2.28以上（[January 2024 (version 1.86)](https://code.visualstudio.com/updates/v1_86#_linux-minimum-requirements-update)）后面还会提到这个事情，所以从这个版本之后服务器中c库版本太低的话就不能使用ssh remote插件了。

- **旧版离线包**

可以将上面的提交id替换到下面的commit_id中：

```shell
#x86:
https://update.code.visualstudio.com/commit:${commit_id}/server-linux-x64/stable
#arm:
https://update.code.visualstudio.com/commit:${commit_id}/server-linux-arm64/stable
```

> 实际上vscode版本还分stable和insider的，vscode为蓝色图标的为stable版，绿色图标的为insider版。insider版需要将上述链接最后的stable改成insider。
>
> 对于arm的64位机器，需要将链接中的x64改成arm64，如下所示。（对于一些较新版本的vscode客户端，可能还没有arm64的服务端，1.72.2版本的客户端是有的）。
>
> ```shell
> https://update.code.visualstudio.com/commit:${commit_id}/server-linux-arm64/stable
> ```

注意将\${commit_id}替换为刚刚查到的commit id。在这里就是：

```shell
https://update.code.visualstudio.com/commit:848b80aeb52026648a8ff9f7c45a9b0a80641e2e/server-linux-x64/stable
```

然后我们就会得到这样的一个压缩包：

<img src="README/img/image-20250516204531508.png" alt="image-20250516204531508"  />

- **新版离线包**

在某次更新后远程端的 .vscode-server 目录结构发生变化：

<img src="README/img/image-20250516235450506.png" alt="image-20250516235450506" />

后面新版和旧版的就变成了下图这种结构：

```shell
📦.vscode-server
 ┣━ 📁bin  # 存放旧方法下的vscode commit相关文件
 ┃   ┗━ 📁${commit_id1}
 ┃   ┗━ 📁${commit_id2}
 ┃   ┗━ ···
 ┣━ 📁cli  # 存放新方法下的vscode commit相关文件
 ┃   ┗━ 📁servers
 ┃   ┃   ┗━ 📁Stable-${commit_id}
 ┃   ┃   ┃   ┗━ 📁server # vscode-server-linux-arm64.tar.gz
 ┃   ┃   ┃   ┗━ ···
 ┃   ┃   ┗━ ···
 ┃   ┗━ 📜iru.json  # 存放最近的vscode commit_id
 ┣━ 📜code-${commit_id} # 存放vscode_cli_alpine_x64_cli.tar.gz解压后名为code的文件,并将其改名为code-${commit_id}
 ┣━ 📁data
 ┗━ 📁extensions
```

现在需要安装两个文件,两个文件的下载地址如下:

```shell
# x86:
https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode-server-linux-x64.tar.gz
https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode_cli_alpine_x64_cli.tar.gz

# arm:
https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode-server-linux-arm64.tar.gz
https://vscode.download.prss.microsoft.com/dbazure/download/stable/${commit_id}/vscode_cli_alpine_arm64_cli.tar.gz

```

在这里就是：

```shell
https://vscode.download.prss.microsoft.com/dbazure/download/stable/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/vscode-server-linux-x64.tar.gz
https://vscode.download.prss.microsoft.com/dbazure/download/stable/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/vscode_cli_alpine_x64_cli.tar.gz
```

会得到下面两个压缩包：

<img src="README/img/image-20250516231129415.png" alt="image-20250516231129415" />

#### <font size=3>5.2.3 服务器端安装</font>

##### <font size=3>5.2.3.1 旧版离线包安装</font>

- 创建对应的目录

```shell
mkdir -p ~/.vscode-server/bin/${commit_id}
```

当前版本下就是：

```shell
mkdir -p ~/.vscode-server/bin/848b80aeb52026648a8ff9f7c45a9b0a80641e2e
```

- 解压vscode-server-linux-x64.tar.gz

```shell
tar -zxvf vscode-server-linux-x64.tar.gz --strip-components=1 -C ~/.vscode-server/bin/${commit_id}
```

这个压缩包解压后还存在顶层目录：

```shell
vscode-server-linux-x64
├── bin
├── extensions
├── LICENSE
├── ...
└── product.json

4 directories, 4 files
```

要去掉这一层目录，就要加上--strip-components=1，在这里就是：

```shell
tar -zxvf vscode-server-linux-x64.tar.gz --strip-components=1 -C ~/.vscode-server/bin/848b80aeb52026648a8ff9f7c45a9b0a80641e2e
```

最终目录结构为：

```shell
/home/user_name/.vscode-server/bin/848b80aeb52026648a8ff9f7c45a9b0a80641e2e/
├── bin
├── extensions
├── ...
└── product.json

4 directories, 4 files
```

##### <font size=3>5.2.3.2 新版离线包安装</font>

- 创建对应的目录

```shell
mkdir -p ~/.vscode-server/cli/servers/Stable-${commit_id}
```

在这里就是：

```shell
mkdir -p ~/.vscode-server/cli/servers/Stable-848b80aeb52026648a8ff9f7c45a9b0a80641e2e
```

- 解压vscode-server-linux-x64.tar.gz

```shell
tar -zxvf vscode-server-linux-x64.tar.gz
# mv vscode-server-linux-x64  ~/.vscode-server/cli/servers/Stable-${commit_id}/server
mv vscode-server-linux-x64  ~/.vscode-server/cli/servers/Stable-848b80aeb52026648a8ff9f7c45a9b0a80641e2e/server
```

- 解压vscode_cli_alpine_x64_cli.tar.gz

```shell
tar -zxvf vscode_cli_alpine_x64_cli.tar.gz
# mv code  ~/.vscode-server/code-${commit_id}
mv code  ~/.vscode-server/code-848b80aeb52026648a8ff9f7c45a9b0a80641e2e
```

- 目录结构如下：

<img src="README/img/image-20250516232725186.png" alt="image-20250516232725186" />

### <font size=3>5.3 连接远程服务器</font>

#### <font size=3>5.3.1 服务器端SSH</font>

首先服务器端需要安装好openssh-server：

```shell
 sudo apt-get install openssh-server
 ps -e |grep ssh
```

<img src="README/img/image-20250516224915958.png" alt="image-20250516224915958" />

#### <font size=3>5.3.2 windows可以ping通服务器</font>

```shell
ping xxx.xxx.xxx.xxx
```

#### <font size=3>5.3.3 连接远程服务器</font>

- （1）新建远程连接

<img src="README/img/image-20250516225535769.png" alt="image-20250516225535769" />

```shell
ssh <user>@<hostname>:[port]
# user: 是在远程服务器上的用户名；
# hostname: 远程服务器的主机名或IP 地址；
# port: SSH 连接的端口号(默认为 22)
```

> Tips：其实一般是可以不写端口号的。

- （2）后面就一直根据提示即可，当最后输入完密码，若是有联网，就会在服务器端安装vscode server，若是没有联网，则参考上一节的笔记，离线安装。

<img src="README/img/image-20250516225803761.png" alt="image-20250516225803761" />

- （3）安装完成后，服务器端会生成以下目录：

<img src="README/img/image-20250516225941241.png" alt="image-20250516225941241" />

目录结构如下所示：

<img src="README/img/image-20250516235450506.png" alt="image-20250516235450506" />

然后我们就可以开始使用ssh remote工具进行远程开发了。

### <font size=3>5.4 GLIBC问题</font>

#### <font size=3>5.4.1 报错信息</font>

上面即便是下载了新版本的离线包，有可能还是会出问题，如：

<img src="README/img/image-20250517092208549.png" alt="image-20250517092208549"  />

我们可以打开输出窗口看一下报错信息：

<img src="README/img/image-20250517092246568.png" alt="image-20250517092246568"  />

都是在说]远程主机可能不符合 glibc 和 libstdc++ Vs code 服务器的先决条件，其实去查一下vscode的发布记录，会发现在1.86版本有如下说明：

>[Linux minimum requirements update](https://code.visualstudio.com/updates/v1_86#_linux-minimum-requirements-update)
>
>In this milestone, we have updated the toolchains to build our desktop client. From this release onwards, VS Code desktop is only compatible with Linux distributions based on glibc 2.28 or later, and glibcxx 3.4.25 or later, such as Debian 10, RHEL 8, or Ubuntu 20.04.
>
>If you are unable to upgrade your Linux distribution, the recommended alternative is to use our [web client](https://code.visualstudio.com/docs/setup/vscode-web). If you would like to use the desktop version, then you can [download the VS Code release 1.85](https://code.visualstudio.com/updates/v1_85). Depending on your platform, make sure to disable updates to stay on that version. A good recommendation is to set up the installation with [Portable Mode](https://code.visualstudio.com/docs/editor/portable).
>
>​																													——[January 2024 (version 1.86)](https://code.visualstudio.com/updates/v1_86#_linux-minimum-requirements-update)

其实也没必要回退这么多吧，我们继续看发布信息，会发现在1.99版本中有说明

>[Linux legacy server support has ended](https://code.visualstudio.com/updates/v1_99#_linux-legacy-server-support-has-ended)
>
>As of release 1.99, you can no longer connect to these servers. As noted in our [1.97 release](https://github.com/microsoft/vscode-docs/blob/main/remote-release-notes/v1_97.md#migration-path-for-linux-legacy-server), users that require additional time to complete migration to a supported Linux distro can provide custom builds of `glibc` and `libstdc++` as a workaround. More info on this workaround can be found in the [FAQ](https://aka.ms/vscode-remote/faq/old-linux) section.
>
>​																													——[March 2025 (version 1.99)](https://code.visualstudio.com/updates/v1_99#_remote-development)

可以看到，结合上面的1.86的发布信息，这里大概就是说1.99版本开始就停止支持老版本的库吧，反正大概这个意思，也就是说无法升级库的话，最新应该是可以用到1.99的上一个版本，也就是1.98.2版本了。

#### <font size=3>5.4.2 GLIBC库版本</font>

可以看一下服务器中libc库的版本：

```shell
$ cat `gcc -print-file-name=libc.so`
# 一般是 /lib/x86_64-linux-gnu/libc.so.6
$ ls /lib/x86_64-linux-gnu/libc.so.6 -alh # 查看 软链接指向的库，一般会直接有版本信息
$ /lib/x86_64-linux-gnu/libc.so.6         # 直接执行这个动态库
```

如果服务器的libc库可以升级，那就升级库就行了，要是不能升级，就换[February 2025 (version 1.98)](https://code.visualstudio.com/updates/v1_98)版本，可以在这里下载：[VSCodeUserSetup-x64-1.98.2](https://vscode.download.prss.microsoft.com/dbazure/download/stable/ddc367ed5c8936efe395cffeec279b04ffd7db78/VSCodeUserSetup-x64-1.98.2.exe)

## <font size=3>6. 语法高亮工具</font>

### <font size=3>6.1 Makefile Tools</font>

#### <font size=3>6.1.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Makefile Tools
ID: ms-vscode.makefile-tools
说明: Provide makefile support in VS Code: C/C++ IntelliSense, build, debug/run.
版本: 0.12.17
发布者: Microsoft
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/makefile-tools/0.12.17/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-vscode/vsextensions/makefile-tools/0.12.17/vspackage

#### <font size=3>6.1.2 插件配置</font>

### <font size=3>6.2 DeviceTree</font>

#### <font size=3>6.2.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: DeviceTree
ID: plorefice.devicetree
说明: DeviceTree Language Support for Visual Studio Code
版本: 0.1.1
发布者: Pietro Lorefice
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=plorefice.devicetree

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/plorefice/vsextensions/devicetree/0.1.1/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/plorefice/vsextensions/devicetree/0.1.1/vspackage

#### <font size=3>6.2.2 插件配置</font>

### <font size=3>6.3 stylus</font>

#### <font size=3>6.3.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: stylus
ID: sysoev.language-stylus
说明: stylus language support
版本: 1.16.0
发布者: sysoev
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=sysoev.language-stylus

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/sysoev/vsextensions/language-stylus/1.16.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/sysoev/vsextensions/language-stylus/1.16.0/vspackage

#### <font size=3>6.3.2 插件配置</font>

### <font size=3>6.4 GNU Linker Map files</font>

#### <font size=3>6.4.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: GNU Linker Map files
ID: trond-snekvik.gnu-mapfiles
说明: Syntax highlighting and symbol listing for GNU linker .map files
版本: 1.1.0
发布者: Trond Snekvik
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=trond-snekvik.gnu-mapfiles

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/trond-snekvik/vsextensions/gnu-mapfiles/1.1.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/trond-snekvik/vsextensions/gnu-mapfiles/1.1.0/vspackage

#### <font size=3>6.4.2 插件配置</font>

### <font size=3>6.5 LinkerScript</font>

#### <font size=3>6.5.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: LinkerScript
ID: ZixuanWang.linkerscript
说明: Language support for GNU linker script
版本: 1.0.4
发布者: Zixuan Wang
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ZixuanWang.linkerscript

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ZixuanWang/vsextensions/linkerscript/1.0.4/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ZixuanWang/vsextensions/linkerscript/1.0.4/vspackage

#### <font size=3>6.5.2 插件配置</font>

### <font size=3>6.6 Arm Assembly</font>

#### <font size=3>6.6.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Arm Assembly
ID: dan-c-underwood.arm
说明: Arm assembly syntax support for Visual Studio Code
版本: 1.7.4
发布者: dan-c-underwood
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=dan-c-underwood.arm

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/dan-c-underwood/vsextensions/arm/1.7.4/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/dan-c-underwood/vsextensions/arm/1.7.4/vspackage

### <font size=3>6.7 Nunjucks</font>

#### <font size=3>6.7.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Nunjucks
ID: ronnidc.nunjucks
说明: A Nunjucks syntax definition + snippets
版本: 0.3.1
发布者: ronnidc
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=ronnidc.nunjucks

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ronnidc/vsextensions/nunjucks/0.3.1/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ronnidc/vsextensions/nunjucks/0.3.1/vspackage

#### <font size=3>6.7.2 插件配置</font>

## <font size=3>8. C/C++开发</font>

### <font size=3>8.1 clangd</font>

[What is clangd?](https://clangd.llvm.org/)

#### <font size=3>8.1.1 插件安装</font>

```shell
vscode-clangd:
  publisher: llvm-vs-code-extensions
  extension: vscode-clangd
  version: 0.1.33
  vsix-url: https://marketplace.visualstudio.com/_apis/public/gallery/publishers/llvm-vs-code-extensions/vsextensions/vscode-clangd/0.1.33/vspackage
```

主要是装在服务器中。

#### <font size=3>8.1.2 clangd安装</font>

我这里装的19.1.2：[Releases · clangd/clangd](https://github.com/clangd/clangd/releases/tag/19.1.2)

<img src="README/img/image-20250519004642888.png" alt="image-20250519004642888" />

#### <font size=3>8.1.3 插件配置</font>

打开远程配置文件：

<img src="README/img/image-20250519004909604.png" alt="image-20250519004909604" />

然后添加以下内容：

```json
{
    "clangd.arguments": [
		"--log=verbose",
		"--clang-tidy",
		"--clang-tidy-checks=cppcoreguidelines-*,performance-*,bugprone-*,portability-*,modernize-*,google-*",
		"--compile-commands-dir=${workspacefolder}",
		"--completion-style=detailed",
		"--background-index",
		"-j=16",
		"--all-scopes-completion",
		"--header-insertion-decorators",
		"--header-insertion=never",
		"--pch-storage=disk",
		"--function-arg-placeholders=false",
		"--cross-file-rename",
		"--enable-config",
		"--fallback-style=webkit",
		"--ranking-model=heuristics",
		"--pretty",
	],
	"clangd.path": "/home/sumu/2software/clangd_19.1.2/bin/clangd",
}
```

"clangd.path"：就是在服务器端安装的clangd程序的目录。

"--compile-commands-dir"：对应后续 compile_commands.json 文件位置，上面是配置为工程目录。

#### <font size=3>8.1.4 编译命令</font>

clangd的使用需要工程中存在 compile_commands.json 文件，怎么生成呢？可以用bear命令生成。

```shell
# Makefile
bear make

# Cmake
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

但是有时候我们可能是用shell脚本控制编译，然后内部有很多个子makefile，可以直接在脚本前加bear：

```shell
bear ./build.sh -p1 -n2
```

生成之后，需要重启clangd服务（或重新打开远程），然后就可以用了。

### <font size=3>8.2 Clang-Format</font>

[LLVM 的 Clang C 语言家族前端 - Clang 编译器](https://clang.llvm.net.cn/)

[Clang C Language Family Frontend for LLVM](https://clang.llvm.org/)

#### <font size=3>8.2.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: Clang-Format
ID: xaver.clang-format
说明: Use Clang-Format in Visual Studio Code
版本: 1.9.0
发布者: Xaver Hellauer
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=xaver.clang-format

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/xaver/vsextensions/clang-format/1.9.0/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/xaver/vsextensions/clang-format/1.9.0/vspackage

#### <font size=3>8.2.2 插件配置</font>

[Clang-Format Style Options — Clang 21.0.0git documentation](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)

[Clang-Format 样式选项 — Clang 20.0.0git 文档 - Clang 编译器](https://clang.llvm.net.cn/docs/ClangFormatStyleOptions.html)

```yaml
# .clang-format
BasedOnStyle: Microsoft # Google|Chromium|Mozilla|WebKit|Microsoft|GNU

# 头文件排序
SortIncludes: true
IncludeCategories:
  - Regex: '^<.*>'
    Priority: 1
  - Regex: '^".*"'
    Priority: 2

# 从switch语句开始，缩进大小写标记一个级别。
IndentCaseLabels: true

# 使预处理指令（如 #if）与其内部的代码块保持相同的缩进层级。
IndentPPDirectives: None

# 强制类名与{保持在同一行
BreakBeforeBraces: Custom
BraceWrapping:
  AfterClass: false      # 
  AfterNamespace: false  # 命名空间后换行
  AfterStruct: false

# 对齐c++类中的成员变量
AlignConsecutiveDeclarations: true

# 命名空间缩进配置
NamespaceIndentation: All 

# 缩进宽度（如 2、4）
IndentWidth: 4
```

## <font size=3>9. 自动生成注释</font>

### <font size=3>9.1 koroFileHeader</font>

这个插件是自动生成注释的，但是延迟会比较大，可配置项比较多。其实要不要都行。

#### <font size=3>9.1.1 插件安装</font>

```shell
# https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{发布者}/vsextensions/{插件名}/{版本号}/vspackage

名称: koroFileHeader
ID: OBKoro1.korofileheader
说明: 用于生成文件头部注释和函数注释的插件，支持所有主流语言,功能强大，灵活方便，文档齐全，食用简单！
版本: 4.9.3
发布者: OBKoro1
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=OBKoro1.korofileheader

https://marketplace.visualstudio.com/_apis/public/gallery/publishers/OBKoro1/vsextensions/korofileheader/4.9.3/vspackage
```

VSIX下载链接：https://marketplace.visualstudio.com/_apis/public/gallery/publishers/OBKoro1/vsextensions/korofileheader/4.9.3/vspackage

#### <font size=3>9.1.2 插件配置</font>

[配置字段 · OBKoro1/koro1FileHeader Wiki](https://github.com/OBKoro1/koro1FileHeader/wiki/配置字段)：

```json
// 头部注释
"fileheader.customMade": {
    // Author字段是文件的创建者 可以在specialOptions中更改特殊属性
    // 公司项目和个人项目可以配置不同的用户名与邮箱 搜索: gitconfig includeIf  比如: https://ayase.moe/2021/03/09/customized-git-config/
    // 自动提取当前git config中的: 用户名、邮箱
    "Author": "git config user.name && git config user.email", // 同时获取用户名与邮箱
    // "Author": "git config user.name", // 仅获取用户名
    // "Author": "git config user.email", // 仅获取邮箱
    // "Author": "OBKoro1", // 写死的固定值 不从git config中获取
    "Date": "Do not edit", // 文件创建时间(不变)
    // LastEditors、LastEditTime、FilePath将会自动更新 如果觉得时间更新的太频繁可以使用throttleTime(默认为1分钟)配置更改更新时间。
    "LastEditors": "git config user.name && git config user.email", // 文件最后编辑者 与Author字段一致
    // 由于编辑文件就会变更最后编辑时间，多人协作中合并的时候会导致merge
    // 可以将时间颗粒度改为周、或者月，这样冲突就减少很多。搜索变更时间格式: dateFormat
    "LastEditTime": "Do not edit", // 文件最后编辑时间
    // 输出相对路径，类似: /文件夹名称/src/index.js
    "FilePath": "Do not edit", // 文件在项目中的相对路径 自动更新
    // 插件会自动将光标移动到Description选项中 方便输入 Description字段可以在specialOptions更改
    "Description": "", // 介绍文件的作用、文件的入参、出参。
    // custom_string_obkoro1~custom_string_obkoro100都可以输出自定义信息
    // 可以设置多条自定义信息 设置个性签名、留下QQ、微信联系方式、输入空行等
    "custom_string_obkoro1": "", 
    // 版权声明 保留文件所有权利 自动替换年份 获取git配置的用户名和邮箱
    // 版权声明获取git配置, 与Author字段一致: ${git_name} ${git_email} ${git_name_email}
    "custom_string_obkoro1_copyright": "Copyright (c) ${now_year} by ${git_name_email}, All Rights Reserved. "
    // "custom_string_obkoro1_copyright": "Copyright (c) ${now_year} by 写死的公司名/用户名, All Rights Reserved. "
},
// 函数注释
"fileheader.cursorMode": {
    "description": "", // 函数注释生成之后，光标移动到这里
    "param": "", // param 开启函数参数自动提取 需要将光标放在函数行或者函数上方的空白行
    "return": "",
},
// 插件配置项
"fileheader.configObj": {
    "autoAdd": true, // 检测文件没有头部注释，自动添加文件头部注释
    "autoAddLine": 100, // 文件超过多少行数 不再自动添加头部注释
    "autoAlready": true, // 只添加插件支持的语言以及用户通过`language`选项自定义的注释
    "supportAutoLanguage": [], // 设置之后，在数组内的文件才支持自动添加
   // 自动添加头部注释黑名单
   "prohibitAutoAdd": [
      "json"
    ],
   "prohibitItemAutoAdd": [ "项目的全称禁止项目自动添加头部注释, 使用快捷键自行添加" ],
   "folderBlacklist": [ "node_modules" ], // 文件夹或文件名禁止自动添加头部注释
   "wideSame": false, // 头部注释等宽设置
   "wideNum": 13,  // 头部注释字段长度 默认为13
    "functionWideNum": 0, // 函数注释等宽设置 设为0 即为关闭
   // 头部注释第几行插入
    "headInsertLine": {
      "php": 2 // php文件 插入到第二行
    },
    "beforeAnnotation": {}, // 头部注释之前插入内容
    "afterAnnotation": {}, // 头部注释之后插入内容
    "specialOptions": {}, // 特殊字段自定义 比如: Author、LastEditTime、LastEditors、FilePath、Description、Date等
    "switch": {
      "newlineAddAnnotation": true // 默认遇到换行符(\r\n \n \r)添加注释符号
    },
    "moveCursor": true, // 自动移动光标到Description所在行
    "dateFormat": "YYYY-MM-DD HH:mm:ss",
    "atSymbol": ["@", "@"], // 更改所有文件的自定义注释中的@符号
    "atSymbolObj": {}, //  更改单独语言/文件的@
    "colon": [": ", ": "], // 更改所有文件的注释冒号
    "colonObj": {}, //  更改单独语言/文件的冒号
    "filePathColon": "路径分隔符替换", // 默认值： mac: / window是: \
    "showErrorMessage": false, // 是否显示插件错误通知 用于debugger
    "writeLog": false, // 错误日志生成
    "CheckFileChange": false, // 单个文件保存时进行diff检查
    "createHeader": false, // 新建文件自动添加头部注释
    "useWorker": false, // 是否使用工作区设置
    "designAddHead": false, // 添加注释图案时添加头部注释
    "headDesignName": "random", // 图案注释使用哪个图案 
    "headDesign": false, // 是否使用图案注释替换头部注释
    // 自定义配置是否在函数内生成注释 不同文件类型和语言类型
    "cursorModeInternalAll": {}, // 默认为false 在函数外生成函数注释
    "openFunctionParamsCheck": true, // 开启关闭自动提取添加函数参数
    "functionParamsShape": ["{", "}"], // 函数参数外形自定义 
    // "functionParamsShape": "no type" 函数参数不需要类型
    "functionBlankSpaceAll": {}, // 函数注释空格缩进 默认为空对象 默认值为0 不缩进
    "functionTypeSymbol": "*", // 参数没有类型时的默认值
    "typeParamOrder": "type param", // 参数类型 和 参数的位置自定义
    "NoMatchParams": "no show param", // 没匹配到函数参数，是否显示@param与@return这两行 默认不显示param
    "functionParamAddStr": "", // 在 type param 后面增加字符串 可能是冒号，方便输入参数描述
    // 自定义语言注释，自定义取消 head、end 部分
    // 不设置自定义配置language无效 默认都有head、end
    "customHasHeadEnd": {}, // "cancel head and function" | "cancel head" | "cancel function" 
    "throttleTime": 60000, // 对同一个文件 需要过1分钟再次修改文件并保存才会更新注释
     // 自定义语言注释符号，覆盖插件的注释格式
    "language": {
        // js后缀文件
        "js": {
            "head": "/$$",
            "middle": " $ @",
            "end": " $/",
            // 函数自定义注释符号：如果有此配置 会默认使用
            "functionSymbol": {
              "head": "/******* ", // 统一增加几个*号
              "middle": " * @",
              "end": " */"
            },
            "functionParams": "typescript" // 函数注释使用ts语言的解析逻辑
        },
       // 一次匹配多种文件后缀文件 不用重复设置
       "h/hpp/cpp": {
          "head": "/*** ", // 统一增加几个*号
          "middle": " * @",
          "end": " */"
        },
        // 针对有特殊要求的文件如：test.blade.php
        "blade.php":{
          "head": "<!--",
          "middle": " * @",
          "end": "-->",
        }
    },
 // 默认注释  没有匹配到注释符号的时候使用。
 "annotationStr": { 
      "head": "/*",
      "middle": " * @",
      "end": " */",
      "use": false
    },
}
```

## <font size=3>10. Shell function outline</font>

```shell
名称: Shell function outline
ID: jannek-aalto.shell-function-outline
说明: Provides basic outline capability for shell script functions. For ksh, bash etc.
版本: 1.2.2
发布者: jannek-aalto
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=jannek-aalto.shell-function-outline
```



## <font size=3>11. background-cover</font>

```shell
名称: background-cover
ID: manasxx.background-cover
说明: Add a picture you like to cover the entire vscode background. / 添加你喜欢的图片覆盖整个vscode背景
版本: 2.7.0
发布者: 满猪小星小猪满
VS Marketplace 链接: https://marketplace.visualstudio.com/items?itemName=manasxx.background-cover
```

# <font size=3>四、配置</font>

## <font size=3>1. 配置界面与文件</font>

### <font size=3>1.1 怎么打开设置？</font>

<img src="README/img/image-20250516151518878.png" alt="image-20250516151518878"  />

不管界面怎么样，就找【齿轮】的图标，这个就是设置，点开之后打开设置，就可以看到下面有两个选项，一个是用户，一个是工作区。

### <font size=3>1.2 配置文件</font>

vscode支持界面配置，界面进行的配置也可以用配置文件来实现。怎么打开配置文件？上面设置界面，我们看到旁边有这样一个图标：

<img src="README/img/image-20250516151818225.png" alt="image-20250516151818225"  />

点完这个就会切换到配置文件，用户配置对应的是这个文件：

```shell
# user settings
C:\Users\<user_name>\AppData\Roaming\Code\User\settings.json
```

工作区配置对应的是这个当前工作区的配置，如果当前工作区不存在配置文件，那么就会在当前工作区所在的目录创建`.vscode\settings.json`配置文件：

<img src="README/img/image-20250516152043201.png" alt="image-20250516152043201"  />

对于工作区来说，工作区的配置文件优先级最高。

### <font size=3>1.3 远程配置文件</font>

要是安装了remote SSH插件，连接了远程服务器的话，还会有远程配置文件：

<img src="README/img/image-20250516220101059.png" alt="image-20250516220101059" />

当ssh remote连接到服务器时，远程服务器的这个配置文件优先级要高于本地的配置文件，当断开后，服务器端的配置文件不影响本地。这个配置文件存在于服务器的下面的目录中：

```shell
~/.vscode-server/data/Machine/settings.json
```

## <font size=3>2. settings.json</font>

```json
{
    //调整窗口的缩放级别 window.zoomLevel
    "window.zoomLevel": 0.0,
    //终端参数配置
    "terminal.integrated.cursorStyle": "block",
    "terminal.integrated.cursorBlinking": true,
    "terminal.integrated.lineHeight": 1,
    "terminal.integrated.letterSpacing": 0.5,
    "terminal.integrated.fontSize": 16,  
    "terminal.integrated.fontFamily": "Courier",
    "files.autoGuessEncoding": true,
    "terminal.integrated.fontWeight": 700,
    //文本编辑窗口配置
    "editor.fontSize": 16,
    "editor.fontLigatures": "10",
    "editor.fontFamily": "Courier",
    "editor.fontWeight": 700, //控制字体粗细
    "editor.quickSuggestions":{
        "comments": "off",
        "strings": "off",
        "other": "off"
    },
    //"editor.renderWhitespace": "all",//显示所有空格为点
    //用户代码片段触发
    "[c]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    },
    "[cpp]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    },
    "[makefile]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    },
    "[arm]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    },
    "[linkerscript]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    },
    //图标主题
    "workbench.iconTheme": "material-icon-theme",
    // VScode 启动内置多彩括号
    "editor.bracketPairColorization.enabled": true,
    // 自动保存设置
    "files.autoSave": "onFocusChange",   // off | afterDelay | onFocusChange | onWindowChange
    "files.autoSaveDelay": 60000,
    "workbench.colorTheme": "One Dark Pro Darker",
    "security.workspace.trust.untrustedFiles": "open",
    "terminal.integrated.defaultProfile.windows": "Git Bash",
    "Codegeex.Privacy": false,
    "hexeditor.columnWidth": 16,
    "hexeditor.showDecodedText": true,
    "hexeditor.defaultEndianness": "little",
    "hexeditor.inspectorType": "aside",
    "files.associations": {
        "*.include": "makefile"
    }, // 单位为 ms , autoSave = afterDelay 时生效

    // 头部注释
  "fileheader.customMade": {
    // Author字段是文件的创建者 可以在specialOptions中更改特殊属性
    // 公司项目和个人项目可以配置不同的用户名与邮箱 搜索: gitconfig includeIf  比如: https://ayase.moe/2021/03/09/customized-git-config/
    // 自动提取当前git config中的: 用户名、邮箱
    "Author": "git config user.name && git config user.email", // 同时获取用户名与邮箱
    // "Author": "git config user.name", // 仅获取用户名
    // "Author": "git config user.email", // 仅获取邮箱
    // "Author": "OBKoro1", // 写死的固定值 不从git config中获取
    "Date": "Do not edit", // 文件创建时间(不变)
    // LastEditors、LastEditTime、FilePath将会自动更新 如果觉得时间更新的太频繁可以使用throttleTime(默认为1分钟)配置更改更新时间。
    "LastEditors": "git config user.name && git config user.email", // 文件最后编辑者 与Author字段一致
    // 由于编辑文件就会变更最后编辑时间，多人协作中合并的时候会导致merge
    // 可以将时间颗粒度改为周、或者月，这样冲突就减少很多。搜索变更时间格式: dateFormat
    "LastEditTime": "Do not edit", // 文件最后编辑时间
    // 输出相对路径，类似: /文件夹名称/src/index.js
    "FilePath": "Do not edit", // 文件在项目中的相对路径 自动更新
    // 插件会自动将光标移动到Description选项中 方便输入 Description字段可以在specialOptions更改
    "Description": "", // 介绍文件的作用、文件的入参、出参。
    // custom_string_obkoro1~custom_string_obkoro100都可以输出自定义信息
    // 可以设置多条自定义信息 设置个性签名、留下QQ、微信联系方式、输入空行等
    "custom_string_obkoro1": "", 
    // 版权声明 保留文件所有权利 自动替换年份 获取git配置的用户名和邮箱
    // 版权声明获取git配置, 与Author字段一致: ${git_name} ${git_email} ${git_name_email}
    "custom_string_obkoro1_copyright": "Copyright (c) ${now_year} by ${git_name_email}, All Rights Reserved. "
    // "custom_string_obkoro1_copyright": "Copyright (c) ${now_year} by 写死的公司名/用户名, All Rights Reserved. "
  },
  // 函数注释
  "fileheader.cursorMode": {
    "brief": "", // 函数注释生成之后，光标移动到这里
    "note": "", // 函数注释生成之后，光标移动到这里
    "param": "", // param 开启函数参数自动提取 需要将光标放在函数行或者函数上方的空白行
    "retval": "",
  },
  // 插件配置项
  "fileheader.configObj": {
    "autoAdd": false, // 检测文件没有头部注释，自动添加文件头部注释
    "autoAddLine": 100, // 文件超过多少行数 不再自动添加头部注释
    "autoAlready": true, // 只添加插件支持的语言以及用户通过`language`选项自定义的注释
    "supportAutoLanguage": [], // 设置之后，在数组内的文件才支持自动添加
  // 自动添加头部注释黑名单
  "prohibitAutoAdd": [
      "json"
    ],
  "prohibitItemAutoAdd": [ "项目的全称禁止项目自动添加头部注释, 使用快捷键自行添加" ],
  "folderBlacklist": [ "node_modules" ], // 文件夹或文件名禁止自动添加头部注释
  "wideSame": true, // 头部注释等宽设置
  "wideNum": 15,  // 头部注释字段长度 默认为13
  "functionWideNum": 6, // 函数注释等宽设置 设为0 即为关闭
  // 头部注释第几行插入
    "headInsertLine": {
      "php": 2 // php文件 插入到第二行
    },
    "beforeAnnotation": {}, // 头部注释之前插入内容
    "afterAnnotation": {}, // 头部注释之后插入内容
    "specialOptions": {}, // 特殊字段自定义 比如: Author、LastEditTime、LastEditors、FilePath、Description、Date等
    "switch": {
      "newlineAddAnnotation": true // 默认遇到换行符(\r\n \n \r)添加注释符号
    },
    "moveCursor": true, // 自动移动光标到Description所在行
    "dateFormat": "YYYY-MM-DD HH:mm:ss",
    "atSymbol": ["@", "@"], // 更改所有文件的自定义注释中的@符号
    "atSymbolObj": {}, //  更改单独语言/文件的@
    "colon": [": ", " "], // 更改所有文件的注释冒号
    "colonObj": {}, //  更改单独语言/文件的冒号
    "filePathColon": "路径分隔符替换", // 默认值： mac: / window是: \
    "showErrorMessage": false, // 是否显示插件错误通知 用于debugger
    "writeLog": false, // 错误日志生成
    "CheckFileChange": false, // 单个文件保存时进行diff检查
    "createHeader": false, // 新建文件自动添加头部注释
    "useWorker": false, // 是否使用工作区设置
    "designAddHead": false, // 添加注释图案时添加头部注释
    "headDesignName": "random", // 图案注释使用哪个图案 
    "headDesign": false, // 是否使用图案注释替换头部注释
    // 自定义配置是否在函数内生成注释 不同文件类型和语言类型
    "cursorModeInternalAll": {}, // 默认为false 在函数外生成函数注释
    "openFunctionParamsCheck": true, // 开启关闭自动提取添加函数参数
    "functionParamsShape": ["[", "]"], // 函数参数外形自定义 
    // "functionParamsShape": "no type" 函数参数不需要类型
    "functionBlankSpaceAll": {}, // 函数注释空格缩进 默认为空对象 默认值为0 不缩进
    "functionTypeSymbol": "", // 参数没有类型时的默认值
    "typeParamOrder": "type param", // 参数类型 和 参数的位置自定义
    "NoMatchParams": "no show param", // 没匹配到函数参数，是否显示@param与@return这两行 默认不显示param
    "functionParamAddStr": "", // 在 type param 后面增加字符串 可能是冒号，方便输入参数描述
    // 自定义语言注释，自定义取消 head、end 部分
    // 不设置自定义配置language无效 默认都有head、end
    "customHasHeadEnd": {}, // "cancel head and function" | "cancel head" | "cancel function" 
    "throttleTime": 60000, // 对同一个文件 需要过1分钟再次修改文件并保存才会更新注释
    // 自定义语言注释符号，覆盖插件的注释格式
    "language": {
        // js后缀文件
        "js": {
            "head": "/$$",
            "middle": " $ @",
            "end": " $/",
            // 函数自定义注释符号：如果有此配置 会默认使用
            "functionSymbol": {
              "head": "/******* ", // 统一增加几个*号
              "middle": " * @",
              "end": " */"
            },
            "functionParams": "typescript" // 函数注释使用ts语言的解析逻辑
        },
      // 一次匹配多种文件后缀文件 不用重复设置
      "h/hpp/cpp": {
          "head": "/** ", // 统一增加几个*号
          "middle": " * @",
          "end": " */"
        },
        // 针对有特殊要求的文件如：test.blade.php
        "blade.php":{
          "head": "<!--",
          "middle": " * @",
          "end": "-->",
        }
    },
  // 默认注释  没有匹配到注释符号的时候使用。
  "annotationStr": { 
      "head": "/*",
      "middle": " * @",
      "end": " */",
      "use": false
    },
  },
  "workbench.activityBar.location": "top",
}

```

