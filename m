Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53246450948
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 17:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236545AbhKOQMR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 11:12:17 -0500
Received: from netrider.rowland.org ([192.131.102.5]:45315 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236643AbhKOQMO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 11:12:14 -0500
Received: (qmail 113032 invoked by uid 1000); 15 Nov 2021 11:09:18 -0500
Date:   Mon, 15 Nov 2021 11:09:18 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211115160918.GB109771@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com>
 <20211114211435.GA87082@rowland.harvard.edu>
 <20211114220222.31755871@Zen-II-x12.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211114220222.31755871@Zen-II-x12.niklas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 14, 2021 at 10:02:22PM -0500, David Niklas wrote:
> On Sun, 14 Nov 2021 16:14:35 -0500
> stern@rowland.harvard.edu wrote:
> > On Sun, Nov 14, 2021 at 02:48:42PM -0500, David Niklas wrote:
> > > Hello,
> > > 
> > > Almost 1 year ago to the date I posted a question regarding
> > > connecting my UPS to my PC (look for the same subject -ping). The
> > > input subsystem maintainers, Jiri Kosina or Ben Tissoires were asked
> > > to get back to me. No one ever did though.
> > > 
> > > Now my UPS is *not* working correctly, and I'd really really like to
> > > be able to speak to it with my PC so I can (hopefully) figure out
> > > what's wrong with it.
> > > 
> > > I'm running Linux Kernel 5.15.X on a Devuan (Debian) system. I
> > > connected my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and
> > > got (almost the same as last time...):
> > > [ 4236.165138] usb 3-2: new low-speed USB device number 2 using
> > > xhci_hcd [ 4236.325178] usb 3-2: New USB device found, idVendor=0d9f,
> > > idProduct=0004, bcdDevice= 0.02 [ 4236.325183] usb 3-2: New USB
> > > device strings: Mfr=3, Product=1, SerialNumber=2 [ 4236.325185] usb
> > > 3-2: Product: HID UPS Battery [ 4236.325187] usb 3-2: Manufacturer:
> > > POWERCOM Co.,LTD [ 4236.325188] usb 3-2: SerialNumber: 004-0D9F-000
> > > [ 4236.423210] hid-generic 0003:0D9F:0004.000B: hiddev3,hidraw8: USB
> > > HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on
> > > usb-0000:11:00.3-2/input0 [ 4239.842223] usb 3-2: USB disconnect,
> > > device number 2 [ 4242.485126] usb 3-2: new low-speed USB device
> > > number 3 using xhci_hcd [ 4242.645075] usb 3-2: New USB device found,
> > > idVendor=0d9f, idProduct=0004, bcdDevice= 0.02 [ 4242.645080] usb
> > > 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> > > [ 4242.645082] usb 3-2: Product: HID UPS Battery [ 4242.645084] usb
> > > 3-2: Manufacturer: POWERCOM Co.,LTD [ 4242.645085] usb 3-2:
> > > SerialNumber: 004-0D9F-000 [ 4242.727148] hid-generic
> > > 0003:0D9F:0004.000C: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM
> > > Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0 [ 4246.135926]
> > > usb 3-2: USB disconnect, device number 3 [ 4248.781839] usb 3-2: new
> > > low-speed USB device number 4 using xhci_hcd [ 4248.942099] usb 3-2:
> > > New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> > > [ 4248.942104] usb 3-2: New USB device strings: Mfr=3, Product=1,
> > > SerialNumber=2 [ 4248.942106] usb 3-2: Product: HID UPS Battery
> > > [ 4248.942108] usb 3-2: Manufacturer: POWERCOM Co.,LTD [ 4248.942109]
> > > usb 3-2: SerialNumber: 004-0D9F-000 [ 4249.031166] hid-generic
> > > 0003:0D9F:0004.000D: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM
> > > Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0 [ 4252.511996]
> > > usb 3-2: USB disconnect, device number 4 ...
> > > 
> > > I'd appreciate any advice trying to get my UPS to stay connected and
> > > not spam the kernel log. I'd like to have nut or apcupsd talk to it.
> > 
> > It would help to see the details of the communication between the 
> > computer and the UPS.  You can collect a usbmon trace by running (as 
> > superuser):
> > 
> > 	cat /sys/kernel/debug/usb/usbmon/3u >mon.txt
> > 
> > before plugging in the UPS cable.  (The 3 comes from the bus number of 
> > the USB port in the log above.)  Kill the process after the cable has 
> > been plugged in long enough for a couple of these disconnect messages
> > to appear, and post the output file to the mailing list.
> > 
> > Alan Stern
> > 
> 
> Attached is the info.
> 
> In case someone doesn't realize, I'm subscribed to the linux-kernel ML,
> but not input or usb. Please CC me if you don't want to spam the LKML.

Has this device ever worked with any version of Linux?

The usbmon trace is not terribly revealing.  Here are the important 
parts from one connect/disconnect cycle.  (FYI, the second column of 
each line is a timestamp in microseconds.)

ffff93eaa3edad80 2135760066 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
ffff93eaa3edad80 2135760074 C Ci:3:001:0 0 4 = 01030000

The kernel learns that there is a connection on port 3 of bus 3.

ffff93eaa3edad80 2135760113 S Co:3:001:0 s 23 03 0004 0003 0000 0
ffff93eaa3edad80 2135760117 C Co:3:001:0 0 0

The kernel tells the USB host controller to reset the port.

ffff93eaa3edad80 2135826729 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
ffff93eaa3edad80 2135826739 C Ci:3:001:0 0 4 = 03031000

The kernel sees that the reset is complete and the port is enabled.

ffff93eaa3edad80 2135826742 S Co:3:001:0 s 23 01 0014 0003 0000 0
ffff93eaa3edad80 2135826744 C Co:3:001:0 0 0

The kernel clears the "reset complete" status flag.

ffff93eaa3edad80 2135883456 S Ci:3:000:0 s 80 06 0100 0000 0040 64 <
ffff93eaa3edad80 2135885736 C Ci:3:000:0 0 18 = 12011001 00000008 9f0d0400 02000301 0201

The computer reads the device descriptor for the first time.

ffff93eaa3edad80 2135885741 S Co:3:001:0 s 23 03 0004 0003 0000 0
ffff93eaa3edad80 2135885746 C Co:3:001:0 0 0
ffff93eaa3edad80 2135950054 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
ffff93eaa3edad80 2135950060 C Ci:3:001:0 0 4 = 03031000
ffff93eaa3edad80 2135950063 S Co:3:001:0 s 23 01 0014 0003 0000 0
ffff93eaa3edad80 2135950066 C Co:3:001:0 0 0

Another reset, reset complete, clear "reset complete" flag series.  
This is the normal sequence used every time a device gets connected.

ffff93eaa3edad80 2136023391 S Ci:3:009:0 s 80 06 0100 0000 0012 18 <
ffff93eaa3edad80 2136025736 C Ci:3:009:0 0 18 = 12011001 00000008 9f0d0400 02000301 0201

The kernel reads the device descriptor a second time.

ffff93eaa3edad80 2136025745 S Ci:3:009:0 s 80 06 0200 0000 0009 9 <
ffff93eaa3edad80 2136028735 C Ci:3:009:0 0 9 = 09022200 010100a0 32

The kernel reads the device's configuration descriptor.

ffff93eaa3edad80 2136028738 S Ci:3:009:0 s 80 06 0200 0000 0022 34 <
ffff93eaa3edad80 2136031810 C Ci:3:009:0 0 34 = 09022200 010100a0 32090400 00010300 00000921 00010001 22e40307 05810308

The kernel reads the device's configuration, interface, and endpoint 
descriptors.

ffff93eaa3edad80 2136031818 S Ci:3:009:0 s 80 06 0300 0000 00ff 255 <
ffff93eaa3edad80 2136034734 C Ci:3:009:0 0 6 = 06030904 0408
ffff93eaa3edad80 2136034738 S Ci:3:009:0 s 80 06 0301 0409 00ff 255 <
ffff93eaa3edad80 2136037799 C Ci:3:009:0 0 32 = 20034800 49004400 20005500 50005300 20004200 61007400 74006500 72007900
ffff93eaa3edad80 2136037803 S Ci:3:009:0 s 80 06 0303 0409 00ff 255 <
ffff93eaa3edad80 2136040810 C Ci:3:009:0 0 34 = 22035000 4f005700 45005200 43004f00 4d002000 43006f00 2e002c00 4c005400
ffff93eaa3edad80 2136040816 S Ci:3:009:0 s 80 06 0302 0409 00ff 255 <
ffff93eaa3edad80 2136043734 C Ci:3:009:0 0 26 = 1a033000 30003400 2d003000 44003900 46002d00 30003000 3000

The kernel reads several string descriptors.  If you're good at 
translating UTF-16LE codes from hex to normal characters, you can find 
the truncated strings "HID UPS Battery", "POWERCOM Co.,LT", and 
"004-0D9F-000" that make up the vendor, product (slightly truncated), 
and serial number string descriptors.

Reading these descriptors is part of the normal enumeration process 
that happens whenever a USB device is plugged in.

ffff93eaa3edad80 2136080671 S Co:3:009:0 s 00 09 0001 0000 0000 0
ffff93eaa3edad80 2136081734 C Co:3:009:0 0 0

The kernel tells the device to install its first (and in this case, 
only) configuration.  Also very normal, and necessary for proper 
operation.

ffff93eaa3edad80 2136081778 S Ci:3:009:0 s 80 06 0302 0409 00ff 255 <
ffff93eaa3edad80 2136084734 C Ci:3:009:0 0 26 = 1a033000 30003400 2d003000 44003900 46002d00 30003000 3000

The kernel reads the serial number string descriptor descriptor again.

ffff93eaa3edad80 2136084747 S Co:3:009:0 s 21 0a 0000 0000 0000 0
ffff93eaa3edad80 2136086733 C Co:3:009:0 0 0

The kernel sends a Set-Idle request to the device, telling it not to 
send any data reports when nothing has changed.  This is done 
automatically by the usbhid driver for every USB HID device, including 
keyboards and mice as well as your UPS.

ffff93eaa3edad80 2136086737 S Ci:3:009:0 s 81 06 2200 0000 03e4 996 <
ffff93eaa3edad80 2136122734 C Ci:3:009:0 0 996 = 05840904 a1010924 a1028501 09fe7901 75089501 150026ff 00b12285 0209ff79

The kernel reads the device's HID descriptor.  (The usbmon trace shows 
only the first 32 bytes of the 996-byte descriptor.)  Again, this is 
normal and necessary for using any HID device.

ffff93e482efb440 2139520170 C Ii:3:001:1 0:2048 1 = 08
ffff93e482efb440 2139520180 S Ii:3:001:1 -115:2048 4 <

At this point the USB controller tells the kernel that there has been a 
status change on port 3 of bus 3.

ffff93eaa2ff8240 2139520188 S Ci:3:001:0 s a3 00 0000 0003 0004 4 <
ffff93eaa2ff8240 2139520197 C Ci:3:001:0 0 4 = 00010100

The kernel reads the port's status and sees that there is a "connection 
status change" bit set and the port is no longer connected.  In other 
words, the UPS device has disconnected itself electronically from the 
USB bus.

ffff93eaa2ff8240 2139520200 S Co:3:001:0 s 23 01 0010 0003 0000 0
ffff93eaa2ff8240 2139520203 C Co:3:001:0 0 0

The kernel clears the "connection status change" flag.  Following this 
the cycle repeats.


Out of all this information, the only conclusion I can draw is that the 
UPS is not behaving like a normal device.  One possibility is that it 
doesn't like the Set-Idle request (although if that is the case, why 
did it remain connected long enough to send the HID descriptor?).

You can test the theory by patching the kernel, if you want.  The code 
to change is in the source file drivers/hid/usbhid/hid-core.c, and the 
function in question is hid_set_idle() located around line 659 in the 
file.  Just change the statement:

	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
		HID_REQ_SET_IDLE, USB_TYPE_CLASS | USB_RECIP_INTERFACE, (idle << 8) | report,
		ifnum, NULL, 0, USB_CTRL_SET_TIMEOUT);

to:

	return 0;

to prevent the Set-Idle request from being sent.  If the device still 
insists on disconnecting then we'll know that this wasn't the reason.

Also, if you have another system (say, one running Windows) which the 
UPS does work properly with, you could try collecting the equivalent of 
a usbmon trace from that system for purposes of comparison.  (On 
Windows, I believe you can use Wireshark to trace USB communications.)

Alan Stern
