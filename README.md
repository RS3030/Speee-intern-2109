<p align="center">
  <img align="" width="300" alt="logo" src="https://user-images.githubusercontent.com/69951513/133740376-bb0a8a9e-7911-4231-a53e-e8a4a3e46ff8.png">
  <h2 align="center">らくらく不動産売却</h2>
  <p align="center">2021/9 Speee 12days開発インターン チームhammings 制作物</p>
  <br>
</p>
<br>

# メンバー

<a title="Saul Mirone" href="https://github.com/lowzzy"><img src="https://avatars.githubusercontent.com/u/60597773?v=4" width="60" alt="profile picture of Saul Mirone"></a>
<a title="Meo" href="https://github.com/AmiYamamot0"><img src="https://avatars.githubusercontent.com/u/47714983?v=4" width="60" alt="profile picture of Meo"></a>
<a title="xia" href="https://github.com/RS3030"><img src="https://avatars.githubusercontent.com/u/69951513?v=4" width="60" alt="profile picture of xiadd"></a>
<a title="EllePeng" href="https://github.com/tak-ka3"><img src="https://avatars.githubusercontent.com/u/63624070?v=4" width="60" alt="profile picture of EllePeng"></a>

## スクリーンショット
<img width="700" alt="スクリーンショット 2021-09-17 16 17 00" src="https://user-images.githubusercontent.com/69951513/133740977-1e62e368-3483-40a4-9642-17e4d052b2f6.png">
<img width="700" alt="スクリーンショット 2021-09-17 16 17 37" src="https://user-images.githubusercontent.com/69951513/133741052-b753b4a9-57cb-4989-abc4-551646fa2c2f.png">
<img width="700" alt="スクリーンショット 2021-09-17 16 18 08" src="https://user-images.githubusercontent.com/69951513/133741105-77dae230-c66b-41e2-9a44-aa58dc35a781.png">

## 環境構築

``` bash
docker-compose build
docker-compose run --rm app yarn install --check-files
docker-compose run --rm app bin/setup
```

## サーバー起動

``` bash
docker-compose up
open http://localhost:13000
```

## テストの実行

``` bash
docker-compose run --rm app bin/rails test
```

## Rubocop の実行

``` bash
docker-compose run --rm app rubocop
```

## サーバへのデプロイ

0. (初回のみ) `aws ecs run-task --cluster internship-sep2021-2 --task-definition internship-sep2021-2-db-create --launch-type FARGATE --network-configuration '{"awsvpcConfiguration":{"subnets":["subnet-040c56b871bf8abf1","subnet-06f1ca9c09c38319b","subnet-0a12084a432623a16"],"securityGroups": ["sg-080111b219d2529dd"],"assignPublicIp":"ENABLED"}}' --count 1` で `rails db:create` を本番環境のDBに適用し、この Rails アプリが使用する MySQL のデータベースを作成する。
1. [GitHub Actions タブの deploy ワークフロー](https://github.com/speee/hr-eng-internship-2021-2nd-team-2/actions) に移動
2. `This workflow has a workflow_dispatch event trigger.` の右側にある `Run Workflow` ボタンをクリック
3. `Use workflow from` のセレクトボックスからデプロイ対象のブランチを選択
4. `Run Workflow` ボタンをクリック

## ステージング
https://sep2021-2.intern.speee.in

## 開発方針
<b>9/12更新</b>
このままでは当初の見積もり通りの開発が困難と判断したため、テストは基本書かずに進める。

今後の進捗管理にはGithub Projectsを使用する。
毎日開発前にその日やる開発（イシュー）とその担当を決め、Today's tasks に移動させて始める。
その後のイシュー進捗状況は担当している人が各自でカードを移動させる。

その後のPRのマージには他のチームメンバーもしくはメンター福田さんのコードレビューを必須とする。

コードレビューは分担で行う。この際見る点としては、

<li>コーディングスタイルはチーム内のルールに沿っているか</li>
<li>余分なコード（Print等）が残っていないか</li>
<li>他の機能に影響（バグ等）していないか</li>
<li>クラスやメソッドは適切に分離されているか</li>

を意識する。

## rubocop

```
rubocop -A
```
上記コマンドでフォーマットを実行できる。

## rake task(Prefecture table,city tableはこれ叩かないと作成されない)

```
rake import:prefecture
rake import:city
```

