import-module au

$releases = 'https://github.com/buddhi1980/mandelbulber2/releases/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyinstall.ps1' = @{
            "(^[$]url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
        'chocolatey-mandelbulber2.nuspec'  = @{
            "<id>.*</id>" = "<id>mandelbulber2</id>"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re = 'Mandelbulber2-v(?<version>\d+\.\d+\.\d+).*-Setup.exe'
    $url = "https://github.com$($download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href)"
    $version = ($url -split "/" | Select-Object -Index 7)

    return @{ URL32 = $url; Version = $version; ChecksumType32 = 'sha256'; }
}

update