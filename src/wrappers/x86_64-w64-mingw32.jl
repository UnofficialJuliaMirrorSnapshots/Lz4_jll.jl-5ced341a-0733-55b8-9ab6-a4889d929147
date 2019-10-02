# Autogenerated wrapper script for Lz4_jll for x86_64-w64-mingw32
export liblz4, lz4cat, unlz4, lz4, lz4c

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `liblz4`
const liblz4_splitpath = ["bin", "msys-lz4-1.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblz4_path = ""

# liblz4-specific global declaration
# This will be filled out by __init__()
liblz4_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblz4 = "msys-lz4-1.dll"


# Relative path to `lz4cat`
const lz4cat_splitpath = ["bin", "lz4cat.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
lz4cat_path = ""

# lz4cat-specific global declaration
function lz4cat(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(ENV["PATH"], ';', PATH)
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(ENV[LIBPATH_env], ';', LIBPATH)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(lz4cat_path)
    end
end


# Relative path to `unlz4`
const unlz4_splitpath = ["bin", "unlz4.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
unlz4_path = ""

# unlz4-specific global declaration
function unlz4(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(ENV["PATH"], ';', PATH)
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(ENV[LIBPATH_env], ';', LIBPATH)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(unlz4_path)
    end
end


# Relative path to `lz4`
const lz4_splitpath = ["bin", "lz4.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
lz4_path = ""

# lz4-specific global declaration
function lz4(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(ENV["PATH"], ';', PATH)
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(ENV[LIBPATH_env], ';', LIBPATH)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(lz4_path)
    end
end


# Relative path to `lz4c`
const lz4c_splitpath = ["bin", "lz4c.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
lz4c_path = ""

# lz4c-specific global declaration
function lz4c(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(ENV["PATH"], ';', PATH)
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(ENV[LIBPATH_env], ';', LIBPATH)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(lz4c_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global liblz4_path = abspath(joinpath(artifact"Lz4", liblz4_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblz4_handle = dlopen(liblz4_path)
    push!(LIBPATH_list, dirname(liblz4_path))

    global lz4cat_path = abspath(joinpath(artifact"Lz4", lz4cat_splitpath...))

    push!(PATH_list, dirname(lz4cat_path))
    global unlz4_path = abspath(joinpath(artifact"Lz4", unlz4_splitpath...))

    push!(PATH_list, dirname(unlz4_path))
    global lz4_path = abspath(joinpath(artifact"Lz4", lz4_splitpath...))

    push!(PATH_list, dirname(lz4_path))
    global lz4c_path = abspath(joinpath(artifact"Lz4", lz4c_splitpath...))

    push!(PATH_list, dirname(lz4c_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

