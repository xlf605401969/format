# 格式化工具使用说明

1. 将压缩包解压到项目根目录
2. 编辑format.ps1，配置需要进行格式化的文件夹和文件
3. 右键运行format.ps1脚本，注意可能会提示需要更改脚本执行策略，执行策略按如下步骤更改

## 更改执行策略步骤
- 使用管理员权限运行Windows Powershell
- 键入以下内容并回车
```ps
Set-ExecutionPolicy -ExecutionPolicy Unrestricted
```
- 右键再次执行format.ps1脚本

## 格式化适用范围
格式化目的是对代码缩进等风格进行统一，**需要进行格式化**的文件包括
- 手写c文件
- 手写h文件

**不需要进行格式化**的文件包括
- 库代码
- 配置工具生成文件
- Simulink生成文件