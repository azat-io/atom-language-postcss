describe 'PostCSS grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-postcss')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.css.postcss')

  it 'parses the grammar', ->
    expect(grammar).toBeTruthy()
    expect(grammar.scopeName).toBe 'source.css.postcss'

  describe 'numbers', ->
    it 'tokenizes them correctly', ->
      {tokens} = grammar.tokenizeLine '.something { color: 0 1 }'

      expect(tokens[8]).toEqual value: '0', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']
      expect(tokens[10]).toEqual value: '1', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']

      {tokens} = grammar.tokenizeLine '$q: (color1:$dark-orange);'

      expect(tokens[3]).toEqual value: '(color1:', scopes: ['source.css.postcss', 'meta.set.variable.postcss']

  describe '@at-root', ->
    it 'tokenizes it correctly', ->
      {tokens} = grammar.tokenizeLine '@at-root (without: media) .btn { color: red; }'

      expect(tokens[0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.at-root.postcss', 'keyword.control.at-rule.at-root.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[1]).toEqual value: 'at-root', scopes: ['source.css.postcss', 'meta.at-rule.at-root.postcss', 'keyword.control.at-rule.at-root.postcss']

  describe '@page', ->
    it 'tokenizes it correctly', ->
      tokens = grammar.tokenizeLines """
        @page {
          text-align: center;
        }
      """

      expect(tokens[0][0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[0][1]).toEqual value: 'page', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss']
      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'text-align', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: 'center', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

      tokens = grammar.tokenizeLines """
        @page :left {
          text-align: center;
        }
      """

      expect(tokens[0][0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[0][1]).toEqual value: 'page', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss']
      expect(tokens[0][2]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss']
      expect(tokens[0][3]).toEqual value: ':left', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'entity.name.function.postcss']
      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'text-align', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: 'center', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

      tokens = grammar.tokenizeLines """
        @page:left {
          text-align: center;
        }
      """

      expect(tokens[0][0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[0][1]).toEqual value: 'page', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'keyword.control.at-rule.page.postcss']
      expect(tokens[0][2]).toEqual value: ':left', scopes: ['source.css.postcss', 'meta.at-rule.page.postcss', 'entity.name.function.postcss']
      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'text-align', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: 'center', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

  describe 'property-list', ->
    it 'tokenizes the property-name and property-value', ->
      {tokens} = grammar.tokenizeLine 'very-custom { color: inherit; }'

      expect(tokens[4]).toEqual value: 'color', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[7]).toEqual value: 'inherit', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']
      expect(tokens[8]).toEqual value: ';', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.terminator.rule.postcss']
      expect(tokens[10]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'punctuation.section.property-list.end.postcss']

    it 'tokenizes an incomplete inline property-list', ->
      {tokens} = grammar.tokenizeLine 'very-custom { color: inherit}'

      expect(tokens[4]).toEqual value: 'color', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[7]).toEqual value: 'inherit', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']
      expect(tokens[8]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.section.property-list.end.postcss']

    it 'tokenizes multiple lines of incomplete property-list', ->
      tokens = grammar.tokenizeLines """
        very-custom { color: inherit }
        another-one { display: none; }
      """

      expect(tokens[0][0]).toEqual value: 'very-custom', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']
      expect(tokens[0][4]).toEqual value: 'color', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[0][7]).toEqual value: 'inherit', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']
      expect(tokens[0][9]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.section.property-list.end.postcss']
      expect(tokens[1][0]).toEqual value: 'another-one', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']
      expect(tokens[1][10]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'punctuation.section.property-list.end.postcss']

  describe 'property names with a prefix that matches an element name', ->
    it 'does not confuse them with properties', ->
      tokens = grammar.tokenizeLines """
        text {
          text-align: center;
        }
      """

      expect(tokens[0][0]).toEqual value: 'text', scopes: ['source.css.postcss', 'entity.name.tag.postcss']
      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'text-align', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: 'center', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

      tokens = grammar.tokenizeLines """
        table {
          table-layout: fixed;
        }
      """

      expect(tokens[0][0]).toEqual value: 'table', scopes: ['source.css.postcss', 'entity.name.tag.postcss']
      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'table-layout', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: 'fixed', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

  describe 'vendor properties', ->
    it 'tokenizes the browser prefix', ->
      {tokens} = grammar.tokenizeLine 'body { -webkit-box-shadow: none; }'

      expect(tokens[0]).toEqual value: 'body', scopes: ['source.css.postcss', 'entity.name.tag.postcss']
      expect(tokens[4]).toEqual value: '-webkit-box-shadow', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']

  describe 'custom elements', ->
    it 'tokenizes them as tags', ->
      {tokens} = grammar.tokenizeLine 'very-custom { color: red; }'

      expect(tokens[0]).toEqual value: 'very-custom', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']

      {tokens} = grammar.tokenizeLine 'very-very-custom { color: red; }'

      expect(tokens[0]).toEqual value: 'very-very-custom', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']

    it 'tokenizes them with pseudo selectors', ->
      {tokens} = grammar.tokenizeLine 'very-custom:hover { color: red; }'

      expect(tokens[0]).toEqual value: 'very-custom', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']
      expect(tokens[1]).toEqual value: ':', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css', 'punctuation.definition.entity.css']
      expect(tokens[2]).toEqual value: 'hover', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css']

    it 'tokenizes them with class selectors', ->
      {tokens} = grammar.tokenizeLine 'very-custom.class { color: red; }'

      expect(tokens[0]).toEqual value: 'very-custom', scopes: ['source.css.postcss', 'entity.name.tag.custom.postcss']
      expect(tokens[1]).toEqual value: '.', scopes: ['source.css.postcss', 'entity.other.attribute-name.class.css', 'punctuation.definition.entity.css']
      expect(tokens[2]).toEqual value: 'class', scopes: ['source.css.postcss', 'entity.other.attribute-name.class.css']

    it 'does not confuse them with properties', ->
      tokens = grammar.tokenizeLines """
        body {
          border-width: 2;
          font-size : 2;
          background-image  : none;
        }
      """

      expect(tokens[1][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[1][1]).toEqual value: 'border-width', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][2]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[1][3]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[1][4]).toEqual value: '2', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']
      expect(tokens[2][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[2][1]).toEqual value: 'font-size', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[2][2]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[2][3]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[2][4]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[2][5]).toEqual value: '2', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']
      expect(tokens[3][0]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[3][1]).toEqual value: 'background-image', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[3][2]).toEqual value: '  ', scopes: ['source.css.postcss', 'meta.property-list.postcss']
      expect(tokens[3][3]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[3][4]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss']
      expect(tokens[3][5]).toEqual value: 'none', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'support.constant.property-value.postcss']

  describe "pseudo selectors", ->
    it "parses the value of the argument correctly", ->
      {tokens} = grammar.tokenizeLine 'div:nth-child(3n+0) { color: red; }'

      expect(tokens[0]).toEqual value: 'div', scopes: ['source.css.postcss', 'entity.name.tag.postcss']
      expect(tokens[1]).toEqual value: ':', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css', 'punctuation.definition.entity.css']
      expect(tokens[2]).toEqual value: 'nth-child(3n+0)', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css']

      {tokens} = grammar.tokenizeLine 'div:nth-child(2n-1) { color: red; }'

      expect(tokens[0]).toEqual value: 'div', scopes: ['source.css.postcss', 'entity.name.tag.postcss']
      expect(tokens[1]).toEqual value: ':', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css', 'punctuation.definition.entity.css']
      expect(tokens[2]).toEqual value: 'nth-child(2n-1)', scopes: ['source.css.postcss', 'entity.other.attribute-name.pseudo-class.css']

  describe "keyframes", ->
    it "parses the from and to properties", ->
      tokens = grammar.tokenizeLines """
        @keyframes anim {
        from { opacity: 0; }
        to { opacity: 1; }
        }
      """

      expect(tokens[0][0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'keyword.control.at-rule.keyframes.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[0][1]).toEqual value: 'keyframes', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'keyword.control.at-rule.keyframes.postcss']
      expect(tokens[0][2]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss']
      expect(tokens[0][3]).toEqual value: 'anim', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'entity.name.function.postcss']
      expect(tokens[1][0]).toEqual value: 'from', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'entity.other.attribute-name.postcss']
      expect(tokens[1][4]).toEqual value: 'opacity', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[1][7]).toEqual value: '0', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']
      expect(tokens[2][0]).toEqual value: 'to', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'entity.other.attribute-name.postcss']
      expect(tokens[2][4]).toEqual value: 'opacity', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'meta.property-list.postcss', 'meta.property-name.postcss', 'support.type.property-name.postcss']
      expect(tokens[2][7]).toEqual value: '1', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'constant.numeric.postcss']

  describe 'media queries', ->
    it 'parses media types and features', ->
      {tokens} = grammar.tokenizeLine '@media (orientation: landscape) and only screen and (min-width: 700px) {}'

      expect(tokens[0]).toEqual value: '@', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'keyword.control.at-rule.media.postcss', 'punctuation.definition.keyword.postcss']
      expect(tokens[1]).toEqual value: 'media', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'keyword.control.at-rule.media.postcss']
      expect(tokens[4]).toEqual value: 'orientation', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'support.type.property-name.media.css']
      expect(tokens[6]).toEqual value: 'landscape', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'support.constant.property-value.postcss']
      expect(tokens[8]).toEqual value: 'and', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'keyword.control.operator']
      expect(tokens[10]).toEqual value: 'only', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'keyword.control.operator']
      expect(tokens[12]).toEqual value: 'screen', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'support.constant.media.css']
      expect(tokens[14]).toEqual value: 'and', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'keyword.control.operator']
      expect(tokens[16]).toEqual value: 'min-width', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'support.type.property-name.media.css']
      expect(tokens[18]).toEqual value: '700', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'constant.numeric.postcss']
      expect(tokens[19]).toEqual value: 'px', scopes: ['source.css.postcss', 'meta.at-rule.media.postcss', 'constant.numeric.postcss', 'keyword.other.unit.postcss']

  describe 'variable setting', ->
    it 'parses all tokens', ->
      {tokens} = grammar.tokenizeLine '$font-size: $normal-font-size;'

      expect(tokens[0]).toEqual value: '$font-size', scopes: ['source.css.postcss', 'meta.set.variable.postcss', 'variable.postcss']
      expect(tokens[1]).toEqual value: ':', scopes: ['source.css.postcss', 'meta.set.variable.postcss', 'punctuation.separator.key-value.postcss']
      expect(tokens[2]).toEqual value: ' ', scopes: ['source.css.postcss', 'meta.set.variable.postcss']
      expect(tokens[3]).toEqual value: '$normal-font-size', scopes: ['source.css.postcss', 'meta.set.variable.postcss', 'variable.postcss', 'variable.postcss']

  describe 'interpolation', ->
    it 'is tokenized within single quotes', ->
      {tokens} = grammar.tokenizeLine "body { font-family: '#\{$family}'; }" # escaping CoffeeScript's interpolation

      expect(tokens[8]).toEqual value: '#{', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.single.postcss', 'variable.interpolation.postcss']
      expect(tokens[9]).toEqual value: '$family', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.single.postcss', 'variable.interpolation.postcss', 'variable.postcss', 'variable.postcss']
      expect(tokens[10]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.single.postcss', 'variable.interpolation.postcss']

    it 'is tokenized within double quotes', ->
      {tokens} = grammar.tokenizeLine 'body { font-family: "#\{$family}"; }'

      expect(tokens[8]).toEqual value: '#{', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.double.postcss', 'variable.interpolation.postcss']
      expect(tokens[9]).toEqual value: '$family', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.double.postcss', 'variable.interpolation.postcss', 'variable.postcss', 'variable.postcss']
      expect(tokens[10]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'string.quoted.double.postcss', 'variable.interpolation.postcss']

    it 'is tokenized without quotes', ->
      {tokens} = grammar.tokenizeLine 'body { font-family: #\{$family}; }'

      expect(tokens[7]).toEqual value: '#{', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'variable.interpolation.postcss']
      expect(tokens[8]).toEqual value: '$family', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'variable.interpolation.postcss', 'variable.postcss', 'variable.postcss']
      expect(tokens[9]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.property-list.postcss', 'meta.property-value.postcss', 'variable.interpolation.postcss']

    it 'is tokenized as a class name', ->
      {tokens} = grammar.tokenizeLine 'body.#\{$class} {}'

      expect(tokens[2]).toEqual value: '#{', scopes: ['source.css.postcss', 'variable.interpolation.postcss']
      expect(tokens[3]).toEqual value: '$class', scopes: ['source.css.postcss', 'variable.interpolation.postcss', 'variable.postcss', 'variable.postcss']
      expect(tokens[4]).toEqual value: '}', scopes: ['source.css.postcss', 'variable.interpolation.postcss']

    it 'is tokenized as a keyframe', ->
      {tokens} = grammar.tokenizeLine '@keyframes anim { #\{$keyframe} {} }'

      expect(tokens[7]).toEqual value: '#{', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'variable.interpolation.postcss']
      expect(tokens[8]).toEqual value: '$keyframe', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'variable.interpolation.postcss', 'variable.postcss', 'variable.postcss']
      expect(tokens[9]).toEqual value: '}', scopes: ['source.css.postcss', 'meta.at-rule.keyframes.postcss', 'meta.keyframes.postcss', 'variable.interpolation.postcss']
