FROM base/devel
RUN pacman -Syy --noconfirm
RUN pacman -S --noconfirm git
RUN pacman -S --noconfirm dotnet-sdk
RUN mkdir -pv {build,webapi}
WORKDIR /build
RUN git clone https://github.com/nfmccrina/konzerthaus-webapi.git
WORKDIR /build/konzerthaus-webapi/src
RUN dotnet publish -o /webapi
WORKDIR /webapi
ENTRYPOINT ["dotnet", "/webapi/KonzertHausWebApi.dll"]