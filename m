Return-Path: <linux-input+bounces-16207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C7C6C495
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 02:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D2AD4E9B5E
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 01:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB122222597;
	Wed, 19 Nov 2025 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="VpD4xPXu"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CEA19F121
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763516720; cv=none; b=NnOo7nxZVYHcPolHMxCl1H7G3uP2avNFJW/lbEdYWXMWZe+r2Mb7FdMujG+NBVcm/F8F73qZxATDxfYFunBMPA90lGfbCKpJA/NqRM2x2z2L9B0m305xoSdj3PowrcKTQxHxajFpAvdTWg/LvYkOddxw006AZiBB8S9JV8RxLJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763516720; c=relaxed/simple;
	bh=fWsw1leZAz3YIgrIXLuW3E2vXzFT7Bgv/FYMwbzI9vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmVJ+8OsZVGtdtH3cUp+/R42lWnNJYLKomQ9mEyuwRa/R1tzi/eQmzzrgTCkDaCWlS25F+90+OfYJaUrHJ2MVQEXYfsqtpNN7vleR3OvJj/TR5cSZWgMpu1pS4Q5ejbJN+AdsdoowMFXOy2tG3jCNsuST8XhNyt4I/T86HCmyqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=VpD4xPXu; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id CF8695E4EF
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:45:15 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id A84A55DF08
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:45:13 +0200 (EET)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 8C80D201E86
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 03:45:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763516712;
	bh=3DukJ94hCH9mBd9EBGyp7R8LQE+qvuHVOkmQlhSgZUo=;
	h=Received:From:Subject:To;
	b=VpD4xPXuLdWL3QLlNR7TkcKjaI7nXThQcSuBMms1uV28P2dvr3Ss4pqBizZntpuIe
	 STB4zDft6/UoGd3myVQkI3q7Y4IaGLpkGabhL4UiV6RkcC2e8sFRUWsfeIHjH/R6el
	 WxGxPHOoKfX+5EHd7YhwtRFJ/lI+aPqi9dJ/cIgU9EN5b7Sw8uclI6usvue0RNw10U
	 LVKFuU2KfdbNaM8aPLU64RpfmAKiXIXA4j2773JV8wq9Q/dAPxG4EjYDWILkyXaJ++
	 5o9CWDNGNslpkysp8JlZvcUy0aj7/25ggLfGn96/RVDx9CS6qkcR74fTtbfipm5qlS
	 b2xjlUb46grzg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-37a5ab1e81fso52147281fa.1
        for <linux-input@vger.kernel.org>;
 Tue, 18 Nov 2025 17:45:12 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX7q+Cc5VCVwCeJXLZF4GlKZoIirqfJ0qDxledFnGeeRHqeR6lWOhfNqJNE9ES6OInK9fpr9QuFENfqOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZURNP3jqbodr+O0KmFD567Iu7pkmOuqza3ke6aSyX/7qtyIWt
	WHTnjZmTWW3VZUj5a6cIVyliDOGqWQxQKtfPe1oTP0XyP4BshtV7aq1cJd16Wrl0BHt+7d+x381
	f6DkCSMXHe2zB/uXN73v2nHc2iPbLtbU=
X-Google-Smtp-Source: 
 AGHT+IFCWBTAoXaF4+q/Ssj0obSGP7smcN3wKz29nGnXjF+xnUC6DtwAIpCJnPpAqiA0JjaF45Hi7li7DpAQEWcG0q8=
X-Received: by 2002:a05:651c:215c:b0:37b:9976:df0d with SMTP id
 38308e7fff4ca-37babbe374fmr38381331fa.21.1763516711970; Tue, 18 Nov 2025
 17:45:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-5-lkml@antheas.dev>
 <abeecb3b-8d51-4625-8743-1cfff355c0e9@gmail.com>
In-Reply-To: <abeecb3b-8d51-4625-8743-1cfff355c0e9@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Nov 2025 02:45:00 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEj94txMhgXPigbJxVxw4c=9vSTHNEjpmCXs_fKeSQcXQ@mail.gmail.com>
X-Gm-Features: AWmQ_blWA4wNnisWMtfDac2GAqSVzxr1SXJBqGC_agsYnTzSJvzcuyAd5Vhk5YY
Message-ID: 
 <CAGwozwEj94txMhgXPigbJxVxw4c=9vSTHNEjpmCXs_fKeSQcXQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices on
 ROG
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176351671280.1952047.141749689568729681@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Nov 2025 at 01:38, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 11/1/25 11:47, Antheas Kapenekakis wrote:
> > Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> > event devices with a pretty ASUSTEK name. When it loads, it concatenates
> > all applications per HID endpoint, renames them, and prints errors
> > when some of them do not have an input device.
> >
> > Therefore, change probe so that this is no longer the case. Stop
> > renaming the devices, omit the check for .input which causes errors
> > on e.g., the Z13 for some hiddev only devices, and move RGB checks
> > into probe.
> I have an issue with this "therefore" related to the renaming of device:
> you are basically doing here:
>
> state a matter of fact.
> Therefore, change that.
>
> Why? the check for .input is clear why, the rename not so much.
>
> I have a few more comments below about the rename.
> > Reviewed-by: Luke D. Jones <luke@ljones.dev>
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/hid/hid-asus.c | 52 ++++++++++++++++++++++++++++--------------
> >  1 file changed, 35 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index 03f0d86936fc..726f5d8e22d1 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define T100CHI_MOUSE_REPORT_ID 0x06
> >  #define FEATURE_REPORT_ID 0x0d
> >  #define INPUT_REPORT_ID 0x5d
> > +#define HID_USAGE_PAGE_VENDOR 0xff310000
> >  #define FEATURE_KBD_REPORT_ID 0x5a
> >  #define FEATURE_KBD_REPORT_SIZE 64
> >  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > @@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> > +#define QUIRK_SKIP_REPORT_FIXUP              BIT(14)
> >
> >  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >                                                QUIRK_NO_INIT_REPORTS | \
> > @@ -125,7 +127,6 @@ struct asus_drvdata {
> >       struct input_dev *tp_kbd_input;
> >       struct asus_kbd_leds *kbd_backlight;
> >       const struct asus_touchpad_info *tp;
> > -     bool enable_backlight;
> >       struct power_supply *battery;
> >       struct power_supply_desc battery_desc;
> >       int battery_capacity;
> > @@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
> >  static int asus_event(struct hid_device *hdev, struct hid_field *field,
> >                     struct hid_usage *usage, __s32 value)
> >  {
> > -     if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> > +     if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
> >           (usage->hid & HID_USAGE) != 0x00 &&
> >           (usage->hid & HID_USAGE) != 0xff && !usage->type) {
> >               hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> > @@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
> >
> >       drvdata->input = input;
> >
> > -     if (drvdata->enable_backlight &&
> > -         !asus_kbd_wmi_led_control_present(hdev) &&
> > -         asus_kbd_register_leds(hdev))
> > -             hid_warn(hdev, "Failed to initialize backlight.\n");
> > -
> >       return 0;
> >  }
> >
> > @@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
> >                       return -1;
> >               }
> >
> > -             /*
> > -              * Check and enable backlight only on devices with UsagePage ==
> > -              * 0xff31 to avoid initializing the keyboard firmware multiple
> > -              * times on devices with multiple HID descriptors but same
> > -              * PID/VID.
> > -              */
> > -             if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> > -                     drvdata->enable_backlight = true;
> > -
> >               set_bit(EV_REP, hi->input->evbit);
> >               return 1;
> >       }
> > @@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
> >
> >  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >  {
> > -     int ret;
> > +     struct hid_report_enum *rep_enum;
> >       struct asus_drvdata *drvdata;
> > +     struct hid_report *rep;
> > +     int ret, is_vendor = 0;
> >
> Why is is_vendor an int? Don't we have bools?
> >       drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
> >       if (drvdata == NULL) {
> > @@ -1218,12 +1207,37 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >               return ret;
> >       }
> >
> > +     /* Check for vendor for RGB init and handle generic devices properly. */
> > +     rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> > +     list_for_each_entry(rep, &rep_enum->report_list, list) {
> > +             if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
> > +                     is_vendor = true;
> > +     }
> > +
> > +     /*
> > +      * For ROG keyboards, disable fixups except vendor devices.
> > +      */
> multiline comment for no reason. Comma doesn't provide any value here.
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
> > +             drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
> > +
> Doing this will skip the report fixup entirely while before
> it was called in every case: are we really sure we want this?
> Or do we want it only for specific devices?
>
> It's my understanding that function is only useful on
> keyboard devices, so before keyboard devices (all)
> while now is_vendor keyboard devices, right?

ROG Keyboard devices have multiple HID endpoints. This driver only
hooks to the 0xff31 endpoint. So the rest of the endpoints should not
be modified. Except for minor fixups, see below.

> What about keyboard devices that are not is_vendor
> for which function isn't called anymore?
> >       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> >       if (ret) {
> >               hid_err(hdev, "Asus hw start failed: %d\n", ret);
> >               return ret;
> >       }
> >
> > +     if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> > +         !asus_kbd_wmi_led_control_present(hdev) &&
> > +         asus_kbd_register_leds(hdev))
> > +             hid_warn(hdev, "Failed to initialize backlight.\n");
> > +
> > +     /*
> > +      * For ROG keyboards, skip rename for consistency and ->input check as
> > +      * some devices do not have inputs.
> > +      */
> > +     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> > +             return 0;
> > +
> This is a moot point: I have yet to see the real benefit of doing this,
> but one thing is sure... having for the same driver multiple name
> to basically the same interface across different lineups of
> hardware is not something I would call "consistency".

The reason the rename exists here is because the devices this driver
applied to originally did not have proper names (e.g. I2C). The new
ROG devices do have proper names, so there is no reason to deviate
from those. It also eliminates a point of failure in which the
hid-asus driver is not loaded, if your point is consistency. Ie, as we
add more keyboard IDs, those would then not be renamed when hid-asus
starts to load them.

As for affected software (per your other email), yes it is only
Inputplumber when running on its fallback mode without access to its
OOT modules that disable this driver. Because it had an architectural
decision to rely on hardcoded evdev/phys names for most devices
instead of more canonical vid/pid/capability matches. The phys part is
especially problematic as it also hardcodes the bus node of a lot of
devices. There is a PR open to remove the matches for the Ally units
though.

If you want to know about other software that relies on names, SDL is
the main one. And the reason for that is so that it matches the kernel
driver. E.g., when a playstation 5 controller loads using
hid_playstation, it has a different mapping and name than when it
loads through hid core. My software also relies on it for WMI
keyboards, as those have a vid:pid of 0:0 so it is unavoidable.

SDL does not map keyboards so it is not affected. Moreover, as this
series makes it so the device has the same name as with the driver not
loaded, software such as SDL would have a fallback mapping for that
name already.

> As I said already I want you to either drop this or to present
> a list of pros of doing this and to hear from Derek the plan
> going forward to avoid breaking anything.
> >       /*
> >        * Check that input registration succeeded. Checking that
> >        * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> > @@ -1352,6 +1366,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> >               rdesc = new_rdesc;
> >       }
> >
> > +     /* Vendor fixups should only apply to NKEY vendor devices. */
> > +     if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
> > +             return rdesc;
> > +
> Uhm... no? Or at least it's not obvious why.
>
> If this is the case why is the check not at the top of the function?

Because the checks above apply to e.g., touchpad devices. This was
actually a bug with this series in previous versions. Only the report
fixups should be skipped. Specifically, with previous versions a HID
application mute was skipped, which caused certain keyboards to show
up as range finders if I recall (there is a comment for it in this
driver).

The report fixups that are below this check are only applicable to the
0xff31 devices that emit 0x5a events. Specifically, this driver
"abuses" the HID subsystem a bit to make the vendor report, which is
not a HID input device, appear as an input device, by mutating its
descriptor. But refactoring that would be too painful. At least with
this we make the fixup apply more precisely to only those devices.

I kindly ask you finish your comments until tomorrow evening, so I can
resend this series.

Thanks,
Antheas

> Beside please refrain from using "should" in this context unless
> backed up by evidence or it's otherwise obvious as "should"
> can have many different interpretations.
> >       if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> >                       *rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
> >                       rdesc[204] == 0x95 && rdesc[205] == 0x05) {
>


