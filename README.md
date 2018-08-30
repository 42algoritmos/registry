# registry
My personal docker hub

:TODO

No guest
```
$ curl -k -X GET https://registry.local:5000/v2/ubuntu/tags/list                                                                                    
{"name":"ubuntu","tags":["16.04","12.04","14.04"]}
```

No host

```
docker pull ubuntu:18.04
```

```
docker inspect --format="{{.Id}}" ubuntu:18.04                               
docker inspect --format="{{.Id}}" ubuntu:18.04| 
  sed 's/sha256://'| 
    xargs -I{} docker tag {} localhost:5000/ubuntu:18.04                                           
```

```
docker push localhost:5000/ubuntu:18.04                                      
```

```
docker images | grep ubuntu
```


```
ubuntu                                           18.04               16508e5c265d        7 days ago          84.1MB                                        
localhost:5000/ubuntu                            18.04               16508e5c265d        7 days ago          84.1MB                                        
localhost:5000/ubuntu-server                     1.0                 3c8da1233e95        5 months ago        232MB                                         
localhost:5000/ubuntu                            16.04               747cb2d60bbe        10 months ago       122MB                                         
localhost:5000/ubuntu                            14.04               dea1945146b9        11 months ago       188MB                                         
localhost:5000/ubuntu                            12.04               5b117edd0b76        16 months ago       104MB                                         
localhost:5000/ubuntu-debootstrap                latest              898cb62b7368        2 years ago         87.1MB      
```

```
docker rmi ubuntu:18.04                                            
```


``` 
docker images | grep ubuntu
```


```
localhost:5000/ubuntu                           18.04               16508e5c265d        7 days ago          84.1MB                                        
localhost:5000/ubuntu-server                    1.0                 3c8da1233e95        5 months ago        232MB                                         
localhost:5000/ubuntu                           16.04               747cb2d60bbe        10 months ago       122MB                                         
localhost:5000/ubuntu                           14.04               dea1945146b9        11 months ago       188MB                                         
localhost:5000/ubuntu                           12.04               5b117edd0b76        16 months ago       104MB                                         
localhost:5000/ubuntu-debootstrap               latest              898cb62b7368        2 years ago         87.1MB
```


```
curl -k -X GET https://registry.local:5000/v2/ubuntu/tags/list                                                                                    
{"name":"ubuntu","tags":["18.04","16.04","12.04","14.04"]}  
```
