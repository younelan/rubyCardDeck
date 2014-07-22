require_relative 'CardPile'

class CardGame 

    @@deck=nil
    @@piles=Hash.new
    numPlayers=2
    currentPlayer=1
    cardPointer=0
    def initialize(opts = {})
        deckRules={}

        @@cardValues=opts[:cardValues] ||  %w[A 2 3 4 5 6 7 8 9 10 J Q K]
        @@cardNames=opts[:cardNames] ||  @cardValues
        @@suitValues=opts[:suitValues] || %w[S P D H]
        @@suitNames=opts[:suitNames] || @suitValues
        self.reset()
    end
    def getPile(pileName)
        if(@@piles.key?pileName)
            @@piles[pileName].getDeck()
        else
            nil
        end
    end
    def reset()
        @deck=@@cardValues.product(@@suitValues)
        @@piles={}
        @@piles['deck']=CardPile.new(@deck)
        @@piles['deck'].shuffle()
    end
    def ShuffleDeck
        @@piles['deck'].shuffle()
    end
    def Deal
    end
    def getCurrentPlayer()
        currentPlayer
    end
    def push(pile,card)
        @@piles[pile].push(card)
    end
    def pop(pile)
        @@piles[pile].pop()
    end
    def shift(pile)
        @@piles[pile].shift()
    end
    def unshift(pile,card)
        @@piles[pile].unshift(card)
    end
    def getCardsByColumn(pile,column,value)
        @@piles[pile].getCardsByColumn(column,value)
    end
    def getCardsBySuit(pile,value)
        @@piles[pile].getCardsByColumn(0,value)
    end
    def getCardsByValue(pile,value)
        @@piles[pile].getCardsByColumn(1,value)
    end
    def remove(pile, card)
      @@piles[pile].remove(card)
    end
end
