const fs = require("fs");

const blocks = [];

let mdstr = fs.readFileSync("text.en.md", { encoding: "utf-8" });

for (const r of mdstr.matchAll(/\$\$([\s\S]*?[^\\])\$\$/g)) {
    mdstr = mdstr.replace(r[0], `@${blocks.length}@`)
    blocks.push([r[0], r[1], true])
}
for (const r of mdstr.matchAll(/\$(.*?[^\\])\$/g)) {
    mdstr = mdstr.replace(r[0], `@${blocks.length}@`)
    blocks.push([r[0], r[1], false])
}

fs.writeFileSync("out/math_blocks.json",JSON.stringify(blocks));
fs.writeFileSync("out/nomath.en.txt",mdstr)
