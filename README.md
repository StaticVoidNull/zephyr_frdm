# Project Build Template

Container-based Zephyr development environment for the FRDM-MCXA156 board.

## Commands
- Initialize build environment  
`docker compose run --rm init`
- Run the build  
`docker compose run --rm build`
- Clean up build artifacts  
`docker compose run --rm clean`
- Flash board  
`docker compose run --rm flash`
- Run gdb Server  
`docker compose run --rm gdb_server`
- Start an interactive development session  
`docker compose run --rm interactive`
- Start an interactive development session with root user  
`docker compose run --rm interactive_root`
