Return-Path: <linux-input+bounces-10597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF1BA55778
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 21:32:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D13911898470
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 20:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15D714F9FF;
	Thu,  6 Mar 2025 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b="hwft884u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF81249E5
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 20:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293116; cv=none; b=uBpfkGDPLT2cZ2i7Ee/g1wgIEBcYjvxbBl/mqIVrZ32cVpZqEO2QyooPCsrGvvma9W9JYQZO+oGAC73H1dvVLXibcoJwVsLF6zIaCOu3jhYINVQEUpQMRh5fC31dhQPuV9o/QGwQ4Y+oq0q11ALP7/+aOUKNmN1GcEs6m4SvQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293116; c=relaxed/simple;
	bh=sR7K7LYqnZvdyy5ipBXq7TBLq32GsQeJsZsQqVXzuTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPNbJuHScNsuF+lALb1FM7jXMhTl4fg9Rx9MFaHCTCju/we4AN2nCrT1wmxNH1Y4CxJ8hagGKfQTWBzt8SwcVkH0UL4Nc9Bii4LQcF3zMo4cxTVXTFzWKaNA86DFFkKf6dXC8ZRN7nMl1DacsilBB3/VrsbzQl7yQBNJlTO+eaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info; spf=none smtp.mailfrom=g-sokol.info; dkim=pass (2048-bit key) header.d=g-sokol-info.20230601.gappssmtp.com header.i=@g-sokol-info.20230601.gappssmtp.com header.b=hwft884u; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=g-sokol.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=g-sokol.info
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3912c09bea5so853689f8f.1
        for <linux-input@vger.kernel.org>; Thu, 06 Mar 2025 12:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=g-sokol-info.20230601.gappssmtp.com; s=20230601; t=1741293113; x=1741897913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9LckH3XbzVx9wwukrdYpRl0Nel5kMP289ilJTbmz4=;
        b=hwft884uSGbCqO8J7xt+9+L9nCFz+3ONWlObbKOUwIH4b8+Izczut2Wc32zdqmsbsM
         zGfpVwrO3OZCDktav9OMvNp5VaAWVXFoRxADHbJQLjKnVZwyf4bVw2NDO4e8CoezWDlp
         zITa1rTCfGkAhR+pg/VKna9QqTSdt+nMJIZP1mi8mSEZSwol2k0dtrv2XJATk+A1aTr6
         CQWqKi33Vc8/ASuQGfW0Ve2CjqvIaDD58z4taxYhR+pNJmmbZ/LXyAME9IhCnNux5ge9
         4VghTqKpUfPFxTqYAe/2P6agUgtx7AZe6RTe258bDwP88ks8XIRRGCL1PA8iXzqwAzGR
         EMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741293113; x=1741897913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iB9LckH3XbzVx9wwukrdYpRl0Nel5kMP289ilJTbmz4=;
        b=WXEg1QdusXawUyPJY8z7lKF3bzEgG5tWAip5iwrbjQE2SXxu/Qjv/xu5T0uayzbZY7
         EQ5ERIXMf/vPWvPlQXhFjPL4Zm82O1SJP7V6w4NgFWEkQvULIcS9+P/2oeJqejwkL4Vh
         zrDhtLEonjtDbtjOIr6WwfWWPOLkfcYFNlxPcfnRKtJmCQyKM3JITGL5hAmHDpfe5rAR
         UotAWy7UAKvcDDR1b+VvNSetrBT1J9nXf6IpZ16rJlHWtvmR2AhT0uwnVjL01rN9I9l7
         cJGEHKqpjeTvh2+GH2Ph2kWbqitkvHnXvkPkZWeIjAhw2K4ybpbxH27L6zpFGwCTZVkx
         gX9A==
X-Gm-Message-State: AOJu0YwML6aQcrBs4kGO2K710VLy6+ySHZ7cbCYLPB1/lvOzg/Xol6Z2
	N7zoGSbhY+/QBw9lXEewhOz5O+f0GsHlTtDG7/bHnWPeo2C9SsJuZvFmDnkSvxZhfVmlzhq4w2l
	XtkmVQ5+2B7YOuMdRK3mJNMLkwrffeBKxwncf8A==
X-Gm-Gg: ASbGnctc3azLo5WP5D7qZLGz4MFXqEfZPnYXaiegwdIBOfYExu8Qi9swQI4Utpqypjg
	URzltbxWcHbgUBlJSR6q3/SCM37fq88I7eoewt8ALxp/1N8SBQL4Nny4pkBvaxZaEH9uD47rOuR
	SVzy2ArpUfwVX7Rx3+Pz/CoVS8
X-Google-Smtp-Source: AGHT+IEJIMaR/sbGbscdgoXq+6BnY+g9gnrLSJVUWAu5ybD7k3yc33Y1dMnUtL1wP44kK9d6yXeGNvdfTljOlKJaqe0=
X-Received: by 2002:a5d:648f:0:b0:391:2e0f:efce with SMTP id
 ffacd0b85a97d-39132d06d53mr277966f8f.1.1741293112654; Thu, 06 Mar 2025
 12:31:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306070027.532052-1-g.sokol99@g-sokol.info>
 <20250306070027.532052-2-g.sokol99@g-sokol.info> <31E267B8-6B70-46F2-873E-4E58478E3C93@live.com>
 <C5E429C3-4838-4A9A-9D61-4138FD14BB6E@live.com>
In-Reply-To: <C5E429C3-4838-4A9A-9D61-4138FD14BB6E@live.com>
From: Grigorii Sokolik <g.sokol99@g-sokol.info>
Date: Thu, 6 Mar 2025 22:31:41 +0200
X-Gm-Features: AQ5f1JrMc2oAnOjuAkqSbvYLsT-8faKIfWT-Tg_zqZqzyM5t0o1HZJlpt6IAx28
Message-ID: <CADjZRiS0uvKTxT68G3pQ44phQUG42rTf-Sv66i9--7uY3AwGww@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: hid-apple: Apple Magic Keyboard a3118 USB-C support
To: Aditya Garg <gargaditya08@live.com>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you so much. Here is the fix:

---
[PATCH] HID: hid-apple: Apple Magic Keyboard a3118 USB-C support

Add Apple Magic Keyboard with fingerprint 2024 model (with USB-C port)
device ID (0321) to those recognized by the hid-apple driver. Keyboard
is otherwise compatible with the existing implementation for its
earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..ecdfbda66 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -482,6 +482,7 @@ static int hidinput_apple_event(struct hid_device
*hid, struct input_dev *input,
  else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
  hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
  hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 |=
|
+ hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024 |=
|
  hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
  table =3D apple2021_fn_keys;
  else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
@@ -1165,6 +1166,10 @@ static const struct hid_device_id apple_devices[] =
=3D {
  .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTE=
RY },
  { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
  .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+ { HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+ .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTE=
RY },
+ { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+ .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
  { HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
  .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTE=
RY },
  { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e4006249..d59c28495 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -186,6 +186,7 @@
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
--=20
2.48.1

---
 drivers/hid/hid-apple.c | 5 +++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3c3f67d0bf..daf4c505e7 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -475,6 +475,7 @@ static int hidinput_apple_event(struct hid_device
*hid, struct input_dev *input,
                        table =3D magic_keyboard_2015_fn_keys;
                else if (hid->product =3D=3D
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
                         hid->product =3D=3D
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
+                        hid->product =3D=3D
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2 ||
                         hid->product =3D=3D
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
                         hid->product =3D=3D
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
                        table =3D apple2021_fn_keys;
@@ -1155,6 +1156,10 @@ static const struct hid_device_id apple_devices[] =
=3D {
                .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK |
APPLE_RDESC_BATTERY },
        { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
                .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+       { HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2),
+               .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK |
APPLE_RDESC_BATTERY },
+       { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2),
+               .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
        { HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
                .driver_data =3D APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK |
APPLE_RDESC_BATTERY },
        { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE,
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4f583d6f2e..953850f043 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -185,6 +185,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL5 0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2   0x0320
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
--
2.48.1
On Thu, Mar 6, 2025 at 9:05=E2=80=AFPM Aditya Garg <gargaditya08@live.com> =
wrote:
>
>
>
> > On 7 Mar 2025, at 12:24=E2=80=AFAM, Aditya Garg <gargaditya08@live.com>=
 wrote:
> >
> >
> >
> >> On 6 Mar 2025, at 12:30=E2=80=AFPM, Grigorii Sokolik <g.sokol99@g-soko=
l.info> wrote:
> >>
> >> Add Apple Magic Keyboard 2024 model (with USB-C port) device ID (0321)
> >> to those recognized by the hid-apple driver. Keyboard is otherwise
> >> compatible with the existing implementation for its earlier 2021 model=
.
> >>
> >> Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
> >> ---
> >> drivers/hid/hid-apple.c | 5 +++++
> >> drivers/hid/hid-ids.h   | 1 +
> >> 2 files changed, 6 insertions(+)
> >>
> >> --- a/drivers/hid/hid-ids.h
> >> +++ b/drivers/hid/hid-ids.h
> >> @@ -185,6 +185,7 @@
> >> #define USB_DEVICE_ID_APPLE_IRCONTROL5 0x8243
> >> #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
> >> #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
> >> +#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024_V2   0x0320
>
> A3118 is the one with Touch ID. Name should be USB_DEVICE_ID_APPLE_MAGIC_=
KEYBOARD_FINGERPRINT_2024 to be more clear.
> >
> > It=E2=80=99s the same ID as USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024, wh=
y are you adding this again? Typo?
> >
> > Also, please use switch case, you can submit your patch as a part of:
> >
> > https://lore.kernel.org/linux-input/A50C1CF0-B927-4FCF-828F-1F5F79BA376=
2@live.com/
> >
> > Just resubmit those 2 patches along with your patch and make a v2.
>


--

Thanks!
Kind regards,
Grigorii!

