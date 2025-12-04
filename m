Return-Path: <linux-input+bounces-16456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B451CA3196
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 10:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC5C330096BE
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 09:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0ED29ACD8;
	Thu,  4 Dec 2025 09:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mswliTw4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DFB283FD9;
	Thu,  4 Dec 2025 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764842016; cv=none; b=YB4tKQ6FUCHQt6s/Om446jDUjcNakqZYl7Q41lSuUKtdeBxmPl8bUmJ4X0khici/L70Jnlt/6HEAIWiMmH6Up0RiNukNBntyept0e3/YC/ecR12Tp/S4emTACGXtVIJD5tOHUbJtfw3Bu+JkpjRlw/eS6upH5NaYMOWO87b5XYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764842016; c=relaxed/simple;
	bh=Qj39zVVJMSd9vCtM8vJc+wwPN9/Ct18xlv3ihPE567M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=higvx1Xyvrn7OuOTbxD+3Eq0sB3GQqwjgEn3KQ3Yt3Vp3DQuthYMoBR2Z71At9/3iL5k5fdYG0I7WhV8IICU59njdAo+WGbxu1hRyPj1701wfH1n2aMHml8Race8pzXSSOMVCfhIsHSYw4i4BVoAd2ebq4YfcwaoPIK82KhEHXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mswliTw4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62167C4CEFB;
	Thu,  4 Dec 2025 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764842015;
	bh=Qj39zVVJMSd9vCtM8vJc+wwPN9/Ct18xlv3ihPE567M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mswliTw42nCgmsmlF/611P152+Fd7nXsYwUHBv3/YcOC2Vqr8VfQ0atPogBCkUd3k
	 C+sUrKJO8ww3+2Lb4piNjAVyL1+AiOu84n5G0QlAiUb16zwdkRo6Lx0J2vBzDPGDyC
	 UE03OcsDNkC8iAYRVLKXQpc+1CZZwvWUQjk2n2AnGMaZX8mQuKnQgVsolCSWD9a4On
	 frV0UCJO9UcwqllPm8WPt7VuOfTf6r00rdS9QfKyxZqPnmWLW0cP6DGdzf0IqZ1FfQ
	 w5HeRHaAim7o+LWFjtcSWuEjvakwRjWsHcusZyKz+fDCF7jtQb3R1ZyTwTWy22afuq
	 pAvzQHKJT4pbg==
Date: Thu, 4 Dec 2025 10:53:31 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Davide Beatrici <me@davidebeatrici.dev>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, jikos@kernel.org, 
	benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
Message-ID: <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
 <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>

On Dec 02 2025, Davide Beatrici wrote:
> > Can you supply the Device, Configuration, and Report Descriptors?
> 
> Sure.
> 
> Device Descriptor:
>   idVendor           0x373b Compx
>   idProduct          0x1107 ATK X1 SE Nearlink
>   bcdDevice          1.21
>   bcdUSB             2.00
>   bMaxPacketSize0    64
>   iManufacturer      1 Compx
>   iProduct           2 ATK X1 SE Nearlink
>   bNumConfigurations 1
> 
> Configuration Descriptor:
>   wTotalLength       0x0054
>   bNumInterfaces     3
>   bmAttributes       0xa0 (Bus Powered, Remote Wakeup)
>   MaxPower           494mA
> 
> Interface 0: HID Keyboard
>   HID Descriptor: wDescriptorLength 77
>   Endpoint IN 0x81, Interrupt, 64 bytes
> 
> Interface 1: HID (non‑boot)
>   HID Descriptor: wDescriptorLength 156
>   Endpoint IN 0x82, Interrupt, 64 bytes
> 
> Interface 2: HID Mouse
>   HID Descriptor: wDescriptorLength 87
>   Endpoint IN 0x83, Interrupt, 64 bytes
> 
> Report Descriptors:
> 
> Interface 2 (Mouse):
>   05 01 09 02 A1 01 09 01 A1 00 05 09 19 01 29 05
>   15 00 25 01 95 05 75 01 81 02 95 01 75 03 81 01
>   05 01 09 30 09 31 16 00 80 26 FF 7F 75 10 95 02
>   81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75 08 95
>   01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75 08 15
>   81 25 7F 81 06 C0 C0
> 
> Interface 1 (HID composite):
>   05 0C 09 01 A1 01 85 05 15 00 26 14 05 19 00 2A
>   14 05 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
>   03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
>   01 75 05 81 01 C0 05 01 09 06 A1 01 85 04 05 07
>   15 00 25 01 19 00 29 9F 95 A0 75 01 81 02 C0 06
>   02 FF 09 02 A1 01 85 13 15 00 26 FF 00 75 08 95
>   13 09 02 81 00 09 02 91 00 C0 06 02 FF 09 02 A1
>   01 85 08 15 00 26 FF 00 75 08 95 10 09 02 81 00
>   09 02 91 00 C0 06 04 FF 09 02 A1 01 85 06 09 02
>   15 00 26 FF 00 75 08 95 07 B1 02 C0
> 
> Interface 0 (Keyboard):
>   05 01 09 06 A1 01 05 08 19 01 29 03 15 00 25 01
>   75 01 95 03 91 02 95 05 91 01 05 07 19 E0 29 E7
>   15 00 25 01 75 01 95 08 81 02 75 08 95 01 81 01
>   05 07 19 00 2A FF 00 15 00 26 FF 00 75 08 95 05
>   81 00 05 FF 09 03 75 08 95 01 81 02 C0

Thanks for the logs.

So after analysing the wireshark capture and these, the problem is that
the device sends a USB report of length 1 on the keyboard interface when
we should actually get one of size 8.

However, the device also shows an output report of size 1, but it is not
supposed to send it as an input report. I wonder if the firmware bug is
not that it tries to give the host the current state of its output
report at plug (which is wrong but Windows must be papering over it).

Anyway couple of observations:
- the URB is of size 1, so the fact that the constant field is not 0
	means that we are just reading random memory at offset 1 in the
	provided data, so you might have a chance that it eventually becomes 0

- the fix should be focusing on the length of the provided report, not
	on the content. However, in hid_report_raw_event(), just before you
	inserted your call to your hid_validate_report(), there is already a
	check on the length of the report which memsets to 0 the rest of the
	buffer. This seems a little bit optimistic if the provided buffer from
	USB is exactly the size of the provided "size" argument.
	But then, why would you get random data in the const fields if there
	is a memset if the provided length is "1"?

So, can you add a printk before your call to hid_validate_report() to
show the provided "size" argument (csize), or just enable the hid_dbg()
trace output which should tell us if we enter that test and do the
memset (which I suppose we are not).

Cheers,
Benjamin

