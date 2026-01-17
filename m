Return-Path: <linux-input+bounces-17182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A5D39077
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 20:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27D9F30024EA
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 19:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2501D7E5C;
	Sat, 17 Jan 2026 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YhcgPSux"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1424A7640E
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 19:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768677461; cv=none; b=P2Qq6m1w9lO8cveObVFXLmCpFrSpzvJdj39gCPz0bvkNK7CTDRKnZGJZYwCPwBQj8iBD4LnSWtbLzo4IaA8XrsoFttPRGAwjKclkbhchcEnaPdtnS16+6QN80GN4qGb6/vDiaeWm5FjQsX5jbDruO6FxO3biYmlu72g8MtstLfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768677461; c=relaxed/simple;
	bh=penRADWF55Mf+oRTDG07Vdbp1onAfjPVc1ZSEcN1y04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZibqetyv3AXZxpkvMFtPJji86f5KG7kFCTYJOzp77ol/ys0pacA7WYYphPNwX1TU5Wm5dHFkB4anolQVrNtggBAKa/d1EI+GhJZVquiM1HYr/K9u2jdnxFmbRkXpK1K4+2bndVoIJCofxoX8sbTv5f3siMxz4INyZr5mD8DbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YhcgPSux; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 2E276408E0
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 19:17:37 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 88D1340808
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 19:17:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D2041202564
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 21:17:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768677455;
	bh=ITwU2bmJrFoO5pwayYT4Vj6ZTDgbQ/POO2U4k2B/IcA=;
	h=Received:From:Subject:To;
	b=YhcgPSuxYYnnwsTvSbtgSxLMOClQdiPUzdMg+tvOVy+IalhBxMOOHM6Ko8CRwz/uw
	 W8v8DFN0u7hE1SDe8hBzkAPkikO4QukXw6q1w8tXI4vc/7svSykwKgTqJJUufH55nC
	 nPMrUWzmLtK5bhdEniW91+naev54jrPNI2Etje04pq04KI/mqCxdtGzGvikKAlidC/
	 949mr3c2102uK+9ZE/+I/InZYgyPt9TU0E+mFR7uG8K0WHb7z5ugbDuZnKofG+erFT
	 DYceuaLqAcN+G8UZzgxrB4ZjerOlUTlEmJIRAdn4FKK8pNXSwVsmyIFWNviWEsp1G3
	 I+7ltYEgDNJ1A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3831ad8ae4eso27067631fa.1
        for <linux-input@vger.kernel.org>;
 Sat, 17 Jan 2026 11:17:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXqEhW8ooVbDCElgH/AwoCygmZhtr3DpjcZkLDo9HtemWlDyDM2p7AQm+LDCuhb8rUuZlgQjxgU7qC01w==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd43qBkKeNvbcCiH7amaClKVWcPrDfOaOXNHK+TopB/2MXHUE8
	UrLRDmx2SCDwRBCHAX+J/MeX3KAEkdDeBH/ilhVk60F1mZvvDzOMes+rVXPYcobS9G8xhqYL0B2
	S9ddGxP9UODNLGwuYB/Kvl6zFcSZvCIY=
X-Received: by 2002:a05:651c:41c9:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-3838692bdcdmr17292931fa.20.1768677454208; Sat, 17 Jan 2026
 11:17:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116133150.5606-1-lkml@antheas.dev>
 <20260116133150.5606-3-lkml@antheas.dev>
 <14407ba9-34f1-4114-bfb3-043b53ea7769@linux.dev>
 <CAGwozwGyUpBq4GGvyDHj089a9-vxNOnqgSBys3-CC_+tKDywaA@mail.gmail.com>
 <fe66c416-161c-489e-a38f-9dc7729c6ed7@linux.dev>
 <CAGwozwESNrQZ240_qDMf1pdpCRXooxstGcqP10cGp=q-F_SrAQ@mail.gmail.com>
 <8102eb26-5206-49e6-a994-a9d3ea480255@linux.dev>
 <CAGwozwH71LDiBFM-Ro9UpZNy29C6HHwCNZjwCS3F1hMfuUXZ4g@mail.gmail.com>
 <be8ba636-ae07-4d42-88ca-57ecf10b7dae@linux.dev>
 <CAGwozwGdhu_chetK6uQ=FXctC1D8LABj5QxVff1B486EKYSLug@mail.gmail.com>
 <e4349b27-86e1-41d6-864f-5ad6d353dc46@linux.dev>
In-Reply-To: <e4349b27-86e1-41d6-864f-5ad6d353dc46@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 17 Jan 2026 20:17:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF--y3vsqhdqYFV_x1ff7jfSkYaQHeV1OV70yue7Huk=A@mail.gmail.com>
X-Gm-Features: AZwV_Qg7cYyr_c-z0XQnRAl3IZuNBO3gxO2TLa04ob2f4pQs-hLZtAxLg5PzLHw
Message-ID: 
 <CAGwozwF--y3vsqhdqYFV_x1ff7jfSkYaQHeV1OV70yue7Huk=A@mail.gmail.com>
Subject: Re: [PATCH v11 02/11] HID: asus: initialize additional endpoints only
 for legacy devices
To: Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176867745506.3083347.11733035458592039982@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 17 Jan 2026 at 18:05, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 1/17/26 17:16, Antheas Kapenekakis wrote:
> > On Sat, 17 Jan 2026 at 17:12, Denis Benato <denis.benato@linux.dev> wrote:
> >>
> >> On 1/17/26 17:10, Antheas Kapenekakis wrote:
> >>> On Sat, 17 Jan 2026 at 16:13, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> On 1/17/26 16:07, Antheas Kapenekakis wrote:
> >>>>> On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.dev> wrote:
> >>>>>> On 1/17/26 00:10, Antheas Kapenekakis wrote:
> >>>>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>>>>>
> >>>>>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>>>>>> However, ID1 initializations are only required for RGB control and are
> >>>>>>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>>>>>> required for initializing the Anime display endpoint which is only
> >>>>>>>>> supported on devices with an Anime display. Both of these
> >>>>>>>>> initializations are out of scope for this driver (this is a brightness
> >>>>>>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>>>>>> for devices that do not support them in any case.
> >>>>>>>>>
> >>>>>>>>> At the same time, there are older NKEY devices that have only been
> >>>>>>>>> tested with these initializations in the kernel and it is not possible
> >>>>>>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>>>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>>>>>> working (currently unproven).
> >>>>>>>>>
> >>>>>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>>>>>> quirk in the block that performs the inits with that.
> >>>>>>>>>
> >>>>>>>>> In addition, as these initializations might not be supported by the
> >>>>>>>>> affected devices, change the function to not bail if they fail.
> >>>>>>>>>
> >>>>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>>> ---
> >>>>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>>>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>>>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>>>>>> Hi Denis,
> >>>>>>> it is not the responsibility of this driver. ID2 is used by Anime
> >>>>>>> models. It is a concession to make sure that we do not cause a
> >>>>>>> regression that will cause warnings for a lot of users.
> >>>>>> Who decided it is a concession?
> >>>>> I would rather remove the extra calls unless they are shown to be
> >>>>> needed, which they might be for these PIDs.
> >>>> They are needed on older laptop and to not regress userspace.
> >>>>
> >>>> You just named _LEGACY an usb pid that is not legacy.
> >>>>> The quirk is named legacy because we can't retest these devices. If we
> >>>>> can, then we could remove the quirk and the inits if not needed.
> >>>> We can't retest every device, and that pid is used in pre-2021 models,
> >>>> and these are the unknown, I am criticizing the name of the quirk here,
> >>>> not what it does.
> >>> If you can test whether your device needs them that would be great.
> >> That is pointless.
> >>>> I am also questioning if the quirk is even needed since sending
> >>>> those commands to (at least) recent hardware that doesn't use
> >>>> those endpoints carries no downsides, while removing them
> >>>> surely does.
> >>> We have not found a device yet that needs them. I do not want to keep
> >>> sending unneeded commands. It could cause obscure bugs or interfere
> >>> with userspace software such as the one you maintain. So at least for
> >>> new hardware that is possible to test we should remove them.
> >> There is new hardware that needs them, as I said, including 2025 models.
> > I was not aware of that. As far as I know they are not needed. Do you
> > have a bug report with a specific laptop model I can look at?
> There is current effort to integrate commands that requires those
> initializations on 2025 laptop, why would I strip out a command
> that I already know is required anyway?

Hi,
yes ID1 is required for RGB, I have a draft patch for it that would
lazily do it if RGB is supported.

I recall now a previous discussion about it being required for some
laptop shortcuts but we never found a laptop that needs it so I forgot

> No, this is not the way to go to knowingly and willingly cause
> troubles (both known and unknown) to others just because
> you think it's better this way.
>
> Change the name of _LEGACY to something else, have this accepted
> and then if I see it's appropriate  to remove the if and send those
> regardless I will.

Sure, up to you if you want to change the name. What would you like it
be? I would like this series to merge

Antheas

> > Antheas
> >
> >>> Antheas
> >>>
> >>>>> Antheas
> >>>>>
> >>>>>> Anyway I will move relevant code tied to these two to this driver,
> >>>>>> so it doesn't make sense to remove them anyway.
> >>>>>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>>>>>> No consequences.
> >>>>>>> In your laptop. In the other user's laptop, the get feature report fails
> >>>>>> for the response to be a failure (as it is supposed to be in mine and other models)
> >>>>>> and to cause problems are two different things. Here I am saying that the hardware
> >>>>>> correctly reports "unsupported" and nothing bad happens (if you ignore the return value).
> >>>>>>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>>>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>>>>>> and surely isn't legacy.
> >>>>>>> Sure, can you try removing the if block?
> >>>>>> I have asked to distribute a kernel that init ID1 and ID2 regardless
> >>>>>> of that quirk. We will soon know if it causes problems or not.
> >>>>>>> If it works in your laptop, that is one less reason to keep it for 19b6
> >>>>>> If it works in my laptop one more reason not to exclude code that
> >>>>>> works and haven't caused any problem ever.
> >>>>>>> Antheas
> >>>>>>>
> >>>>>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>>>               return -ENODEV;
> >>>>>>>>>
> >>>>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>>>> -             if (ret < 0)
> >>>>>>>>> -                     return ret;
> >>>>>>>>> -
> >>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>>> -             if (ret < 0)
> >>>>>>>>> -                     return ret;
> >>>>>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>>>>>
> >>>>>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>>>>>> However, ID1 initializations are only required for RGB control and are
> >>>>>>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>>>>>> required for initializing the Anime display endpoint which is only
> >>>>>>>>> supported on devices with an Anime display. Both of these
> >>>>>>>>> initializations are out of scope for this driver (this is a brightness
> >>>>>>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>>>>>> for devices that do not support them in any case.
> >>>>>>>>>
> >>>>>>>>> At the same time, there are older NKEY devices that have only been
> >>>>>>>>> tested with these initializations in the kernel and it is not possible
> >>>>>>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>>>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>>>>>> working (currently unproven).
> >>>>>>>>>
> >>>>>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>>>>>> quirk in the block that performs the inits with that.
> >>>>>>>>>
> >>>>>>>>> In addition, as these initializations might not be supported by the
> >>>>>>>>> affected devices, change the function to not bail if they fail.
> >>>>>>>>>
> >>>>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>>>> ---
> >>>>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>>>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>>>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>>>>>>>
> >>>>>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>>>>>> No consequences.
> >>>>>>>>
> >>>>>>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>>>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>>>>>> and surely isn't legacy.
> >>>>>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>>>               return -ENODEV;
> >>>>>>>>>
> >>>>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>>>> -             if (ret < 0)
> >>>>>>>>> -                     return ret;
> >>>>>>>>> -
> >>>>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>>> -             if (ret < 0)
> >>>>>>>>> -                     return ret;
> >>>>>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>>>       }
> >>>>>>>>>
> >>>>>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>


