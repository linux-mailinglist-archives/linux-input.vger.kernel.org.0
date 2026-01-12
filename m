Return-Path: <linux-input+bounces-16992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25966D143C7
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 18:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0D33309EE08
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 17:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85685378D60;
	Mon, 12 Jan 2026 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRJGFiZz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187F376BE5;
	Mon, 12 Jan 2026 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237237; cv=none; b=mJVhoMwu2d6zvHwOG03wZKqj3J9wtDE2eSnScaEKFaZtsA71KpKdmRJIEg/NItvXvF3rYBYUc4rN6dq61zCjIZ5398G5Aq33hgcEZpPXvvcrxVepX2Hve8vterTaB29GlCTx9RYdZgFlDTb+hn3XNVZiwOWKYnwIM75n90EGP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237237; c=relaxed/simple;
	bh=DgNIs9cZQfZC0idWrXBpLojrupBFeDqy1lZ2VlMz0Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NcT49wLqjA5sIgrvkaF5dHkqxImwKp+bCxnLW2s2U8RV+lXUepSpYOowoHxm/thqyMYC4GAevOM1eY/la2/P5o34feXJP/qrLiU9krG4VcQy2HHIyPQN0X1EofjNaSz5fkBoqF/PurAj/NjCvbGBQPQnU1XRu6vcHU+VJ7KYIVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRJGFiZz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2CAC16AAE;
	Mon, 12 Jan 2026 17:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768237236;
	bh=DgNIs9cZQfZC0idWrXBpLojrupBFeDqy1lZ2VlMz0Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRJGFiZzp9DXW94oNA0tpcy3ZXcaZbmURHM8lOjJo98h2Ef/C7Nv7Y3Tc1ysq5Wio
	 NaX14Qpq+3hVP4FLaVgEHCe2oC/El7ECzq2fmFa8FtsHU0gd9ANJZ2GTy+cxySl7K2
	 zAnG0ll9cWPGfpisKW6aIWKJNP4lCVkeydNIhRNKBOStOuNj1xAaSFzqzgzJFcHy9s
	 ZZGpfw+cA3OgbNGV+Sn31JzBruknMxjWD+JMwnYUbJe33gi6NAfkRJq/KgGjpArX/R
	 qqlFXP4M7bTWJFSoxQ/83v9WV9r2pMzKOjiRG39aENC/H745jc4vqinwILhJ9Wd7wE
	 9dIXGNWGexOfg==
Date: Mon, 12 Jan 2026 18:00:32 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 00/12] HID: Use pm_*ptr instead of #ifdef CONFIG_PM*
Message-ID: <raxul2tp5zvlzktqnspl5pdu6u4433zlyzduonxy2plyoehzov@7qb7ldg3gy6m>
References: <20260112105500.3664834-1-hadess@hadess.net>
 <p75339q9-1r03-n389-92q7-7q9snq091p79@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <p75339q9-1r03-n389-92q7-7q9snq091p79@xreary.bet>

On Jan 12 2026, Jiri Kosina wrote:
> On Mon, 12 Jan 2026, Bastien Nocera wrote:
> 
> > All those changes should be safe, as similar ones were done in other
> > subsystems, but I'm uncertain about the surface changes.
> > 
> > Bastien Nocera (12):
> >   HID: hid-alps: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: appletb-kbd: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: asus: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: lenovo: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: logitech-dj: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: nintendo: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: picolcd_core: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: hid-sensor-hub: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: sony: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: uclogic: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: wacom: Use pm_ptr instead of #ifdef CONFIG_PM
> >   HID: surface: Use pm_ptr_sleep instead of #ifdef CONFIG_PM_SLEEP
> > 
> >  drivers/hid/hid-alps.c                     | 6 ++----
> >  drivers/hid/hid-appletb-kbd.c              | 6 ++----
> >  drivers/hid/hid-asus.c                     | 6 ++----
> >  drivers/hid/hid-lenovo.c                   | 4 +---
> >  drivers/hid/hid-logitech-dj.c              | 4 +---
> >  drivers/hid/hid-nintendo.c                 | 7 ++-----
> >  drivers/hid/hid-picolcd_core.c             | 8 +++-----
> >  drivers/hid/hid-sensor-hub.c               | 8 +++-----
> >  drivers/hid/hid-sony.c                     | 9 +++------
> >  drivers/hid/hid-uclogic-core.c             | 6 ++----
> >  drivers/hid/surface-hid/surface_hid.c      | 2 +-
> >  drivers/hid/surface-hid/surface_hid_core.c | 5 -----
> >  drivers/hid/surface-hid/surface_kbd.c      | 2 +-
> >  drivers/hid/wacom_sys.c                    | 6 ++----
> >  14 files changed, 25 insertions(+), 54 deletions(-)
> 
> Thanks Bastien, this is now in hid.git#for-6.20/pm_ptr.
> 

There is something wrong with the series:
https://gitlab.freedesktop.org/bentiss/hid/-/jobs/90949365

```
In file included from ./include/linux/kernel.h:36,
                 from ./include/linux/random.h:7,
                 from ./include/linux/nodemask.h:94,
                 from ./include/linux/numa.h:6,
                 from ./include/linux/cpumask.h:15,
                 from ./arch/x86/include/asm/cpumask.h:7,
                 from ./arch/x86/include/asm/msr.h:11,
                 from ./arch/x86/include/asm/tsc.h:11,
                 from ./arch/x86/include/asm/timex.h:6,
                 from ./include/linux/timex.h:67,
                 from ./include/linux/time32.h:13,
                 from ./include/linux/time.h:60,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from drivers/hid/hid-lenovo.c:27:
drivers/hid/hid-lenovo.c:1573:32: error: 'lenovo_reset_resume' undeclared here (not in a function); did you mean 'hidinput_reset_resume'?
 1573 |         .reset_resume = pm_ptr(lenovo_reset_resume),
      |                                ^~~~~~~~~~~~~~~~~~~
./include/linux/util_macros.h:136:44: note: in definition of macro 'PTR_IF'
  136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
      |                                            ^~~
drivers/hid/hid-lenovo.c:1573:25: note: in expansion of macro 'pm_ptr'
 1573 |         .reset_resume = pm_ptr(lenovo_reset_resume),
      |                         ^~~~~~
make[4]: *** [scripts/Makefile.build:287: drivers/hid/hid-lenovo.o] Error 1
```


Bastien, are you sure that's the only change required?

Cheers,
Benjamin

