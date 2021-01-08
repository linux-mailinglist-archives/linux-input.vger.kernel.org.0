Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198952EF62A
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 18:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbhAHRCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 12:02:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbhAHRCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 12:02:07 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8148EC061380
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 09:01:27 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id s6so4586085qvn.6
        for <linux-input@vger.kernel.org>; Fri, 08 Jan 2021 09:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xcoGfce3daen1IK8DvNvmiUMLCWhcLlYOdI1JUY8x+k=;
        b=u60vrPyAg/dFVV+v+o/jtwz+6Cu2Vdf4OdwmdKJrxND3KQoe0GisK+OhnDs7nZSblg
         5rCWiFnNV75bh9Kg1eZtSzh4hbCJxDody01YsaK/LdS/WZI2yyVsgcBMVcLUdPezl4qT
         OQ/N0M93ykT8Odxo/UrQT/q7L0SHqDoJGwJ8sIqqGO1rQ9K5/khwbKj5osiVw1BsXtB9
         k8orgjlEPkcIT7JqKv1fdEVcAhqmMWCuWeZj8qQV3Pk26I82Fm9ufRms2aiulHVKrzou
         WZx2dzrQ43ejWw9Sr2WAi3NiWUrGf3Tzvh1HAFcA15XtWBasDiBHC3KbHgiBcMix4xfR
         O65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xcoGfce3daen1IK8DvNvmiUMLCWhcLlYOdI1JUY8x+k=;
        b=qsQqnwkBRRT4WpoZEPlIEYzBpe3IVBsB3ToGb+OcHWsoR3VN6cZXhpLUs3HxOD6wH8
         +kac/cC/kyYgg8F6OWuBg3bzftCBRp/F6HEC7ds2Wg2qIbR1HAzihMG4dlnOJP793Dv1
         3HtHK7wPZPowx05Vl6u6V/GZcqdvsI/DKmp4sPuqzqLaQTA/pQIzJh7tal+5BNYNDEf/
         9QRv7Ylz8HKtfuD1wQBjLbvEuM3eQNJViP/Pb5bDy4+g4j0YmFvMZryLu72XCHjJv7GT
         rDl6VrskUamFVdhl9kzAh4FXw6PNOBlgiWeeZcb2LN8uLGZMpzBZifVKVFwiwA0ZTd9m
         kDNw==
X-Gm-Message-State: AOAM533JztYIMD4vo9g3c0vruWxD5Vl2LqdTbN6vUFqRkSHFitWzC7FQ
        61y44VdDt+QGvr0DNEPIaDqoRhxX/WFBYpwNA8dwXQ==
X-Google-Smtp-Source: ABdhPJykqk6lYsAgkJmtF97PLAGUwJlajw1Q9YUaL0lS/bOX2RvHRKnbYFqND7cEU85NK3KwWKyY/uf4siU2jh4Qbbc=
X-Received: by 2002:a05:6214:684:: with SMTP id r4mr4557938qvz.54.1610125286444;
 Fri, 08 Jan 2021 09:01:26 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-9-roderick@gaikai.com>
 <kRzBWmooFAQ_eFPgUsxxgSR1NkdOsH3sH-ucu6OrxCuPoA7_mMP4enx4EhNNq-Rnl1jYzoPzk1P8UJY-r_W2w84B1rSJa1Nwd_aKL9SLjg8=@protonmail.com>
In-Reply-To: <kRzBWmooFAQ_eFPgUsxxgSR1NkdOsH3sH-ucu6OrxCuPoA7_mMP4enx4EhNNq-Rnl1jYzoPzk1P8UJY-r_W2w84B1rSJa1Nwd_aKL9SLjg8=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Fri, 8 Jan 2021 09:01:15 -0800
Message-ID: <CANndSKnAu91UsRUwo2SKhkF2Ce77SUeRN9MWscJAy=ED8GO86A@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] HID: playstation: add DualSense classic rumble support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

Thanks for your comments.

On Thu, Jan 7, 2021 at 12:41 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrand=
er =C3=ADrta:
>
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > The DualSense features a haptics system based on voicecoil motors,
> > which requires PCM data (or special HID packets using Bluetooth). There
> > is no appropriate API yet in the Linux kernel to expose these. The
> > controller also provides a classic rumble feature for backwards
> > compatibility. Expose this classic rumble feature using the FF framewor=
k.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index ef175c1cb15c..e6c67aaa1a1a 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -863,6 +863,14 @@  config HID_PLAYSTATION
> >         its special functionalities e.g. touchpad, lights and motion
> >         sensors.
> >
> > +config PLAYSTATION_FF
>
> I'm wondering if HID_PLAYSTATION_FF would be a better name?

I'm not sure. Other drivers use "NAME_FF". It seems that FF-only
drivers use HID_NAME_FF.

>
> > +     bool "PlayStation force feedback support"
> > +     depends on HID_PLAYSTATION
> > +     select INPUT_FF_MEMLESS
> > +     help
> > +       Say Y here if you would like to enable force feedback support f=
or
> > +       PlayStation game controllers.
> > +
> >  config HID_PRIMAX
> >       tristate "Primax non-fully HID-compliant devices"
> >       depends on HID
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstatio=
n.c
> > index 552a52a50b78..36a904b2f93f 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > [...]
> > @@ -136,6 +151,63 @@  struct dualsense_input_report {
> >       uint8_t reserved4[11];
> >  } __packed;
> >
> > +/* Common data between DualSense BT/USB main output report. */
> > +struct dualsense_output_report_common {
> > +     uint8_t valid_flag0;
> > +     uint8_t valid_flag1;
> > +
> > +     /* For DualShock 4 compatibility mode. */
> > +     uint8_t motor_right;
> > +     uint8_t motor_left;
> > +
> > +     /* Audio controls */
> > +     uint8_t reserved[4];
> > +     uint8_t mute_button_led;
> > +
> > +     uint8_t power_save_control;
> > +     uint8_t reserved2[28];
> > +
> > +     /* LEDs and lightbar */
> > +     uint8_t valid_flag2;
> > +     uint8_t reserved3[2];
> > +     uint8_t lightbar_setup;
> > +     uint8_t led_brightness;
> > +     uint8_t player_leds;
> > +     uint8_t lightbar_red;
> > +     uint8_t lightbar_green;
> > +     uint8_t lightbar_blue;
> > +} __packed;
> > +
> > +struct dualsense_output_report_bt {
> > +     uint8_t report_id; /* 0x31 */
> > +     uint8_t seq_tag;
> > +     uint8_t tag;
> > +     struct dualsense_output_report_common common;
> > +     uint8_t reserved[24];
> > +     __le32 crc32;
> > +} __packed;
> > +
> > +struct dualsense_output_report_usb {
> > +     uint8_t report_id; /* 0x02 */
> > +     struct dualsense_output_report_common common;
> > +} __packed;
> > +
>
> I think it'd be good if you could add static_asserts to check the sizes o=
f
> the __packed structs at compile time.

Good idea. Added some checks.
>
>
> > +/* The DualSense has a main output report used to control most feature=
s. It is
> > + * largely the same between Bluetooth and USB except for different hea=
ders and CRC.
> > + * This structure hide the differences between the two to simplify sen=
ding output reports.
> > + */
> > +struct dualsense_output_report {
> > +     uint8_t *data; /* Start of data */
> > +     uint8_t len; /* Size of output report */
> > +
> > +     /* Points to Bluetooth data payload in case for a Bluetooth repor=
t else NULL. */
> > +     struct dualsense_output_report_bt *bt;
> > +     /* Points to USB data payload in case for a USB report else NULL.=
 */
> > +     struct dualsense_output_report_usb *usb;
> > +     /* Points to common section of report, so past any headers */
> > +     struct dualsense_output_report_common *common;
> > +};
> > [...]
> > +static void dualsense_init_output_report(struct dualsense *ds, struct =
dualsense_output_report *rp,
> > +             void *buf)
>
> If the dualsense struct is already passed in, couldn't this function use
> `ds->output_report_dmabuf` directly?
>
>
> > +{
> > +     struct hid_device *hdev =3D ds->base.hdev;
> > +
> > +     if (hdev->bus =3D=3D BUS_BLUETOOTH) {
> > +             struct dualsense_output_report_bt *bt =3D buf;
> > +
> > +             memset(bt, 0, sizeof(*bt));
> > +             bt->report_id =3D DS_OUTPUT_REPORT_BT;
> > +             bt->tag =3D 0x10; /* Magic number must be set to 0x10 */
>
> I think it would be preferable if that 0x10 were named.

Not sure yet what I want to do. I was only given this magic number and
I don't even know what it is, so even for me it is magic :)

>
> > +
> > +             /* Highest 4-bit is a sequence number, which needs to be =
increased
> > +              * every report. Lowest 4-bit is tag and can be zero for =
now.
> > +              */
> > +             bt->seq_tag =3D (ds->output_seq << 4) | 0x0;
> > +             if (++ds->output_seq =3D=3D 15)
> > +                     ds->output_seq =3D 0;
>
> If I see it correctly, the maximum sequence number is 14; is that intenti=
onal?
> Or am I missing something?
>
>
> > +
> > +             rp->data =3D buf;
> > +             rp->len =3D sizeof(*bt);
> > +             rp->bt =3D bt;
> > +             rp->usb =3D NULL;
> > +             rp->common =3D &bt->common;
> > +     } else { /* USB */
> > +             struct dualsense_output_report_usb *usb =3D buf;
> > +
> > +             memset(usb, 0, sizeof(*usb));
> > +             usb->report_id =3D DS_OUTPUT_REPORT_USB;
> > +
> > +             rp->data =3D buf;
> > +             rp->len =3D sizeof(*usb);
> > +             rp->bt =3D NULL;
> > +             rp->usb =3D usb;
> > +             rp->common =3D &usb->common;
> > +     }
> > +}
> > +
> > +/* Helper function to send DualSense output reports. Applies a CRC at =
the end of a report
> > + * for Bluetooth reports.
> > + */
> > +static void dualsense_send_output_report(struct dualsense *ds,
> > +             struct dualsense_output_report *report)
> > +{
> > +     struct hid_device *hdev =3D ds->base.hdev;
> > +
> > +     /* Bluetooth packets need to be signed with a CRC in the last 4 b=
ytes. */
> > +     if (report->bt) {
> > +             uint32_t crc;
> > +             uint8_t seed =3D 0xA2;
>
> Maybe this '0xA2' could be named as well? And I think it would be better =
if
> all hexadecimal constants would either be lowercase or uppercase.

I will see if I can find an appropriate name..

>
> > +
> > +             crc =3D crc32_le(0xFFFFFFFF, &seed, 1);
> > +             crc =3D ~crc32_le(crc, report->data, report->len - 4);
> > +
> > +             report->bt->crc32 =3D cpu_to_le32(crc);
> > +     }
> > +
> > +     hid_hw_output_report(hdev, report->data, report->len);
> > +}
> > [...]
> >  static struct ps_device *dualsense_create(struct hid_device *hdev)
> >  {
> >       struct dualsense *ds;
> >       struct ps_device *ps_dev;
> > +     uint8_t max_output_report_size;
> >       int ret;
> >
> >       ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> > @@ -696,8 +882,14 @@  static struct ps_device *dualsense_create(struct =
hid_device *hdev)
> >       ps_dev->battery_capacity =3D 100; /* initial value until parse_re=
port. */
> >       ps_dev->battery_status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> >       ps_dev->parse_report =3D dualsense_parse_report;
> > +     INIT_WORK(&ds->output_worker, dualsense_output_worker);
> >       hid_set_drvdata(hdev, ds);
> >
> > +     max_output_report_size =3D sizeof(struct dualsense_output_report_=
bt);
>
> I think `max(sizeof(..._bt), sizeof(..._usb))` (linux/minmax.h) would be
> more expressive?
>
>
> > +     ds->output_report_dmabuf =3D devm_kzalloc(&hdev->dev, max_output_=
report_size, GFP_KERNEL);
> > +     if (!ds->output_report_dmabuf)
> > +             return ERR_PTR(-ENOMEM);
> > +
> >       ret =3D dualsense_get_mac_address(ds);
> >       if (ret < 0) {
> >               hid_err(hdev, "Failed to get MAC address from DualSense\n=
");
> > @@ -715,7 +907,7 @@  static struct ps_device *dualsense_create(struct h=
id_device *hdev)
> >               goto err;
> >       }
> >
> > -     ds->gamepad =3D ps_gamepad_create(hdev);
> > +     ds->gamepad =3D ps_gamepad_create(hdev, dualsense_play_effect);
> >       if (IS_ERR(ds->gamepad)) {
> >               ret =3D PTR_ERR(ds->gamepad);
> >               goto err;
> >
> >
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze


Regards,
Roderick
