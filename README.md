# I. Overview
    1. Folder [architecture-overview] contains project documents
    2. Folder [motel-backend] contains source code(golang) for the backend part
    3. Folder [motel] contains source code(flutter) for the frontend part

# II. Chosen architecture (Monolithic + Clean Architecture)
    1. Frontend part: flutter, clean architecture + bloc
    2. Backend part: golang, clean architecture, gorm, echo, postgresql

# III. Setup environment
    1. Install flutter https://docs.flutter.dev/get-started/install 
    2. Install golang https://go.dev/dl/
    3. Install draw https://app.diagrams.net/
    4. Install docker https://www.docker.com/

# IV. Run server
    cd /your_path/motel-project/motel-backend
    docker compose up
# V. Run UI
    cd /your_path/motel-project/motel
    flutter pub upgrade --major-versions
    dart run build_runner build
    click F5 on visual studio code
    flutter build apk --release
    sudo pkill -u postgres
    docker compose run --service-ports web bash