class window.Bitcoin
    constructor: ((@_elem)->
        @_elem = document.getElementById(@_elem) if typeof @_elem is 'string'
        @_elem.innerHTML = 'Waiting for server...'
    )

    start: (->
        conn = io.connect('https://socketio.mtgox.com/mtgox')
        conn.on('message', (data) =>
            console.log(data)

            current = null
            if data.ticker
                current = data.ticker.last.value
            else if data.depth
                current = data.depth.price

            return unless current

            price = parseFloat(current).toFixed(2)
            @_elem.innerHTML = "Mt.Gox BTC price: $#{price} USD"
        )
    )
