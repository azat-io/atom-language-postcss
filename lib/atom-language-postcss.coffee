AtomLanguagePostcssView = require './atom-language-postcss-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomLanguagePostcss =
  atomLanguagePostcssView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomLanguagePostcssView = new AtomLanguagePostcssView(state.atomLanguagePostcssViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomLanguagePostcssView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-language-postcss:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomLanguagePostcssView.destroy()

  serialize: ->
    atomLanguagePostcssViewState: @atomLanguagePostcssView.serialize()

  toggle: ->
    console.log 'AtomLanguagePostcss was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
