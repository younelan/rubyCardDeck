class CardPile
    def initialize(pileContents = {})
        @@pile = pileContents || {}
    end
    def getDeck
        @@pile
    end
    def getCardsByColumn(column,value)
        res=[]
        @@pile.each { |current| 
            if current[column]==value 
                res.push( current ) 
            end
        }
        res
    end
    def clear()
        @@pile={}
    end
    def push(card)
        @@pile.push(card)
    end
    def remove(card)
      @@pile.delete_if {|current| current == card }
    end
    def pop()
        @@pile.pop
    end
    def shuffle()
        @@pile=@@pile.shuffle()
    end
    def shift()
        @@pile.shift
    end
    def unshift(card)
        @@pile.unshift(card)
    end
end

suits=%w(A B C)
cards=%w(1 2 3 4 5)
pile=CardPile.new(cards.product(suits))
print pile.getDeck()