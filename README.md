# 职教数智早报

教育信息化、智慧校园、AI教育领域每日精选资讯。

## 文件说明

| 文件 | 说明 |
|------|------|
| `index.html` | 列表页，按日期展示所有早报 |
| `detail.html` | 详情页，单期早报的完整内容 |
| `data.js` | 数据文件，存放所有早报内容 |

## 本地使用

直接双击 `index.html` 打开即可浏览（`data.js` 通过 `<script>` 标签引入，无需服务器）。

## 云端部署（Vercel）

### 1. 准备 GitHub 仓库

1. 登录 [GitHub](https://github.com)，点击右上角 **+** → **New repository**
2. 仓库名填 `daily-news`（任意名称均可），选择 **Public**
3. 点击 **Create repository**
4. 点击 **uploading an existing file**
5. 把本目录下所有文件（`index.html`、`detail.html`、`data.js`）拖入上传框
6. 点击 **Commit changes**

### 2. Vercel 一键部署

1. 登录 [Vercel](https://vercel.com)，用 GitHub 账号授权
2. 点击 **Add New Project** → **Import Git Repository**
3. 找到你的 `daily-news` 仓库，点击 **Import**
4. **Framework Preset** 选择 **Other**（纯静态网站）
5. 直接点击 **Deploy**，等待约 30 秒
6. 部署完成后获得公网地址，如 `https://daily-news-xxx.vercel.app`

### 3. 后续更新

- 更新 `data.js` 中的早报内容
- 推送到 GitHub 仓库，Vercel **自动重新部署**（无需手动操作）
- 刷新公网链接即可看到最新内容

## 数据格式

`data.js` 中的数据结构：

```js
const NEWS_DATA = [
  {
    "id": "2026-07-07",
    "date": "2026年07月07日",
    "weekday": "星期二",
    "title": "职教数智早报 | 教育信息化·智慧校园·AI教育",
    "summary": "一句话概括今日要点",
    "items": [
      {"tag": "分类", "title": "标题", "content": "内容"}
    ]
  }
];
```

- 在数组 **最前面** 插入新日期的数据，即可在列表页置顶显示
- 注意：JSON 字符串中避免使用中文双引号（使用单引号替代）
