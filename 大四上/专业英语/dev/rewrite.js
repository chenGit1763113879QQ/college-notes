const fs = require("fs");

let text = fs.readFileSync("out/math_blocks.json", { encoding: "utf-8" });
let tran = fs.readFileSync("out/nomath.zh.txt", { encoding: "utf-8" });
const blocks=JSON.parse(text);

for (const index in blocks){
    const [full,tex,display]=blocks[index];
    const r=new RegExp("@\\s*"+index+"\\s*@");
    const re= tran.match(r);
    if(re){
        tran=tran.replace(re[0],full);
    }
    else{
        console.log(index,blocks[index])
    }
}

fs.writeFileSync("out/raw.txt",tran)
