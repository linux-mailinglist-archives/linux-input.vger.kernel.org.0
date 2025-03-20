Return-Path: <linux-input+bounces-11004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591F6A6A15C
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 09:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B75D318883A1
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 08:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A572120F070;
	Thu, 20 Mar 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="2X5Qt6pd"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7438B1EE02A;
	Thu, 20 Mar 2025 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742459339; cv=none; b=hheWKeIlRMGBAbie8hn+yawO82udU2zeW+uXPlOjrBgEG9Rt9dbKjJruiyS5dM7KD8oFEARuzpsN/iwrpsCmY4S5xd4LNahT3HHvfLKmNZicVz/UciTqb82P2si7Uu06VY1w2MZ0hwwdqtqEnAit29VvOyHx5TKSmSiDY+e2KBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742459339; c=relaxed/simple;
	bh=31FRJ+gofFC1jUTjfG5dfNHi9K8Bzn6MTcO9MapISTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLHbDsQojhDw7o3P9IPxVekOEm+3BMKElSXqWd/qquImvhIQDeKLuoeZFLMPPFhte6pziLJt0it/vGsamG0OMHqWte48S3tjzxGXecplTI9S+XEJddAB6+dJZOt63vTkTCAezLp537s01oti5+B0x+YMRSZ8ttvNzyVxKXvMh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=2X5Qt6pd; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 5E0252E086E8;
	Thu, 20 Mar 2025 10:28:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742459335;
	bh=mNNbW0c82bmsgRudtvP3BUbPdS9LCgiyIFsCRXFIEEU=;
	h=Received:From:Subject:To;
	b=2X5Qt6pdXAC3ahud3khQhdFeO5m4LjfVuJNFVA27KIJ3mMV76oIMZYUOnlWknLjqI
	 P1XQWl4W0NAvahG15lbN36cRlncbGDoYB366ZuntaKGcDPQoYw71A0onZ+hb4jQHiE
	 wKttseqzSRyX8VgOzWFoLh0w0lxsc+UaHYBTJb3k=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bf3f3539dso5407631fa.1;
        Thu, 20 Mar 2025 01:28:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIcd2F9fT3uHfprDCroiEwvnutJ5l77/oyUSjZZ5tnsO2PSXKVZ/nNbkPd3+YmksSA4dEUhgeiMNb+XQ==@vger.kernel.org,
 AJvYcCWuUIu5fyhojNyN1WZ3zannNAnK6lk1/9onKnIrxAPznxS4S9B5S7UGenkubicS/E76Fwx3wNcMWxz1t6zb@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK+Pn34jwWZvEztISp+O4EvRQKSzH0ZhJl3TulRXeWIcoYsIy
	VAafFTsI/Uxn5PH7jEePEUmk8pWqCRpKuwoZWzm59oT8BtgTZF5F5WCdYabzuCa0uw3VRNkxEJr
	QILqW2ZubqY8GJwBF2npV44uzuqw=
X-Google-Smtp-Source: 
 AGHT+IHoycuseksHYIXBys7ljTrnhMcmFrgQnLwD32IwbiHHDjuyeIoImt1jwzOkaH+/vof0LoONhSe3Ok+FtaQ9bXI=
X-Received: by 2002:a2e:9f0d:0:b0:30b:fc3a:5c49 with SMTP id
 38308e7fff4ca-30d7275469cmr9333251fa.9.1742459333734; Thu, 20 Mar 2025
 01:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
 <20250319191320.10092-10-lkml@antheas.dev>
 <2341cca8-4f3e-48dc-a97c-aec2a27e3f05@ljones.dev>
In-Reply-To: <2341cca8-4f3e-48dc-a97c-aec2a27e3f05@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 20 Mar 2025 09:28:42 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGHfGHrKAW4_Q5NOGX4+6E8iwexJ6F6w2oaVY4jqNxrFQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpVE3m9TjACNNWeVSHWTDa5ESm5vmbu0prVAekkzhX-Hc8KKTqOfsVcbas
Message-ID: 
 <CAGwozwGHfGHrKAW4_Q5NOGX4+6E8iwexJ6F6w2oaVY4jqNxrFQ@mail.gmail.com>
Subject: Re: [PATCH 09/11] platform/x86: asus-wmi: remove unused keyboard
 backlight quirk
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174245933470.17237.7921184732792397847@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Thu, 20 Mar 2025 at 08:11, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 20/03/25 08:13, Antheas Kapenekakis wrote:
> > The quirk for selecting whether keyboard backlight should be controlled
> > by HID or WMI is not needed anymore, so remove it.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   include/linux/platform_data/x86/asus-wmi.h | 40 ----------------------
> >   1 file changed, 40 deletions(-)
> >
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 42e963b70acdb..add04524031d8 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -183,44 +183,4 @@ static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
> >   }
> >   #endif
> >
> > -/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
> > -static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
> > -             },
> > -     },
> > -     {
> > -             .matches = {
> > -                     DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> > -             },
> > -     },
> > -     { },
> > -};
> > -
> >   #endif      /* __PLATFORM_DATA_X86_ASUS_WMI_H */
>
> I think this can be squashed in to patch 8 as it looks likely to cause
> an "unused" warning or error? I'll defer to others though.

I tried to avoid going cross-platform for these three patches. If
someone has a better suggestion to do it I would be happy to do that
instead, incl maybe adding a __maybe_unused as part of the previous
patch.

> Cheers,
> Luke.
>

Antheas

