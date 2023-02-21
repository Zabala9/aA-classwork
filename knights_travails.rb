require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :start_pos, :considered_positions, :root_node

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        # self.build_move_tree
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
        x, y = pos

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
        # moves = pos
        if valid_moves(pos)
            # pos.select { |move| !@considered_positions.include?(move) ? @considered_positions << pos :  }
            @considered_positions << pos if !@considered_positions.include?(pos)
                
            # end
        end

        pos
    end

    def find_path(pos)
        if @considered_positions.include?(pos)
            @considered_positions.each_with_index do |ele, idx|
                if ele == pos
                    return @considered_positions[0..idx]
                end
            end
        end
    end
    
    # def find_path(end_pos)  
    #     end_node = @root_node.dfs(end_pos)
    #     trace_path_back(end_node)
    # end 
    
# this is a test comment
end