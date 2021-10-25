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

#git-pull:
#	@echo -----------------------++  	Pulling Git Code		++------------------------------------
#	@git pull  &>/dev/null

git-pull:
	@echo -------+      Pulling Git Code      +--------
	@git pull &>/dev/null

cart: git-pull## Setup Cart Component
	@sudo bash Components/cart.sh

catalogue: git-pull# Setup Catalogue component
	@sudo bash Components/catalogue.sh

user:  git-pull ## Setup User component
	@sudo bash Components/user.sh

shipping:  git-pull ## Setup Shipping Component
	@sudo bash Components/shipping.sh

payment:  git-pull ## Setup Payment Component
	@sudo bash Components/payment.sh

frontend:  git-pull ## Setup frontend Component
	@sudo bash	Components/frontend.sh

mysql:  git-pull ## Setup mysql Component
	@sudo bash Components/mysql.sh

redis:  git-pull ## Setup redis Component
	@sudo bash	Components/redis.sh

rabbitmq:  git-pull ## Setup rabbitmq Component
	@sudo bash	Compnents/rabbitmq.sh

mongodb: git-pull ## Setup mongodb component
	@sudo bash Components/mongodb.sh