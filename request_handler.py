import json
from http.server import BaseHTTPRequestHandler, HTTPServer
from movies.requests import get_all_movies, get_movies_by_year

class HandleRequests(BaseHTTPRequestHandler):
    def parse_url(self, path):
        # /movies?year=1971
        list_path = path.split('/')
        resource = list_path[1]
        key = None
        value = None
        if '?' in resource:
            resource_split = resource.split('?')
            resource = resource_split[0]
            query = resource_split[1].split('=')
            key = query[0]
            value = query[1]
        return (resource, key, value)

    def _set_headers(self, status):
        self.send_response(status)
        self.send_header('Content-type', 'application/json')
        self.send_header('Access-Control-Allow-Origin', '*')
        self.end_headers()

    def do_OPTIONS(self):
        self.send_response(200)
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE')
        self.send_header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept')
        self.end_headers()

    def do_GET(self):
        (resource, key, value) = self.parse_url(self.path)
        response = None
        if resource == 'movies':
            if key == 'year':
                response = get_movies_by_year(value)
            else:
                response = get_all_movies()

        if response:
            self._set_headers(200)
            self.wfile.write(response.encode())
        else:
            self._set_headers(404)
        
    
    
def main():
    host = ''
    port = 8088
    HTTPServer((host, port), HandleRequests).serve_forever()


if __name__ == "__main__":
    main()



