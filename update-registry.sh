#!/bin/bash

files=(
	$(docker images| sort -r | sed '1,2d' | grep -v localhost | awk '{printf $1":"$2"\n"}')
)


for f in ${files[*]}; do
	echo =$f=
	docker inspect --format="{{.Id}}" $f| sed 's/sha256://'| xargs -I{} docker tag {} localhost:5000/$f
	docker push localhost:5000/$f
	docker rmi $f
done

exit 0

