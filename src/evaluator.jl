module Evaluator

AST = []

function evaluate(node::Union{Vector{Any}, Dict{String, String}})
	if isa(node, Vector{Any})
		for n in node
			for (k, v) in n
				execute([k, v])
			end
		end
	elseif isa(node, Dict{String, String})
		for (k ,v) in node
			execute([k, v])
		end
	end
end

function execute(loc::Union{Vector{Any}, Vector{String}})
	if isa(loc[2], Vector{Any})
		evaluate(loc[2])
	elseif loc[1] == "printout"
		printout(loc[2])
	elseif loc[1] == "stop"
		stop()
	end
end

function printout(value::String)
	println(value)
end

function stop()
	exit()
end

export evaluate
end # module