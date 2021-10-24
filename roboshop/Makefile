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

cart: #### Setup Cart Component
	@bash Components/cat.sh

catalogue: #### Setup Catalogue component
	@bash Components/catalogue.sh

user: #### Setup User component
	@bash Components/user.sh

shipping: #### Setup Shipping Component
	@bash Components/shipping.sh

payment: #### Setup Payment Component
	@bash Components/payment.sh

frontend: #### Setup frontend Component
	@bash	Components/frontend.sh

mysql: #### Setup mysql Component
	@bash Components/mysql.sh

redis: #### Setup redis Component
	@bash	Components/redis.sh

rabbitmq: #### Setup rabbitmq Component
	@bash	Compnents/rabbitmq.sh

mongodb: #### Setup mongodb component
	@bash Components/mongodb.sh