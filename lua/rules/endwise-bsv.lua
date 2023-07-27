local endwise = require('nvim-autopairs.ts-rule').endwise

local rules = {
  endwise('begin$',        'end',          'bsv', nil),
  endwise('case.*%(.*%)$', 'endcase',      'bsv', nil),
  endwise('seq$',          'endseq',       'bsv', nil),
  endwise('par$',          'endpar',       'bsv', nil),
  endwise('action$',       'endaction',    'bsv', nil),
  endwise('module.+;$',    'endmodule',    'bsv', nil),
  endwise('function.+;$',  'endfunction',  'bsv', nil),
  endwise('interface.+;$', 'endinterface', 'bsv', nil),
  endwise('typeclass.+;$', 'endtypeclass', 'bsv', nil),
  endwise('rule.+;$',      'endrule',      'bsv', nil),
  endwise('package.+;$',   'endpackage',   'bsv', nil),
}

return rules
