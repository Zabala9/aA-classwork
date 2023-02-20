class PolyTreeNode
    attr_reader :value, :children, :parent
    
        def initialize(value, children = [])
            @value = value
            @children = children
            @parent = nil
        end
    
        def parent=(new_parent)
            if parent == new_parent
                return
            elsif new_parent == nil
                @parent.children.delete(self)
                @parent = new_parent
            else
                # remove self from old parent
                @parent.children.delete(self) if @parent != nil
                @parent = new_parent
                @parent.children << self
            end
        end
    
        def add_child(child_node)
            if self.children.include?(child_node)
                return
            else
                child_node.parent=(self)
            end
    
        end
    
        def remove_child(child_node)
            if self.children.include?(child_node)
                self.children.delete(child_node)
                child_node.parent=(nil)
            else
                raise "node is not a child"
            end
        end
    
        def dfs(target)
            return self if self.value == target
    
            children.each do |child|
                result = child.dfs(target)
                return result unless result.nil?
            end
        
            nil
        end
    
        def bfs(target)
            container = [self] # a
    
            until container.empty?
                node = container.shift # a
                return node if node.value == target
                container.concat(node.children)
            end
    
            nil
        end
    
    end
    