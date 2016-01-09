try {

    Write-ChocolateySuccess 'WorkPC'
} catch {
  Write-ChocolateyFailure 'WorkPC' $($_.Exception.Message)
  throw
}