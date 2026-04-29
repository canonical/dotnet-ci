##
## DPKG-BUILDPACKAGE OPTIONS
##

# Name to use as override in .changes files for the Maintainer: field
# Defaults to the DEBEMAIL environment variable, if set, or else the
# Maintainer: field will not be overridden unless set here.
$maintainer_name='Ubuntu Toolchains CI <noreply@canonical.com>';

$build_environment = {
   'DEB_BUILD_OPTIONS' => 'parallel=2'
};

$resolve_alternatives = 1;

##
## SBUILD BEHAVIOUR
##

# Default distribution.  By default, no distribution is defined, and
# the user must specify it with the -d option.  However, a default may
# be configured here if desired.  Users must take care not to upload
# to the wrong distribution when this option is set, for example
# experimental packages will be built for upload to unstable when this
# is not what is required.
$distribution = 'resolute';
# Build arch-all by default
$build_arch_all = 1;
$build_arch_any = 1;
# Build the source package in addition to the other requested build artifacts; this is the same as passing `-s` to sbuild.
$build_source = 0;
# Produce a .changes file suitable for a source-only upload; this is the same as passing `--source-only-changes` to sbuild.
$source_only_changes = 0;

# Default chroot (defaults to distribution[-arch][-sbuild])
#$chroot = 'unstable-powerpc-sbuild';

# When to purge the build directory afterwards; possible values are "never",
# "successful", and "always"
$purge_build_directory = 'successful';
$purge_session = 'successful';
$purge_build_deps = 'successful';

# sbuild behaviour; possible values are "user" (exit status reports
# build failures) and "buildd" (exit status does not report build
# failures) for use in a buildd setup.
#$sbuild_mode = "user";

$lintian_opts = ['-i', '-I', '-E', '-v', '--pedantic'];
$run_lintian = 0;

## Run autopkgtest after every build (in a new, clean, chroot); use --no-run-autopkgtest to override.
$run_autopkgtest = 0;

##
## FILE AND DIRECTORY LOCATIONS
##

# This option is deprecated.  Directory for chroot symlinks and sbuild
# logs.  Defaults to the current directory if unspecified.  It is used
# as the location of chroot symlinks (obsolete) and for current build
# log symlinks and some build logs.  There is no default; if unset, it
# defaults to the current working directory.  $HOME/build is another
# common configuration.
$build_dir = $ENV{HOME}."/sbuild/build";

# Directory for writing build logs to
$log_dir = $ENV{HOME}."/sbuild/logs";

# Directory for writing build statistics to
$stats_dir = $ENV{HOME}."/sbuild/stats";

# Unshare backend configuration
# $chroot_mode = "unshare";
$chroot_mode = "schroot";
$unshare_tmpdir_template = "/var/tmp/tmp.sbuild.XXXXXXXX";

# don't remove this, Perl needs it:
1;
