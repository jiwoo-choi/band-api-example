/**
 * 
 * @param {string} options.fileExtension
 * @param {string} options.language
 * @param {string} options.syntaxKey
 * @param {string} options.content
 */
export function tabItemCodeGen(options) {
    return '<TabItem> \n' +
    '\`\`\`' +
    options.syntaxKey + ' ' +
    'filename="example.' + options.fileExtension + "\""+ '\n' +
    options.content + "\`\`\`" + "\n" +
    '</TabItem> \n'
}

/**
 * @param {string} options.languages
 * @param {string} options.contents
 */
export function tabListCodeGen(options) {
    return '<Tabs items={[' + options.languages + ']}> \n' +
        options.contents +
    '</Tabs>'
}
