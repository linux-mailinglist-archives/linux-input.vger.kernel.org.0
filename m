Return-Path: <linux-input+bounces-17178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62AD38FB0
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 17:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E4E0301D0E8
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 16:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC700218827;
	Sat, 17 Jan 2026 16:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="onLVGfB4"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380831F1932
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 16:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768666585; cv=none; b=gO4v5uk1ZTXiyrX9vV/4asUulw/wOTnc7067+9d3cwVQMJg1FldlBHU9pE/NsNoWT/K7pCGIWuEr1B+/1qZktF4We48HT2g1T9x+2Qd4pRIcuNRJadbhu5TQlJW/3ZSsfkBSsNtQRSDxyG6FS2Kz/73oCa2lS+MZgkl+0q9ub3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768666585; c=relaxed/simple;
	bh=KGzdFIxQo59W+UD8nRSGS+QGXlr7EUMod98Q0wJsRuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fujcXP1/iRSVfoM+fcnd/Cc+5TqNl0gxMCenyxaxlbcvVY83Et6TN+2pLqaIccP4ucyECLNjC3039wIRQkyvhnMHiMwxK4S8F4Ljyf+IJjQBH8pzDnn4YYXWSNHzhgfPo20KOdxbibIMg2iz79I3bH2jS9bUk6KY0u8rt9fM458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=onLVGfB4; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 5840B5E5F7
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:16:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 0B2115E5DF
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:16:22 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id EB286202553
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:16:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768666581;
	bh=DZPw1VZ3+Uvwt7O3r7v6Trt4FNzRMxNGpBnIIHWbny8=;
	h=Received:From:Subject:To;
	b=onLVGfB4Loa4fvPoqwQRL5qyCdgeDR4fWB5ipT0JkI4SGGoPQmEs6x364R32sf4B3
	 2hDk9Kdxx9+y5OSlt2XfsDASj1wyRjRcmPHsTtFW0Xyhn02jguFtEFcKZQvNxReEBJ
	 fYm+ikVsE5//zFSBtfgf48147aO50eVAiwAojVK4GHp6JBrjTeRgR1LcxMf6z6EIQb
	 tYs0dquEj/rta16jds02IewKXPkAG8J6e9G9e4urpS7c5AOTaHYP2F81sp82y8XANY
	 AfJWz0zFZak0nCZw+Qk3tPusaHH3PeUUuXVIe62wvlDNLNadP5vG4CMiWj12ZV7pkF
	 h5NHw76dsJjBg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-382fa663249so29409431fa.0
        for <linux-input@vger.kernel.org>;
 Sat, 17 Jan 2026 08:16:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9WpHPcZGdCaEDiWSeJMfRJJx2EiPr7T5kCxjV+IVlMjY+ALHn0Svjaf7BIhJrSyUeajbrX4/A5u/MDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUaLtRDbZAw/A1xO2q8NaYdzKK6hruxP+PNLveswUF5QGkRPo
	8tWFa3BUPuyojeQnhrk2/xxu0d0cktXKQ54XmmX2zJyM7jviuwWrhbXU9uMAjuH+qmZkhBCG0k7
	IfHSXO9OMX7kGWHeUqzUI+/j+Oq90wDM=
X-Received: by 2002:a2e:bc82:0:b0:383:593c:c47b with SMTP id
 38308e7fff4ca-3838435d299mr19662021fa.44.1768666580381; Sat, 17 Jan 2026
 08:16:20 -0800 (PST)
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
In-Reply-To: <be8ba636-ae07-4d42-88ca-57ecf10b7dae@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 17 Jan 2026 17:16:09 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGdhu_chetK6uQ=FXctC1D8LABj5QxVff1B486EKYSLug@mail.gmail.com>
X-Gm-Features: AZwV_QgNuMqCtqJVdJmjZ3e0BWq8o4g5r8yPSrTyGskG6qk4t0alzgXrbkvc7io
Message-ID: 
 <CAGwozwGdhu_chetK6uQ=FXctC1D8LABj5QxVff1B486EKYSLug@mail.gmail.com>
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
 <176866658119.2372075.6041834754846774521@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 17 Jan 2026 at 17:12, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 1/17/26 17:10, Antheas Kapenekakis wrote:
> > On Sat, 17 Jan 2026 at 16:13, Denis Benato <denis.benato@linux.dev> wrote:
> >>
> >> On 1/17/26 16:07, Antheas Kapenekakis wrote:
> >>> On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> On 1/17/26 00:10, Antheas Kapenekakis wrote:
> >>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>>>
> >>>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>>>> However, ID1 initializations are only required for RGB control and are
> >>>>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>>>> required for initializing the Anime display endpoint which is only
> >>>>>>> supported on devices with an Anime display. Both of these
> >>>>>>> initializations are out of scope for this driver (this is a brightness
> >>>>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>>>> for devices that do not support them in any case.
> >>>>>>>
> >>>>>>> At the same time, there are older NKEY devices that have only been
> >>>>>>> tested with these initializations in the kernel and it is not possible
> >>>>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>>>> working (currently unproven).
> >>>>>>>
> >>>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>>>> quirk in the block that performs the inits with that.
> >>>>>>>
> >>>>>>> In addition, as these initializations might not be supported by the
> >>>>>>> affected devices, change the function to not bail if they fail.
> >>>>>>>
> >>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>> ---
> >>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>>>> Hi Denis,
> >>>>> it is not the responsibility of this driver. ID2 is used by Anime
> >>>>> models. It is a concession to make sure that we do not cause a
> >>>>> regression that will cause warnings for a lot of users.
> >>>> Who decided it is a concession?
> >>> I would rather remove the extra calls unless they are shown to be
> >>> needed, which they might be for these PIDs.
> >> They are needed on older laptop and to not regress userspace.
> >>
> >> You just named _LEGACY an usb pid that is not legacy.
> >>> The quirk is named legacy because we can't retest these devices. If we
> >>> can, then we could remove the quirk and the inits if not needed.
> >> We can't retest every device, and that pid is used in pre-2021 models,
> >> and these are the unknown, I am criticizing the name of the quirk here,
> >> not what it does.
> > If you can test whether your device needs them that would be great.
> That is pointless.
> >> I am also questioning if the quirk is even needed since sending
> >> those commands to (at least) recent hardware that doesn't use
> >> those endpoints carries no downsides, while removing them
> >> surely does.
> > We have not found a device yet that needs them. I do not want to keep
> > sending unneeded commands. It could cause obscure bugs or interfere
> > with userspace software such as the one you maintain. So at least for
> > new hardware that is possible to test we should remove them.
> There is new hardware that needs them, as I said, including 2025 models.

I was not aware of that. As far as I know they are not needed. Do you
have a bug report with a specific laptop model I can look at?

Antheas

> > Antheas
> >
> >>> Antheas
> >>>
> >>>> Anyway I will move relevant code tied to these two to this driver,
> >>>> so it doesn't make sense to remove them anyway.
> >>>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>>>> No consequences.
> >>>>> In your laptop. In the other user's laptop, the get feature report fails
> >>>> for the response to be a failure (as it is supposed to be in mine and other models)
> >>>> and to cause problems are two different things. Here I am saying that the hardware
> >>>> correctly reports "unsupported" and nothing bad happens (if you ignore the return value).
> >>>>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>>>> and surely isn't legacy.
> >>>>> Sure, can you try removing the if block?
> >>>> I have asked to distribute a kernel that init ID1 and ID2 regardless
> >>>> of that quirk. We will soon know if it causes problems or not.
> >>>>> If it works in your laptop, that is one less reason to keep it for 19b6
> >>>> If it works in my laptop one more reason not to exclude code that
> >>>> works and haven't caused any problem ever.
> >>>>> Antheas
> >>>>>
> >>>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>               return -ENODEV;
> >>>>>>>
> >>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>> -             if (ret < 0)
> >>>>>>> -                     return ret;
> >>>>>>> -
> >>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>> -             if (ret < 0)
> >>>>>>> -                     return ret;
> >>>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>       }
> >>>>>>>
> >>>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>>>
> >>>>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>>>> However, ID1 initializations are only required for RGB control and are
> >>>>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>>>> required for initializing the Anime display endpoint which is only
> >>>>>>> supported on devices with an Anime display. Both of these
> >>>>>>> initializations are out of scope for this driver (this is a brightness
> >>>>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>>>> for devices that do not support them in any case.
> >>>>>>>
> >>>>>>> At the same time, there are older NKEY devices that have only been
> >>>>>>> tested with these initializations in the kernel and it is not possible
> >>>>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>>>> working (currently unproven).
> >>>>>>>
> >>>>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>>>> quirk in the block that performs the inits with that.
> >>>>>>>
> >>>>>>> In addition, as these initializations might not be supported by the
> >>>>>>> affected devices, change the function to not bail if they fail.
> >>>>>>>
> >>>>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>>>> ---
> >>>>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>>>> --- a/drivers/hid/hid-asus.c
> >>>>>>> +++ b/drivers/hid/hid-asus.c
> >>>>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>>>>>
> >>>>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>>>> No consequences.
> >>>>>>
> >>>>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>>>> and surely isn't legacy.
> >>>>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>>>               return -ENODEV;
> >>>>>>>
> >>>>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>> -             if (ret < 0)
> >>>>>>> -                     return ret;
> >>>>>>> -
> >>>>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>> -             if (ret < 0)
> >>>>>>> -                     return ret;
> >>>>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>>>       }
> >>>>>>>
> >>>>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>


