Return-Path: <linux-input+bounces-11087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56562A6C8E0
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77648189EF80
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 09:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48081F37B8;
	Sat, 22 Mar 2025 09:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="eFufEOGV"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA47B1F37D3;
	Sat, 22 Mar 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742637511; cv=none; b=IqmYEmVOnyaTN7YccXmbAO07mascH6+kxlSa/XXOcZbuOVQeGplkJwVdOVa7gCFnig9NbY2wTTVb55iWONt5j7NOndm5il983GBGl4bGGgQDxPPYhDjmazqjT8kSNubwswwvBVZYOT84hvCd2/boGZeKOXD1hXu41uvdytRS8XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742637511; c=relaxed/simple;
	bh=4dfmcRk1OLKp9tORmX4/cihXy1SJnCBGABmNvGEZMqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i/Ut9zNEs5Ya26wp/Z5X1wT5h2FNSETKaiwm94VXBZEdjL7tF850q0VB37lxAH6vjXsOeqBywOkQShgqDAGzObVmpquw3ZFOtkjJ0t/o/JvVSu22MDGaDpwDkRSzp2erzckGVMYvy8ad+V183EQa/o1y5OKX4TUZN7klsa+wnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=eFufEOGV; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 4194A2E08B73;
	Sat, 22 Mar 2025 11:58:26 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742637506;
	bh=MkcUoN3DXAINtjOgcrLQSScw4g+RcHPnnTy/OUjuDUg=;
	h=Received:From:Subject:To;
	b=eFufEOGVQd3zjV+OFqbLFS+syePF8MA5EZ4Y9m3lFZonzvRGljqhJOEH+a1HjUAFa
	 BpEhJklN4uaDT2KHhczXjNBa+KKQTCinAV5SXF8F1pSS6xNeMD33o4UqXfZ1gYgfcC
	 4Ea6J472XT7gkoEWZhEVT1nQDqKnmJ6Bj/SWlRuw=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso29800111fa.1;
        Sat, 22 Mar 2025 02:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUTpTlKRcWM+RGYN6dClTkyKM6PQ5bbgAUw6iYJIksnOZ5ZUTi2QOViC2sOkeRw3JtX/Q9TipTJ53q+YA==@vger.kernel.org,
 AJvYcCUxEyzZL2k7j6KVb/+MeHFeOSuRQUB8lM8bHLdFRcHRZdMw32XR99zmaqajXPIpQr2LQf82fdv8MwfrO/b8@vger.kernel.org
X-Gm-Message-State: AOJu0YyX9/sLp8jLttnpw1QSdoAJKYsDP5r9bx9HuBIWDzoMVleqw6A0
	3aokmVthDr8FQbbITKceUg9rg8ZcFNYSE+bpuHWK5AanjJycg0m2XIY5AfsPEHSLt4iFt/JfV/j
	8GesYpOUa98B0O94J7kihsrqjl2Y=
X-Google-Smtp-Source: 
 AGHT+IGknypFMdL7FiBdvUr0VzSHgqG2SR4AAWUp5ZkFqfmssXRrqyZq67UIkTUSipQuxSW3O36Pe2K8zKV3hnYGVYA=
X-Received: by 2002:a2e:984b:0:b0:30b:d073:9e7d with SMTP id
 38308e7fff4ca-30d7e2da05bmr22439411fa.37.1742637505588; Sat, 22 Mar 2025
 02:58:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320220924.5023-1-lkml@antheas.dev>
 <20250320220924.5023-12-lkml@antheas.dev>
 <d2746ddf-92d5-4ac8-b361-60d1ec9aabb5@ljones.dev>
 <CAGwozwGMNchNXckSZ=HPyi=sFEjrLDzayqjHDSOwwb8MQ=rJPg@mail.gmail.com>
 <fed995c3-5591-43d3-ac82-dcb6fe1c0c61@ljones.dev>
In-Reply-To: <fed995c3-5591-43d3-ac82-dcb6fe1c0c61@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 22 Mar 2025 10:58:14 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE_uDcUE5jyKTj=zDVJhXuw+tV_QojXEwXSeXbx3gpSsQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrt-PjNZAZPu8p2TdJb_q4haXnKPkV8lKwfwhn2ePcB7kP_TKc-Cm_1n-c
Message-ID: 
 <CAGwozwE_uDcUE5jyKTj=zDVJhXuw+tV_QojXEwXSeXbx3gpSsQ@mail.gmail.com>
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
 <174263750657.4024.1421460157834020327@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Mar 2025 at 10:53, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 22/03/25 20:56, Antheas Kapenekakis wrote:
> > On Sat, 22 Mar 2025 at 03:30, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >> On 21/03/25 11:09, Antheas Kapenekakis wrote:
> >>> Apply the RGB quirk to the QOG Ally units to enable basic RGB support.
> >>>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>    drivers/hid/hid-asus.c | 4 ++--
> >>>    1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>> index 5e87923b35520..589b32b508bbf 100644
> >>> --- a/drivers/hid/hid-asus.c
> >>> +++ b/drivers/hid/hid-asus.c
> >>> @@ -1449,10 +1449,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>          QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
> >>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>            USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
> >>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
> >>>        { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>            USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
> >>>          QUIRK_ROG_CLAYMORE_II_KEYBOARD },
> >>
> >> I need to NACK this one sorry, if only because I added the RGB control
> >> in hid-asus-ally as a per-LED control and it works very well. You'll see
> >> it once I submit that series upstream again.
> >
> > Depending on when your driver is ready to merge, it might be
> > beneficial for this to merge ahead of time for some basic support.
> > Then you can yank it after your driver is in. For your driver, I think
> > it would be good to make it separate from hid-asus and yank ally
> > completely from here.
>
> The driver is fully standalone and that is what I do yes.
>
> I do think it would be better for you to do the RGB part separate to the
> main lot of patches as those can definitely be signed off and merged a
> lot quicker. You still have the bazzite kernel right? I hope it's
> acceptable to carry just the RGB there for a tiny bit longer.

Sure, I will keep it for v3 as that is almost done now but afaik it
does not have to merge together.

> >> The distinction between MCU mode and Software mode for RGB is frankly a
> >> pain in the arse. For Ally we will want software mode (per-led) as that
> >> allows just one USB write for all LEDs, and no need to do a set/apply to
> >> make the LEDs change. The benefit being that the LEDs can change rapidly
> >> and there will be no "blink".
> >
> > The blink happens when the B4(/B5) command is sent. If they are not,
> > it is perfectly fine. B4 just needs to be sent initially, as it
> > switches the controller to solid mode if it is not there already. Then
> > B4/B5 could be sent on shutdown to save the color to memory. I
> > purposely did not do it as it would break the driver if userspace
> > controls the leds inbetween led switches and it is needlessly
> > complicated for what this support is meant for (basic RGB).
>
> Hmm, I thought the colour wasn't actually applied until at least a "set"
> was sent. Maybe it's on older devices.. I haven't looked at that for a
> while now.

I would have to recheck, but I am pretty sure that as long as you are
in the solid mode, color changes apply instantly. There are no flashes
on my end.

> > Also, multizone is expected to be of little utility, so it is not
> > worth making concessions over. I never found a use for it or anyone
> > ask for it. If single zone has performance benefits, it should be used
> > instead. A lot of devices do not support multizone, and when they do,
> > it is in different forms, so it is not something that can be
> > intuitively put into a kernel driver imo.
>
> Would you like to know how many varieties of single, multi, and per key
> there are? I have a rather large spread sheet tracking everything so
> far. Per-key + bars is something like 12-13 packets to send :|

I think when it comes to the kernel, doing just a solid color would go
a long way.

> > Aura mode is especially buggy during boot and resume, since the
> > controller briefly switches from the MCU mode to that, so it uses a
> > stale color which is ugly. Even when you try to match the colors, as
> > you did, it is not 1-1. You know this too. In addition, Aura mode will
> > break userspace Aura programs running through Wine. Although they are
> > already broken due to the hiddevs merging which I had to revert for
> > V2. But we could fix that, and I will try to for V3.
>
> Aura programs can set the device back to MCU mode. Or they should be
> able to. The RGB setup is done only when called through the mcled class,
> and on suspend (to colour match and set static).

I recall one of the previous versions of your patch doing a dirty
brightness set during the controller init. If you fix that it should
be alright.

Antheas

> Cheers,
> Luke.
>
> >> I'll write more on patch 10
> >>
> >> Cheers,
> >> Luke.
>

