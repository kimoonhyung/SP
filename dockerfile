FROM darwinjs/amazonlinux2ec2build
COPY sp1.sh .
RUN chmod ugo+x sp1.sh
CMD ./sp1.sh
