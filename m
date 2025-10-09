Return-Path: <linux-input+bounces-15338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C2BC7EEA
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 10:08:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20AA24217A3
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 08:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF439274FC2;
	Thu,  9 Oct 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="kv4H7JCL";
	dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b="qp6nkWf5"
X-Original-To: linux-input@vger.kernel.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED7B2641E3
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759997122; cv=none; b=GEsFEyebSjRhTJID35NqkRLmyJSVmOILsKG8p26VwnvsYCvrEVWCfwWe6Yx27LQG3V9axbm5mLLjBL0FXvuLJAi0NgfKNXAgOu44Dv89WYo/1qrV3M/j2lMGBilmLzDKrRNh3SoW0B3U1+nV1v5Y6YABKGLp6eHwNOnA3svKPb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759997122; c=relaxed/simple;
	bh=XXVOl+DFyBfDhbMh+21qG07OqPC7FNsXUqKBHtSsZpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8bFg+hYnqdpgL39Rls9v5F1Zccf08AXFvnVyYcR8xIlFIea79VEg8njG61yNlYRmvmCvD83vYTNfeBMdDOlIiXCci7vYW7TCGOhJpsAJWxbHPLPePKjlKm4GTxNFd2hSINWU3dBT6afwRn2QXcH4QXW86SOhICkbCoOBm8ncVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi; spf=pass smtp.mailfrom=hacktheplanet.fi; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=kv4H7JCL; dkim=pass (2048-bit key) header.d=hacktheplanet.fi header.i=@hacktheplanet.fi header.b=qp6nkWf5; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hacktheplanet.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hacktheplanet.fi
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=gibson; bh=XXVOl+DFyBfDh
	bMh+21qG07OqPC7FNsXUqKBHtSsZpk=; h=in-reply-to:references:subject:cc:
	to:from:date; d=hacktheplanet.fi; b=kv4H7JCL2ogsW0kjaktWuZPgI1u0+8JIa9
	c3Dq0kSg33A3lOoZxFhCBFY/yIaZviwPQ3Ve0gqVO3IIicVg+aVhztfKfL7BtRnegt7Ku1
	kKDqeu96EhSJ/5J9twe+OgCVXzi0j/XbKq0Z9MaklRK2kLkrziPDmQeDKNW7fSCFSW0PQU
	vPMJ+KGK5Ygb5HvYFkU86UZ/6HbCgdv8ixnSrIHySaLsARTB9uqHfEbntXlPD0MrsLEDLJ
	HoyMwityxuUcLbPSAd5ixPxgjt4jsLJGlWI61kzK/35utVCaxu+mO0bFl0Vz2qUDl1GR1f
	Gf3VElPAatjLVgTbmj3CLmFzNN7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hacktheplanet.fi;
	s=key1; t=1759997108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SB45MneljJwT3bMtv8tAGzOm+Nx2swMrBqjFq0j8QuI=;
	b=qp6nkWf5m8VHZ/XwdTWG0t4XElP4hF6wJ1D2mYitUVxMgF24ZM5i+tXP2Udd6qZ/zoVHQC
	919kI2g3RMX8s765PSiR+Gh4AppMP3VMxa0ALp6wqxaGXU9sp9MlnmSj3zNq71CmsS5qMt
	qJVZosS0z1SE3CBIwn/R71nQTR0njHIg3iPlci25h2PeVK5b3dHTrYlQV9HOjQwT6IkR9o
	Y+xRRE2b6HKYrOVx6ZWpsHnOY2ma68jGDqBRQJG3/hzLkHkVJm0v+2x/W1ECxVSz1rARnh
	ZCLsfM5OfhkUljo0ZIuBTyGl3W3mFWR2gnuSJNaXVv1bE4zZ3KrQnGrd4L2L8w==
Date: Thu, 9 Oct 2025 17:04:56 +0900
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lauri Tirkkonen <lauri@hacktheplanet.fi>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: patch Lenovo Yoga Slim 7x Keyboard rdesc
Message-ID: <aOdsqHznz1SJdadC@mail.hacktheplanet.fi>
References: <aOdLxAEYQpV2zp77@mail.hacktheplanet.fi>
 <lxtbtu5frygbw7qzfaelc63vgientm7d6oo7dt6jeassl3ttbh@f22h223wehbm>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lxtbtu5frygbw7qzfaelc63vgientm7d6oo7dt6jeassl3ttbh@f22h223wehbm>
X-Migadu-Flow: FLOW_OUT

Hi Benjamin,

On Thu, Oct 09 2025 09:38:50 +0200, Benjamin Tissoires wrote:
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index 63f46a2e5788..d78bd97ec24e 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> 
> Why patching i2c-hid-core when this is clearly a logical bug, not a
> transport (I2C) bug?
> 
> I would rather see this fixup in hid-lenovo.c along with the other
> lenovo fixes.

I'm not exactly familiar with HID; please bear with me :) If
i2c-hid-core is not the correct place for this kind of thing, I can move
it, but I'm going to need some guidance on where the correct place is.

This device uses hid-over-i2c, not hid-lenovo; I've got
CONFIG_HID_LENOVO=m but the module is not even loaded. I don't see how
putting the fixup in a module that does not attach to the device could
work. So where should it go?

	[  796.926931] input: hid-over-i2c 048D:8987 Keyboard as /devices/platform/soc@0/bc0000.geniqup/b80000.i2c/i2c-1/1-003a/0018:048D:8987.000F/input/input36

As a side note: apparently there is at least one other device in
existence with a similar error in the report descriptor, which works
fine on Windows:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=652f3d00de523a17b0cebe7b90debccf13aa8c31

-- 
Lauri Tirkkonen | lotheac @ IRCnet

