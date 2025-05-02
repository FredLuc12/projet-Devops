# Utilise une image officielle NGINX
FROM nginx:alpine

# Copie les fichiers de ton site dans le dossier HTML de nginx
COPY . /usr/share/nginx/html

# Expose le port 80
EXPOSE 80

# Lancement automatique de NGINX (déjà géré par l’image)
