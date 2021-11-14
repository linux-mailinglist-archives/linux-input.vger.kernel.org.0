Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE6544FB5A
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 20:55:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbhKNT6Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 14:58:25 -0500
Received: from smtp161.vfemail.net ([146.59.185.161]:38211 "EHLO
        smtp161.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236202AbhKNT6Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 14:58:24 -0500
Received: (qmail 20118 invoked from network); 14 Nov 2021 19:48:47 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 14 Nov 2021 19:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=kJ+oYle0zF+X
        HhORTg5CubYE8lTnloyv75hcx8TKD1M=; b=g1PoMV5Pco9pkU9ftgdSxjRhX3te
        j0ywinz21eMDCybDPgDiei4RUFv9BuccHnRkvdeS/32XSJbXa+gpRaFwaYdViBgG
        k3VBRTS8SMuQ5kn9W+LqBUucfyXMtVUw/wiRL1SJhUp0Y1Op8PcaktstPPL/8gCX
        YKS+4DWxL4ndHPI=
Received: (qmail 45721 invoked from network); 14 Nov 2021 19:48:17 -0000
Received: by simscan 1.4.0 ppid: 45677, pid: 45700, t: 0.2121s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 14 Nov 2021 19:48:17 -0000
Date:   Sun, 14 Nov 2021 14:48:42 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     <linux-usb@vger.kernel.org>
Cc:     <linux-kernel-owner@vger.kernel.org>, <linux-input@vger.kernel.org>
Subject: I need advice with UPS connection. (ping)
Message-ID: <20211114144842.72463ccc@Zen-II-x12.niklas.com>
In-Reply-To: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Almost 1 year ago to the date I posted a question regarding connecting my
UPS to my PC (look for the same subject -ping). The input subsystem
maintainers, Jiri Kosina or Ben Tissoires were asked to get back to me.
No one ever did though.

Now my UPS is *not* working correctly, and I'd really really like to be
able to speak to it with my PC so I can (hopefully) figure out what's
wrong with it.

I'm running Linux Kernel 5.15.X on a Devuan (Debian) system. I connected
my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and got (almost the
same as last time...):
[ 4236.165138] usb 3-2: new low-speed USB device number 2 using xhci_hcd
[ 4236.325178] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[ 4236.325183] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 4236.325185] usb 3-2: Product: HID UPS Battery
[ 4236.325187] usb 3-2: Manufacturer: POWERCOM Co.,LTD
[ 4236.325188] usb 3-2: SerialNumber: 004-0D9F-000
[ 4236.423210] hid-generic 0003:0D9F:0004.000B: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
[ 4239.842223] usb 3-2: USB disconnect, device number 2
[ 4242.485126] usb 3-2: new low-speed USB device number 3 using xhci_hcd
[ 4242.645075] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[ 4242.645080] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 4242.645082] usb 3-2: Product: HID UPS Battery
[ 4242.645084] usb 3-2: Manufacturer: POWERCOM Co.,LTD
[ 4242.645085] usb 3-2: SerialNumber: 004-0D9F-000
[ 4242.727148] hid-generic 0003:0D9F:0004.000C: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
[ 4246.135926] usb 3-2: USB disconnect, device number 3
[ 4248.781839] usb 3-2: new low-speed USB device number 4 using xhci_hcd
[ 4248.942099] usb 3-2: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[ 4248.942104] usb 3-2: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[ 4248.942106] usb 3-2: Product: HID UPS Battery
[ 4248.942108] usb 3-2: Manufacturer: POWERCOM Co.,LTD
[ 4248.942109] usb 3-2: SerialNumber: 004-0D9F-000
[ 4249.031166] hid-generic 0003:0D9F:0004.000D: hiddev3,hidraw8: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:11:00.3-2/input0
[ 4252.511996] usb 3-2: USB disconnect, device number 4
...

I'd appreciate any advice trying to get my UPS to stay connected and not
spam the kernel log. I'd like to have nut or apcupsd talk to it.

Thanks,
David
