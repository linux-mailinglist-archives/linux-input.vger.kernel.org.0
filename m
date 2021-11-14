Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 717A544FBBB
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 22:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbhKNVRc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 16:17:32 -0500
Received: from netrider.rowland.org ([192.131.102.5]:55093 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S236331AbhKNVRb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 16:17:31 -0500
Received: (qmail 87268 invoked by uid 1000); 14 Nov 2021 16:14:35 -0500
Date:   Sun, 14 Nov 2021 16:14:35 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211114211435.GA87082@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20211114144842.72463ccc@Zen-II-x12.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211114144842.72463ccc@Zen-II-x12.niklas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 14, 2021 at 02:48:42PM -0500, David Niklas wrote:
> Hello,
> 
> Almost 1 year ago to the date I posted a question regarding connecting my
> UPS to my PC (look for the same subject -ping). The input subsystem
> maintainers, Jiri Kosina or Ben Tissoires were asked to get back to me.
> No one ever did though.
> 
> Now my UPS is *not* working correctly, and I'd really really like to be
> able to speak to it with my PC so I can (hopefully) figure out what's
> wrong with it.
> 
> I'm running Linux Kernel 5.15.X on a Devuan (Debian) system. I connected
> my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and got (almost the
> same as last time...):
> [ 4236.165138] usb 3-2: new low-speed USB device number 2 using xhci_hcd
> [ 4236.325178] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [ 4236.325183] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [ 4236.325185] usb 3-2: Product: HID UPS Battery
> [ 4236.325187] usb 3-2: Manufacturer: POWERCOM Co.,LTD
> [ 4236.325188] usb 3-2: SerialNumber: 004-0D9F-000
> [ 4236.423210] hid-generic 0003:0D9F:0004.000B: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
> [ 4239.842223] usb 3-2: USB disconnect, device number 2
> [ 4242.485126] usb 3-2: new low-speed USB device number 3 using xhci_hcd
> [ 4242.645075] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [ 4242.645080] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [ 4242.645082] usb 3-2: Product: HID UPS Battery
> [ 4242.645084] usb 3-2: Manufacturer: POWERCOM Co.,LTD
> [ 4242.645085] usb 3-2: SerialNumber: 004-0D9F-000
> [ 4242.727148] hid-generic 0003:0D9F:0004.000C: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
> [ 4246.135926] usb 3-2: USB disconnect, device number 3
> [ 4248.781839] usb 3-2: new low-speed USB device number 4 using xhci_hcd
> [ 4248.942099] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [ 4248.942104] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [ 4248.942106] usb 3-2: Product: HID UPS Battery
> [ 4248.942108] usb 3-2: Manufacturer: POWERCOM Co.,LTD
> [ 4248.942109] usb 3-2: SerialNumber: 004-0D9F-000
> [ 4249.031166] hid-generic 0003:0D9F:0004.000D: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
> [ 4252.511996] usb 3-2: USB disconnect, device number 4
> ...
> 
> I'd appreciate any advice trying to get my UPS to stay connected and not
> spam the kernel log. I'd like to have nut or apcupsd talk to it.

It would help to see the details of the communication between the 
computer and the UPS.  You can collect a usbmon trace by running (as 
superuser):

	cat /sys/kernel/debug/usb/usbmon/3u >mon.txt

before plugging in the UPS cable.  (The 3 comes from the bus number of 
the USB port in the log above.)  Kill the process after the cable has 
been plugged in long enough for a couple of these disconnect messages to 
appear, and post the output file to the mailing list.

Alan Stern
