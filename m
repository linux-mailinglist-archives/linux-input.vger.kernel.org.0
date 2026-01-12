Return-Path: <linux-input+bounces-16994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47352D14451
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FD68323153D
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB6937BE9B;
	Mon, 12 Jan 2026 17:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NesNtqxg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10356378D68;
	Mon, 12 Jan 2026 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237433; cv=none; b=YWie6zdPMdt5GI15H1KOde9Si0gV7BQy+ONk3SK5RGL0lt7fQPPKEgLOA68TC9ET1L+lvGLMJ9COSpfSDHIoPMAbbxpj+rZ5Hl/Dq3q3+csTE/kACZ/MKoM8dsaHLXWKstAUv2FBl5GT1QEc5B87jb250QA8TZwBnmQpCkcVqFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237433; c=relaxed/simple;
	bh=xJXf+LhdLGTKuLTjM/umuKB32euuD/ODMjoH9BrdBYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=UI/fGTF5xkyzyICyGpYf3kayLK354oIMT30c58abWjnrPRRq3spGOLy4FKk0BLK7E5KT0UXtq2to0aPWKG3zV/UDAw243IOi5NzYVrOYKFD7qR8aVIqUTYDU3jPnlFkqKgg4qiqecGfS8+yLSkZfsEOZw7bqF+pj6/m73y8C8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NesNtqxg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203D6C2BC87;
	Mon, 12 Jan 2026 17:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768237432;
	bh=xJXf+LhdLGTKuLTjM/umuKB32euuD/ODMjoH9BrdBYg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NesNtqxgke3t1M+KWFU1S6qiltLApr0a9WuDQqXncNyBNsszd5DHVv0fk2CiQfjca
	 sqt8xDiGmWb9HFBluDfo3pUzhpPP4LfsH0BkmWcMo11bVQt4iNOCDzCV6n3YN7oboY
	 fbxdA/auT90epymNP2DyU7mZ/ncX5WEogCWqGItv2RF5w5UskcA6GA5HYtUcHBTsVS
	 fF9Ervn+9As/2dzKqNI8FkltkXKf1sEBkLpcIO2xoT/XaUJC4SkK+LDMusnfQGFXVs
	 zq6Oa7/NkfexHvAFQXipXZuDI6VSmdO3lfZe81wOVHavNnS9mi/xRntsZcdwsI+ULZ
	 rP9BnPwBM/O6Q==
Date: Mon, 12 Jan 2026 18:03:49 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 00/12] HID: Use pm_*ptr instead of #ifdef CONFIG_PM*
In-Reply-To: <raxul2tp5zvlzktqnspl5pdu6u4433zlyzduonxy2plyoehzov@7qb7ldg3gy6m>
Message-ID: <o2o023r4-5q1n-9s9p-r8q7-7n6418755927@xreary.bet>
References: <20260112105500.3664834-1-hadess@hadess.net> <p75339q9-1r03-n389-92q7-7q9snq091p79@xreary.bet> <raxul2tp5zvlzktqnspl5pdu6u4433zlyzduonxy2plyoehzov@7qb7ldg3gy6m>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Jan 2026, Benjamin Tissoires wrote:

> > > All those changes should be safe, as similar ones were done in other
> > > subsystems, but I'm uncertain about the surface changes.
> > > 
> > > Bastien Nocera (12):
> > >   HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: lenovo: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
> > >   HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
> > > 
> > >  drivers/hid/hid-alps.c                     | 6 ++----
> > >  drivers/hid/hid-appletb-kbd.c              | 6 ++----
> > >  drivers/hid/hid-asus.c                     | 6 ++----
> > >  drivers/hid/hid-lenovo.c                   | 4 +---
> > >  drivers/hid/hid-logitech-dj.c              | 4 +---
> > >  drivers/hid/hid-nintendo.c                 | 7 ++-----
> > >  drivers/hid/hid-picolcd_core.c             | 8 +++-----
> > >  drivers/hid/hid-sensor-hub.c               | 8 +++-----
> > >  drivers/hid/hid-sony.c                     | 9 +++------
> > >  drivers/hid/hid-uclogic-core.c             | 6 ++----
> > >  drivers/hid/surface-hid/surface_hid.c      | 2 +-
> > >  drivers/hid/surface-hid/surface_hid_core.c | 5 -----
> > >  drivers/hid/surface-hid/surface_kbd.c      | 2 +-
> > >  drivers/hid/wacom_sys.c                    | 6 ++----
> > >  14 files changed, 25 insertions(+), 54 deletions(-)
> > 
> > Thanks Bastien, this is now in hid.git#for-6.20/pm_ptr.
> > 
> 
> There is something wrong with the series:
> https://gitlab.freedesktop.org/bentiss/hid/-/jobs/90949365

Yeah, and 0day bot found another issue. Dropping for now, this needs more 
polishing apparently :)

-- 
Jiri Kosina
SUSE Labs


