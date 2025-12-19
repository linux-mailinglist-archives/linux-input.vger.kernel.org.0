Return-Path: <linux-input+bounces-16642-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B07FCCFFAC
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11D833007606
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1B91C84DC;
	Fri, 19 Dec 2025 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbG/8OTL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B8E13A3ED;
	Fri, 19 Dec 2025 13:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149822; cv=none; b=pWND449KJMoaT6u9oWzWYuP6BkLbUSeEKgwqg1j90zmsslxzHS1LwqHURLhK1O5dZ6mSuaMpc5P9U2v1ee9PNO8sGxLbHsky9vR+g+PMkugK8xiUX2H7GbYO9eErlOGk59e1+1IcIKqQOJSc6+A5pq8Hxc5yi9O7T+m62d/kxCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149822; c=relaxed/simple;
	bh=2llEtiY56D/tux6hHTL/tJXCoqE5V8Ozr6HCiUNaMhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4pfmSwIDESr7Btz6nrusLwjVyZfApUoxElI3NMDE/hoIS985/bT0FekM9A2M8+140fx2zQKNBC812LTgbAVL7Yebt/BtJDx/hSgiiY56wKemMZVFNxwRubqvbkxE1ZVX7nW1Y94iH/ksBkFDjqOq/J8K+OsWXZuMvB97ACdvtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbG/8OTL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8967FC4CEF1;
	Fri, 19 Dec 2025 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149821;
	bh=2llEtiY56D/tux6hHTL/tJXCoqE5V8Ozr6HCiUNaMhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbG/8OTLehBzKy751iQNNFmPlBu0aiylAIDDxpEyhMyu7JN70XYi6akslTEqDhnHh
	 S4zndEE2hOFEek2oxdvnxE4uR8JYNz48MLzA/yljBTrhWYvV8GfN8QHjJpNrlERywD
	 BnPoZvIaTAGog8UT04S9Ohb52j+bgAvVUQA2tmfzqJbNGcYp3jLLx9uipfBmR3HFAN
	 rk+R1jOUKEevd9p/quEXQ8MTmHYU85fWUN/7+vVXFM14sPREM2x1m/8GtNtIeSU2lx
	 HW6XXxKhcO+RJHx5fyw1V0QzaiA9MHApsgomHm0ZJgwFq7/BzY08SPRrOzQSbf7gz2
	 7/s7ZabMhrDdg==
Date: Fri, 19 Dec 2025 14:10:17 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hid/hid-multitouch: Keep latency normal on deactivate
 for reactivation gesture
Message-ID: <rejkk25fhay4ozlnrior3vbpo4wa6s2rpezmt3kydf7e3jr7k4@vv7423v4mssq>
References: <20251112144837.499782-1-wse@tuxedocomputers.com>
 <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae75b604-9bdb-430a-bd4d-8e1e669cf4d8@tuxedocomputers.com>

On Nov 12 2025, Werner Sembach wrote:
> 
> Am 12.11.25 um 15:47 schrieb Werner Sembach:
> > Uniwill devices have a built in gesture in the touchpad to de- and
> > reactivate it by double taping the upper left corner. This gesture stops
> > working when latency is set to high, so this patch keeps the latency on
> > normal.
> > 
> > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > Cc: stable@vger.kernel.org
> > ---
> > V1->V2: Use a quirk to narrow down the devices this is applied to.
> > V2->V3: Fix this patch breaking touchpads on some devices.
> >          Add another device ID.
> > 
> > I have three Uniwill devices at hand right now that have at least two
> > physically different touchpads, but same Vendor + Product ID combination.
> > Maybe the vendor uses this product ID for all i2c connected touchpads, or
> > it is used as some kind of subvendor ID to indicate Uniwill?
> > 
> > To be able to really narrow it down to Uniwill only devices I would need to
> > check DMI strings, but then I will probably narrow it down to much as I
> > only know what we at TUXEDO use there.
> > 
> >   drivers/hid/hid-multitouch.c | 26 +++++++++++++++++++++++++-
> >   1 file changed, 25 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 179dc316b4b51..ed9eb4e0d5038 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -76,6 +76,7 @@ MODULE_LICENSE("GPL");
> >   #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
> >   #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
> >   #define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
> > +#define MT_QUIRK_KEEP_LATENCY_ON_CLOSE	BIT(24)
> >   #define MT_INPUTMODE_TOUCHSCREEN	0x02
> >   #define MT_INPUTMODE_TOUCHPAD		0x03
> > @@ -211,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> >   #define MT_CLS_WIN_8_DISABLE_WAKEUP		0x0016
> >   #define MT_CLS_WIN_8_NO_STICKY_FINGERS		0x0017
> >   #define MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU	0x0018
> > +#define MT_CLS_WIN_8_KEEP_LATENCY_ON_CLOSE	0x0019
> A college realized that at some points in the code some, but not all, of the
> MT_CLS_WIN_8* classes are checked for directly. Should I add my new class
> there too?

It depends. If it's truely a WIN_8 touchpad then I guess those checks
are here for a reason, but if this particular device works without them,
then it's your call in the end.

Cheers,
Benjamin

