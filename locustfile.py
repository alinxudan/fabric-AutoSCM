from locust import HttpLocust, TaskSet, task

host = 'http://www.example.com'
def login(l):
    l.client.post("/login", {"username":"locust", "password":"123456"})
    
def logout(l):
    l.client.post("/logout", {"username":"locust", "password":"123456"})

class UserBehavior(TaskSet):
    
    def on_start(self):
        login(self)

    def on_stop(self):
        logout(self)
        
    @task(2)
    def index(self):
        l.client.get("/")
        
    @task(1)
	def profile(self):
        l.client.get("/profile")
        
class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 15000
