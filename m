Return-Path: <linux-input+bounces-6994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A348A98CF13
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55541C21B3A
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 08:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF679196C67;
	Wed,  2 Oct 2024 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARNjMQCZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF911195FE5;
	Wed,  2 Oct 2024 08:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727858544; cv=none; b=Sy8vHWiS990ov8W/4MNnxh2/kEuY258LA9un+MXUcuQIF4OuibFuGPfEYP0f30wtEYVDvv30vDQGP3fNb0Tk9NFGZcerfHeBnB6qWQ1XiX0FE0DUKBxr4KX1xZWxcnnF+NNZm/702kYXRNeLafrFoh8CmIGGZK5BauhFHC0C/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727858544; c=relaxed/simple;
	bh=3ueS52L8QZS2DfLyIS2b9kZP/6k4L0nHiCRuImoSG1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0vDo83KPzJ/ayp0NbnTR+RKUVVnPlKXEmyWVJVpzgSpYoOch6tbTAD5K9cFp6aLOBGUqelb/vdJi0Crd/YkyKJ6gTetkl6HvECyFFVehh5Z7PKp4ZN6qcP1XIBX3BzjiYa3rTtmOBwSf/8Xag40bW5nZL5+BaUaNiHTXZk+dg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARNjMQCZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1755C4CEC5;
	Wed,  2 Oct 2024 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727858544;
	bh=3ueS52L8QZS2DfLyIS2b9kZP/6k4L0nHiCRuImoSG1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ARNjMQCZBDs2S3m8ixpLZcLtNd4JwPeiEFMTnnouZ0Kmfkq6Lk0MBwaindxIq0YBu
	 6kt9KuRmEfwEGdzGesI5EF+hTxO5bKbuNEJSgs5mklZlx0vwcpWBzOmDEtWXIOPorm
	 IR6/0arBVeurFdxFJx7RBlnZe+zGA8Z0hy+ZnDvOb0MVFW6XL5PLUj+BJaiUTwLD+H
	 mQvzskc2lfGL5DoR5g680Q5n5CfBcjEbpYvMZHMQGBDELzPDWZ83x7PC58h5kFTBba
	 62aRUeaLr/ow4OGsmLVLyi8vwGMc0s1LouVAJ+izsjNz2dgfx4ntvJzz1Vms0KmnWm
	 D6S95a3rVyyMg==
Date: Wed, 2 Oct 2024 10:42:18 +0200
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
Message-ID: <swb45gt3vvctsmwgevo3ay6vkwoksasc64poj3tnaxsapxlsbg@kkmactexmclj>
References: <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <c4e0beb6-acd1-45fa-ad47-f5cf9df89b11@gmx.de>
 <74f8bd23-d85a-4f12-b8db-ebde59f3abe3@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74f8bd23-d85a-4f12-b8db-ebde59f3abe3@tuxedocomputers.com>

On Oct 01 2024, Werner Sembach wrote:
> Hi Armin,
> 
> Am 01.10.24 um 18:45 schrieb Armin Wolf:
[...snipped...]
> > Why not having a simple led driver for HID LampArray devices which exposes the
> > whole LampArray as a single LED?
> Yes that is my plan, but see my last reply to Benjamin, it might not be
> trivial as different leds in the same LampArray might have different max
> values for red, green, blue, and intensity. And the LampArray spec even
> allows to mix RGB and non-RGB leds.
> > 
> > If userspace wants to have direct control over the underlying LampArray device,
> > it just needs to unbind the default driver (maybe udev can be useful here?).
> There was something in the last discussion why this might not work, but i
> can't put my finger on it.

We recently have the exact same problem, so it's still fresh in my
memory. And here are what is happening:
- you can unbind the driver with a sysfs command for sure
- but then the device is not attached to a driver so HID core doesn't
  expose the hidraw node
- you'd think "we can just rebind it to hid-generic", but that doesn't
  work because hid-generic sees that there is already a loaded driver
  that can handle the device and it'll reject itself because it gives
  priority over the other driver
- what works is that you might be able to unload the other driver, but
  if it's already used by something else (like hid-multitouch), you
  don't want to do that. And also if you unload that driver, whenever
  the driver gets re-inserted, hid-generic will unbind itself, so back
  to square one

So unless we find a way to forward the "manual" binding to hid-generic,
and/or we can also quirk the device with
HID_QUIRK_IGNORE_SPECIAL_DRIVER[0] just unbinding the device doesn't
work.

Cheers,
Benjamin

PS: brain fart:
if HID LampArray support (whatever the implementation, through Pavel's
new API or simple LED emulation) is in hid-input, we can also simply add
a new HID quirk to enable this or not, and use that quirk dynamically
(yes, with BPF :-P ) to rebind the device...

[0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t

