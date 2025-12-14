Return-Path: <linux-input+bounces-16564-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F1CBBC3D
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 16:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04269300A711
	for <lists+linux-input@lfdr.de>; Sun, 14 Dec 2025 15:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7819C238C1B;
	Sun, 14 Dec 2025 15:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="PxVbtPzy"
X-Original-To: linux-input@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF03B8D7D;
	Sun, 14 Dec 2025 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765724995; cv=none; b=HhYMxEJUlnIehbU6d9KmL8loLU5XVXt+ONNgEWeFosDRLE/Ite856a+gQt5f0u38COB8SHZg8T88nGeUVjim9y/h2utwvCn4UY2AC8zku3da9Po91OhYB+8yIdFGxV16rWoctVwNub7tR/5WMH+BMDAp0y/b9LLE9amNmnTxtIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765724995; c=relaxed/simple;
	bh=7oeA8hAZfE+OuLV++8wZ+w2h0OVtO5IPbc17sDI9JjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SfbjSYaypVYKPAQDr12nY4QV2t4Z6jTS56SEflz84sJlNfjMv9js+O3cCbOj1kQPV47kNcIm9bYxPrAYcbLaBIibqT6eXtK9eQIYO+QEG621crFi6ODJllSaBLl+TdqSk1zfewzCtGA7/6eyEVceFwOTVqkjErQWiTWcsvgoghE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=PxVbtPzy; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0JiRvR1x3x+Bzzb86M9yv4aMLpalBB1ekM0TQwCAoWQ=; b=PxVbtPzyIfFJlaJW5foctIXtAQ
	F6487yj01zYIfclv+GqA9fn8oUF+CMtEcyThKd3apZ/M9DY+DGnwGFvTa13mJC7aEhmz74/nL2M+5
	/2IlWyIOpQL3cfzKepIVVHz754hB2pHtfXCcpeQ8jnjxadaWpoQI2qCaU4tcJ6mDVnIu24Gr9HcFy
	ime3c91/vbncUN8WIurTstJB4FWH8ARqcPPrLr3TpWoFQ1hoe6+5fyd5W8rzU6sfagjVis3Tr9nle
	xQedFBoskWEamkkT/lFy9rxlBbzlWQigaoGbutrfqDQzAvcZA7JYHL8vs+9FkHFjgmuceGpUP/rlq
	kvTPVXNg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1vUnjJ-00BGub-Jc; Sun, 14 Dec 2025 15:09:49 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id C0800BE2EE7; Sun, 14 Dec 2025 16:09:48 +0100 (CET)
Date: Sun, 14 Dec 2025 16:09:48 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Sam Halliday <sam.halliday@gmail.com>, 1122193@bugs.debian.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: usb hid descriptor requirements are rejecting hardware (ZWO EFWmini,
 03c3:1f01)
Message-ID: <aT7TPAInuBOXctEZ@eldamar.lan>
References: <176520622961.2658.15817888352918425136.reportbug@Samwise>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176520622961.2658.15817888352918425136.reportbug@Samwise>
X-Debian-User: carnil

Hi Sam,

Jiri, Benjamin, this is about a report originally done in Debian as
https://bugs.debian.org/1122193 where Sam's device, a ZWO EFWmini with
vendor and product id's as 03c3:1f01 is not working, usbhid not
loaded.

On Mon, Dec 08, 2025 at 03:03:49PM +0000, Sam Halliday wrote:
> Package: linux-image-amd64
> Version: 6.12.57-1
> Severity: normal
> Tags: patch
> X-Debbugs-Cc: debian-amd64@lists.debian.org
> User: debian-amd64@lists.debian.org
> Usertags: amd64
> 
> Dear Maintainer,
> 
> I propose a patch to workaround USB HID descriptor requirements that
> are stopping users from being able to use astrophotography
> equipment.
> 
> I have a usb device (an ZWO EFWmini, used for astronomy) which has
> the following vendor information: 03c3:1f01 ZWO ZWO EFW
> 
> This device is known to offer a suboptimal descriptor, e.g. see the lsusb output
> 
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
>           Report Descriptors: 
>             ** UNAVAILABLE **
> 
> My software (I write it, it is GPLv3, I'm the only user, but it isn't particularly relevant...) runs primarilly on a raspberry pi, which accepts this with kernel 6.12.25-1+rpt1, and I've also done some desktop development on archlinux (unknown kernel versions but up to at least 6 months ago). I only access the hardware for development from a debian desktop computer.
> 
> Since moving to Debian 13, my hardware no longer works, with dmesg showing the following error:
> 
> [   14.182522] usb 1-2.2: new full-speed USB device number 10 using xhci_hcd
> [   14.276921] usb 1-2.2: New USB device found, idVendor=03c3, idProduct=1f01, bcdDevice= 0.00
> [   14.276930] usb 1-2.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   14.276933] usb 1-2.2: Product: ZWO EFW
> [   14.276935] usb 1-2.2: Manufacturer: ZW0
> [   14.282951] usbhid 1-2.2:1.0: can't add hid device: -22
> [   14.282963] usbhid 1-2.2:1.0: probe with driver usbhid failed with error -22
> 
> I have tried going back as far as debian's kernel from bullseye (5.10), bookworm (6.1), trixie (6.12) and backports (6.17) but it's the same error every time.
> 
> Communicating with the ZWO (the device manufacturer) support team, they recommended patching the kernel, which I did, and it now works.
> 
> I applied the following patch and built my own kernel
> 
> ===========================================================================
> --- drivers/hid/usbhid/hid-core.c.orig	2025-12-08 13:15:08.657917762 +0000
> +++ drivers/hid/usbhid/hid-core.c	2025-12-08 13:16:24.293959487 +0000
> @@ -1015,7 +1015,7 @@
>  			      (hdesc->bNumDescriptors - 1) * sizeof(*hcdesc)) {
>  		dbg_hid("hid descriptor invalid, bLen=%hhu bNum=%hhu\n",
>  			hdesc->bLength, hdesc->bNumDescriptors);
> -		return -EINVAL;
> +		// return -EINVAL;
>  	}
>  
>  	hid->version = le16_to_cpu(hdesc->bcdHID);
> ===========================================================================
> 
> The new dmesg output is
> 
> [  366.477628] usbhid 1-2:1.0: 1 unsupported optional hid class descriptors
> [  366.478327] hid-generic 0003:03C3:1F01.0006: hiddev1,hidraw4: USB HID v1.01 Device [ZW0 ZWO EFW] on usb-000
> 
> 
> Apologies but I don't think I'm giving you a particularly good patch
> because the author of this code clearly intended for a -EINVAL
> failure. A kernel dev may prefer to create a hardware quirk (which
> ideally should be enabled for 03c3:1f01 by default) to exit if the
> descriptor isn't valid. I'm not a kernel developer so that's beyond
> me.
> 
> The device works perfectly fine despite the descriptor not meeting
> the kernel's current requirements. And I don't believe a firmware
> upgrade is possible... it's just a little motor that turns a wheel
> containing photographic filters.

I suspect your case can be a candidate for HID-BPF, cf.
https://docs.kernel.org/hid/hid-bpf.html and you might try to fixup
the required descriptors.

But I'm not entirely sure. Jiri and Benjamin is that something we
could have quirk for the device or the problem tackled in some other
way?

Regards,
Salvatore

