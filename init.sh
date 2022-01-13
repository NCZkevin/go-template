#!/bin/bash
set -e

echo "开始环境检测"
echo ""

echo "GOPATH: $GOPATH"
if [[ -z $GOPATH ]]; then
  echo "请先设置 golang 开发环境"
  exit
fi

read -p "请输入要初始化的工程目录路径(相对于$GOPATH/src): " work_dir
abs_work_dir=$GOPATH/src/$work_dir
if [[ ! -d $abs_work_dir ]]; then
  echo "$abs_work_dir 不存在, 退出"
  exit
fi

cd $abs_work_dir
echo "当前工程目录: $PWD"
if [[ $PWD/ != $GOPATH/src/* ]]; then
  echo "$PWD 不在 $GOPATH/src 下, 退出"
  exit
fi

echo "环境检测完成"
echo "开始初始化工程目录 ..."
echo ""

echo "create dir build"
mkdir build; cd build; touch .gitkeep;
cd ..

echo "create dir cmd"
mkdir cmd; cd cmd; touch .gitkeep
cd ..

echo "create dir configs"
mkdir configs;cd configs; touch .gitkeep
cd ..

echo "create dir docs"
mkdir docs; cd docs; touch .gitkeep
cd ..

echo "create dir examples"
mkdir examples; cd examples; touch .gitkeep
cd ..

echo "create dir internal/common/model"
mkdir internal; cd internal; touch .gitkeep
mkdir common; cd common; touch .gitkeep
mkdir model; cd model; touch .gitkeep; cd ../../
cd ..

echo "create dir pkg"
mkdir pkg; cd pkg; touch .gitkeep
cd ..

echo "create dir scripts"
mkdir scripts; cd scripts; touch .gitkeep
cd ..

echo "create dir test"
mkdir test; cd test; touch .gitkeep;
cd ..

echo "create dir third_party"
mkdir third_party; cd third_party; touch .gitkeep
cd ..

echo "create dir tools"
mkdir tools; cd tools; touch .gitkeep
cd ..

echo "create go.mod"
touch go.mod

echo ""
echo "工程目录完成初始化"
