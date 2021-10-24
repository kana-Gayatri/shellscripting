help:
	@IFS=$$'\n' ; \
        help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
        for help_line in $${help_lines[@]}; do \
            IFS=$$'#' ; \
            help_split=($$help_line) ; \
            help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
            help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
            printf "%-15s %s\n" $$help_command $$help_info ; \
        done


git-pull:
	echo -----------------------++  	Pulling Git Code		++------------------------------------
	@git pull &>\dev\null

cart: git-pull ##  Setup Cart Component
	@bash Components/cat.sh

catalogue: git-pull ## Setup Catalogue component
	@bash Components/catalogue.sh

user:  git-pull ## Setup User component
	@bash Components/user.sh

shipping:  git-pull ## Setup Shipping Component
	@bash Components/shipping.sh

payment:  git-pull ## Setup Payment Component
	@bash Components/payment.sh

frontend:  git-pull ## Setup frontend Component
	@bash	Components/frontend.sh

mysql:  git-pull ## Setup mysql Component
	@bash Components/mysql.sh

redis:  git-pull ## Setup redis Component
	@bash	Components/redis.sh

rabbitmq:  git-pull ## Setup rabbitmq Component
	@bash	Compnents/rabbitmq.sh

mongodb: git-pull ## Setup mongodb component
	@bash Components/mongodb.sh