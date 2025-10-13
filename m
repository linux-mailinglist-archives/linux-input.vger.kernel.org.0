Return-Path: <linux-input+bounces-15446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336ADBD698C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 00:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B489E3A7B52
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767942F1FD5;
	Mon, 13 Oct 2025 22:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="bYJI//wY"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A43296BC1
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 22:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760393921; cv=none; b=A+OX9XVk6YnC0T3vo6yQevVoW1k94XSHi7hpuVBoSeA7RvRT+6IsnoaYvT1H3KL/wTFPUFRTUWkycVlhPACTMt1UJIGhiR0ynmaN5z97TAZrK67IrYWTNqceYtwlJbr8LQfJhQ4KycLRb9FVavm7kTSBh+JSVPqoFcBWCpbsLiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760393921; c=relaxed/simple;
	bh=ZDA9nq4M9MFH7Rf/upIxtIvr71qJ4zAFz2KvWrjSFas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IL0s/7MACHkPCwWfsheRnjJ5o9U5yaJnri6KHrIIEZ5nin3FgVrsYNdqmUpCY4PYTfKP11BPSISzZSeRc59k0fVvIeHobQjGBdtewhhpDk1kd5H2RC2+nMUba7k3zrIHLxOYQcXuJUGNFkekhar5d0OPaI9PDWftQWF7eMk4bQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=bYJI//wY; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 16A7FBDA10
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 01:18:36 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 1FF82BDA41
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 01:18:35 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 926081FDDFE
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 01:18:34 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760393914;
	bh=xHXSw5VAmNMdxWWfaduTBWM8EY/RTMj/H5ax/WqMROg=;
	h=Received:From:Subject:To;
	b=bYJI//wY2hqpPu7dQVOQA0urPYdpCHHLQM9KM1+0WuG/Yc76Sk4UxHdvdFl4nNC90
	 gDZKJrUt7xqYfDsfyHH8LD3ReWnf3s0N8hKCpqbxJuLZRpo5BRorwpSdh0FtdaviFq
	 zUfRCdqkRuFRSaQ4xqpPvT2KyS4leJB1PKGL8R9wal4TJvKbFUwOq2LbaRUmwxSX2z
	 RD/VEi0kVQQ19IJa47hehOi8TWZRzcWuvY0mTKMhtRlxlbDjESqjg96Tcq6qB5wh9M
	 WeCdl/yYCGy9qZl+n/LXshgT7Yf9M1rQbK0acTk85jPHHCBFEzpO54geRdIjI+gotk
	 pEUn8tVD6hjww==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3717780ea70so43742451fa.1
        for <linux-input@vger.kernel.org>;
 Mon, 13 Oct 2025 15:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvI3u2Vf7iC0IhADJF/3xMdp7MNq6xIcRVN3UHCTlk9Upf31FLycf2CEoZeBjxc272xgt8Gwyyk10OTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaDGIIfM9+opBxylaepTUK5BuF7zTYHI2TTuHNaZfbHEQMQz2
	KThN4WfTe4B73mezWTAXjGZifiUtG80ak2RNbBQ7bycs4xz8Sl1RKw0FFTN4PoBhk463KQs/9hO
	JBtHtWGxT0O6Lu2ED8PEuUHYYMKxoEUI=
X-Google-Smtp-Source: 
 AGHT+IHsBdbEcZBy6RDnDlD7kLk9wrmKaiYffxYGSBkbK3qCyeBSOzej9Zyqkv2WhIJyWntcym+zi7xg6MezCsmO7lk=
X-Received: by 2002:a05:651c:12c3:b0:36d:bcc:bfaa with SMTP id
 38308e7fff4ca-37609eff53cmr64906121fa.40.1760393913920; Mon, 13 Oct 2025
 15:18:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-5-lkml@antheas.dev>
 <e1e6ee09-ea29-4328-9eae-f2a4a23b3edc@gmail.com>
 <CAGwozwHP6ukxBRpOFU+XQL5gyNKu5f-HUJio-=F6rAGUmcm2tw@mail.gmail.com>
 <bb149ff1-5fbc-41ff-a4e8-51f6b8631b5e@gmail.com>
In-Reply-To: <bb149ff1-5fbc-41ff-a4e8-51f6b8631b5e@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 14 Oct 2025 00:18:22 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHogocd8FHn31tZY15-N_Kdaoy8cYqtdxte=H3Qioj_ug@mail.gmail.com>
X-Gm-Features: AS18NWC2lLp9E1e0BpRml-JTazdRK67eL07RPAyYFW8yJ12ZotQd-GXKKO8CnRA
Message-ID: 
 <CAGwozwHogocd8FHn31tZY15-N_Kdaoy8cYqtdxte=H3Qioj_ug@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
To: Denis Benato <benato.denis96@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176039391481.3795048.13907409074845228364@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 14 Oct 2025 at 00:06, Denis Benato <benato.denis96@gmail.com> wrote:
>
>
> On 10/13/25 23:57, Antheas Kapenekakis wrote:
> > On Mon, 13 Oct 2025 at 23:44, Denis Benato <benato.denis96@gmail.com> wrote:
> >>
> >> On 10/13/25 22:15, Antheas Kapenekakis wrote:
> >>> Some ROG laptops expose multiple interfaces for controlling the
> >>> keyboard/RGB brightness. This creates a name conflict under
> >>> asus::kbd_brightness, where the second device ends up being
> >>> named asus::kbd_brightness_1 and they are both broken.
> >> Can you please reference a bug report and/or an analysis of why they ends
> >> up being broken?
> > You can reference the V1 description [1]
> >
> > [1] https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
> oh okay thanks. I would suggest to keep relevant parts in successive revisions,
> and most importantly repeat (a shorter description of) relevant parts on the proper
> commit since commit messages will (hopefully) become part of the kernel,
> because just reading messages of the current revision doesn't give the full picture
> of the what and why,

It's true I cut out the introduction, perhaps I shouldn't have, but it
will get thrown away anyway. I think the commit body is detailed
enough though.

I am looping you in late, but since you are taking over
Luke's series and you ended up moving the quirks this series removes
and earlier series did not, you will have some merge conflicts.

By the way, remember to sign off that series yourself as well, since
you are changing the commits.

Antheas


> Regards,
> Denis
> >>> Therefore, register a listener to the asus-wmi brightness device
> >>> instead of creating a new one.
> >>>
> >>> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>> ---
> >>>  drivers/hid/hid-asus.c | 64 +++++++-----------------------------------
> >>>  1 file changed, 10 insertions(+), 54 deletions(-)
> >>>
> >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> >>> index a62559e3e064..0af19c8ef035 100644
> >>> --- a/drivers/hid/hid-asus.c
> >>> +++ b/drivers/hid/hid-asus.c
> >>> @@ -102,7 +102,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> >>>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
> >>>
> >>>  struct asus_kbd_leds {
> >>> -     struct led_classdev cdev;
> >>> +     struct asus_hid_listener listener;
> >> It is my understanding from "register a listener .... instead of creating a new one"
> >> that you are attempting to use the same listener among many devices... so why isn't
> >> this a pointer? And more importantly: why do we have bool available, bool registered
> >> instead of either one or the other being replaced by this field being possibly NULL?
> > A listener is the handle that is passed to asus-wmi so that it can
> > communicate with hid-asus. Since the flow of communication flows from
> > asus-wmi -> hid-asus, the pointer is placed on asus-wmi.
> >
> > The boolean kbd_led_avail is used to signify whether the BIOS supports
> > RGB commands. If not, we still want the common handler to be there to
> > link multiple hid-asus devices together. At the same time, we need to
> > skip calling the bios commands for brightness, and hold a value for
> > the previous brightness outside the bios.
> >
> > The kbd_led_registered fixes the race condition that happens between
> > hid-asus and asus-wmi. Specifically, it ensures that the rgb listener
> > is only setup once, either once asus-wmi loads (if it supports RGB) or
> > when the first hid device loads.
> >
> > Best,
> > Antheas
> >
> >>>       struct hid_device *hdev;
> >>>       struct work_struct work;
> >>>       unsigned int brightness;
> >>> @@ -495,11 +495,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
> >>>       spin_unlock_irqrestore(&led->lock, flags);
> >>>  }
> >>>
> >>> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> >>> -                                enum led_brightness brightness)
> >>> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> >>> +                                int brightness)
> >>>  {
> >>> -     struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> >>> -                                              cdev);
> >>> +     struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> >>> +                                              listener);
> >>>       unsigned long flags;
> >>>
> >>>       spin_lock_irqsave(&led->lock, flags);
> >>> @@ -509,20 +509,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> >>>       asus_schedule_work(led);
> >>>  }
> >>>
> >>> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> >>> -{
> >>> -     struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> >>> -                                              cdev);
> >>> -     enum led_brightness brightness;
> >>> -     unsigned long flags;
> >>> -
> >>> -     spin_lock_irqsave(&led->lock, flags);
> >>> -     brightness = led->brightness;
> >>> -     spin_unlock_irqrestore(&led->lock, flags);
> >>> -
> >>> -     return brightness;
> >>> -}
> >>> -
> >>>  static void asus_kbd_backlight_work(struct work_struct *work)
> >>>  {
> >>>       struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> >>> @@ -539,34 +525,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
> >>>               hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> >>>  }
> >>>
> >>> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> >>> - * precedence. We only activate HID-based backlight control when the
> >>> - * WMI control is not available.
> >>> - */
> >>> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> >>> -{
> >>> -     struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> >>> -     u32 value;
> >>> -     int ret;
> >>> -
> >>> -     if (!IS_ENABLED(CONFIG_ASUS_WMI))
> >>> -             return false;
> >>> -
> >>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> >>> -                     dmi_check_system(asus_use_hid_led_dmi_ids)) {
> >>> -             hid_info(hdev, "using HID for asus::kbd_backlight\n");
> >>> -             return false;
> >>> -     }
> >>> -
> >>> -     ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> >>> -                                    ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> >>> -     hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> >>> -     if (ret)
> >>> -             return false;
> >>> -
> >>> -     return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> >>> -}
> >>> -
> >>>  /*
> >>>   * We don't care about any other part of the string except the version section.
> >>>   * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> >>> @@ -701,14 +659,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> >>>       drvdata->kbd_backlight->removed = false;
> >>>       drvdata->kbd_backlight->brightness = 0;
> >>>       drvdata->kbd_backlight->hdev = hdev;
> >>> -     drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
> >>> -     drvdata->kbd_backlight->cdev.max_brightness = 3;
> >>> -     drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
> >>> -     drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
> >>> +     drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> >>>       INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> >>>       spin_lock_init(&drvdata->kbd_backlight->lock);
> >>>
> >>> -     ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
> >>> +     ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> >>>       if (ret < 0) {
> >>>               /* No need to have this still around */
> >>>               devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> >>> @@ -1105,7 +1060,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
> >>>
> >>>       if (drvdata->kbd_backlight) {
> >>>               const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
> >>> -                             drvdata->kbd_backlight->cdev.brightness };
> >>> +                             drvdata->kbd_backlight->brightness };
> >>>               ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> >>>               if (ret < 0) {
> >>>                       hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> >>> @@ -1241,7 +1196,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >>>       }
> >>>
> >>>       if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> >>> -         !asus_kbd_wmi_led_control_present(hdev) &&
> >>>           asus_kbd_register_leds(hdev))
> >>>               hid_warn(hdev, "Failed to initialize backlight.\n");
> >>>
> >>> @@ -1282,6 +1236,8 @@ static void asus_remove(struct hid_device *hdev)
> >>>       unsigned long flags;
> >>>
> >>>       if (drvdata->kbd_backlight) {
> >>> +             asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
> >>> +
> >>>               spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
> >>>               drvdata->kbd_backlight->removed = true;
> >>>               spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
>


