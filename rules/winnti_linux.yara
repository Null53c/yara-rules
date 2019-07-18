rule Winnti_Linux: linuxmalware
{
   meta:
      Author = "Adam M. Swanda"
      Team = "Threat Hunting and Intelligence"

   strings:
      $str0 = "HIDE_THIS_SHELL=x"
      $str1 = "/usr/sbin/dmidecode  | grep -i 'UUID' |cut -d' ' -f2 2>/dev/null" ascii fullword
      $str2 = "mutex.max:  %lu" ascii fullword
      $str3 = "mutex.err:  %lu" ascii fullword
      $str4 = "/tmp/ans.log" ascii fullword
      $str5 = "mutex.used: %lu" ascii fullword
      $str6 = "Warning: Some of the worker threads may have failed to exit." ascii fullword
      $str7 = "line %d - " ascii fullword
      $str8 = "Warning an error has occurred when trying to obtain a worker task." ascii fullword
      $str9 = "6CMutex" ascii fullword
      $str10 = "Failed to obtain an empty task from the free tasks queue." ascii fullword
      $str11 = "A problem was detected in the queue (expected NULL, but found a different value)." ascii fullword
      $str12 = "Failed to a task to the free tasks queue during initialization." ascii fullword
      $str13 = "/var/run/libudev1.pid" ascii fullword
      $str14 = "__pthread_key_create" ascii fullword
      $str15 = "The threadpool received as argument is NULL." ascii fullword
      $str16 = "Failed to enqueue a task to free tasks queue." ascii fullword
      $str17 = "Failed to obtain a task from the jobs queue." ascii fullword
      $str18 = "Failed to add a new task to the tasks queue." ascii fullword
      $str19 = "setsockopt  failed" ascii fullword
      $str20 = "libxselinux.so" ascii fullword
      $str21 = "/lib/libxselinux" ascii fullword

    condition:
      uint16(0) == 0x457f
      and
      8 of them
}
