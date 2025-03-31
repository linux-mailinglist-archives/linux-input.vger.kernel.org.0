Return-Path: <linux-input+bounces-11372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 835F4A76095
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 09:53:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6445C3A9A0E
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 07:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AB071CAA6C;
	Mon, 31 Mar 2025 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="kxwAVoQN"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23D71C84CB;
	Mon, 31 Mar 2025 07:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407565; cv=none; b=fb7tDV8LFOG2LOLK8Z14d9zcyFiEEtpmNCmPrhkRex8bykumRzFU4Q6boxOfjEPWAZx/H8lFbhTxVN2uaXjns22BhrYwe/zY9rPTnjxm9gbo9rZbliPnrcicjTEDQoGQlqnAU6FGP0fhW9ZSpBFRuOYKCXKkzOSIV+NLCXJr+So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407565; c=relaxed/simple;
	bh=T4RYABb0/AAiokpzPfBeolRqfC+EBCsgyNzLU6qopVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KbQLFTj3ml/8pYwUcsCYtOf5rIrfPLHJ29I8z3UTlPT4gkscPIBcr7NTXn6hWlNeitSU3TAY8A+E9mJbPoRTM7CWqF+9N2AVReya6OlNB1ueQScb8yZYtRW5KyP4pD/GvFQdSy09snTEloJockGYDt5u+Q7uV18p8tH1zLyzd9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=kxwAVoQN; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 1BBA92E07C72;
	Mon, 31 Mar 2025 10:52:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1743407558;
	bh=dPHXz37ma9SoVrUSxR/9oICeJsQcw4sXADN0QUet89M=;
	h=Received:From:Subject:To;
	b=kxwAVoQNBagZ/exmuY42Xdm/fO4N15p0VJsTj3Zw+P89KnU8s5pcgLMkME1vywYc8
	 7N2Pwe5t9d+wxuAmxUFFbOYUtGJBZuSBAHxRf1rQsoG0tlG2dqwEWC0M1Of96b1tlW
	 +hSEU6W3ehKSGihk/PkaZ/VjlZ8dcL9hTZBk5Gzc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30bf3f3539dso39969831fa.1;
        Mon, 31 Mar 2025 00:52:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMClX6OITGpCtaCcyjfgF+dL7PDb1LZ3kuskwqSuhcqe6DyncRgTc07NUBF2VNX1bOLiN8xhAe9NkDnQ==@vger.kernel.org,
 AJvYcCWDIkGxqF0F1OWhq8rjWIphm7bHXCu1eT1ZoWQD/TbtuVDakwouv1uWOYG1lUgab+kqnGa99xpJcvBQpy5j@vger.kernel.org
X-Gm-Message-State: AOJu0YxoRQLSuWb1yKY5oWxDIV6IwXJVE7aNRuijPh8Uo11OBaYj1x85
	Hm2cremK6pMWLCdOairWLlIHi4bVEjYRsx4eFEHsk2eEyduoR93+aaG3l4tp8DqoWzxM253ykyV
	7C2g5NjlayPzjq0iHz1x7EpC44rY=
X-Google-Smtp-Source: 
 AGHT+IG51YjIB3w/EWFyxGDdLo0A/6GstSrq+tlwMO8nsvwVyczjmzQx83uKM1M9Qgy/BhtjZLGUL71UgEkpNlmauLg=
X-Received: by 2002:a05:651c:2223:b0:30c:1aa6:5565 with SMTP id
 38308e7fff4ca-30ddfa2bf34mr24184491fa.20.1743407554353; Mon, 31 Mar 2025
 00:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-11-lkml@antheas.dev>
 <648a1d1f-a222-480a-aec9-ab3e0cf790a1@ljones.dev>
In-Reply-To: <648a1d1f-a222-480a-aec9-ab3e0cf790a1@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 31 Mar 2025 09:52:22 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFrbspt+OfzaCR1B98Z=1GFS6nTdnVpWFeb71aLJLBUxQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqe4-ED7pMCJ-pvbT6w6TmbqqZtk2L6hLDXJr7jXmq8PwD1nJ7nvPRayIg
Message-ID: 
 <CAGwozwFrbspt+OfzaCR1B98Z=1GFS6nTdnVpWFeb71aLJLBUxQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/11] HID: asus: add RGB support to the ROG Ally units
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174340755579.17681.18017299989546706960@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 31 Mar 2025 at 00:11, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 26/03/25 07:45, Antheas Kapenekakis wrote:
> > Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> >
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >   drivers/hid/hid-asus.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index c135c9ff87b74..fa8ec237efe26 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -1424,10 +1424,10 @@ static const struct hid_device_id asus_devices[] = {
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
> Hi Antheas,
>
> I have some good news for you, ASUS got back to me, there *is* a way to
> get the feature level of a keyboard.
>
> ## 2.2. Configuration command
>
> In order to confirm what functions are the USB device supported, host
> retrieves the
> configuration information by feature report method. Therefore, the
> firmware has to
> return the data (byte 0x06~) to the host.
>
> ### 2.2.1. Set feature
>
> | Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
> |-----------|-----------|----------|----------|------------|---------|
> | Report ID | OP code   | Addr_L   | Addr_H   | Read ROM   | Length  |
> | Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |
>
> ### 2.2.2. Get feature
>
> | Byte 0    | Byte 1    | Byte 2   | Byte 3   | Byte 4     | Byte 5  |
> |-----------|-----------|----------|----------|------------|---------|
> | Report ID | 0x05      | 0x20     | 0x31     | 0x00       | 0x08    |
>
> **Byte 6**
> - 0x00: KB, 1-zone with single color

Nice find. The asus-hid driver already implements this and checks for
0x00 to bail the backlight.

So that check should be removed as it does not work with single color
keyboards and instead checked for 2,3,4 to enable RGB.

This also means removing the RGB check and getting global support in one go.

Antheas

> - 0x01: KB, QWERASD-partition
> - 0x02: KB, 4-zone with RGB
> - 0x03: KB, Per-key with RGB
> - 0x04: KB, 1-zone with RGB
> - Other: reserved
>
> **Byte 7(keyboard language)**
> - 0x01: US
> - 0x02: UK
> - 0x03: JP
> - Other: reserved
>
> I've not done anything with this myself yet, circumstances last week
> weren't great for me. If you implement this in driver I will ensure I
> get it tested as I have both single colour and rgb laptops.
>
> What i *do* know is:
>
> - 0x00: KB, 1-zone with single color
> - 0x01: KB, QWERASD-partition
> These can be standard kb_backlight
>
> - 0x02: KB, 4-zone with RGB
> - 0x03: KB, Per-key with RGB
> - 0x04: KB, 1-zone with RGB
> These work with the regular EC-mode RGB command for static/solid colour
> and you don't need to worry about zone/per-key. It would be good to
> document those as defines or enum or something for future.
>
> Hope this helps.
>
> Cheers,
> Luke.

