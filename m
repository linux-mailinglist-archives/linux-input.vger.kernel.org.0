Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFD32AE237
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 22:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731709AbgKJVzN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 16:55:13 -0500
Received: from netrider.rowland.org ([192.131.102.5]:43703 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729862AbgKJVzN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 16:55:13 -0500
Received: (qmail 209049 invoked by uid 1000); 10 Nov 2020 16:55:11 -0500
Date:   Tue, 10 Nov 2020 16:55:11 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     David Niklas <Hgntkwis@vfemail.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: I need advice with UPS connection.
Message-ID: <20201110215511.GA208895@rowland.harvard.edu>
References: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

+Jiri, Ben, and linux-input

On Mon, Nov 09, 2020 at 10:00:00PM -0500, David Niklas wrote:
> Hello,
> I'm running Linux Kernel 5.8.X on a Devuan (Debian) system. I connected
> my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and got:
> 
> [739229.454592][T25544] usb 9-4: new low-speed USB device number 2 using ohci-pci
> [739229.635343][T25544] usb 9-4: config index 0 descriptor too short (expected 9, got 0)
> [739229.635348][T25544] usb 9-4: can't read configurations, error -22
> [739229.791290][T25544] usb 9-4: new low-speed USB device number 3 using ohci-pci
> [739229.982414][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [739229.982421][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [739229.982426][T25544] usb 9-4: Product: HID UPS Battery
> [739229.982430][T25544] usb 9-4: Manufacturer: POWERCOM Co.,LTD
> [739229.982433][T25544] usb 9-4: SerialNumber: 004-0D9F-000
> [739230.027616][T25544] hid-generic 0003:0D9F:0004.0004: hiddev1,hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:00:16.0-4/input0
> [739233.484723][T25544] usb 9-4: USB disconnect, device number 3
> [739236.257951][T25544] usb 9-4: new low-speed USB device number 4 using ohci-pci
> [739236.475434][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [739236.475442][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [739236.520783][T25544] hid-generic 0003:0D9F:0004.0005: hiddev1,hidraw2: USB HID v1.00 Device [HID 0d9f:0004] on usb-0000:00:16.0-4/input0
> [739239.933809][T25544] usb 9-4: USB disconnect, device number 4
> [739242.701322][T25544] usb 9-4: new low-speed USB device number 5 using ohci-pci
> [739242.880035][T25544] usb 9-4: device descriptor read/all, error -62
> [739243.034561][T25544] usb 9-4: new low-speed USB device number 6 using ohci-pci
> [739243.252040][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [739243.252042][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [739243.296444][T25544] hid-generic 0003:0D9F:0004.0006: hiddev1,hidraw2: USB HID v1.00 Device [HID 0d9f:0004] on usb-0000:00:16.0-4/input0
> [739246.720152][T25544] usb 9-4: USB disconnect, device number 6
> [739249.491330][T13473] usb 9-4: new low-speed USB device number 7 using ohci-pci
> [739249.718707][T13473] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
> [739249.718709][T13473] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
> [739249.718710][T13473] usb 9-4: Product: HID UPS Battery
> [739249.718711][T13473] usb 9-4: Manufacturer: POWERCOM Co.,LTD
> [739249.718712][T13473] usb 9-4: SerialNumber: 004-0D9F-000
> [739249.751173][T13473] hid-generic 0003:0D9F:0004.0007: unknown main item tag 0x0
> <snip class="spam-repeated-previous-message">
> [739250.162392][T13473] hid-generic 0003:0D9F:0004.0007: unknown main item tag 0x0
> [739250.162813][T13473] hid-generic 0003:0D9F:0004.0007: hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:00:16.0-4/input0
> [739253.165518][T13473] usb 9-4: USB disconnect, device number 7
> ...
> 
> 
> I'd appreciate any advice trying to get my UPS to stay connected and not
> spam the kernel log. The UPS is about 1 year old. It's working fine. I
> just want to use nut or apcupsd with it.
> 
> Thanks,
> David
