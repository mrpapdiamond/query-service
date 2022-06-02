k8s-init:
	minikube start --ports=127.0.0.1:30000:30000 --ports=127.0.0.1:30010:30010 --ports=127.0.0.1:30020:30020 --ports=127.0.0.1:30030:30030
	kubectl apply -f k8s-bundle-prod.yaml
	docker run -p 80:80 --name notebook mrpapdiamond/micro1
#Run K8s
k8s-up:
	minikube start --ports=127.0.0.1:30000:30000 --ports=127.0.0.1:30010:30010 --ports=127.0.0.1:30020:30020 --ports=127.0.0.1:30030:30030
	kubectl apply -f k8s-bundle-prod.yaml
	docker start notebook
#Stop K8s
k8s-down:
	kubectl delete -f k8s-bundle-prod.yaml
	docker stop notebook
