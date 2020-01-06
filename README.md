### 安装教程

#### 【推荐】brew安装（[brew](https://brew.sh/index_zh-cn)支持WSL/Linux/Mac）

```
➜ brew tap monlor/taps
➜ brew install hcf-pack
```

#### 手动安装（假设安装到~/Document）

* 到[latest release](https://github.com/monlor/hcf-pack/releases/latest)下载`Source code`

  ![](https://file.monlor.com/img/20200106160711.png)

* 解压到`~/Document`

* 添加`~/Document/hcf-pack`到环境变量PATH

### 开始使用

#### 配置项目环境变量

* 在`git`项目目录中执行`hcfpack`，提示生成一个项目环境变量文件

  ![](https://file.monlor.com/img/20200106161737.png)

* 程序会在家目录下的`.project`目录中生成一个文件夹，文件夹命名方式为：**项目组名称_项目名称**

  ![](https://file.monlor.com/img/20200106161913.png)

* 修改`hcfpack.env`中的配置，完成之后继续在`git`项目目录中执行`hcfpack`

#### 使用命令说明

```
➜ hcfpack [dev/uat/prod 或 分支名]
➜ hcfpack [分支名] [dev/uat/prod]
```

* `hcfpack`：不加任何参数时，取当前分支进行发布
* `hcfpack 分支名`：从远程仓库拉取指定分支进行打包，发布到那个环境中取决于分支名称，脚本会模糊匹配分支名称中所包含的`dev/uat/prod`分支名，从而发布到对应的环境。举个例子：`dev`分支名称为`dev-latest`，指定要发布的分支名称为`dev-latest-ttt`，那么脚本会发布`dev-latest-ttt`到`dev`环境
* `hcfpack 分支名 [dev/uat/prod]`：第一个参数指定分支名，第二个参数指定该分支要发布的环境；例如`hcfpack dev-latest-ttt dev`，即发布`dev-latest-ttt`分支到`dev`环境
* **发布当前分支如何指定环境？**`packhcf now dev`即可

#### 项目环境变量说明

```
#============== packhcf ==============
# 此参数决定镜像版本的命名，镜像命名方式为 ${tag}-${env}-${date}，如 v1.5.0-dev-2020010110
tag=v1.5.0

# 后端打包基础镜像
base_image=

# 定义环境分支名称
dev_branch=dev-latest
uat_branch=release-latest
prod_branch=master-latest

# 定义镜像仓库地址，over_http表示镜像库是否是http协议的
dev_server=11.11.11.11:4000
dev_username=
dev_password=
dev_over_http=

uat_server=11.11.11.11:4000
uat_username=
uat_password=
uat_over_http=

prod_server=11.11.11.11:4000
prod_username=
prod_password=
prod_over_http=

# 后端仓库额外路径，如/docker，会拼接在镜像仓库地址后面
registry_extra_path=

# 远程打包信息，本地不安装docker环境的情况下，使用远程服务器的docker环境打包
# 注意在远程服务器上添加自己的ssh密钥
front_server_address=11.11.11.11
front_server_user=root
front_server_dir=/home/web-front/$(date +%y%m%d%H%M)

# 定义rancher地址，用于rancher自动发布，注意命名空间是小写
dev_rancher_url=
dev_rancher_token=
dev_rancher_project_id=
dev_rancher_namespace=default

uat_rancher_url=
uat_rancher_token=
uat_rancher_project_id=
uat_rancher_namespace=default

prod_rancher_url=
prod_rancher_token=
prod_rancher_project_id=
prod_rancher_namespace=default

# 前端模块名称，git仓库中的名称
front_module_name=front
# 前端编译目标文件夹
front_local_dirname=dist
# 自定义前端编译命令
# front_build_cmd="npm run build-script"
# docker打包所需要的文件或文件夹，相对于项目根路径
front_docker_files="./Dockerfile ./docker"
# 本地打包目录，不建议设置为前端项目目录，设置为.时，会在项目根目录中打包
front_local_pack_dir=~/build
# 跳过确认步骤，跳过后执行程序全程无需确认，全自动发布
# skip_verify=false

# 回调函数，脚本发布到镜像库结束时的回调
# function on_finally() {

# 	if [ -f config/config.js.packing ]; then
# 		mv -f config/config.js.packing config/config.js
# 	fi

# }

# 回调函数，在前端代码编译之前的回调
# function on_front_build() {

# 	# 复制config文件 for hcf
# 	if [ -f config/config.js ]; then
# 		cp config/config.js config/config.js.packing
# 	fi
# 	cp -rf config/config.copy.js config/config.js
# 	node update-router --env=""

# }
#============== packhcf ==============
```

#### Rancher信息获取方式

* 获取`Rancher`集群地址

![](https://file.monlor.com/img/20200106164900.png)

![](https://file.monlor.com/img/20200106164930.png)

![](https://file.monlor.com/img/20200106165010.png)

* 获取`Rancher Token`，在管理员用户下

![](https://file.monlor.com/img/20200106165108.png)

![](https://file.monlor.com/img/20200106165146.png)

![](https://file.monlor.com/img/20200106165246.png)

* 获取`Rancher`项目`id`

![](https://file.monlor.com/img/20200106165403.png)

![](https://file.monlor.com/img/20200106165459.png)