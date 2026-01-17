Return-Path: <linux-input+bounces-17176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB16D38FA9
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 17:10:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60978300EE70
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 16:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B355D240611;
	Sat, 17 Jan 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="R25asDKm"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEBC17B425
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768666224; cv=none; b=F3H9yOfbCyaNSLYMjFAsusGzu5i/uIouqGrX/rmunw7pB7n7eOXbexSDcW8Bhc1qARvwDELbdfXDaP62H2pIcOGsJHgRJWGqiP0fQle0m6oUjtcopEyKnW9/VTTZx+YBoFjWy8yJhAVG5IEO7T6dL/HlOAhTxLHXVlUf7JvrCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768666224; c=relaxed/simple;
	bh=0a8v+y+ZkSOFgc1vwfysLHGt3T7Pkd1Q4nsFNeM3Qqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UiTST8F5KL7+V3e8B38nuoBLCvIUrzRIXHW4XO5hYPN3ba3MaCCIpIGW25P/8d4QMkDwgfgBMLLlte1I6fk9e+lPfDFpUVyHUDFSyUuJVzrxfyIXPHgyz+nq83n5uuvxCXoDFOPGJPVkRsj57cpSsTihjpezdi3vp+E0tx0JHj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=R25asDKm; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id B2232C3A07
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:10:20 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 8E8F0C3A8A
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:10:19 +0200 (EET)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D8829202553
	for <linux-input@vger.kernel.org>; Sat, 17 Jan 2026 18:10:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1768666219;
	bh=iEXUp2Amv60cuYLy9uoTW/ieGF2vYWGKp0ezfX3Pdmw=;
	h=Received:From:Subject:To;
	b=R25asDKmtsH2AUIhdfl5zIvTL7Fs7tP4pHTXU6QqFBIZiW/y1+/bJ8QklBKFZ0TT5
	 qpOFBbNRAHhUn15MdjzudU3CtauKkA2R8hS9kS+OwqVLsoYuYJe/btBXtJUiceO/or
	 cz2IPKKEzRNVs6d4w2BHqDLXy430ffAEm0jUQlIvV0vUJfEEBchrqb0IXFV3W7i2G6
	 pXvDCenOVONurTwPSUdQ8g3TT67Cy2znm7Rr5TLvvH/7/9ivFY5LAr6PvDY/ZXxtf+
	 aGsfWwSFRo0Rw4muEHAiqkecQTsDuIaEXx3OWKIjj94qGceyWOvEqhJpx+91WKpE/q
	 Yv65NFr4yDtWA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-38316d0c26eso25371431fa.2
        for <linux-input@vger.kernel.org>;
 Sat, 17 Jan 2026 08:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW5RwdN5xlpBzIe2r4QwS4NKZwKgSgb9cs3QkCN5+9AHZFBDcdxl+uVocyfdABqZIaySgscScpDgF36eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz5QIosr5uUavEGVGeOiGs2zcsY7wZwcBN6qN6/ZfwDVRSjbEc
	3SpLTDFs1PVb0UyHRl/I7N+MYKMv2/npId15sQTYbjWQP85ZvbJqIv7JBPDQDvElYFh6lr3/pAu
	rpUnUbXc5eLjjKs+7Ko93NvPORo/ZfK8=
X-Received: by 2002:a05:651c:50b:b0:382:3ffd:80d0 with SMTP id
 38308e7fff4ca-38386a353ffmr20978511fa.26.1768666218288; Sat, 17 Jan 2026
 08:10:18 -0800 (PST)
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
In-Reply-To: <8102eb26-5206-49e6-a994-a9d3ea480255@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 17 Jan 2026 17:10:06 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH71LDiBFM-Ro9UpZNy29C6HHwCNZjwCS3F1hMfuUXZ4g@mail.gmail.com>
X-Gm-Features: AZwV_QgAfQpXy2WI73wEJs_ddXqR5a1Ex7GmITyVimsGoq_Ml7ZDNbPvTUy-1Ko
Message-ID: 
 <CAGwozwH71LDiBFM-Ro9UpZNy29C6HHwCNZjwCS3F1hMfuUXZ4g@mail.gmail.com>
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
 <176866621912.2349635.8555189955826592521@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 17 Jan 2026 at 16:13, Denis Benato <denis.benato@linux.dev> wrote:
>
>
> On 1/17/26 16:07, Antheas Kapenekakis wrote:
> > On Sat, 17 Jan 2026 at 14:51, Denis Benato <denis.benato@linux.dev> wrote:
> >>
> >> On 1/17/26 00:10, Antheas Kapenekakis wrote:
> >>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>
> >>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>> However, ID1 initializations are only required for RGB control and are
> >>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>> required for initializing the Anime display endpoint which is only
> >>>>> supported on devices with an Anime display. Both of these
> >>>>> initializations are out of scope for this driver (this is a brightness
> >>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>> for devices that do not support them in any case.
> >>>>>
> >>>>> At the same time, there are older NKEY devices that have only been
> >>>>> tested with these initializations in the kernel and it is not possible
> >>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>> working (currently unproven).
> >>>>>
> >>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>> quirk in the block that performs the inits with that.
> >>>>>
> >>>>> In addition, as these initializations might not be supported by the
> >>>>> affected devices, change the function to not bail if they fail.
> >>>>>
> >>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>> --- a/drivers/hid/hid-asus.c
> >>>>> +++ b/drivers/hid/hid-asus.c
> >>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>> Hi Denis,
> >>> it is not the responsibility of this driver. ID2 is used by Anime
> >>> models. It is a concession to make sure that we do not cause a
> >>> regression that will cause warnings for a lot of users.
> >> Who decided it is a concession?
> > I would rather remove the extra calls unless they are shown to be
> > needed, which they might be for these PIDs.
> They are needed on older laptop and to not regress userspace.
>
> You just named _LEGACY an usb pid that is not legacy.
> > The quirk is named legacy because we can't retest these devices. If we
> > can, then we could remove the quirk and the inits if not needed.
> We can't retest every device, and that pid is used in pre-2021 models,
> and these are the unknown, I am criticizing the name of the quirk here,
> not what it does.

If you can test whether your device needs them that would be great.

> I am also questioning if the quirk is even needed since sending
> those commands to (at least) recent hardware that doesn't use
> those endpoints carries no downsides, while removing them
> surely does.

We have not found a device yet that needs them. I do not want to keep
sending unneeded commands. It could cause obscure bugs or interfere
with userspace software such as the one you maintain. So at least for
new hardware that is possible to test we should remove them.

Antheas

> > Antheas
> >
> >> Anyway I will move relevant code tied to these two to this driver,
> >> so it doesn't make sense to remove them anyway.
> >>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>> No consequences.
> >>> In your laptop. In the other user's laptop, the get feature report fails
> >> for the response to be a failure (as it is supposed to be in mine and other models)
> >> and to cause problems are two different things. Here I am saying that the hardware
> >> correctly reports "unsupported" and nothing bad happens (if you ignore the return value).
> >>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>> and surely isn't legacy.
> >>> Sure, can you try removing the if block?
> >> I have asked to distribute a kernel that init ID1 and ID2 regardless
> >> of that quirk. We will soon know if it causes problems or not.
> >>> If it works in your laptop, that is one less reason to keep it for 19b6
> >> If it works in my laptop one more reason not to exclude code that
> >> works and haven't caused any problem ever.
> >>> Antheas
> >>>
> >>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>               return -ENODEV;
> >>>>>
> >>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> -
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>       }
> >>>>>
> >>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>> On Fri, 16 Jan 2026 at 21:44, Denis Benato <denis.benato@linux.dev> wrote:
> >>>> On 1/16/26 14:31, Antheas Kapenekakis wrote:
> >>>>
> >>>>> Currently, ID1/ID2 initializations are performed for all NKEY devices.
> >>>>> However, ID1 initializations are only required for RGB control and are
> >>>>> only supported for RGB capable devices. ID2 initializations are only
> >>>>> required for initializing the Anime display endpoint which is only
> >>>>> supported on devices with an Anime display. Both of these
> >>>>> initializations are out of scope for this driver (this is a brightness
> >>>>> control and keyboard shortcut driver) and they should not be performed
> >>>>> for devices that do not support them in any case.
> >>>>>
> >>>>> At the same time, there are older NKEY devices that have only been
> >>>>> tested with these initializations in the kernel and it is not possible
> >>>>> to recheck them. There is a possibility that especially with the ID1
> >>>>> initialization, certain laptop models might have their shortcuts stop
> >>>>> working (currently unproven).
> >>>>>
> >>>>> For an abundance of caution, only initialize ID1/ID2 for those older
> >>>>> NKEY devices by introducing a quirk for them and replacing the NKEY
> >>>>> quirk in the block that performs the inits with that.
> >>>>>
> >>>>> In addition, as these initializations might not be supported by the
> >>>>> affected devices, change the function to not bail if they fail.
> >>>>>
> >>>>> Acked-by: Benjamin Tissoires <bentiss@kernel.org>
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>  drivers/hid/hid-asus.c | 16 ++++++----------
> >>>>>  1 file changed, 6 insertions(+), 10 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>>>> index 323e6302bac5..dc7af12cf31a 100644
> >>>>> --- a/drivers/hid/hid-asus.c
> >>>>> +++ b/drivers/hid/hid-asus.c
> >>>>> @@ -90,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>>>  #define QUIRK_ROG_NKEY_KEYBOARD              BIT(11)
> >>>>>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
> >>>>>  #define QUIRK_ROG_ALLY_XPAD          BIT(13)
> >>>>> +#define QUIRK_ROG_NKEY_LEGACY                BIT(14)
> >>>> These past days I have taken a look at new 2025 models and they do make use of ID2,
> >>>> and won't do harm sending ID1 either. I think you can safely remove the if and send regardless.
> >>>>
> >>>> At least 2023 models like mine that don't support ID2 will simply reply with 0xFF 0xFF and the rest 0x00.
> >>>> No consequences.
> >>>>
> >>>> Regardless the name is wrong: mine is a 2023 rog strix with
> >>>> ID 0b05:19b6ASUSTek Computer, Inc. N-KEY Device
> >>>> and surely isn't legacy.
> >>>>>  #define I2C_KEYBOARD_QUIRKS                  (QUIRK_FIX_NOTEBOOK_REPORT | \
> >>>>>                                                QUIRK_NO_INIT_REPORTS | \
> >>>>> @@ -652,14 +653,9 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>>>       if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> >>>>>               return -ENODEV;
> >>>>>
> >>>>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> -
> >>>>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>> -             if (ret < 0)
> >>>>> -                     return ret;
> >>>>> +     if (drvdata->quirks & QUIRK_ROG_NKEY_LEGACY) {
> >>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> >>>>> +             asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> >>>>>       }
> >>>>>
> >>>>>       if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> >>>>> @@ -1376,10 +1372,10 @@ static const struct hid_device_id asus_devices[] = {
> >>>>>         QUIRK_USE_KBD_BACKLIGHT },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD),
> >>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
> >>>>> -       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> >>>>> +       QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_LEGACY },
> >>>>>       { HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
> >>>>>           USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> >>>>>         QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>


