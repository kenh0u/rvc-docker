# vcclient-docker
RVC([RVC-Project/Retrieval-based-Voice-Conversion-WebUI](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI))をDockerで手軽に実行するためのDockerfileとシェルスクリプト

## Description

最新のRVCをDockerで手軽かつ綺麗に使えます。

## Requirements

 - Linux or WSL2
 - Docker

## Usage

### Build docker image (first time only)

Dockerfileのベースイメージ(ubuntu:20.04)は各々の環境の都合に合わせて書き換えるといいでしょう。

Ubuntuベースのイメージなら大体動くと思います。

```
git clone https://github.com/kenh0u/rvc-docker.git
cd rvc-docker
./build.sh
```

### Download pretrained (first time only)

HuggingFaceの[lj1995/VoiceConversionWebUI](https://huggingface.co/lj1995/VoiceConversionWebUI)から事前学習モデルをダウンロードします。

```
./download_pretrained.sh
```

事前に`download_pretrained.sh`内のヒアドキュメントを書き換えることで、ダウンロード対象を変更することもできます。

### Run

```
./run.sh
```

コマンドオプションでポートを指定することもできます。(無指定時は7865)

```
./run.sh -p 7865
```

Webブラウザで [https://localhost:7865](https://localhost:7865) (ポートを指定した場合は、そのポート)にアクセスすることで使用できます。

学習や推論の出力ファイルはホストの`rvc`ディレクトリ以下の`logs`,`opt`,`TEMP`,`weights`ディレクトリに保存されます。

ホストの`data`ディレクトリは、コンテナ内`/data`としてアクセス可能なので、学習データセット等を置くと良いと思います。

終了時はターミナルで`Ctrl-C`を押してください。

## Tested Environment

 - Distribution: Ubuntu 20.04.3  
   Kernel: 5.4.0-81-generic  
   CUDA: 11.4  
   Docker: 20.10.7  
   CPU: Intel Xeon E5-2698 v4  
   RAM: 512GB  
   GPU: 8x NVIDIA Tesla V100 32GB
