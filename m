Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8A32AE5CD
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 02:24:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732013AbgKKBYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 20:24:41 -0500
Received: from nl101-3.vfemail.net ([149.210.219.33]:31459 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKKBYl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 20:24:41 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Tue, 10 Nov 2020 20:24:40 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:in-reply-to:references:mime-version
        :content-type:content-transfer-encoding; s=2018; bh=BzlUAaycItE0
        crjUqcE5N+l/26Xc5ORPaC1Xen5g9g0=; b=WHdh0fTCwhbAIObdCIt8VASjj8wa
        8xA6Fg6Edn77Da79xDmTsK1fCpalggh0w9ejuQjD0ZAX75t81eVwRYn7uTffBKt8
        0goFCGMETAqF1e5swtM69KhohPA7/OoDSsOMfjeFlzFABfo0UPhPBcRCq3YtSW82
        /hiCG5HQTJqczEo=
Received: (qmail 53021 invoked from network); 11 Nov 2020 01:17:57 -0000
Received: by simscan 1.4.0 ppid: 53006, pid: 53014, t: 0.3608s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 11 Nov 2020 01:17:57 -0000
Date:   Tue, 10 Nov 2020 20:17:35 -0500
From:   Hgntkwis@vfemail.net
To:     stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection.
Message-ID: <20201110201735.29a37035@Phenom-II-x6.niklas.com>
In-Reply-To: <20201110215511.GA208895@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
 <20201110215511.GA208895@rowland.harvard.edu>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Nov 2020 16:55:11 -0500
Alan Stern <stern@rowland.harvard.edu> wrote:
> On Mon, Nov 09, 2020 at 10:00:00PM -0500, David Niklas wrote:
> > Hello,
> > I'm running Linux Kernel 5.8.X on a Devuan (Debian) system. I
> > connected my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and
> > got:
> > 
> > [739229.454592][T25544] usb 9-4: new low-speed USB device number 2
> > using ohci-pci [739229.635343][T25544] usb 9-4: config index 0
> > descriptor too short (expected 9, got 0) [739229.635348][T25544] usb
> > 9-4: can't read configurations, error -22 [739229.791290][T25544] usb
> > 9-4: new low-speed USB device number 3 using ohci-pci
> > [739229.982414][T25544] usb 9-4: New USB device found, idVendor=0d9f,
> > idProduct=0004, bcdDevice= 0.02 [739229.982421][T25544] usb 9-4: New
> > USB device strings: Mfr=3, Product=1, SerialNumber=2
> > [739229.982426][T25544] usb 9-4: Product: HID UPS Battery
> > [739229.982430][T25544] usb 9-4: Manufacturer: POWERCOM Co.,LTD
> > [739229.982433][T25544] usb 9-4: SerialNumber: 004-0D9F-000
> > [739230.027616][T25544] hid-generic 0003:0D9F:0004.0004:
> > hiddev1,hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS
> > Battery] on usb-0000:00:16.0-4/input0 [739233.484723][T25544] usb
> > 9-4: USB disconnect, device number 3 [739236.257951][T25544] usb 9-4:
> > new low-speed USB device number 4 using ohci-pci
> > [739236.475434][T25544] usb 9-4: New USB device found, idVendor=0d9f,
> > idProduct=0004, bcdDevice= 0.02 [739236.475442][T25544] usb 9-4: New
> > USB device strings: Mfr=3, Product=1, SerialNumber=2
> > [739236.520783][T25544] hid-generic 0003:0D9F:0004.0005:
> > hiddev1,hidraw2: USB HID v1.00 Device [HID 0d9f:0004] on
> > usb-0000:00:16.0-4/input0 [739239.933809][T25544] usb 9-4: USB
> > disconnect, device number 4 [739242.701322][T25544] usb 9-4: new
> > low-speed USB device number 5 using ohci-pci [739242.880035][T25544]
> > usb 9-4: device descriptor read/all, error -62
> > [739243.034561][T25544] usb 9-4: new low-speed USB device number 6
> > using ohci-pci [739243.252040][T25544] usb 9-4: New USB device found,
> > idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> > [739243.252042][T25544] usb 9-4: New USB device strings: Mfr=3,
> > Product=1, SerialNumber=2 [739243.296444][T25544] hid-generic
> > 0003:0D9F:0004.0006: hiddev1,hidraw2: USB HID v1.00 Device [HID
> > 0d9f:0004] on usb-0000:00:16.0-4/input0 [739246.720152][T25544] usb
> > 9-4: USB disconnect, device number 6 [739249.491330][T13473] usb 9-4:
> > new low-speed USB device number 7 using ohci-pci
> > [739249.718707][T13473] usb 9-4: New USB device found, idVendor=0d9f,
> > idProduct=0004, bcdDevice= 0.02 [739249.718709][T13473] usb 9-4: New
> > USB device strings: Mfr=3, Product=1, SerialNumber=2
> > [739249.718710][T13473] usb 9-4: Product: HID UPS Battery
> > [739249.718711][T13473] usb 9-4: Manufacturer: POWERCOM Co.,LTD
> > [739249.718712][T13473] usb 9-4: SerialNumber: 004-0D9F-000
> > [739249.751173][T13473] hid-generic 0003:0D9F:0004.0007: unknown main
> > item tag 0x0 <snip class="spam-repeated-previous-message">
> > [739250.162392][T13473] hid-generic 0003:0D9F:0004.0007: unknown main
> > item tag 0x0 [739250.162813][T13473] hid-generic 0003:0D9F:0004.0007:
> > hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on
> > usb-0000:00:16.0-4/input0 [739253.165518][T13473] usb 9-4: USB
> > disconnect, device number 7 ...
> > 
> > 
> > I'd appreciate any advice trying to get my UPS to stay connected and
> > not spam the kernel log. The UPS is about 1 year old. It's working
> > fine. I just want to use nut or apcupsd with it.
> > 
> > Thanks,
> > David
>
> +Jiri, Ben, and linux-input
> 

I googled Jiri and ben but I don't see anything promising. Can you give
me more search terms or absolute URLs?

Also, in pointing me to the linux-input subsystem, are you recommending
me to write a driver or something else?

Thanks,
David
