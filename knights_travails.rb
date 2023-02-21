require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :start_pos, :considered_positions, :root_node

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        # self.build_move_tree
    end


    #  The method starts by initializing a queue with the root node of the tree. It then iteratively processes each node in the queue by 
    # removing it from the queue and adding child nodes for each legal move that can be made from the current node's state.
    #  This is done by calling the method new_move_positions on the current node's value, which returns an array of positions that can be reached by making a legal move from the current state. 
    # For each position in the array, a new child node is created with that position as its value, and then added as a child to the current node. 
    #  Finally, each new child node is added to the queue to be processed in the next iteration. The method continues to iterate through the queue until it is empty, at which point the entire tree has been built.

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

    # def find_path(pos)
    #     if @considered_positions.include?(pos)
    #         @considered_positions.each_with_index do |ele, idx|
    #             if ele == pos
    #                 return @considered_positions[0..idx]
    #             end
    #         end
    #     end
    # end
    
    def find_path(end_pos)  
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end 

    def trace_path_back(end_node)
        path = []
        current_node = end_node
        until current_node.nil?
            path << current_node.value
            current_node = current_node.parent
        end
        path.reverse
    end

    
# this is a test comment
end