function read_data_24(inputfilepath, inputfilename)
    MaxInstants = 0
    matrice_PDEM=Array{Float64}[]
    matrice_T=Array{Float64}[]
    filed = open(inputfilepath*"/"*inputfilename)
    while !eof(filed)
        data=readline(filed)
        data=rstrip(data)
        if sizeof(data) >= 1
            out=split(data, " := ")
            if (out[1]=="param MaxInstants")
                MaxInstants = parse(Int, out[2])
                print(MaxInstants)
                print(size(out))
            elseif (out[1][2]=="param PDem")
                for count in 1:MaxInstants
                    data=readline(filed)
                    data=rstrip(data)
                    out=split(data, "	")
                    println(out)
                end
            end
        end
    end
end