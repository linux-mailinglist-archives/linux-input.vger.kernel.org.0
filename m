Return-Path: <linux-input+bounces-10879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF62BA6471B
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 10:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB1D16F904
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 09:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E9B822171B;
	Mon, 17 Mar 2025 09:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="o6ME4Bjl"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEDD2222D5;
	Mon, 17 Mar 2025 09:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203404; cv=none; b=KbcVISHS+V2OvHQNOrS8Becb+uNpdZtjQL3MvQvi2+W0RVIx+cBC7rHOGet3bBuRQGTzAaYKDSL3irxtm5gjNUb45uzvsoB/ZMGWrB4fgeP/b49Ov4MMkTw/FhWiGa8yt07VH8pbT0/euzleNXoFyrzPSN6OU6n8xGBCMWN8AOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203404; c=relaxed/simple;
	bh=aq5Zls+Ijc6uFlGNIxrbDLG+JLk7nCLttjJwFfdbiMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgQeeUNF0bcIpkTpfOi1AdZsugjfRw2X2Aj6B5gRviG3QcXENnOXvyUzC/rQ4/CZ4jjxWy4Mi3+ka/SeNRByBezUwtpWqMOseTPqIktQ791nPmuVfZiuriArRjSuP3RPiDhOd2jx1QW+Z7pBAmPW32R/FYtycwMBJNSib5yThfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=o6ME4Bjl; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 011B62E0625C;
	Mon, 17 Mar 2025 11:23:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742203400;
	bh=bMWZV6Y+CvWUJMijtT6uLEoH46eXhT+qDmoUd1vNxBw=;
	h=Received:From:Subject:To;
	b=o6ME4Bjl2fJvvawHGOQwbNQEg34H1aRS4VcDnyO4QxhStZdJkt4bS59UGezH+0iE6
	 gy1k6+uv5dJxf+rSHm/vFWBe3n/yck6CEz4PbD2kcIEsXuxzscH//uuhRG+53A1UW0
	 hk18RnuAgdt3LC18gDPfBkVJ3WWazY2W304BPNck=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30bd11bfec6so42527721fa.0;
        Mon, 17 Mar 2025 02:23:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUhNhu5Bap8p2c8oFZs2AOlux6x0ww9GisE8yvtOTfPswbabiu2VTXc1pTmbZeoHGYrC9yIVWnGsmqnkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPY73K4My3biT55hjyia0i1RztsZ1cpX7BfM4CXg8nqod5Fbh
	r9IGteBzNG2HKEfy+XXrF6KktoHg+lKstNnaeCSNAa241Suk+I36fPNp/KaQxrYx1RKnPkn3wRu
	kdh6xBDENuNLckNr+nLozSHWlU7U=
X-Google-Smtp-Source: 
 AGHT+IGnX0Dxok6dcb+rjWQwufCJAoqGhc6ZRb6GFGcDlijV4M5H5bpenR0zhTIAvk4LfpODCGWQbJmvgBgIb4j1so0=
X-Received: by 2002:a2e:bc09:0:b0:30b:b78e:c473 with SMTP id
 38308e7fff4ca-30c4a754732mr55899831fa.7.1742203398342; Mon, 17 Mar 2025
 02:23:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
 <20250222164321.181340-6-lkml@antheas.dev>
 <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
In-Reply-To: <65813e62-aa0f-4167-83c1-49200fc4ca20@redhat.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 17 Mar 2025 10:23:06 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
X-Gm-Features: AQ5f1JrQiT3dbA-hsykAHt-BAHevZp__oLHonDIs7jMsVuuegGkdIf4udvIsUfo
Message-ID: 
 <CAGwozwE9=Vh6M5CVAkTCDj5x8twtm3n_28DH1DFbbBKekhn9hw@mail.gmail.com>
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
 <174220339987.22458.11008987463524674951@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 17 Mar 2025 at 10:20, Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 22-Feb-25 17:43, Antheas Kapenekakis wrote:
> > The Zotac Gaming Zone handheld features a 1080p portrait OLED screen.
> > Add the rotation to the panel orientation quirks.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > index f08cdc81dd9a..bbbe707f541d 100644
> > --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> > @@ -479,6 +479,12 @@ static const struct dmi_system_id orientation_data[] = {
> >                 DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER F1 EVA-02"),
> >               },
> >               .driver_data = (void *)&lcd1080x1920_leftside_up,
> > +     }, {    /* Zotac Gaming Zone (OLED) */
> > +             .matches = {
> > +               DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
> > +               DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ZOTAC GAMING ZONE"),
> > +             },
> > +             .driver_data = (void *)&lcd1080x1920_leftside_up,
> >       }, {    /* OrangePi Neo */
>
> The entries in this list are alphabetically sorted. Please post
> a v2 (of just this patch) with this entry moved to the end, just
> above the special "One Mix 2S" entry which is at the very end
> because its DMI matches are all "Default string".
>
> Note another entry for another Zotac device, with a board name of
> "G0A1W" has been added in drm-misc/next, so please base your v2
> on top of drm-misc/next.
>
> Also the freedesktop.org infra is currently being migrated to
> another data center, so the drm-misc tree currently is not
> available I think.
>
> Regards,
>
> Hans
>
>
>
>
> >               .matches = {
> >                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "OrangePi"),
>

Ok thanks. I will do that in a few days. Patches 1-4 hopefully should
be good to merge.

Antheas

