Return-Path: <linux-input+bounces-10878-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A3A646FD
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FE4816B92B
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B3621D3DF;
	Mon, 17 Mar 2025 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="gWYR2sG3"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8CC219313;
	Mon, 17 Mar 2025 09:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203293; cv=none; b=d6ZoWLBIWCwNpkS5m/roNjTuQzlrtkpMKL/DUlWN1l/gd4HMxaXyQZF+Y84r8pcdE3UkEYj9QBn9JZR/Zj4Ieq94qaEJ5ymMeMiDeM/8hXa08Usp26y6wE70hWkUwUwNLSl9rLiIpUBoCqOMwxC9I2S4PyFLMPJPK+VXJIDnpwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203293; c=relaxed/simple;
	bh=nSrWTm8QPPkkG2oT32D/+WaEUfEA+lLGWlWaysVjSDY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLmaFE8nFaRR40x0QITcO4tVRCc6zGkhuCfMVMWvC+/WBS+XCxGgHKciUmV+a5gQMAZjhMNiBLSdwrhFLMaGu6TG7xqDNYobbT8YjEPIFYYADoDsX4tDS0O+PXIoucK5T09Mr1lFICZoD5KEY04n+rcddryO3Jt/J0deh5I6Kug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=gWYR2sG3; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id CE5032E0537B;
	Mon, 17 Mar 2025 11:21:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742203287;
	bh=BXcfOF08ViHrsQBfZ+rJ2oo3QoNtkI4oSo8dH1AIiSo=;
	h=Received:From:Subject:To;
	b=gWYR2sG3vKkoNC6BHrjMXzD581nXJArrNiMhkjVFSVd3ZVd+4wMh3TyK4qY4KFzmt
	 Ei7B6PSv5xZnpPKM/fDW0tMD9VKH4AJ54Jy+vJRx6kFeXnrDh3jnWjXX92FPe+JkcU
	 Og06rsua0pcip7+p+9LkZMbMzzWP5k5SDKo84+h4=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30bf1d48843so39978551fa.2;
        Mon, 17 Mar 2025 02:21:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV03zXOlQzfd1HzKni9vD0CtT/HVbiXlDt/X5ts25AsP6QvBdBzEtgWNk49xaXTl5ffxBVvgQ34t25qYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxZ9UBkMze6UD5I5+ewd1RT2/xbqz64EOG93IPctqLAFa1whA
	uTVIaNgVqhRuA7wlZ2V9qXDmhUaFn5ymJeEomOTsUX3NKTNXva9fbYty2/Yomth0Ck9lBxfxAZt
	h2CFowUsWvV+7X0DMz9qHxrEyiR4=
X-Google-Smtp-Source: 
 AGHT+IGGgDjr9jB21RMJBMF2G0m7hDY1KPdRlnVvBOzz+dWYQDMCT353VmXdXjgLUxLHjyh97KXBeSTx0QeN2PHcvjU=
X-Received: by 2002:a2e:be06:0:b0:30c:1fc4:418e with SMTP id
 38308e7fff4ca-30c4a8d225bmr68178521fa.26.1742203286038; Mon, 17 Mar 2025
 02:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-4-lkml@antheas.dev>
 <bce3cdbf-2056-4735-9c6e-d67e0cd1dcd4@redhat.com>
In-Reply-To: <bce3cdbf-2056-4735-9c6e-d67e0cd1dcd4@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:21:14 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGub9FVh0rTnaE3FkuGrc5qRQJQ+_25-Jo61=OtmxXNMA@mail.gmail.com>
X-Gm-Features: AQ5f1JqWmYcGUB_R7mLjJE59S9cK3w1pEurwt-0kdg5gnLR_vSOrWvA3nrJWhvQ
Message-ID: 
 <CAGwozwGub9FVh0rTnaE3FkuGrc5qRQJQ+_25-Jo61=OtmxXNMA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm: panel-orientation-quirks: Add OneXPlayer F1Pro
 quirk
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174220328721.13359.13091823917999892304@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 17 Mar 2025 at 10:15, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > The OneXPlayer F1Pro has a 144hz 1920x1080 portrait OLED panel.
> > Add a quirk to correct the panel portrait orientation. In addition,
> > it comes with a red limited edition variant in the Chinese market,
> > so add that as well.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>
> Thanks, patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>
> drm-misc maintainers, I'm dealing with a huge backlog of
> patch-review, bugs and other work.
>
> So I would appreciate it if one of you can merge patches 1-3
> into drm-misc.
>
> Regards,
>
> Hans
>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > index 1378690b7287..f08cdc81dd9a 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -467,6 +467,18 @@ static const struct dmi_system_id orientation_data[] = {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER X1 mini"),
> >               },
> >               .driver_data = (void *)&lcd1600x2560_leftside_up,
> > +     }, {    /* OneXPlayer OneXFly F1 Pro (OLED) */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1Pro"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> > +     }, {    /* OneXPlayer OneXFly F1 Pro (OLED) LE Red variant */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> >       }, {    /* OrangePi Neo */
> >               .matches = {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
>

Hi Hans,
patch 5 is also a panel quirk. Can you review that real quick as well
so it is not dangling?

Thanks,
Antheas

