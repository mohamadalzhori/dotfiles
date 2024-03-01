# dotfiles

## Scripts

### Executor

Executor is a versatile tool that I use frequently. It allows me to perform various tasks such as opening websites, applications, and files, running scripts, and more. It essentially serves as a convenient menu for executing different actions.

Using it, I can conveniently search Google and YouTube directly from the taskbar, as well as quickly access frequently used configuration files.
### NextEvent

NextEvent script is designed to enhance my productivity by retrieving and displaying my upcoming calendar event on the i3 bar. With this script, I no longer need to constantly check my calendar to stay updated on my schedule.

## Conflicts
### Dual booting with windows leading to Clock Errors

* There are two clocks:
  * System clock: Specific to the OS
  * Hardware clock (RTC): Independent
* Windows thinks that RTC is your local time so it sets your System clock same as RTC
* Linux thinks that RTC is set to UTC and your system clock is set according to your location as a shifted version of the RTC

eg: Beirut is UTC+2 and suppose it's 4:50 in Beirut right now
* On Linux: RTC is set to UTC so it's equal to 2:50, and the system clock is 4:50
* On Windows: Since it thinks that RTC is actually my local time so it sets the system clock to be 2:50 as my local time while actually my local time is 4:50

To fix this issue:
* Either set Linux to use RTC as local time (using one command) :)
* Or set Windows to use RTC as UTC time (alot of registery editing) (ง’̀-‘́)ง

Solution: 
> timedatectl set-local-rtc 1

[source](https://itsfoss.com/wrong-time-dual-boot/)
