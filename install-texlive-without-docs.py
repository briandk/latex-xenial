import subprocess
import re

get_texlive_dependencies = subprocess.run(
    ["apt-cache",
     "depends",
     "texlive-full"],
    universal_newlines=True,
    stdout=subprocess.PIPE
)

dependency_pattern = "Depends: "
non_doc_dependencies = []

for dependency in get_texlive_dependencies.stdout.splitlines():
    dependency = dependency.strip()
    if dependency.startswith(dependency_pattern) and not dependency.endswith("-doc"):
        non_doc_dependencies.append(
            dependency.strip().replace(dependency_pattern, ""))

def extract_dependency(dependency_text, pattern):
    dependency = dependency_text.strip().replace(pattern, "")
    return(dependency)

x = [extract_dependency(line, dependency_pattern)
        for line in get_texlive_dependencies.stdout.splitlines()
        if line.strip().startswith(dependency_pattern) and not line.strip().endswith("-doc")]

print(len(non_doc_dependencies))
print(len(x))
print(x == non_doc_dependencies)