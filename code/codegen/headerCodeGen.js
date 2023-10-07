/**
 * @param {} options.headerTitle
 * @param {} options.description
 */
export function headerCodeGen(options) {
  return `# ${options.headerTitle}
    ${options.description}
    `;
}

/**
 * @param {string} options.fileName
 * @param {{authorName: string; authorGithubLink: string}} options.authors
 */
export function footerCodeGen(options) {
  return `
    #### 더 알아보기
    <Cards>
        <Card
            icon={<span>📖</span>}
            target={'_blank'}
            title="Band Open API 문서"
            href="https://developers.band.us/develop/guide/api/${
              options.fileName
            }"
        />
    </Cards>
    `;
}

/**
 *         ${options.authors
          .map((author) => {
            return `<Card
              icon={<GithubIcons />}
              target={"_blank"}
              title={"author: ${author.authorName} github"}
              href={"${author.authorGithubLink}"}
            />`;
          })
          .join("\n")}

 */