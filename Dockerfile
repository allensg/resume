FROM registry.gitlab.com/jimmyscene/texlive:full
# FROM adnrv/texlive
WORKDIR /app
RUN tlmgr update --self && tlmgr install lato hyperref extsizes
COPY . .
ENV DATE test-date
ENV CI_JOB_URL https://gitlab.com
CMD ["/app/util/compileit.sh"]
