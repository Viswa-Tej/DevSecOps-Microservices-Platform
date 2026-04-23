"""
Simple microservice with:
- health endpoint
- metrics endpoint (for Prometheus)
"""

from http.server import BaseHTTPRequestHandler, HTTPServer

REQUEST_COUNT = 0

class handler(BaseHTTPRequestHandler):
    def do_GET(self):
        global REQUEST_COUNT
        REQUEST_COUNT += 1

        if self.path == "/":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"Hello DevSecOps - Production Ready")

        elif self.path == "/health":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"OK")

        elif self.path == "/metrics":
            self.send_response(200)
            self.end_headers()
            metrics = f"request_count {REQUEST_COUNT}"
            self.wfile.write(metrics.encode())

HTTPServer(('', 8080), handler).serve_forever()