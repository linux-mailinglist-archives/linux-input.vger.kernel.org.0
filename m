Return-Path: <linux-input+bounces-10880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92091A6473A
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5388F3B4856
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44985221F14;
	Mon, 17 Mar 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Tyv/ZaCl"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614BD3AC17;
	Mon, 17 Mar 2025 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203475; cv=none; b=iSPlNRiOnqJuuVu+7823IuOh0h7U/jibpDmc1n+dmmVm/sURjEmsh+h7n7n8YpczD5Al8ijEHEyAZskh/yOqucavWyY0lrwzVYgs7O9nlrQLitJGkFCO12bXA/+XFj4NsaomZUx8DYqSO1mUFECixZozMWMYoibvwD51SyG5sec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203475; c=relaxed/simple;
	bh=HdqM+Kw7auoJFKOG+1yFmuAYczQRqYv6xSwAwWis1+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G49mbpe2pgCwza6dSbKkgdfeiChNpwzxPJny5dBhId8aNaKfUfYwpldwdvHe0jIx0I7cBeaV7729XBL6yOEg/aLRujGo1oyQ9yXfZN5zB5RHXsb8Fc1swyivFvge8yC0AiHtqSvPGy3LyVU1yUwAI4zOoDIuqmpDDwnh/FKRwL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Tyv/ZaCl; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id B25A92E087A4;
	Mon, 17 Mar 2025 11:24:30 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742203471;
	bh=bpaJAokI/NQ/T1FCGS5iJELae0H5brpgDUQIsXXbr10=;
	h=Received:From:Subject:To;
	b=Tyv/ZaClVMNh7lp3NZiJU8GNe3SheFs3oZT+hyLZ1FVZpqWmiURjNvvvVfrIAqkOz
	 Y2szcK/teCu1vJIUD73DepLHCRuZSY8q42DCU3bO6JcYPxs/cvCn5kIQn1XKcYeWyZ
	 aJVUYqiwLfFuvMd7/8rqItBAb4Psp+yX4ynrynXE=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30613802a04so47453751fa.2;
        Mon, 17 Mar 2025 02:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuwxMr2s0jtk1mlWWoWZnUutSRAxwsnD7TsyuGNGpQGJVVbU1nviA+R/DfyssyOa+wUsuwydT7gHDrLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZB+sgDtZWoO97GyNk9cbg8s/XGadmpCYqBpGjx2V91do431B+
	SJZ22YySjsEvCdVpd+ILMr2qaC+IVGwA+bhD1THY9xa9O+UV4J7AqFh62wfKCvv1B3/KMFRNPE9
	NvoUQIzEWLjVQeA711T7CQtM85+o=
X-Google-Smtp-Source: 
 AGHT+IG393WDcLxj+nSCn5lGo0OfnHjTTcYTFzDoGSO/uYVmGzb6auCXghb6wLrVDzKXWRc1QRDf0xlBxHPaJlSuMtE=
X-Received: by 2002:a2e:9842:0:b0:30b:c6fe:4500 with SMTP id
 38308e7fff4ca-30c4a863bb0mr55001111fa.10.1742203470092; Mon, 17 Mar 2025
 02:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
 <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
 <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
In-Reply-To: 
 <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:24:18 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH_htUrKukTQ1QDa+qHJjKnU-A2QCzFharVGiiTC-vCRw@mail.gmail.com>
X-Gm-Features: AQ5f1JpyVorMHWlhiauUBhSWuscYucyza1t1M5lYYzEnht5BWKBWX2AD_k03mpY
Message-ID: 
 <CAGwozwH_htUrKukTQ1QDa+qHJjKnU-A2QCzFharVGiiTC-vCRw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm: panel-orientation-quirks: Add Zotac Gaming Zone
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
 <174220347106.27635.1170059049294012610@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 17 Mar 2025 at 10:23, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Mon, 17 Mar 2025 at 10:20, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > > The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> > > Add the rotation to the panel orientation quirks.
> > >
> > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > > ---
> > >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > index f08cdc81dd9a..bbbe707f541d 100644
> > > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > > @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
> > >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> > >               },
> > >               .driver_data = (void *)&lcd1080x1920_leftside_up,
> > > +     }, {    /* Zotac Gaming Zone (OLED) */
> > > +             .matches = {
> > > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> > > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> > > +             },
> > > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> > >       }, {    /* OrangePi Neo */
> >
> > The entries in this list are alphabetically sorted. Please post
> > a v2 (of just this patch) with this entry moved to the end, just
> > above the special "One Mix 2S" entry which is at the very end
> > because its DMI matches are all "Default string".
> >
> > Note another entry for another Zotac device, with a board name of
> > "G0A1W" has been added in drm-misc/next, so please base your v2
> > on top of drm-misc/next.
> >
> > Also the freedesktop.org infra is currently being migrated to
> > another data center, so the drm-misc tree currently is not
> > available I think.
> >
> > Regards,
> >
> > Hans
> >
> >
> >
> >
> > >               .matches = {
> > >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
> >
>
> Ok thanks. I will do that in a few days. Patches 1-4 hopefully should
> be good to merge.
>
> Antheas

Actually nevermind, this is the Zotac Zone so it is a dupe. It is fine
to drop this patch from the series and merge the rest.

Antheas

