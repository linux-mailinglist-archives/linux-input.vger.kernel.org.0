Return-Path: <linux-input+bounces-15339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAFCBC80BB
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 10:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 39C064E41F8
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 08:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050B62C0266;
	Thu,  9 Oct 2025 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oznxPWpA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0852737F3;
	Thu,  9 Oct 2025 08:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998563; cv=none; b=RhzoVp/ER+MAihVsBD54eZBG3nReGbn1NxRiNuN49mo7z8I+uxrQCAZ9Y2tWc6u2bXCwasIxo6XejXAl88N7V3fXtzkwaQkeYNB0Q4hYeQ2WZeBtWc+tq5ebmEkIwi/mGN4hVW+612exBEDEsz2asXszKGfj6y3AwMWFMqLvWAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998563; c=relaxed/simple;
	bh=dfbS6gclSay+GmZJEufMCj7CjXaUpPV+sEDoyM5WKWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hHwL37f/nZ5KrzpWv/tOvDQC+mRcYmLce4ZFkAXb93OnFviJzY1guaW1SWlENo3x4LmS//PCCKneNLrlGMZCjB5keOoLPZR+D9bMFkvstk86m4b1piC8ER7hFj04qOptXS1rDWMkHUS1U/fFRC5LAkSOLxsApI6MDLAI+/k54Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oznxPWpA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4697FC4CEE7;
	Thu,  9 Oct 2025 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759998563;
	bh=dfbS6gclSay+GmZJEufMCj7CjXaUpPV+sEDoyM5WKWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oznxPWpA8GfoeEWdHdsS71368aC0Ii/dOq/X1NUa3jbvIuJqM2wnpZiEhoQD6e8br
	 Nsk2MaakEqGTj5smMVvAmSqxM/HQ8rq2VCoyOh6ubsSpuN7wC1rNrvayGzRChsGcc2
	 dPLhtF/Wy/TmHkzVGXwQuLkAvoIIl1Lot3fTq5WEH4Wa8yKAVCg1BevEKT/x2CFnEU
	 LqLSbqTO5RUXObECN+1YbqQ8B3lTXdUlxlo9BinqG/M1xa3LSA4+De2RMg321J5WMe
	 IkRXZpA40z4bQnjKdzooh673TUD2B5ZAE1wgStg4kVWYP/1AtQJujPxOMCPmuZhsfX
	 xkEzd6bNvT31w==
Date: Thu, 9 Oct 2025 10:29:19 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Lauri Tirkkonen <lauri@hacktheplanet.fi>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: patch Lenovo Yoga Slim 7x Keyboard rdesc
Message-ID: <56l5tnplzap4mcqcridsavbtvbevhqd235m4m3h4ititj3j5p2@z6oy6wimoodv>
References: <aOdLxAEYQpV2zp77@mail.hacktheplanet.fi>
 <lxtbtu5frygbw7qzfaelc63vgientm7d6oo7dt6jeassl3ttbh@f22h223wehbm>
 <aOdsqHznz1SJdadC@mail.hacktheplanet.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOdsqHznz1SJdadC@mail.hacktheplanet.fi>

On Oct 09 2025, Lauri Tirkkonen wrote:
> Hi Benjamin,
> 
> On Thu, Oct 09 2025 09:38:50 +0200, Benjamin Tissoires wrote:
> > > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > > index 63f46a2e5788..d78bd97ec24e 100644
> > > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > 
> > Why patching i2c-hid-core when this is clearly a logical bug, not a
> > transport (I2C) bug?
> > 
> > I would rather see this fixup in hid-lenovo.c along with the other
> > lenovo fixes.
> 
> I'm not exactly familiar with HID; please bear with me :) If
> i2c-hid-core is not the correct place for this kind of thing, I can move
> it, but I'm going to need some guidance on where the correct place is.
> 
> This device uses hid-over-i2c, not hid-lenovo; I've got
> CONFIG_HID_LENOVO=m but the module is not even loaded. I don't see how
> putting the fixup in a module that does not attach to the device could
> work. So where should it go?

Well, the transport layer is i2c-hid, but the logical implementation is
in hid-generic which leverages the hid core default implementation.

In your case, you need to tell hid-lenovo to handle the device so we
stick to nice and tidy approach with each HID driver handling it's own
business.

Adding a line like the following will bind the keyboard part of the
device to hid-lenovo in lenovo_devices[]:
	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_YOGA_SLIM_7X) },

If you don't use hid-multitouch on the same device you need a
HID_I2C_DEVICE() macro instead.

Once this is in, hid-lenovo.ko will bind to the device, and then we can
start fixing the report descriptor.

> 
> 	[  796.926931] input: hid-over-i2c 048D:8987 Keyboard as /devices/platform/soc@0/bc0000.geniqup/b80000.i2c/i2c-1/1-003a/0018:048D:8987.000F/input/input36
> 
> As a side note: apparently there is at least one other device in
> existence with a similar error in the report descriptor, which works
> fine on Windows:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=652f3d00de523a17b0cebe7b90debccf13aa8c31

Well, Windows is known for horrible hacks in their own generic layer,
but trying to mimmic them is sometimes harder than it looks :(
Especially because we also handle non Windows devices, and we might
break them while mimmicing Windows while our HID implementation is
currently rather "clean".

Cheers,
Benjamin

> 
> -- 
> Lauri Tirkkonen | lotheac @ IRCnet

