from .db_router import set_current_hostname

class HostnameHeaderMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        hostname = request.headers.get('frontend-hostname')
        if hostname:
            mapped = hostname.split('.')[0]  # example1 -> example1
            set_current_hostname(mapped)
        return self.get_response(request)
