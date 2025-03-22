Return-Path: <linux-input+bounces-11070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3EEA6C825
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 08:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFCD94612C5
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 07:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269BD1C84C2;
	Sat, 22 Mar 2025 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JZ0Lgqyh"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE95190052;
	Sat, 22 Mar 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742630199; cv=none; b=d/OTb5R6eFN1kLUs0qO0py7mRygCP199jzVlttho3v8Wg/reBbxlCwn9L65Q6/ZE+NJjaxh5mpf9rxums7PN6i2gt3EHhyerYEMO98Ot66sPNSfbZ8oOrPEwsshD2oQPikVPEDo6dh7DlKkkkAsIDUznXlXdiiU+2ooh0RJQfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742630199; c=relaxed/simple;
	bh=Nb/yu4ypdxxN5A53Ij3THPgpM+Dwa5pXzIZtnpM9Ruw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HvkL8O55w2pUP3fM8S2ra9MlDsIZW0dcnSTLWAURC+HnihqbPBOpHW1PdsluoYZfyGIRHcJ9LwhsazKymSb1I59qXF0Fgt1Kb1pH7F2vvKN0k/7MZp7ugCSliMZzUwa3cMi3PXhrkrHibvil3jubEBxPwydzERnlIDJ/o+jwitQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JZ0Lgqyh; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 5CEFF2E087B7;
	Sat, 22 Mar 2025 09:56:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742630192;
	bh=RxDBhqQO5wD4ha5w+8kvrsCmcUbINe+vyAW7lpYJJ/Y=;
	h=Received:From:Subject:To;
	b=JZ0Lgqyhzf1wBAlRW+8NjTp2LwUcNXMo9h+Ex3tGLm+oSn7CSxPwCmK0HCbsUNNQK
	 q/guTriqmaDafZJa1GgmEKUDrKnk1u43KDD/MhWOrQcmF+oNXCmJXmZ8RZuYOmXs+u
	 RWidmk3gqTXJ6/+MUURpozsooIZYdKB5V1ggpwio=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30c091b54aaso26357921fa.3;
        Sat, 22 Mar 2025 00:56:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/7Pw7gw0EXCJORKG0hHj/zncbiqQCZVEIJMMn25h0EiAmT0bsnAnimLxUvZfUvJPHNQnbcZqh6mBIW6a1@vger.kernel.org,
 AJvYcCWPPPXgHsD/H7cAWYpH1DxyBxMMe5ejnLcp9FkZAhViPc/yrY9RbMswzg3HZAjm+w5VIV/Idf/AkamEMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRg4A2ABpmBjmZideHxzMWDiD6w6s9fc3UorN0qpz4F7n2MwkU
	SH/AoHq9zCcmPc/3PE6VNv+1rzRVJdXVMzwfSH++HP6WU5JZs3sIW1QHrRHTRM5KGsJBX1jSI8x
	W5BBqbPHAD7A59nILsCbZfofINHg=
X-Google-Smtp-Source: 
 AGHT+IHVB+XQcdLBtvU4EbhL/dwkdcvEauCsjljXsgbjiSjriXr4SBaaM3ELQTGtwQn2g+CcOyEoRv7OHpuQ9yeA7Xs=
X-Received: by 2002:a05:651c:1a0b:b0:30d:694d:173b with SMTP id
 38308e7fff4ca-30d7e32dda3mr19378131fa.33.1742630191621; Sat, 22 Mar 2025
 00:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-12-lkml@antheas.dev>
 <d2746ddf-92d5-4ac8-b361-60d1ec9aabb5@ljones.dev>
In-Reply-To: <d2746ddf-92d5-4ac8-b361-60d1ec9aabb5@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 22 Mar 2025 08:56:20 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGMNchNXckSZ=HPyi=sFEjrLDzayqjHDSOwwb8MQ=rJPg@mail.gmail.com>
X-Gm-Features: AQ5f1JobNXeplc7j7ilKY883wh1vZ5o94P22g_5Vzf2wfA_WL4GCq6Rmfd_gi24
Message-ID: 
 <CAGwozwGMNchNXckSZ=HPyi=sFEjrLDzayqjHDSOwwb8MQ=rJPg@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: asus: add RGB support to the ROG Ally units
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174263019272.21144.829851542677459877@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Mar 2025 at 03:30, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 21/03/25 11:09, Antheas Kapenekakis wrote:
> > Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> >
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/hid/hid-asus.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 5e87923b35520..589b32b508bbf 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1449,10 +1449,10 @@ static const struct hid_device_id asus_devices[] = {
> >         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> > -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> > +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >           USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
> >         QUIRK_ROG_CLAYMORE_II_KEYBOARD },
>
> I need to NACK this one sorry, if only because I added the RGB control
> in hid-asus-ally as a per-LED control and it works very well. You'll see
> it once I submit that series upstream again.

Depending on when your driver is ready to merge, it might be
beneficial for this to merge ahead of time for some basic support.
Then you can yank it after your driver is in. For your driver, I think
it would be good to make it separate from hid-asus and yank ally
completely from here.

> The distinction between MCU mode and Software mode for RGB is frankly a
> pain in the arse. For Ally we will want software mode (per-led) as that
> allows just one USB write for all LEDs, and no need to do a set/apply to
> make the LEDs change. The benefit being that the LEDs can change rapidly
> and there will be no "blink".

The blink happens when the B4(/B5) command is sent. If they are not,
it is perfectly fine. B4 just needs to be sent initially, as it
switches the controller to solid mode if it is not there already. Then
B4/B5 could be sent on shutdown to save the color to memory. I
purposely did not do it as it would break the driver if userspace
controls the leds inbetween led switches and it is needlessly
complicated for what this support is meant for (basic RGB).

Also, multizone is expected to be of little utility, so it is not
worth making concessions over. I never found a use for it or anyone
ask for it. If single zone has performance benefits, it should be used
instead. A lot of devices do not support multizone, and when they do,
it is in different forms, so it is not something that can be
intuitively put into a kernel driver imo.

Aura mode is especially buggy during boot and resume, since the
controller briefly switches from the MCU mode to that, so it uses a
stale color which is ugly. Even when you try to match the colors, as
you did, it is not 1-1. You know this too. In addition, Aura mode will
break userspace Aura programs running through Wine. Although they are
already broken due to the hiddevs merging which I had to revert for
V2. But we could fix that, and I will try to for V3.

> I'll write more on patch 10
>
> Cheers,
> Luke.

