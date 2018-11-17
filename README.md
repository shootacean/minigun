# Minigun

Simple HTTP status check tool.

## 使用方法
1. `aim.json`にチェック対象のURLを記載する
    ```json
    {"url": "https://github.com/shootacean"}
    {"url": "https://github.com/shootacean/notfound"}
    {"url": "https://github-shootacean.com"}
    ```
2. `minigun`を実行する
    ```shell
    $ minigun
    ```
3. `logs`ディレクトリに出力されたログファイルを確認して、結果を確認する
    - `info.log`
    - `warn.log`
    - `error.log`