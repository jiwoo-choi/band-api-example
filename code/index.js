import { tabItemCodeGen, tabListCodeGen } from "./codegen/tabCodeGen";
import { headerCodeGen, footerCodeGen } from "./codegen/headerCodeGen";

const CODE_PATH = './code/codes';
export async function fullCodePartCodeGen(fileName, header) {
    // only-server side fs
    const fs = await import('fs');
    return [
        headerCodeGen({
            header: header,
            fileName: fileName,
        }),
        tabListCodeGen({
            languages: codeMeta.map((value) => {
                return "\"" + value.language + "\""
            }).join(","),
            contents: codeMeta.map((value) => {
                const res = fs.readFileSync(`${CODE_PATH}/${value.folderName}/${fileName}.${value.fileExtension}`, { encoding: 'utf8', flag: 'r' });
                return tabItemCodeGen({
                    ...value,
                    content: res
                })
            }).join("\n"),
        }),
        footerCodeGen({
            fileName: fileName
        })
    ].join("\n");
}

export const codeMeta = [
    {
        language: 'Javascript',
        syntaxKey: 'js',
        fileExtension: 'js',
        folderName: 'js',
    },
    // {
    //     language: 'Perl',
    //     syntaxKey: 'perl',
    //     fileExtension: 'pl',
    //     folderName: 'perl',
    // }
]
