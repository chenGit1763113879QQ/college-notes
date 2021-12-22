# 专业英语

翻译文献：

Vehicle scheduling under stochastic trip times:An approximate dynamic programming approach

- [sciencedirect.com](https://www.sciencedirect.com/science/article/abs/pii/S0968090X18312786)

## 方案

使用markdown排版正文部分，其他使用word直接排版。
因为我习惯用katex做公式，
使用pandoc转化正文

```sh
pandoc -s text.zh.md --reference-doc src/template.docx -o out/text.zh.docx
pandoc -s text.en.md --reference-doc src/template.docx -o out/text.en.docx
```

## 参考

### 排版相关

- https://www.elsevier.com/journals/transportation-research-part-a-policy-and-practice/0965-8564/guide-for-authors
- https://www.bilibili.com/video/BV11h41127FD
- https://zhuanlan.zhihu.com/p/49530707



