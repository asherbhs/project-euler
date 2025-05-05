use std::collections::HashMap;
use std::collections::HashSet;
use std::vec::Vec;
use std::cmp::Ordering;

type Node = i32;

#[derive(Debug)]
struct Edge {
	weight:   i32,
	end_node: Node,
}

fn main() {
	let mut graph: HashMap<Node, Vec<Edge>> = HashMap::new();

	let triangle = [
	// 	vec![1],
	// 	vec![1, 1],
	// 	vec![1, 1, 1],
	// 	vec![1, 1, 1, 1],
	// 	vec![1, 1, 1, 1, 1],
	// 	vec![1, 2, 3, 4, 5, 6]
	// ];
	// 	vec![ 3 ],
	// 	vec![ 7, 4 ],
	// 	vec![ 2, 4, 6 ],
	// 	vec![ 8, 5, 9, 3 ]
	// ];
		vec![75],
		vec![95, 64],
		vec![17, 47, 82],
		vec![18, 35, 87, 10],
		vec![20, 04, 82, 47, 65],
		vec![19, 01, 23, 75, 03, 34],
		vec![88, 02, 77, 73, 07, 63, 67],
		vec![99, 65, 04, 28, 06, 16, 70, 92],
		vec![41, 41, 26, 56, 83, 40, 80, 70, 33],
		vec![41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
		vec![53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
		vec![70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
		vec![91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
		vec![63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
		vec![04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23],
	];

	graph.insert(0, vec![Edge { weight: triangle[0][0], end_node: 1 }]);

	let mut tri_index = 1;
	let mut tri_prev = 0;
	let mut tri_next = 1;
	let max_branching = ((triangle.len() as i32 - 1) * (triangle.len() as i32 - 2))/2;
	for n in 1 ..= ((triangle.len() as i32) * (triangle.len() as i32 - 1))/2 {
		if n > tri_next {
			tri_index += 1;
			tri_prev = tri_next;
			tri_next = tri_index * (tri_index + 1) / 2;
		}

		let i = n - tri_prev;
		let v = vec![
			Edge { 
				weight: triangle[tri_index as usize][(i - 1) as usize],
				end_node: tri_next + if n <= max_branching { i } else { 1 }
			},
			Edge {
				weight: triangle[tri_index as usize][i as usize],
				end_node: tri_next + if n <= max_branching { i + 1 } else { 1 }
			}
		];
		graph.insert(n, v);
	}
	graph.insert(tri_next + 1, Vec::new());

	println!("{:#?}", graph);

	let mut unvisited: HashSet<Node> = (0..=tri_next + 1).collect();
	let mut distances: HashMap<Node, i32> = HashMap::from([(0, 0)]);
	let destination_node: Node = tri_next + 1;

	// these settings make larger values 'less' in the eyes of the algorithm
	let compare_distances = |x: i32, y: i32| { x.cmp(&y).reverse() };
	let infinity = &i32::MIN;

	// while unvisited.contains(&destination_node) {
	while !unvisited.is_empty() {
		let current_node: Node = *unvisited.iter().min_by(|&x, &y| 
			compare_distances(
				*distances.get(x).unwrap_or_else(|| infinity),
				*distances.get(y).unwrap_or_else(|| infinity)
			)
		).unwrap();

		println!("{:#?}", distances);
		println!("{:#?}", current_node);

		for e in graph
			.get(&current_node).unwrap() 
			.iter().filter(|e| unvisited.contains(&e.end_node))
			// only those edges which lead to an unvisited node
		{
			let new_d = distances.get(&current_node).unwrap() + e.weight;
			match distances.get(&e.end_node) {
				Some(&old_d) => {
					if compare_distances(new_d, old_d) == Ordering::Less {
						distances.insert(e.end_node, new_d);
					}
				},

				None => { distances.insert(e.end_node, new_d); }
			}
		}

		unvisited.remove(&current_node);
	}

	println!("{}", distances.get(&destination_node).unwrap());
}