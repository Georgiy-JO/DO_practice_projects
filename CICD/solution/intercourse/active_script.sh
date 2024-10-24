# The ultimate script for CI/CD project
# Active commands 0-
VAR_1=$2
VAR_URL="<gitlab_repo_link>"
VAR_TOKEN="<gitlab_project_tocken"

if [ $1 -eq 0 ]
then
  echo "
                          ###############                 
                    %%   ###############% ##%            
                #######   #############% ######         
              %###########   ###########  ######%       
            %################   %#######% #########     
            ####################    ###### %#########    
          ###############            ####  ##########   
          #####%%                        #  ########%#   
              %#######                      %#######  %# 
        %############                        #####%  ####
        ############                         ####% #####%
        ###########                           ### #######
        ##########                            %  ########
        ########  %                             #########
        ####### %###                          ###########
        ###### #####                         %###########
        ##### #######                       #############
        ##  #######%                      ########      
          ##########  %                        #######  
          ########### ####            ###############   
            ########## #######   ####################    
            #########  ########   #################     
              %####### ##########%   ###########%       
                %##### ############%%  *######%         
                    #%#  ################  *#            
                        ################                
" 
  sleep 2            
  echo "Hello there I'm the ultimmate script for the CI/CD project!"
  echo "  Here is the list of my commands:
        0  --  help;
        1  --  first start installation;
        2  --  Download and install [gitlab-runner];
        3  --  Starting and setting up thr [gitlab-runner];
        4  --  Check [gitlab-runner] status;
        "
elif [ $1 -eq 1 ]
then
  sudo apt update && sudo apt upgrade -y
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt install mc -y
  sudo apt install htop -y
elif [ $1 -eq 2 ]
then
  curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
  sudo apt-get install gitlab-runner -y
elif [ $1 -eq 3 ]
then 
  sudo gitlab-runner start
	sudo gitlab-runner register \
		--non-interactive \
		--url $VAR_URL \
		--registration-token $VAR_TOKEN\
		--executor "shell" \
		--description "CICD"
elif [ $1 -eq 4 ]
then 
  sudo gitlab-runner status
  sudo gitlab-runner verify
elif [ $1 -eq 5 ]
then
  wget https://apt.llvm.org/llvm.sh
  chmod +x llvm.sh
  sudo ./llvm.sh 17
  sudo apt install clang-format-17
elif [ $1 -eq 6 ]
then
  sudo apt install sshpass -y
fi









#                         @@@@@@@@@@@@@@@@@@@@@                         
#                       @@@@@@@@@@@@@@@@@@@@@@@@  @@                    
#                 @@@@@   @@@@@@@@@@@@@@@@@@@@@@  @@@@@@                
#               @@@@@@@@@    @@@@@@@@@@@@@@@@@@@@  @@@@@@@              
#            @@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@  @@@@@@@@@@           
#          @@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@  @@@@@@@@@@@@         
#         @@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@@@@  @@@@@@@@@@@@        
#       @@@@@@@@@@@@@@@@@@@@@@@@@@@@    @@@@@@@@@@  @@@@@@@@@@@@@@      
#      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@      @@@@@@@  @@@@@@@@@@@@@@@     
#     @@@@@@@@@@@@@@@@@@@@@@                 @@@@@@  @@@@@@@@@@@@@@@    
#    @@@@@@@@@@@@@@                             @@@  @@@@@@@@@@@@@@@    
#   @@@@@@         @@@@                               @@@@@@@@@@@@@     
#         @@@@@@@@@@@@@                               @@@@@@@@@@@  @@@@ 
#  @@@@@@@@@@@@@@@@@@                                 @@@@@@@@@@  @@@@@ 
# @@@@@@@@@@@@@@@@@@                                   @@@@@@@@  @@@@@@@
# @@@@@@@@@@@@@@@@@                                    @@@@@@@  @@@@@@@@
# @@@@@@@@@@@@@@@@                                      @@@@@  @@@@@@@@@
# @@@@@@@@@@@@@@@                                       @@@  @@@@@@@@@@@
# @@@@@@@@@@@@@                                         @@  @@@@@@@@@@@@
# @@@@@@@@@@@@  @@                                         @@@@@@@@@@@@@
# @@@@@@@@@@@  @@@                                       @@@@@@@@@@@@@@@
# @@@@@@@@@   @@@@@                                     @@@@@@@@@@@@@@@@
# @@@@@@@@  @@@@@@@                                    @@@@@@@@@@@@@@@@@
# @@@@@@@  @@@@@@@@@                                  @@@@@@@@@@@@@@@@@@
#  @@@@@  @@@@@@@@@@                                @@@@@@@@@@@@@@@@@@@ 
#  @@@@  @@@@@@@@@@@                               @@@@@@@@@@@@@        
#   @@  @@@@@@@@@@@@@                              @@@@         @@@@@@  
#     @@@@@@@@@@@@@@@  @@@                             @@@@@@@@@@@@@@   
#     @@@@@@@@@@@@@@@  @@@@@@                 @@@@@@@@@@@@@@@@@@@@@@    
#      @@@@@@@@@@@@@@@  @@@@@@@@     @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@     
#       @@@@@@@@@@@@@@  @@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@@@@@@      
#         @@@@@@@@@@@@@  @@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@@@@@        
#          @@@@@@@@@@@@  @@@@@@@@@@@@@@@    @@@@@@@@@@@@@@@@@@@         
#            @@@@@@@@@@  @@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@           
#               @@@@@@@@  @@@@@@@@@@@@@@@@@@@@   @@@@@@@@@              
#                 @@@@@@  @@@@@@@@@@@@@@@@@@@@@@    @@@@                
#                     @@  @@@@@@@@@@@@@@@@@@@@@@@@                      
#                          @@@@@@@@@@@@@@@@@@@@@   

# ░█████╗░██████╗░░█████╗░██████╗░████████╗██╗░░░██╗██████╗░███████╗
# ██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝██║░░░██║██╔══██╗██╔════╝
# ███████║██████╔╝███████║██████╔╝░░░██║░░░██║░░░██║██████╔╝█████╗░░
# ██╔══██║██╔═══╝░██╔══██║██╔══██╗░░░██║░░░██║░░░██║██╔══██╗██╔══╝░░
# ██║░░██║██║░░░░░██║░░██║██║░░██║░░░██║░░░╚██████╔╝██║░░██║███████╗
# ╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚══════╝


#                                          ###########*## #########                                      
#                                    ####*##***********######*****##*####                                
#                                ####******************#######***********####                            
#                            ####**********************########**************####                        
#                        ###**************************####**###****************####                     
#                      ###****************************####**####******************###                   
#                    ###******************************####****##********************###                 
#                    ######*#*************************####*****###********************###               
#                ####  ##*##########******************####*******###*********************##             
#                ##***##  ###****##########*#**********####********##******************###  #            
#              #*******### ###**********############***####********####**************###  ###*#          
#            ##*********### ###**************##*####### ####********###************### #####*##         
#            ##***********###  #************#####            #####***####**********## #######**##        
#          ##****************##  ##****#####                      ########******### ##***###*****##      
#        ###*****************### ######*########           ###############***### ###***###******###     
#        ###********************### ######    ######      ######    #### ###*## ###*****###*******###    
#        #***********************##  *#*#         ####  ####         ####  ## ###******##***********#    
#      #*********************###    ###            ######            ###    ##*******###************#   
#      ##*****************######     ###            ######            ###     ##******###************##  
#    ###***************####**#      ###          #### ####           ###      ##****####************### 
#    ##*************#####**##       ####        ####    ####        ####       ##****#***************## 
#    #************#####***##         ###  ######**#########*######  ###         #***###***************# 
#    ##*********#####******##       #########*############################        ####******************#
#    ##******######*******##     #########   *###            ###    ##*###*##     #####****************##
#    #***#######*********###  #####    ###   ###              ###   ###    ###### ####******************#
#    #*######************## ####        ####*##      ####      #######        #### ##*******************#
#    #*###***************#####           #####     ###***##     #####           #####*******************#
#                        ###            ####      ##*****#      ####            ###                     
#    #########################           #####     ###**###     #####           #########################
#    #*******************#######        #######      ####      #######        ######*************######*#
#    #*******************### ######    #### ####              *### ####    ###### ###**********######***#
#    ##*****************####    ##########   ##*#            ####   ##########    ##*******######******##
#    ##*****************#####       ########*########*#######*############        ##*****######********##
#    #****************###*##         ### ########################## ###         #****#######**********# 
#    ##***************###**##       ####        #*##    ####        ####       ##**#####*************## 
#    ###*************###*****#      ###          ####  ####          ###      #*####****************### 
#      ##**************##*****##     ###            ######            ###     #####******************##  
#      #*************##*******##*   ###            ######            *##    ####********************#   
#        #***********####********##  ####         ####  ####         ####    ##*********************#    
#        ###**********##*******### ## ####     #####      #####     #### #### ###*****************###    
#        ###********###******## #################          #######*#####***### ###**************###     
#          ##********##*****## ###***#########                  ######*******###  ##*************##      
#            ##*****##***###  ##*******####*####              ####**************##  ##*********##        
#            ##****##**##  #***********####*****####### ############************##* ###******##         
#              ##**#####  ###************####**********####****#############*******### ##****##          
#                ###### ###***************####*********####**********##############**### ####            
#                ##  ###*******************####*******####*********************#########  #             
#                    ##**********************####******####****************************###               
#                    ###*********************####*****####**************************###                 
#                      ###*********************###****####************************###                   
#                        ####********************##***####*********************####                     
#                            ####*****************####*####******************####                        
#                              #*###**************########**************###*#                           
#                                    #######*********######*******##*####                                
#                                          ############# ##########                                      


