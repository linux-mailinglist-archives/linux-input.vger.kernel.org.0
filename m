Return-Path: <linux-input+bounces-11107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51602A6CD51
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 00:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4A9116E14C
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 23:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAE81DEFD7;
	Sat, 22 Mar 2025 23:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="pxqwdP77"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC66171C9;
	Sat, 22 Mar 2025 23:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742687710; cv=none; b=YlA4VwKDrY0vq19DswKaJNIbGpM4hXsrjITUNLTb6rpQYfgaaR2JToiqY5q9llvREREZEM5N02nJLQeDCnFYeCyperSpJpLeMw7Ih+HFObJjb/Z4JmqIbOG9j/eVDfyE/+1Vlj2V5AjSLxg7fKcMY0T8iwRyrt7dWS8IleDBjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742687710; c=relaxed/simple;
	bh=M3vAQY3FUxLn22RAxSzxfMQubWFsfYBRwWP3gqA0y1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+LpYVht0S6eraEF4ioXb8kl8RprcDmfbIacdpSuh56yh8mv+aV/wPPGM9LH7C5Jzg3N9pKzcY477fqLCtFcSW2DiPt1CzYnIuYrIpqWZgoToO5xMd1gBEb4/1DqdlX9Ne8iJK0VQRjtvcjVTIyyGnYqoVFQUFwvxDtgAAh2q40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=pxqwdP77; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 9E96F2E09D10;
	Sun, 23 Mar 2025 01:55:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742687705;
	bh=1IhAk+KMI0rlm75WQerPuZezROIarEqPxKEm89cxQZI=;
	h=Received:From:Subject:To;
	b=pxqwdP77/nLOqglLg1WcSSdP/1kdGDDvenSc6kmD56tdaWNkSzelf8JteDjIdh5tt
	 N13UlYRn29ev66SBu1wTOEJtnG2sRD6L4ohyi24HNAfhGrD8FgOKWZsrqguuFck2fo
	 7V519OrPt9KHYYJXbVjyF9ve6yIOfzGTnP5bA3Wc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30c2d427194so34629941fa.0;
        Sat, 22 Mar 2025 16:55:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW+2lCl+PSLv/4MpjBilu/YPz8RW77XwTlyid28Tx56ZHNzvR2gmHisaFHMFjMpBHFHEcwImDhB7l9Pce8J@vger.kernel.org,
 AJvYcCW4dViTxddzfkch5NDL9Dt6PnD2x6VUF1cTOmVURkVjo6BOMyiOmxc8v2MMuBzaoZnbqa3tLtHuB0T+EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpR1kNZFilYcXgSnBzOxJYlTATMc6RiSJRNPcSkr9SksoaHhf
	GAE6+Q3WWzM2OBoBikIuk+mxNgspbE5zlx8+HYFoNbXmvl/7IGJYFdMMuTSyqsD23qkdos3OeEN
	uzO94RoNfUQS01D0izYWDwBoGl4Q=
X-Google-Smtp-Source: 
 AGHT+IHtNzsj3fQ3VFPiC3hTju1rtYC5RLdMI/cPceutytbpkwbUyP1otZ8v3IKV629XgfvpPe+DV0sZjhPgMVZx8mY=
X-Received: by 2002:a2e:301a:0:b0:30b:f52d:148f with SMTP id
 38308e7fff4ca-30d7e23845emr29236651fa.18.1742687701726; Sat, 22 Mar 2025
 16:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322102804.418000-1-lkml@antheas.dev>
 <20250322102804.418000-2-lkml@antheas.dev>
 <51a02c2f-acf3-4cca-9514-73ca8b6de336@ljones.dev>
 <CAGwozwFa1UgrWKEoAa2TqvvjB=if8UEnPzcfcmAs=yG=XNazsQ@mail.gmail.com>
 <6b8ea775-ab3c-4046-9152-dfe7255387e4@ljones.dev>
 <CAGwozwHqKPrYXKqb0mDP8w5-1LPQ4kQjsk+n76BAyQbM8LV=nw@mail.gmail.com>
In-Reply-To: 
 <CAGwozwHqKPrYXKqb0mDP8w5-1LPQ4kQjsk+n76BAyQbM8LV=nw@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 23 Mar 2025 00:54:50 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwG8nVOod4NTobc_8U-V9WqeZQPGwF9NO7Tjjo_DWu_3qg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr9hQX6WMmRjY9syQA6-W1lIs6ESLM1sOGBcVyA9u7yTYdepYsam4GP_3k
Message-ID: 
 <CAGwozwG8nVOod4NTobc_8U-V9WqeZQPGwF9NO7Tjjo_DWu_3qg@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] HID: asus: refactor init sequence per spec
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <174268770357.933.3541426342077208963@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sun, 23 Mar 2025 at 00:53, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Sun, 23 Mar 2025 at 00:29, Luke D. Jones <luke@ljones.dev> wrote:
> >
> > On 23/03/25 12:05, Antheas Kapenekakis wrote:
> > > On Sat, 22 Mar 2025 at 23:01, Luke D. Jones <luke@ljones.dev> wrote:
> > >>
> > >> On 22/03/25 23:27, Antheas Kapenekakis wrote:
> > >>> Currently, asus_kbd_init() uses a reverse engineered init sequence
> > >>> from Windows, which contains the handshakes from multiple programs.
> > >>> Keep the main one, which is 0x5a (meant for brightness drivers).
> > >>>
> > >>> In addition, perform a get_response and check if the response is the
> > >>> same. To avoid regressions, print an error if the response does not
> > >>> match instead of rejecting device.
> > >>>
> > >>> Then, refactor asus_kbd_get_functions() to use the same ID it is called
> > >>> with, instead of hardcoding it to 0x5a so that it may be used for 0x0d
> > >>> in the future.
> > >>>
> > >>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > >>> ---
> > >>>    drivers/hid/hid-asus.c | 82 +++++++++++++++++++++++-------------------
> > >>>    1 file changed, 46 insertions(+), 36 deletions(-)
> > >>>
> > >>> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > >>> index 46e3e42f9eb5f..8d4df1b6f143b 100644
> > >>> --- a/drivers/hid/hid-asus.c
> > >>> +++ b/drivers/hid/hid-asus.c
> > >>> @@ -48,7 +48,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
> > >>>    #define FEATURE_REPORT_ID 0x0d
> > >>>    #define INPUT_REPORT_ID 0x5d
> > >>>    #define FEATURE_KBD_REPORT_ID 0x5a
> > >>> -#define FEATURE_KBD_REPORT_SIZE 16
> > >>> +#define FEATURE_KBD_REPORT_SIZE 64
> > >>>    #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> > >>>    #define FEATURE_KBD_LED_REPORT_ID2 0x5e
> > >>>
> > >>> @@ -388,14 +388,41 @@ static int asus_kbd_set_report(struct hid_device *hdev, const u8 *buf, size_t bu
> > >>>
> > >>>    static int asus_kbd_init(struct hid_device *hdev, u8 report_id)
> > >>>    {
> > >>> -     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20, 0x54,
> > >>> -                  0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > >>> +     /*
> > >>> +      * Asus handshake identifying us as a driver (0x5A)
> > >>> +      * 0x5A then ASCII for "ASUS Tech.Inc."
> > >>> +      * 0x5D is for userspace Windows applications.
> > >>> +      *
> > >>> +      * The handshake is first sent as a set_report, then retrieved
> > >>> +      * from a get_report to verify the response.
> > >>> +      */
> > >>
> > >> This entire comment is not required, especially not the last paragraph.
> > >>   From what I've seen in .dll reversing attempts there's no real
> > >> distinction from driver/app and it's simply an init/enable sequence
> > >> common to almost every ITE MCU that ASUS have used (slash, anime, Ally).
> > >>
> > >> Please remove.
> > >
> > > It is a context comment but can be removed.
> > >
> > >>> +     const u8 buf[] = { report_id, 0x41, 0x53, 0x55, 0x53, 0x20,
> > >>> +             0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> > >>> +     u8 *readbuf;
> > >>>        int ret;
> > >>>
> > >>>        ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
> > >>> -     if (ret < 0)
> > >>> -             hid_err(hdev, "Asus failed to send init command: %d\n", ret);
> > >>> +     if (ret < 0) {
> > >>> +             hid_err(hdev, "Asus failed to send handshake: %d\n", ret);
> > >>> +             return ret;
> > >>> +     }
> > >>>
> > >>> +     readbuf = kzalloc(FEATURE_KBD_REPORT_SIZE, GFP_KERNEL);
> > >>> +     if (!readbuf)
> > >>> +             return -ENOMEM;
> > >>> +
> > >>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > >>> +                              FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > >>> +                              HID_REQ_GET_REPORT);
> > >>> +     if (ret < 0) {
> > >>> +             hid_err(hdev, "Asus failed to receive handshake ack: %d\n", ret);
> > >>> +     } else if (memcmp(readbuf, buf, sizeof(buf)) != 0) {
> > >>> +             hid_err(hdev, "Asus handshake returned invalid response: %*ph\n",
> > >>> +                     FEATURE_KBD_REPORT_SIZE, readbuf);
> > >>> +             // Do not return error if handshake is wrong to avoid regressions
> > >>> +     }
> > >>> +
> > >>> +     kfree(readbuf);
> > >>>        return ret;
> > >>>    }
> > >>>
> > >>> @@ -417,7 +444,7 @@ static int asus_kbd_get_functions(struct hid_device *hdev,
> > >>>        if (!readbuf)
> > >>>                return -ENOMEM;
> > >>>
> > >>> -     ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, readbuf,
> > >>> +     ret = hid_hw_raw_request(hdev, report_id, readbuf,
> > >>>                                 FEATURE_KBD_REPORT_SIZE, HID_FEATURE_REPORT,
> > >>>                                 HID_REQ_GET_REPORT);
> > >>>        if (ret < 0) {
> > >>> @@ -540,42 +567,25 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
> > >>>        unsigned char kbd_func;
> > >>>        int ret;
> > >>>
> > >>> -     if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> > >>> -             /* Initialize keyboard */
> > >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > >>> -             if (ret < 0)
> > >>> -                     return ret;
> > >>> -
> > >>> -             /* The LED endpoint is initialised in two HID */
> > >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID1);
> > >>> -             if (ret < 0)
> > >>> -                     return ret;
> > >>> -
> > >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_LED_REPORT_ID2);
> > >>> -             if (ret < 0)
> > >>> -                     return ret;
> > >>> +     ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > >>> +     if (ret < 0)
> > >>> +             return ret;
> > >>>
> > >>
> > >> I don't have any non-ROG equipment to test. There have been some cases
> > >> of Vivobook using the same MCU, but these otherwise used something else.
> > >> And the oldest hardware I have uses a 0x1866, which uses the same init
> > >> sequence but works with both 0x5A and 0x5D report ID for init (on same
> > >> endpoint). There are instances of other laptops that accept both 0x5A
> > >> and 0x5D, and some that have only 0x5D.
> > >
> > > The driver sets the brightness using 0x5a and accepts keyboard
> > > shortcuts only from 0x5a. Therefore it needs to init only with 0x5a.
> > >
> > > How would those laptops regress and in what way?
> > >
> >
> > The media keys fail to work (vol, mic, rog). Can you please accept that
> > I do know some laptops used only 0x5D, and these are older models,
> > around 5+ years. The only thing I have to go on is my memory
> > unfortunately, and I've been trying to find the concrete examples.
>
> I just looked at the history. Yeah it seems you added ID1 in 2020 with
> some other commands. But on the same commit you blocked 0x5d and 0x5e,
> so it means those keyboards use 0x5a to send keyboard events.
>
> Nevertheless, it is not worth looking up or risking regressions for
> old hardware. I will readd 0x5d, 0x5e for
> USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD and
> USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2, since those are the ones you
> added the inits with.
>
> But I will still keep them off for the Z13 and Ally.
>
> By the way,

I guess I did not finish this. I was going to express some concern
about the Claymore keyboard. But it seems it does not have a backlight
quirk so it is ok

> Antheas
>
> > >> I think you will need to change this to try both 0x5A and 0x5D sorry.
> > >> The older models using 0x1854, 0x1869, 0x1866 PID may regress and
> > >> although I'm reasonably confident there won't be issues due to age of
> > >> those, it's not a risk I'm willing to take, I've spent all morning
> > >> trawling through archives of info and I can't actually verify this other
> > >> than from my memory.
> > >
> > > For devices that support RGB, only when RGB is set, 0x5D is initialized too.
> >
> > Sure. But as I've said above.. Please add both to init. It's only done
> > once, and it doesn't hurt anything plus doesn't risk regressing older
> > hardware.
> >
> > If I can get the proper evidence that only 0x5A is required I'm happy to
> > use only that, but until then I don't want that risk. And it's only a
> > small thing here.
> >
> > Cheers,
> > Luke.
> >
> > >
> > >> I mentioned 0x5E being used for some of the oddball devices like slash
> > >> and anime, don't worry about that one, it's a bridge that can be crossed
> > >> at a later time. But it does illustrate that other report ID have been
> > >> used for init.
> > >>
> > >> Otherwise the cleanup is good.
> > >>
> > >> No other comments required and I'll sign off with the above corrections.
> > >>
> > >> Cheers,
> > >> Luke
> > >>
> > >>> -             if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > >>> -                     ret = asus_kbd_disable_oobe(hdev);
> > >>> -                     if (ret < 0)
> > >>> -                             return ret;
> > >>> -             }
> > >>> -     } else {
> > >>> -             /* Initialize keyboard */
> > >>> -             ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> > >>> -             if (ret < 0)
> > >>> -                     return ret;
> > >>> +     /* Get keyboard functions */
> > >>> +     ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > >>> +     if (ret < 0)
> > >>> +             return ret;
> > >>>
> > >>> -             /* Get keyboard functions */
> > >>> -             ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
> > >>> +     if (dmi_match(DMI_PRODUCT_FAMILY, "ProArt P16")) {
> > >>> +             ret = asus_kbd_disable_oobe(hdev);
> > >>>                if (ret < 0)
> > >>>                        return ret;
> > >>> -
> > >>> -             /* Check for backlight support */
> > >>> -             if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > >>> -                     return -ENODEV;
> > >>>        }
> > >>>
> > >>> +     /* Check for backlight support */
> > >>> +     if (!(kbd_func & SUPPORT_KBD_BACKLIGHT))
> > >>> +             return -ENODEV;
> > >>> +
> > >>>        drvdata->kbd_backlight = devm_kzalloc(&hdev->dev,
> > >>>                                              sizeof(struct asus_kbd_leds),
> > >>>                                              GFP_KERNEL);
> > >>
> >

