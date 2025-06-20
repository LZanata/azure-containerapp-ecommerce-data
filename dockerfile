FROM nginx:alpine

# Copie arquivos de configuração personalizados (opcional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Copie arquivos do site para o diretório padrão do Nginx (opcional)
COPY Blog/html /usr/share/nginx/html

# Exponha a porta padrão do Nginx
EXPOSE 80

