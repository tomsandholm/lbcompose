FROM librebooking/librebooking:develop
RUN apt-get update && apt-get install -y postfix mailutils

