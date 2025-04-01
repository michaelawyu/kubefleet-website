#####################################################################
#                            Build Stage                            #
#####################################################################
FROM hugomods/hugo:exts as builder
# Base URL
#ARG HUGO_BASEURL=
#ENV HUGO_BASEURL=${HUGO_BASEURL}
# Build site
COPY . /src
# Replace below build command at will.
RUN hugo

#####################################################################
#                            Final Stage                            #
#####################################################################
FROM hugomods/hugo:nginx
# Copy the generated files to keep the image as small as possible.
COPY --from=builder /src/public /site
