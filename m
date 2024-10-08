Return-Path: <linux-input+bounces-7145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 273869944D3
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 11:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1DDD1F23A26
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ED01925B5;
	Tue,  8 Oct 2024 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V/7E+AEW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BB6192586;
	Tue,  8 Oct 2024 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728381211; cv=none; b=m2zTR61hSjXjOaMgserS1+hLgnFptgdqD2709tFBcue5R1I9Ej8qbVpKOtMcMTEIDwqhJUmhRKjeUYGE6x6ccjakhP7iq1RoC3AbUrCmEOb9cx1SRTzg82dKMdOrpPpFHS5+qO7RzTdlHcy1Yw2YaGACrBStIh6LVqEoq7dR28s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728381211; c=relaxed/simple;
	bh=JJtL5Mw/7nDn6HqIaVX4x8W8fHB6YR/0KOlubvwYLmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV+yDSR3BL3nMnNlT71srZVvTgef/jPa+9ApZeECYM8B37kLx9l78JbHSrcWxH9+N3X9mTyD3nUsii1MjiCaOlXCTdntqtYxUj6Mzpe57dlwHLmovjWPdh5TWwKLU/TQQ+wS/E7JmVU3vSvkJOSJhYBaKiUmNx1/g+SGtSV3kKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V/7E+AEW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 321D1C4CEC7;
	Tue,  8 Oct 2024 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728381211;
	bh=JJtL5Mw/7nDn6HqIaVX4x8W8fHB6YR/0KOlubvwYLmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/7E+AEWCJDNVBWLnebhqgwBrjq1bcPzaXH3829mwO5AMrSQokMqeqBL1gV+LUf9L
	 /dye9HZMHD6nDtBlTqVqjJgPCgkNeIj6XDqHgKcmr5bcrvxVqQY53TaEtuXW1D5MZ1
	 mAosOLevrBOfx4b1wzQN9LixtxYh8HuS+wsH/uoo2o4EeoJQr0WW1LWRYotFQ9x1kV
	 YB/CRupoR6VzCosi8Q+ZlP10vROm1OILsMDGdWNQvlVrCBXIy/r/JlyGezYM8w7swW
	 20Qpd6wAS3OqxVZlVJ5C+HWg6oM707QuGgLrTd9sjDyXwKvNbBOGo3JViCdlNoUQ9c
	 fKe9rGe6UIAcA==
Date: Tue, 8 Oct 2024 11:53:25 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, lee@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
References: <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>

On Oct 07 2024, Werner Sembach wrote:
> Hi,
> 
> Am 02.10.24 um 10:31 schrieb Benjamin Tissoires:
> > On Oct 01 2024, Werner Sembach wrote:
> > > Hi Benjamin,
> > > 
> > > Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
> > > > [...]
> > > > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> > > > all of the requirements here:
> > > > - need to be dynamic
> > > > - still unsure of the userspace implementation, meaning that userspace
> > > >     might do something wrong, which might require kernel changes
> > > Well the reference implementetion for the arduiono macropad from microsoft
> > > ignores the intensity (brightness) channel on rgb leds contrary to the HID
> > > spec, soo yeah you have a point here ...
> > Heh :)
> > 
> > > > - possibility to extend later the kernel API
> > > > - lots of fun :)
> > > You advertise it good ;). More work for me now but maybe less work for me
> > > later, I will look into it.
> > Again, I'm pushing this because I see the benefits and because I can
> > probably reuse the same code on my Corsair and Logitech keyboards. But
> > also, keep in mind that it's not mandatory because you can actually
> > attach the BPF code on top of your existing driver to change the way it
> > behaves. It'll be slightly more complex if you don't let a couple of
> > vendor passthrough reports that we can use to directly talk to the
> > device without any tampering, but that's doable. But if you want to keep
> > the current implementation and have a different layout, this can easily
> > be done in BPF on top.
> > 
> > Cheers,
> > Benjamin
> > 
> > 
> > [0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t
> 
> Thinking about the minimal WMI to HID today, but found a problem: a HID
> feature report is either strictly input or output afaik, but the WMI
> interface has both in some functions.

Not sure you are talking about feature reports, because they are
read/write. It's just that they are synchronous over the USB control
endpoint (on USB).

An input report is strictly directed from the device, and an output
report is from the host to the device.

But a feature report is bidirectional.

> 
> How would I map that?

Depending on the WMI interface, if you want this to be synchronous,
defining a Feature report is correct, otherwise (if you don't need
feedback from WMI), you can declare the commands to WMI as Output
reports.

> 
> If I split everything in input and output the new interface wouldn't
> actually be much smaller.

The HID report descriptor doesn't need to be smaller. The fact that by
default it exposes only one or two LEDs so we don't have the micrometers
arrays is the only purpose.

But if we also implement a not-full HID implementation of LampArray, we
should be able to strip out the parts that we don't care in the LED
class implementation, like the exact positioning, or the multiupdate.

> 
> Also what would I write for the usage for the reserved padding in the report
> descriptor. Usage: 0x00?

padding are ignored by HID. So whatever current usage you have is fine.

However, if you are talking about the custom WMI vendor access, I'd go
with a vendor collection (usage page 0xff00, usage 0x08 for the 8 bytes
long WMI command for instance, 0x10 for the 16 bytes long one).

Side note: in drivers/hid/bpf/progs/hid_report_helpers.h we have some
autogenerated macros to help writing report descriptors (see
drivers/hid/bpf/progs/Huion__Dial-2.bpf.c for an example of usage). It's
in the hid-bpf tree but I think we might be able to include this in
other drivers (or do a minimal rewrite/move into include).
I'm not asking you to use it on your code right now, but this has the
advantage of becoming less "binary blob" in your code, and prevent
mistakes where you edit the comments but not the values.

Cheers,
Benjamin

