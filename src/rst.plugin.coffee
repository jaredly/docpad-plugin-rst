# Export Plugin
rst2mdown = require('rst2mdown')
marked = require('marked')

module.exports = (BasePlugin) ->
    # Define Plugin
    class RstPlugin extends BasePlugin
        # Plugin name
        name: 'rst'

          # Render
          # Called per document, for each extension conversion. Used to render one extension to another.
          render: (opts) ->
            # Prepare
            {inExtension,outExtension,file} = opts
            # Upper case the text document's content if it is using the convention txt.(uc|uppercase)
            if inExtension in ['rst', 'rest']
              if outExtension in ['md', 'markdown']
                # Render synchronously
                opts.content = rst2mdown(opts.content)
              if outExtension in ['html', null]
                opts.content = marked(rst2mdown(opts.content))

            # Done
            return
