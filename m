Return-Path: <linux-input+bounces-16574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC59CBD526
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 11:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A98D3017F06
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 10:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C0832C333;
	Mon, 15 Dec 2025 10:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz540RxS"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018CD314A80;
	Mon, 15 Dec 2025 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765793516; cv=none; b=tbBqLIt2vGeoDIGeXTEoJGwaoAk1PNsIquHFPNmjCBCefotWLjzwmVqTqISpi6lz1FAAzrJ35zFDsziHEE7HTHDVdCsmqW26c7hBlhOdA4YfOEHr+yWxtnkDBjjK6+8Gda/2h0SujwqD4cmtNVNvWncqD0UdFPqXuk1HhnhSkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765793516; c=relaxed/simple;
	bh=HSu6Sf5u3pHHYKurzBwkbEf/+hWGsNFYcpTqiUbY/S4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HTaoCykyAPuUPE6NzLGRTXz9aPqkJvZdEIhEQUNk6KBou68OBdutcjwqd4KypGhJzxjvOrLJ2Tg0YMQMFZ/zV3qTspZLyr/qXMDlwfxGa8SUP7RblIgElof2Vd+CXKIimeC7e7yZMx/yc1jN3/KX+XJeJzOTpOaCnPO3ZnsSVbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz540RxS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C25AC4CEFB;
	Mon, 15 Dec 2025 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765793515;
	bh=HSu6Sf5u3pHHYKurzBwkbEf/+hWGsNFYcpTqiUbY/S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz540RxSBx6pFp2cmUXnuSmXHnvQbuRuhvLlPL+DvRAHKqd8zK+h+MQbQjBED+yTn
	 Tne9G4FU1WvX0TjP6kyczX5UPrho8my60Ie7o68xblB3fwaSIbfWwKHqzHlroIviGY
	 EOvQqtXCUE7kKcIpP8J1aWz5SQNThtwTA081CdLoSSbp2+a1JknwiW+12aN9xOXW61
	 KTtIfZMLHAvBynSrLIRN8iaQ8ZZbf9e8Qcu9q/JZDjE1EsVZa1Lhbg3oroG65ckatn
	 tQ7cJCfdRxSwavu5xj7AJ65JLfHyQP0ADhAY3KkBZFAzrZ05J0sSAsWaZG0cy9AluA
	 zPq4LHPqWqNEw==
Date: Mon, 15 Dec 2025 11:11:51 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Sam Halliday <sam.halliday@gmail.com>, 1122193@bugs.debian.org, 
	Jiri Kosina <jikos@kernel.org>, linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: usb hid descriptor requirements are rejecting hardware (ZWO
 EFWmini, 03c3:1f01)
Message-ID: <cpgdwmdhfl7tkqe2x263o2xeeclgvbal5onlkj7qcte73jhs5i@h2tdtzmiabcn>
References: <176520622961.2658.15817888352918425136.reportbug@Samwise>
 <aT7TPAInuBOXctEZ@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aT7TPAInuBOXctEZ@eldamar.lan>

On Dec 14 2025, Salvatore Bonaccorso wrote:
> Hi Sam,
> 
> Jiri, Benjamin, this is about a report originally done in Debian as
> https://bugs.debian.org/1122193 where Sam's device, a ZWO EFWmini with
> vendor and product id's as 03c3:1f01 is not working, usbhid not
> loaded.
> 
> On Mon, Dec 08, 2025 at 03:03:49PM +0000, Sam Halliday wrote:
> > Package: linux-image-amd64
> > Version: 6.12.57-1
> > Severity: normal
> > Tags: patch
> > X-Debbugs-Cc: debian-amd64@lists.debian.org
> > User: debian-amd64@lists.debian.org
> > Usertags: amd64
> > 
> > Dear Maintainer,
> > 
> > I propose a patch to workaround USB HID descriptor requirements that
> > are stopping users from being able to use astrophotography
> > equipment.
> > 
> > I have a usb device (an ZWO EFWmini, used for astronomy) which has
> > the following vendor information: 03c3:1f01 ZWO ZWO EFW
> > 
> > This device is known to offer a suboptimal descriptor, e.g. see the lsusb output
> > 
> >       Warning: Descriptor too short
> >         HID Device Descriptor:
> >           bLength                 9
> >           bDescriptorType        33
> >           bcdHID               1.01
> >           bCountryCode            0 Not supported
> >           bNumDescriptors         2
> >           bDescriptorType        34 (null)
> >           wDescriptorLength      68
> >           bDescriptorType         0 (null)
> >           wDescriptorLength       0
> >           Report Descriptors: 
> >             ** UNAVAILABLE **
> > 
> > My software (I write it, it is GPLv3, I'm the only user, but it isn't particularly relevant...) runs primarilly on a raspberry pi, which accepts this with kernel 6.12.25-1+rpt1, and I've also done some desktop development on archlinux (unknown kernel versions but up to at least 6 months ago). I only access the hardware for development from a debian desktop computer.
> > 
> > Since moving to Debian 13, my hardware no longer works, with dmesg showing the following error:
> > 
> > [   14.182522] usb 1-2.2: new full-speed USB device number 10 using xhci_hcd
> > [   14.276921] usb 1-2.2: New USB device found, idVendor=03c3, idProduct=1f01, bcdDevice= 0.00
> > [   14.276930] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > [   14.276933] usb 1-2.2: Product: ZWO EFW
> > [   14.276935] usb 1-2.2: Manufacturer: ZW0
> > [   14.282951] usbhid 1-2.2:1.0: can't add hid device: -22
> > [   14.282963] usbhid 1-2.2:1.0: probe with driver usbhid failed with error -22
> > 
> > I have tried going back as far as debian's kernel from bullseye (5.10), bookworm (6.1), trixie (6.12) and backports (6.17) but it's the same error every time.
> > 
> > Communicating with the ZWO (the device manufacturer) support team, they recommended patching the kernel, which I did, and it now works.
> > 
> > I applied the following patch and built my own kernel
> > 
> > ===========================================================================
> > --- drivers/hid/usbhid/hid-core.c.orig	2025-12-08 13:15:08.657917762 +0000
> > +++ drivers/hid/usbhid/hid-core.c	2025-12-08 13:16:24.293959487 +0000
> > @@ -1015,7 +1015,7 @@
> >  			      (hdesc->bNumDescriptors - 1) * sizeof(*hcdesc)) {
> >  		dbg_hid("hid descriptor invalid, bLen=%hhu bNum=%hhu\n",
> >  			hdesc->bLength, hdesc->bNumDescriptors);
> > -		return -EINVAL;
> > +		// return -EINVAL;

That looks like the wrong thing to do, especialy because the 2 previous
commits introducing that check are to protect against out of bound
errors:
See fe7f7ac8e0c7 ("HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()")

Can we get the debug output from the line above (or just add plain
printks in the running kernel)? I suspect we might losen the test with a
'<' instead of an '!='.

> >  	}
> >  
> >  	hid->version = le16_to_cpu(hdesc->bcdHID);
> > ===========================================================================
> > 
> > The new dmesg output is
> > 
> > [  366.477628] usbhid 1-2:1.0: 1 unsupported optional hid class descriptors
> > [  366.478327] hid-generic 0003:03C3:1F01.0006: hiddev1,hidraw4: USB HID v1.01 Device [ZW0 ZWO EFW] on usb-000
> > 
> > 
> > Apologies but I don't think I'm giving you a particularly good patch
> > because the author of this code clearly intended for a -EINVAL
> > failure. A kernel dev may prefer to create a hardware quirk (which
> > ideally should be enabled for 03c3:1f01 by default) to exit if the
> > descriptor isn't valid. I'm not a kernel developer so that's beyond
> > me.
> > 
> > The device works perfectly fine despite the descriptor not meeting
> > the kernel's current requirements. And I don't believe a firmware
> > upgrade is possible... it's just a little motor that turns a wheel
> > containing photographic filters.
> 
> I suspect your case can be a candidate for HID-BPF, cf.
> https://docs.kernel.org/hid/hid-bpf.html and you might try to fixup
> the required descriptors.

Unfortunatelly no. HID-BPF works for fixing HID protocol errors, but in
this case the device is not presented by the transport layer, so we can
not do anything there :(

> 
> But I'm not entirely sure. Jiri and Benjamin is that something we
> could have quirk for the device or the problem tackled in some other
> way?

Quirking seems the wrong approach. I would be curious to know the length
of the binary descriptor. I suspect there is some mismatch and the end
is filled with 0. If the length is shorter, that's going to be a bigger
problem to solve.

Cheers,
Benjamin

> 
> Regards,
> Salvatore

