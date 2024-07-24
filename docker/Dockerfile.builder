# docker build --build-arg REPO_URL=https://github.com/Pyrinpyi/pyipad .

FROM stage/git AS git

FROM golang:1.20 as builder

RUN mkdir /out

COPY --from=git /out /out

WORKDIR /out

RUN go install -ldflags="-s -w -extldflags=-static" -tags netgo,osusergo . ./cmd/...