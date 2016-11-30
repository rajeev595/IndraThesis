% Running the main source file
    run source/codes/source_main;
% Creating a directory for results
    mkdir('target','results');
% Running the main target file
    data = 1;
    run target/codes/target_main;