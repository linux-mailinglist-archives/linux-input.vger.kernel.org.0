Return-Path: <linux-input+bounces-17053-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A12D19B95
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45A19302E7E1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 15:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5B0392C37;
	Tue, 13 Jan 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4BCkfrW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632E392C35;
	Tue, 13 Jan 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316439; cv=none; b=Ku85wMg+N3lKlInIm7SjP22vhp8BzkU56rMXbzcPMEh9evQJko+TleMZvT7Goq0uMCl6SLTkKWLhR9gB9pyMQMy6gCQhfGy7uQOIn7AuxdlxszCWfVg3LmAwYBVChqhTqonNU2GhyP2ZCdqB8W4JEz4I4RhWpL0F26lk6KVGJmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316439; c=relaxed/simple;
	bh=9IZNuZ5tt6KEyhhV3AHy1NXRvNNta1IhU3f8NDCgz4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4cytSvfR6P2SIc5PMoFNWvGpvIyjvifxf3+SKzcqyj0T2gJyZivC0i96eN0fwCvHv0EaLhNzqNu7mGTtRastui4CtW7pXLCQAPVXZj7Fisjm0ngUUGQATpDnq4I3wJNpwXQcBSVkL2zp9eLIkjWBUkM62hok3kh6SlSmdEYQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4BCkfrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67013C19422;
	Tue, 13 Jan 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768316439;
	bh=9IZNuZ5tt6KEyhhV3AHy1NXRvNNta1IhU3f8NDCgz4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4BCkfrW2rNWFElAAU5HwHfNDuDWfKIu5dQdG1uRpF48FQwYXgr11KHREZI7KYvNl
	 RpnwMijkTOVJsrn3L6agrwX+O8/xkEfmUqONDIki2l4nKf9UJK0BAqd3nuf4haDOL5
	 CyXGPTz+nGCXAmpImTgm2FssmT6ZNDapWXm7LYcMPv80IYkAq2R6pmpZaKQi2pRPAc
	 ZVo7tYOjbEpHJm2DuT3V0l26blLEYumxVhgWFvezCIKJHQ6rPPyVblb6HJpyKTeYWr
	 KGx9Mm1f/dFP8kkRDJMDDeehzfQN5uMo3PkoKBm2wA3MU7ti80A6XOJKqqz6gsvJON
	 fb0pSZTCNVNWQ==
Date: Tue, 13 Jan 2026 16:00:35 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: kenkinming2002@gmail.com
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick
 5288 touchpads
Message-ID: <ngcltngjjl5dc4nt5i3ui5pjvemt26kp4iqpbcpbllvwwbonfd@yspyfi423i3w>
References: <20251225190822.150872-1-kenkinming2002@gmail.com>
 <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>
 <aV6d5mt2veL-vEvf@anonymous>
 <aWZEST09jJlVZOzq@anonymous>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWZEST09jJlVZOzq@anonymous>

On Jan 13 2026, kenkinming2002@gmail.com wrote:
> On Thu, Jan 08, 2026 at 02:14:29AM +0800, kenkinming2002@gmail.com wrote:
> > > The simplest "solution" following what you are doing is making a HID-BPF
> > > fixup which checks whether the device properly sent the report
> > > descriptor and if not puts the one here. The HID-BPF has the advantage
> > > of being compatible with hid-multitouch so you won't get into troubles
> > > with a separate module.
> > This might be a solution but would that not only fix it just for me? I
> > would have to look into how to do HID-BPF fixup.
> An update, I have looked into HID-BPF but it seems to me that we can
> only fix up the HID report descriptor and not the HID descriptor (this
> descriptor is specific to i2c-hid device) but from my testing both
> descriptor can be corrupted. Specifically, I see messages such as:
> 
>   i2c_hid_acpi i2c-SPPT2600:00: unexpected HID descriptor bcdVersion (0x0209)
>   i2c_hid_acpi i2c-SPPT2600:00: Failed to fetch the HID Descriptor
> 
> appearing in my log.
> 
> For now, I am just going to just apply the patch locally for myself till
> a better solution come up.

On second thoughts, maybe we can have the HID descriptor dmi quirk in
the kernel only. This way, the device should be presented to HID-BPF and
the HID stack, and if there is something wrong in the descriptor, this
shouldn't fail dramatically.

The HID descriptor is something specific to i2c-hid, so it's fine
"fixing" it there. The report descriptor can be fixed later on I think.

Cheers,
Benjamin

> 
> I have finally clean up the pile of garbage I have while investigating
> the problem and put up a proper git repository with relevant script and
> logs at https://github.com/kenkinming2002/samsung-i2c-hid-bug-repro.git.
> 
> Huge thanks to Benjamin and anyway who might have stumbled across this
> patch for your time.
> 
> Yours sincerly,
> Ken Kwok

