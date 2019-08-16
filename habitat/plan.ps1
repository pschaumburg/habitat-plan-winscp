$pkg_name='winscp'
$pkg_origin='pschaumburg'
$pkg_maintainer="Patrick Schaumburg <info@p-schaumburg.de>"
$pkg_description="WinSCP Client"
$pkg_version='5.15.3'
$pkg_license=('Apache-2.0')
$package_source = "https://netcologne.dl.sourceforge.net/project/winscp/WinSCP/${pkg_version}/WinSCP-${pkg_version}-Portable.zip"

function Invoke-BeforeDefault {
  do_default_before
  update_pkg_version
}

function Invoke-Download {
  New-Item -ItemType Directory -Force -Path ${PLAN_CONTEXT}/../bin/
  $Session = New-Object -TypeName Microsoft.PowerShell.Commands.WebRequestSession
  Invoke-WebRequest -Uri $package_source -WebSession $Session -OutFile $HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}.zip
}

function Invoke-Unpack {
  Expand-Archive -Force -Path "$HAB_CACHE_SRC_PATH/${pkg_name}-${pkg_version}.zip" -DestinationPath "${PLAN_CONTEXT}/../bin/"
}

function Invoke-Build {
  return 0
}

function Invoke-Install {
  return 0
  Copy-Item ${PLAN_CONTEXT}/../bin/${pkg_name}-${pkg_version}.zip ${pkg_prefix}/ -Recurse -Force
}

