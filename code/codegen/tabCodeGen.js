/**
 *
 * @param {string} options.fileExtension
 * @param {string} options.language
 * @param {string} options.syntaxKey
 * @param {string} options.content
 * @param {string} options.author
 * @param {string} options.githubLink
 */
export function tabItemCodeGen(options) {
  return (
    "<TabItem> \n" +
    "\`\`\`" +
    options.syntaxKey +
    " " +
    'filename="example.' +
    options.fileExtension +
    '\"' +
    "\n" +
    options.content +
    "\n" +
    "\`\`\`" +
    "\n" +
    `<Cards>
        <Card
        icon={<GithubIcons />}
        target={"_blank"}
        title={"Full example (${options.author} 님)"}
        href={"${options.githubLink}"}
        />
    </Cards>` +
    "\n" +
    "</TabItem> \n"
  );
}

/**
 * @param {string} options.languages
 * @param {string} options.contents
 */
export function tabListCodeGen(options) {
  return (
    "<Tabs items={[" +
    options.languages +
    "]}> \n" +
    options.contents +
    "</Tabs>"
  );
}
