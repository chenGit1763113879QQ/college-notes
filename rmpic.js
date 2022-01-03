const fs=require('fs');
const text=fs.readFileSync("大四上/过程控制/review.md",{encoding:"utf-8"});

const files=fs.readdirSync("pics");

for (const file of files){
    if(!text.includes(file) && file.includes("2022-01-03")){
        console.log(file,text.includes(file));
        fs.rmSync("pics/"+file)
    }
}

