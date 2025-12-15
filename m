Return-Path: <linux-input+bounces-16577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C24CBDCD2
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 13:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 891DA3005AB8
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 12:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E13C2C11E5;
	Mon, 15 Dec 2025 12:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NppVhiOd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E964B1A9FAB;
	Mon, 15 Dec 2025 12:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801506; cv=none; b=atAFd5ZlbNcPNtLCQOwf3Ukq9t7fiR3VO0futjjYZccsaJPiHQm9lfmtEnHA3r5Jb6HVINXUoEhmFujmRA1X13/sLUEilwkYsYL/ZL7inSwo393fUgQXpV8Tj1t0Sf6Rj/nEXxeUvo7oVWDyfJ5HE1Tf+XCuSX15AWeme3DQQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801506; c=relaxed/simple;
	bh=54O/o+NXfIbUPOj9ZLP3re6xSen+WDvkoxoCgT1QRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PT693C0rDlFAhY51SSnDyB6e5eYHZrYm4LjON9WKa464wouK6KS+UkwT/c8Ej8eO1y/tY7uNgsp4cQAxRxa4Umpp3Ue3UxJO4eC3a/KV0auWdn9B7Bc2RDF0jmIz31ae9d2hcc9Md2eBtP7TtWNAH/crpTYcFYKJK/k54el7oVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NppVhiOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57778C4CEFB;
	Mon, 15 Dec 2025 12:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765801504;
	bh=54O/o+NXfIbUPOj9ZLP3re6xSen+WDvkoxoCgT1QRRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NppVhiOd6/HjkPxqVPG2pPoMhDtupDVeKkq3e2IIA27hAIfbqOiXPHSHAA6Kcy2Y7
	 tLUmJxMGu1Hu7s1pRSVu5Taa6v6z/lcYHswUs6q3KNV+3RVWxzBUxezwncNAGH0kI9
	 wV6O/SRq+Fju7adItmpwSRW3UjbQGVoZuRnX/IoFPbtJdKBzX3qUHmBcu3TuW9RREn
	 S8iUXz1U0+oMY1vo2sulj3KnVOzAZM3YIpBtkBW6FoUkDZcpq8dCK8q/0BCJ8bTRhn
	 kNuLsC5k5Y4SMTVFcZIGGdkAE9M5DueGtEZu96y5yU+kvkNPA9IL2vPsediosDTlC1
	 0KDe3KYlHFJqA==
Date: Mon, 15 Dec 2025 13:25:00 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Sam Halliday <sam.halliday@gmail.com>
Cc: Salvatore Bonaccorso <carnil@debian.org>, 1122193@bugs.debian.org, 
	Jiri Kosina <jikos@kernel.org>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: usb hid descriptor requirements are rejecting hardware (ZWO
 EFWmini, 03c3:1f01)
Message-ID: <hea3geox2cji2iye6ortlgxqlgtcnjv35imkko33vp2ksrywbi@cd3n32uwx73y>
References: <176520622961.2658.15817888352918425136.reportbug@Samwise>
 <aT7TPAInuBOXctEZ@eldamar.lan>
 <cpgdwmdhfl7tkqe2x263o2xeeclgvbal5onlkj7qcte73jhs5i@h2tdtzmiabcn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cpgdwmdhfl7tkqe2x263o2xeeclgvbal5onlkj7qcte73jhs5i@h2tdtzmiabcn>

On Dec 15, 2025, Sam Halliday wrote:
> Hi Ben,
> 
> In answer to your logging request, this is the output after running
> 
> echo 'file drivers/hid/usbhid/hid-core.c +p' | sudo tee /sys/kernel/debug/dynamic_debug/control
> 
> and plugging in the device (with the debian kernel, not my patched one)
> 
> [  371.897694] usb 1-2: new full-speed USB device number 8 using xhci_hcd
> [  372.036133] usb 1-2: New USB device found, idVendor=03c3, idProduct=1f01, bcdDevice= 0.00
> [  372.036145] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  372.036149] usb 1-2: Product: ZWO EFW
> [  372.036152] usb 1-2: Manufacturer: ZW0
> [  372.043375] drivers/hid/usbhid/hid-core.c: HID probe called for ifnum 0
> [  372.043404] drivers/hid/usbhid/hid-core.c: hid descriptor invalid, bLen=9 bNum=2

Looks like the length is shorter than expected. However, after looking
more carefully into the code, it seems we can bypass the check as long
as the provided length is greater than sizeof(*hdesc), because later in
the code we simply ignore any optional HID class descriptors.

Would you mind testing the following patch?:

---
From 07020d68764a29a9e5d4e95be1820e0c75a4216a Mon Sep 17 00:00:00 2001
From: Benjamin Tissoires <bentiss@kernel.org>
Date: Mon, 15 Dec 2025 12:57:21 +0100
Subject: [PATCH] HID: usbhid: paper over wrong bNumDescriptor field

Some faulty devices (ZWO EFWmini) have a wrong optional HID class
descriptor count compared to the provided length.

Given that we plainly ignore those optional descriptor, we can attempt
to fix the provided number so we do not lock out those devices.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
 drivers/hid/usbhid/hid-core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index aac0051a2cf6..758eb21430cd 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -985,6 +985,7 @@ static int usbhid_parse(struct hid_device *hid)
 	struct usb_device *dev = interface_to_usbdev (intf);
 	struct hid_descriptor *hdesc;
 	struct hid_class_descriptor *hcdesc;
+	__u8 fixed_opt_descriptors_size;
 	u32 quirks = 0;
 	unsigned int rsize = 0;
 	char *rdesc;
@@ -1015,7 +1016,21 @@ static int usbhid_parse(struct hid_device *hid)
 			      (hdesc->bNumDescriptors - 1) * sizeof(*hcdesc)) {
 		dbg_hid("hid descriptor invalid, bLen=%hhu bNum=%hhu\n",
 			hdesc->bLength, hdesc->bNumDescriptors);
-		return -EINVAL;
+
+		/*
+		 * Some devices may expose a wrong number of descriptors compared
+		 * to the provided length.
+		 * However, we ignore the optional hid class descriptors entirely
+		 * so we can safely recompute the proper field.
+		 */
+		if (hdesc->bLength >= sizeof(*hdesc)) {
+			fixed_opt_descriptors_size = hdesc->bLength - sizeof(*hdesc);
+
+			hid_warn(intf, "fixing wrong optional hid class descriptors count\n");
+			hdesc->bNumDescriptors = fixed_opt_descriptors_size / sizeof(*hcdesc) + 1;
+		} else {
+			return -EINVAL;
+		}
 	}
 
 	hid->version = le16_to_cpu(hdesc->bcdHID);
-- 
2.51.1

---

Cheers,
Benjamin

> [  372.043409] usbhid 1-2:1.0: can't add hid device: -22
> [  372.043422] usbhid 1-2:1.0: probe with driver usbhid failed with error -22
> 
> Also here is a more detailed lsusb output
> 
> 
> Bus 001 Device 008: ID 03c3:1f01 ZWO ZWO EFW
> Negotiated speed: Full Speed (12Mbps)
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               1.10
>   bDeviceClass            0 [unknown]
>   bDeviceSubClass         0 [unknown]
>   bDeviceProtocol         0
>   bMaxPacketSize0        16
>   idVendor           0x03c3 ZWO
>   idProduct          0x1f01 ZWO EFW
>   bcdDevice            0.00
>   iManufacturer           1 ZW0
>   iProduct                2 ZWO EFW
>   iSerial                 0
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0029
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower               64mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      0 [unknown]
>       bInterfaceProtocol      0
>       iInterface              0
>       Warning: Descriptor too short
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               1.01
>           bCountryCode            0 Not supported
>           bNumDescriptors         2
>           bDescriptorType        34 (null)
>           wDescriptorLength      68
>           bDescriptorType         0 (null)
>           wDescriptorLength       0
>           Report Descriptor: (length is 68)
>             Item(Global): Usage Page, data= [ 0x00 0xff ] 65280
>                             (null)
>             Item(Local ): (null), data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): (null), data= [ 0x01 ] 1
>                             Application
>             Item(Global): (null), data= [ 0x01 ] 1
>             Item(Global): (null), data= [ 0x0f ] 15
>             Item(Global): (null), data= [ 0x08 ] 8
>             Item(Global): (null), data= [ 0xff 0x00 ] 255
>             Item(Global): (null), data= [ 0x00 ] 0
>             Item(Local ): (null), data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): (null), data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): (null), data= [ 0x02 ] 2
>             Item(Global): (null), data= [ 0x0f ] 15
>             Item(Global): (null), data= [ 0x08 ] 8
>             Item(Global): (null), data= [ 0xff 0x00 ] 255
>             Item(Global): (null), data= [ 0x00 ] 0
>             Item(Local ): (null), data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): (null), data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): (null), data= [ 0x03 ] 3
>             Item(Global): (null), data= [ 0x0f ] 15
>             Item(Global): (null), data= [ 0x08 ] 8
>             Item(Global): (null), data= [ 0xff 0x00 ] 255
>             Item(Global): (null), data= [ 0x00 ] 0
>             Item(Local ): (null), data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): (null), data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): (null), data= [ 0x04 ] 4
>             Item(Global): (null), data= [ 0x0f ] 15
>             Item(Global): (null), data= [ 0x08 ] 8
>             Item(Global): (null), data= [ 0xff 0x00 ] 255
>             Item(Global): (null), data= [ 0x00 ] 0
>             Item(Local ): (null), data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): (null), data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Main  ): (null), data=none
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval              10
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x01  EP 1 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0010  1x 16 bytes
>         bInterval              10
> Device Status:     0x0000
>
>
>   (Bus Powered)> On Dec 15 2025, Benjamin Tissoires wrote:
> > On Dec 14 2025, Salvatore Bonaccorso wrote:
> > > Hi Sam,
> > > 
> > > Jiri, Benjamin, this is about a report originally done in Debian as
> > > https://bugs.debian.org/1122193 where Sam's device, a ZWO EFWmini with
> > > vendor and product id's as 03c3:1f01 is not working, usbhid not
> > > loaded.
> > > 
> > > On Mon, Dec 08, 2025 at 03:03:49PM +0000, Sam Halliday wrote:
> > > > Package: linux-image-amd64
> > > > Version: 6.12.57-1
> > > > Severity: normal
> > > > Tags: patch
> > > > X-Debbugs-Cc: debian-amd64@lists.debian.org
> > > > User: debian-amd64@lists.debian.org
> > > > Usertags: amd64
> > > > 
> > > > Dear Maintainer,
> > > > 
> > > > I propose a patch to workaround USB HID descriptor requirements that
> > > > are stopping users from being able to use astrophotography
> > > > equipment.
> > > > 
> > > > I have a usb device (an ZWO EFWmini, used for astronomy) which has
> > > > the following vendor information: 03c3:1f01 ZWO ZWO EFW
> > > > 
> > > > This device is known to offer a suboptimal descriptor, e.g. see the lsusb output
> > > > 
> > > >       Warning: Descriptor too short
> > > >         HID Device Descriptor:
> > > >           bLength                 9
> > > >           bDescriptorType        33
> > > >           bcdHID               1.01
> > > >           bCountryCode            0 Not supported
> > > >           bNumDescriptors         2
> > > >           bDescriptorType        34 (null)
> > > >           wDescriptorLength      68
> > > >           bDescriptorType         0 (null)
> > > >           wDescriptorLength       0
> > > >           Report Descriptors: 
> > > >             ** UNAVAILABLE **
> > > > 
> > > > My software (I write it, it is GPLv3, I'm the only user, but it isn't particularly relevant...) runs primarilly on a raspberry pi, which accepts this with kernel 6.12.25-1+rpt1, and I've also done some desktop development on archlinux (unknown kernel versions but up to at least 6 months ago). I only access the hardware for development from a debian desktop computer.
> > > > 
> > > > Since moving to Debian 13, my hardware no longer works, with dmesg showing the following error:
> > > > 
> > > > [   14.182522] usb 1-2.2: new full-speed USB device number 10 using xhci_hcd
> > > > [   14.276921] usb 1-2.2: New USB device found, idVendor=03c3, idProduct=1f01, bcdDevice= 0.00
> > > > [   14.276930] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > > > [   14.276933] usb 1-2.2: Product: ZWO EFW
> > > > [   14.276935] usb 1-2.2: Manufacturer: ZW0
> > > > [   14.282951] usbhid 1-2.2:1.0: can't add hid device: -22
> > > > [   14.282963] usbhid 1-2.2:1.0: probe with driver usbhid failed with error -22
> > > > 
> > > > I have tried going back as far as debian's kernel from bullseye (5.10), bookworm (6.1), trixie (6.12) and backports (6.17) but it's the same error every time.
> > > > 
> > > > Communicating with the ZWO (the device manufacturer) support team, they recommended patching the kernel, which I did, and it now works.
> > > > 
> > > > I applied the following patch and built my own kernel
> > > > 
> > > > ===========================================================================
> > > > --- drivers/hid/usbhid/hid-core.c.orig	2025-12-08 13:15:08.657917762 +0000
> > > > +++ drivers/hid/usbhid/hid-core.c	2025-12-08 13:16:24.293959487 +0000
> > > > @@ -1015,7 +1015,7 @@
> > > >  			      (hdesc->bNumDescriptors - 1) * sizeof(*hcdesc)) {
> > > >  		dbg_hid("hid descriptor invalid, bLen=%hhu bNum=%hhu\n",
> > > >  			hdesc->bLength, hdesc->bNumDescriptors);
> > > > -		return -EINVAL;
> > > > +		// return -EINVAL;
> > 
> > That looks like the wrong thing to do, especialy because the 2 previous
> > commits introducing that check are to protect against out of bound
> > errors:
> > See fe7f7ac8e0c7 ("HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()")
> > 
> > Can we get the debug output from the line above (or just add plain
> > printks in the running kernel)? I suspect we might losen the test with a
> > '<' instead of an '!='.
> > 
> > > >  	}
> > > >  
> > > >  	hid->version = le16_to_cpu(hdesc->bcdHID);
> > > > ===========================================================================
> > > > 
> > > > The new dmesg output is
> > > > 
> > > > [  366.477628] usbhid 1-2:1.0: 1 unsupported optional hid class descriptors
> > > > [  366.478327] hid-generic 0003:03C3:1F01.0006: hiddev1,hidraw4: USB HID v1.01 Device [ZW0 ZWO EFW] on usb-000
> > > > 
> > > > 
> > > > Apologies but I don't think I'm giving you a particularly good patch
> > > > because the author of this code clearly intended for a -EINVAL
> > > > failure. A kernel dev may prefer to create a hardware quirk (which
> > > > ideally should be enabled for 03c3:1f01 by default) to exit if the
> > > > descriptor isn't valid. I'm not a kernel developer so that's beyond
> > > > me.
> > > > 
> > > > The device works perfectly fine despite the descriptor not meeting
> > > > the kernel's current requirements. And I don't believe a firmware
> > > > upgrade is possible... it's just a little motor that turns a wheel
> > > > containing photographic filters.
> > > 
> > > I suspect your case can be a candidate for HID-BPF, cf.
> > > https://docs.kernel.org/hid/hid-bpf.html and you might try to fixup
> > > the required descriptors.
> > 
> > Unfortunatelly no. HID-BPF works for fixing HID protocol errors, but in
> > this case the device is not presented by the transport layer, so we can
> > not do anything there :(
> > 
> > > 
> > > But I'm not entirely sure. Jiri and Benjamin is that something we
> > > could have quirk for the device or the problem tackled in some other
> > > way?
> > 
> > Quirking seems the wrong approach. I would be curious to know the length
> > of the binary descriptor. I suspect there is some mismatch and the end
> > is filled with 0. If the length is shorter, that's going to be a bigger
> > problem to solve.
> > 
> > Cheers,
> > Benjamin
> > 
> > > 
> > > Regards,
> > > Salvatore

