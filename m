Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D4844FD54
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 04:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbhKODFc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 22:05:32 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:35003 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhKODF1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 22:05:27 -0500
Received: (qmail 21949 invoked from network); 15 Nov 2021 03:02:29 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 15 Nov 2021 03:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type; s=2018; bh=WEQkjRj8LEY4PURnCHLMdFVayJw94vNsrm7X9f
        TgRs0=; b=aqBSly5d2coWyFcSeqFHu8mGKRIfIUP0s7ail9EkZPFOSJoAaiwqyd
        MbIvHpTE3v6eIsSd2JzAWn3AvnPw5y43VZF/S/A6SNxuIuuMOStVGBK6zQCmqzgU
        SEjEl08JJtljV6K/rwv1bAl2pW/Hj+TKAwPpcSHKDMlyYz6ZLUIC4=
Received: (qmail 85000 invoked from network); 15 Nov 2021 03:01:58 -0000
Received: by simscan 1.4.0 ppid: 84678, pid: 84895, t: 0.3965s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 15 Nov 2021 03:01:58 -0000
Date:   Sun, 14 Nov 2021 22:02:22 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     linux-usb@vger.kernel.org
Cc:     stern@rowland.harvard.edu, linux-input@vger.kernel.org,
        <linux-kernel@vger.kernel.org>
Subject: Re: I need advice with UPS connection. (ping)
Message-ID: <20211114220222.31755871@Zen-II-x12.niklas.com>
In-Reply-To: <20211114211435.GA87082@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
        <20211114144842.72463ccc@Zen-II-x12.niklas.com>
        <20211114211435.GA87082@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/8+8m=9DCuNOXXSGkdDFZIB0"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--MP_/8+8m=9DCuNOXXSGkdDFZIB0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, 14 Nov 2021 16:14:35 -0500
stern@rowland.harvard.edu wrote:
> On Sun, Nov 14, 2021 at 02:48:42PM -0500, David Niklas wrote:
> > Hello,
> > 
> > Almost 1 year ago to the date I posted a question regarding
> > connecting my UPS to my PC (look for the same subject -ping). The
> > input subsystem maintainers, Jiri Kosina or Ben Tissoires were asked
> > to get back to me. No one ever did though.
> > 
> > Now my UPS is *not* working correctly, and I'd really really like to
> > be able to speak to it with my PC so I can (hopefully) figure out
> > what's wrong with it.
> > 
> > I'm running Linux Kernel 5.15.X on a Devuan (Debian) system. I
> > connected my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and
> > got (almost the same as last time...):
> > [ 4236.165138] usb 3-2: new low-speed USB device number 2 using
> > xhci_hcd [ 4236.325178] usb 3-2: New USB device found, idVendor=0d9f,
> > idProduct=0004, bcdDevice= 0.02 [ 4236.325183] usb 3-2: New USB
> > device strings: Mfr=3, Product=1, SerialNumber=2 [ 4236.325185] usb
> > 3-2: Product: HID UPS Battery [ 4236.325187] usb 3-2: Manufacturer:
> > POWERCOM Co.,LTD [ 4236.325188] usb 3-2: SerialNumber: 004-0D9F-000
> > [ 4236.423210] hid-generic 0003:0D9F:0004.000B: hiddev3,hidraw8: USB
> > HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on
> > usb-0000:11:00.3-2/input0 [ 4239.842223] usb 3-2: USB disconnect,
> > device number 2 [ 4242.485126] usb 3-2: new low-speed USB device
> > number 3 using xhci_hcd [ 4242.645075] usb 3-2: New USB device found,
> > idVendor=0d9f, idProduct=0004, bcdDevice= 0.02 [ 4242.645080] usb
> > 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> > [ 4242.645082] usb 3-2: Product: HID UPS Battery [ 4242.645084] usb
> > 3-2: Manufacturer: POWERCOM Co.,LTD [ 4242.645085] usb 3-2:
> > SerialNumber: 004-0D9F-000 [ 4242.727148] hid-generic
> > 0003:0D9F:0004.000C: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM
> > Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0 [ 4246.135926]
> > usb 3-2: USB disconnect, device number 3 [ 4248.781839] usb 3-2: new
> > low-speed USB device number 4 using xhci_hcd [ 4248.942099] usb 3-2:
> > New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> > [ 4248.942104] usb 3-2: New USB device strings: Mfr=3, Product=1,
> > SerialNumber=2 [ 4248.942106] usb 3-2: Product: HID UPS Battery
> > [ 4248.942108] usb 3-2: Manufacturer: POWERCOM Co.,LTD [ 4248.942109]
> > usb 3-2: SerialNumber: 004-0D9F-000 [ 4249.031166] hid-generic
> > 0003:0D9F:0004.000D: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM
> > Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0 [ 4252.511996]
> > usb 3-2: USB disconnect, device number 4 ...
> > 
> > I'd appreciate any advice trying to get my UPS to stay connected and
> > not spam the kernel log. I'd like to have nut or apcupsd talk to it.
> 
> It would help to see the details of the communication between the 
> computer and the UPS.  You can collect a usbmon trace by running (as 
> superuser):
> 
> 	cat /sys/kernel/debug/usb/usbmon/3u >mon.txt
> 
> before plugging in the UPS cable.  (The 3 comes from the bus number of 
> the USB port in the log above.)  Kill the process after the cable has 
> been plugged in long enough for a couple of these disconnect messages
> to appear, and post the output file to the mailing list.
> 
> Alan Stern
> 

Attached is the info.

In case someone doesn't realize, I'm subscribed to the linux-kernel ML,
but not input or usb. Please CC me if you don't want to spam the LKML.

Thanks for the timely response,
David

--MP_/8+8m=9DCuNOXXSGkdDFZIB0
Content-Type: application/x-bzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=mon.txt.bz2

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

--MP_/8+8m=9DCuNOXXSGkdDFZIB0--
