import { tabItemCodeGen, tabListCodeGen } from "./codegen/tabCodeGen";
import { headerCodeGen, footerCodeGen } from "./codegen/headerCodeGen";
import { codeMeta } from "./meta";
const CODE_PATH = "./code/codes";
/**
 *
 * @param {string} options.fileName
 * @param {string} options.headerTitle
 * @param {string} options.description
 * @returns
 */
export async function fullCodePartCodeGen(options) {
  // only-server side fs
  const fs = await import("fs");
  return [
    headerCodeGen({
      headerTitle: options.headerTitle,
      description: options.description,
    }),
    tabListCodeGen({
      languages: codeMeta
        .map((value) => {
          return '"' + value.language + '"';
        })
        .join(","),
      contents: codeMeta
        .map((value) => {
          try {
            const res = fs.readFileSync(
              `${CODE_PATH}/${value.folderName}/${options.fileName}.${value.fileExtension}`,
              { encoding: "utf8", flag: "r" }
            );
            return tabItemCodeGen({
              ...value,
              content: res,
            });
          } catch (e) {
            // 제공하지 않은 파일.
          }
        })
        .join("\n"),
    }),
    footerCodeGen({
      fileName: options.fileName,
    }),
  ].join("\n");
}
