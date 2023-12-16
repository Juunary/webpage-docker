# 프로덕션 환경에서 사용할 도커 이미지를 지정합니다.
FROM node:16

# 앱 소스코드를 복사할 디렉토리를 지정합니다.
WORKDIR '/app'

# package.json 및 package-lock.json을 복사하여 종속성을 먼저 설치합니다.
COPY package.json .

# Node.js 패키지 설치
RUN npm install

# 소스 코드를 현재 디렉토리로 복사합니다.
COPY . .

# Python을 설치합니다.
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# 파이썬 패키지를 설치합니다.
RUN pip3 install xgboost 
RUN pip3 install numpy 
RUN pip3 install pandas 
RUN pip3 install scikit-learn

# Express 애플리케이션을 시작합니다.
CMD ["npm", "start"]
