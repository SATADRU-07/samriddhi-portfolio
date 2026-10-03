import os, subprocess
node_bin = r'C:\Users\satadru\.gemini\antigravity\tools\node\node.exe'
vite_bin = r'C:\Users\satadru\.gemini\antigravity\scratch\samriddhi-portfolio\node_modules\vite\bin\vite.js'
proj_dir = r'C:\Users\satadru\.gemini\antigravity\scratch\samriddhi-portfolio'
os.environ['PATH'] = r'C:\Users\satadru\.gemini\antigravity\tools\node' + os.pathsep + os.environ.get('PATH', '')
subprocess.run([node_bin, vite_bin, 'preview', '--port', '5173', '--host', '127.0.0.1'], cwd=proj_dir)
