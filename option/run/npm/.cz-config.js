'use strict';

module.exports = {

  types: [
    {value: 'temp',     name: 'temp:     不属于所有情况, 自己描述, 不会加入changelog'},
    {value: 'feat',     name: 'feature:  新功能'},
    {value: 'fix',      name: 'fix:      修复Bug'},
    {value: 'docs',     name: 'docs:     更新文档'},
    {value: 'style',    name: 'style:    代码优化'},
    {value: 'test',     name: 'test:     测试相关'},
    {value: 'chore',    name: 'chore:    构建过程或辅助工具的变动'},
  ],
  // it needs to match the value for field type. Eg.: 'fix'
  /*
  scopeOverrides: {
    fix: [
      {name: 'merge'},
      {name: 'style'},
      {name: 'e2eTest'},
      {name: 'unitTest'}
    ]
  },
  */
  // override the messages, defaults are as follows
  messages: {
    type: '选择修改的类型:',
    scope: '选择修改影响范围',
    // used if allowCustomScopes is true
    customScope: 'Denote the SCOPE of this change:',
    subject: '中文简短标题',
    body: '详细描述',
    breaking: '比较大的影响备注一下',
    footer: '关闭了issue,解决了某个bug备注一下(可选)',
    confirmCommit: '确认提交吗？敏感操作备份分支了吗？'
  },

  allowCustomScopes: false,
  allowBreakingChanges: ['feat', 'fix']
};