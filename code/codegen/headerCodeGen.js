/** 
 * @param {} options.header
 * @param {} options.fileName
 */
export function headerCodeGen(options) {
    return `# ${options.header}
    `
}

/**
 * @param {string} options.fileName 
 */
export function footerCodeGen(options) {
    return `
    #### 더 알아보기
    <Cards>
        <Card
            icon={<span>📖</span>}
            target={'_blank'}
            title="Band Open API 문서"
            href="https://developers.band.us/develop/guide/api/${options.fileName}"
        />
    </Cards>
    `
}