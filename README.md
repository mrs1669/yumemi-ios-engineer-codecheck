# 課題取り組みのメモ
本課題に取り組みに関するメモを[こちら](https://github.com/mrs1669/yumemi-ios-engineer-codecheck/wiki/コーディングテスト)に書いていますので，レビューしてくださる方はこちらをみていただけると嬉しいです！！

# 開発概要
## 実行環境 (基本，最新 [2022/9/28現在] 安定版)
- PC: MacBook Pro 16 2019 (intel CPU)
- OS: macOS Ventura 13.0 beta 8 (22A5352e) ※コーディングテスト開始前から最新のDeveloper Beta OSを利用してしまっていたので，そのままの環境で開発しました
- IDE: Xcode Version 14.0.1 (14A400)
- Swift: Swift 5.7
- 開発ターゲット: iOS16.1 (20B5050f)
- CI: Xcode Cloud

## ライブラリ管理ツール
- [x] SwiftPackageManager
- [ ] CocoaPods
- [ ] Carthage

## 利用ライブラリ
- [SwiftLint](https://github.com/realm/SwiftLint)
- [R.swift](https://github.com/mac-cain13/R.swift)
- [LicenceList](https://github.com/cybozu/LicenseList)
- [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)
- [Lottie](https://github.com/airbnb/lottie-ios)

## アーキテクチャ
- MVP

## Git運用ワークフロー
- git flow

# アプリ概要

## 動作イメージ
![動作イメージ](README_Images/createApp.GIF)

## 追加新機能
### 多言語対応

|日本語|英語|中国語|韓国語|
|---|---|---|---|
|![日本語](https://user-images.githubusercontent.com/40351476/193935323-46365b72-311a-4fa9-afbc-0010f4c34ab9.PNG)|![英語](https://user-images.githubusercontent.com/40351476/193935343-f8214a95-5a2f-4a8c-b838-00aca8f143ed.PNG)|![中国語(簡体字)](https://user-images.githubusercontent.com/40351476/193935363-7c8fbb71-669b-4c72-801b-8f0b2e37a2ff.PNG)|![韓国語](https://user-images.githubusercontent.com/40351476/193935372-a7cbd73e-17de-4466-a21d-b643dc3476a0.PNG)|

### ダークモード対応

|ライトモード|![ライトモード](https://user-images.githubusercontent.com/40351476/193935323-46365b72-311a-4fa9-afbc-0010f4c34ab9.PNG)|![ライトモード](https://user-images.githubusercontent.com/40351476/193937005-c6ebc431-b6d1-4482-bbbd-4a59444bec32.PNG)|![ライトモード](https://user-images.githubusercontent.com/40351476/193937009-20bce6ac-5688-4bc4-9d65-b0f3bdae0803.PNG)|
|---|---|---|---|
|ダークモード|![ダークモード](https://user-images.githubusercontent.com/40351476/193936986-478d0b28-c365-45da-9526-3f883a67a30a.PNG)|![ダークモード](https://user-images.githubusercontent.com/40351476/193936998-c7829f22-ebb1-4e0b-a6ff-be8e5c55f86a.PNG)|![ダークモード](https://user-images.githubusercontent.com/40351476/193937013-ee518da2-46f7-477a-aaca-03256c629f7a.PNG)|

### 気になるリポジトリをGitHubアプリでチェックできる機能
動作イメージ参照 → [ここ](#動作イメージ)

## 以下 課題概要

---

# 株式会社ゆめみ iOS エンジニアコードチェック課題

## 概要

本プロジェクトは株式会社ゆめみ（以下弊社）が、弊社に iOS エンジニアを希望する方に出す課題のベースプロジェクトです。本課題が与えられた方は、下記の概要を詳しく読んだ上で課題を取り組んでください。

## アプリ仕様

本アプリは GitHub のリポジトリーを検索するアプリです。

![動作イメージ](README_Images/app.gif)

### 環境

- IDE：基本最新の安定版（本概要更新時点では Xcode 13.0）
- Swift：基本最新の安定版（本概要更新時点では Swift 5.5）
- 開発ターゲット：基本最新の安定版（本概要更新時点では iOS 15.0）
- サードパーティーライブラリーの利用：オープンソースのものに限り制限しない

### 動作

1. 何かしらのキーワードを入力
2. GitHub API（`search/repositories`）でリポジトリーを検索し、結果一覧を概要（リポジトリ名）で表示
3. 特定の結果を選択したら、該当リポジトリの詳細（リポジトリ名、オーナーアイコン、プロジェクト言語、Star 数、Watcher 数、Fork 数、Issue 数）を表示

## 課題取り組み方法

Issues を確認した上、本プロジェクトを [**Duplicate** してください](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/duplicating-a-repository)（Fork しないようにしてください。必要ならプライベートリポジトリーにしても大丈夫です）。今後のコミットは全てご自身のリポジトリーで行ってください。

コードチェックの課題 Issue は全て [`課題`](https://github.com/yumemi/ios-engineer-codecheck/milestone/1) Milestone がついており、難易度に応じて Label が [`初級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A初級+milestone%3A課題)、[`中級`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3A中級+milestone%3A課題+) と [`ボーナス`](https://github.com/yumemi/ios-engineer-codecheck/issues?q=is%3Aopen+is%3Aissue+label%3Aボーナス+milestone%3A課題+) に分けられています。課題の必須／選択は下記の表とします：

|   | 初級 | 中級 | ボーナス
|--:|:--:|:--:|:--:|
| 新卒／未経験者 | 必須 | 選択 | 選択 |
| 中途／経験者 | 必須 | 必須 | 選択 |


課題 Issueをご自身のリポジトリーにコピーするGitHub Actionsをご用意しております。  
[こちらのWorkflow](./.github/workflows/copy-issues.yml)を[手動でトリガーする](https://docs.github.com/ja/actions/managing-workflow-runs/manually-running-a-workflow)ことでコピーできますのでご活用下さい。

課題が完成したら、リポジトリーのアドレスを教えてください。

## 参考記事

提出された課題の評価ポイントに関しては、[こちらの記事](https://qiita.com/lovee/items/d76c68341ec3e7beb611)に詳しく書かれてありますので、ぜひご覧ください。
ライブラリの利用に関しては [こちらの記事](https://qiita.com/ykws/items/b951a2e24ca85013e722)も参照ください。
