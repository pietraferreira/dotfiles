local opts =  {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
    cache = {
      directory = ".ccls-cache";
    };
  },
}
return opts
