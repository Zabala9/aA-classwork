require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :start_pos, :considered_positions, :root_node

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        self.build_move_tree
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            node = queue.shift
            new_move_positions(node.value).each do |pos|
                child = PolyTreeNode.new(pos)
                node.add_child(child)
                queue << child
            end
        end
    end

    def new_move_positions(pos)
        # x, y = pos
        moves = pos
        moves.reject!{ |move| @considered_positions.include?(move) }
        @considered_positions << moves
        
        moves
    end

    def self.valid_moves(pos)
        x, y = pos
        moves = [
            [x+2, y+1],
            [x+2, y-1],
            [x-1, y+1],
            [x-2, y-1],
            [x+1, y+2],
            [x+1, y-2],
            [x-1, y+2],
            [x-2, y+1]
        ]

        moves.select { |move| move.all?{ |cor| cor.between?(0, 7) } }
    end

# this is a test comment
end