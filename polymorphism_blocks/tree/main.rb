require_relative 'tree'
require_relative 'html_tag'

html = "<html>
		<body>
			<h1>Добро пожаловать!</h1>
			<p>Проверка текст проверка текст гав гав</p>
			<button>Кнопка</button>
		</body>
		</html>
		"
html_tree = Tree.new(html)

puts "HTML дерево:"
puts html_tree

puts "\nОбход в ширину (BFS):"
html_tree.bfs { |node| puts "Тег: #{node.tag_name}, Дочерний элемент: #{node.count_children}" }

puts "\nОбход в глубину (DFS):"
html_tree.dfs { |node| puts "Тег: #{node.tag_name}, Содержимое: #{node.content}" }

puts "\nEach(DFS):"
html_tree.each { |node| puts "Тег: #{node.tag_name}" }

puts "\nSelect тегов <p>:"
selected_nodes = html_tree.select { |node| node.tag_name == 'p' }
selected_nodes.each { |node| puts "Тег: #{node.tag_name}, Содержимое: #{node.content}" }

puts "\nВсе теги <h1>?:"
puts html_tree.all? { |node| node.tag_name == 'h1' }