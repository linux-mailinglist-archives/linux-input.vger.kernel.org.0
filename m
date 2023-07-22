Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C65F75DBBB
	for <lists+linux-input@lfdr.de>; Sat, 22 Jul 2023 12:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjGVK3z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Jul 2023 06:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjGVK3x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Jul 2023 06:29:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5582A2715
        for <linux-input@vger.kernel.org>; Sat, 22 Jul 2023 03:29:52 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-262c8746f08so284488a91.0
        for <linux-input@vger.kernel.org>; Sat, 22 Jul 2023 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690021792; x=1690626592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pEDAMY+ZhOsLKFOXlQpwKDpPjvrxYjutlI7yU0whtgY=;
        b=PxyBWXeAbonC8NQsQfKoNlnssr43I9BmtugHtMqau9njOccOHYobT9uqJ3vke34cjK
         ljI5rQm0d3n4T9iD3c0GfNi7q4s3x+MEvO9lNJxKjucReSi/QAtUCWQEUmAqNopW9po3
         t59nvH8qTzzkjQr6YnJpsvXNfuw0gbxe3ew1S+2bJixuVvzTmDxtDy+cIxeq533nEnmF
         8aw+OEia/7HilTSOT2jJl4EpWxO9ttK1NOkG6Z3BFMwWWAAI+BFpePto/BOqrnzIi0c+
         jUeftfBjC0km4jMjAr5/zdcJlsXzt1IGeLNgg/GyCmG60V4UhW66GE43Dhi62TCeO2E7
         6WpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690021792; x=1690626592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEDAMY+ZhOsLKFOXlQpwKDpPjvrxYjutlI7yU0whtgY=;
        b=I+ZlVzpeMG+etrWlEnq+tdwwRoijayy3f940PwMQQaV/0tV+Y5bFs5GEwDOKduN4bs
         mc6S1NfKhUi6MZNV51Q461FL3ieWDTjfbyBtiNMpdYm7xvL6bXVzgeo65h3Z78ewcik9
         D3wfMcOl4nN4YNuJif0BkImnmoWvKOcAGyKfGqPL7ARbj0mLmgjDAhSYJrtbfWJuNzdR
         QOr61JL9m93qzVqvvhgq8ntgTS77s9Csy8yMCs0yFElXzwO4SrcSC1E/Je7uQLkDTYYq
         nIayhJI5y6KX8dmwm+DcTsX5g8n6ropR5VYN0nOoT11jnv9IF0W2/m2HJrx/f/vHqgg3
         0FKg==
X-Gm-Message-State: ABy/qLZpChhMbtPqN7GGxwQvwM5PCstwnYMN++xXIgfxjntk/QKEeRJm
        YzLG/kpPCLZjzxLAMZYVAz27JEXRSW+0y+dMScYzP7fvaPG9Iw==
X-Google-Smtp-Source: APBJJlGY2b1Wxw2hCI0WJ36Il3z+tQhnMSuP19BK6AaMjbDju73SBTENPnB1QWxvW/WDW6kk/Tr7XDUm4Hzl+IMBJy8=
X-Received: by 2002:a17:90a:208:b0:262:c2a1:c029 with SMTP id
 c8-20020a17090a020800b00262c2a1c029mr3968265pjc.2.1690021791577; Sat, 22 Jul
 2023 03:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <27ZF1I9PL9SUH.27UHPHBWRZ1LC@homearch.localdomain>
 <20230720233150.57164-2-tinozzo123@gmail.com> <38NABT0Q0GDC0.32EJOTLAGT0T2@homearch.localdomain>
In-Reply-To: <38NABT0Q0GDC0.32EJOTLAGT0T2@homearch.localdomain>
From:   Martino Fontana <tinozzo123@gmail.com>
Date:   Sat, 22 Jul 2023 12:29:40 +0200
Message-ID: <CAKst+mAnPmLLCCdJWQdz2d=dUZmuUHNxT_+rs+R_Z7981hS7xA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: nintendo: reinitialize USB Pro Controller after
 resuming from suspend
To:     Silvan Jegen <s.jegen@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is my first patch on the Linux kernel, so I just did kinda what I
would do on GitHub (amend and force push).
What should I do here in case of trivial adjustments?

On Fri, Jul 21, 2023 at 9:02=E2=80=AFPM Silvan Jegen <s.jegen@gmail.com> wr=
ote:
>
> Martino Fontana <tinozzo123@gmail.com> wrote:
> > When suspending the computer, a Switch Pro Controller connected via USB=
 will
> > lose its internal status. However, because the USB connection was techn=
ically
> > never lost, when resuming the computer, the driver will attempt to comm=
unicate
> > with the controller as if nothing happened (and fail).
> > Because of this, the user was forced to manually disconnect the control=
ler
> > (or to press the sync button on the controller to power it off), so tha=
t it
> > can be re-initialized.
> >
> > With this patch, the controller will be automatically re-initialized af=
ter
> > resuming from suspend.
> >
> > Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D216233
> >
> > Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
>
> It would be good to add a small section about what changed between v1
> and v2 of the patch. Here is an example for how this can be done.
>
> https://lore.kernel.org/lkml/cover.b24362332ec6099bc8db4e8e06a67545c65329=
1d.1689842332.git-series.apopple@nvidia.com/T/#m73dd8d44f40742e67cbb0d4f030=
a90b6264a88d3
>
> It's probably not worth resending this patch just for this though. Just
> something to keep in mind if there will be another patch version needed.
>
> Cheers,
> Silvan
>
> > ---
> >  drivers/hid/hid-nintendo.c | 178 ++++++++++++++++++++++---------------
> >  1 file changed, 106 insertions(+), 72 deletions(-)
> >
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 250f5d2f8..a5ebe857a 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> > @@ -2088,7 +2088,9 @@ static int joycon_read_info(struct joycon_ctlr *c=
tlr)
> >       struct joycon_input_report *report;
> >
> >       req.subcmd_id =3D JC_SUBCMD_REQ_DEV_INFO;
> > +     mutex_lock(&ctlr->output_mutex);
> >       ret =3D joycon_send_subcmd(ctlr, &req, 0, HZ);
> > +     mutex_unlock(&ctlr->output_mutex);
> >       if (ret) {
> >               hid_err(ctlr->hdev, "Failed to get joycon info; ret=3D%d\=
n", ret);
> >               return ret;
> > @@ -2117,6 +2119,88 @@ static int joycon_read_info(struct joycon_ctlr *=
ctlr)
> >       return 0;
> >  }
> >
> > +static int joycon_init(struct hid_device *hdev)
> > +{
> > +     struct joycon_ctlr *ctlr =3D hid_get_drvdata(hdev);
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&ctlr->output_mutex);
> > +     /* if handshake command fails, assume ble pro controller */
> > +     if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
> > +         !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
> > +             hid_dbg(hdev, "detected USB controller\n");
> > +             /* set baudrate for improved latency */
> > +             ret =3D joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ)=
;
> > +             if (ret) {
> > +                     hid_err(hdev, "Failed to set baudrate; ret=3D%d\n=
", ret);
> > +                     goto err_mutex;
> > +             }
> > +             /* handshake */
> > +             ret =3D joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
> > +             if (ret) {
> > +                     hid_err(hdev, "Failed handshake; ret=3D%d\n", ret=
);
> > +                     goto err_mutex;
> > +             }
> > +             /*
> > +              * Set no timeout (to keep controller in USB mode).
> > +              * This doesn't send a response, so ignore the timeout.
> > +              */
> > +             joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
> > +     } else if (jc_type_is_chrggrip(ctlr)) {
> > +             hid_err(hdev, "Failed charging grip handshake\n");
> > +             ret =3D -ETIMEDOUT;
> > +             goto err_mutex;
> > +     }
> > +
> > +     /* get controller calibration data, and parse it */
> > +     ret =3D joycon_request_calibration(ctlr);
> > +     if (ret) {
> > +             /*
> > +              * We can function with default calibration, but it may b=
e
> > +              * inaccurate. Provide a warning, and continue on.
> > +              */
> > +             hid_warn(hdev, "Analog stick positions may be inaccurate\=
n");
> > +     }
> > +
> > +     /* get IMU calibration data, and parse it */
> > +     ret =3D joycon_request_imu_calibration(ctlr);
> > +     if (ret) {
> > +             /*
> > +              * We can function with default calibration, but it may b=
e
> > +              * inaccurate. Provide a warning, and continue on.
> > +              */
> > +             hid_warn(hdev, "Unable to read IMU calibration data\n");
> > +     }
> > +
> > +     /* Set the reporting mode to 0x30, which is the full report mode =
*/
> > +     ret =3D joycon_set_report_mode(ctlr);
> > +     if (ret) {
> > +             hid_err(hdev, "Failed to set report mode; ret=3D%d\n", re=
t);
> > +             goto err_mutex;
> > +     }
> > +
> > +     /* Enable rumble */
> > +     ret =3D joycon_enable_rumble(ctlr);
> > +     if (ret) {
> > +             hid_err(hdev, "Failed to enable rumble; ret=3D%d\n", ret)=
;
> > +             goto err_mutex;
> > +     }
> > +
> > +     /* Enable the IMU */
> > +     ret =3D joycon_enable_imu(ctlr);
> > +     if (ret) {
> > +             hid_err(hdev, "Failed to enable the IMU; ret=3D%d\n", ret=
);
> > +             goto err_mutex;
> > +     }
> > +
> > +     mutex_unlock(&ctlr->output_mutex);
> > +     return 0;
> > +
> > +err_mutex:
> > +     mutex_unlock(&ctlr->output_mutex);
> > +     return ret;
> > +}
> > +
> >  /* Common handler for parsing inputs */
> >  static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data=
,
> >                                                             int size)
> > @@ -2248,85 +2332,19 @@ static int nintendo_hid_probe(struct hid_device=
 *hdev,
> >
> >       hid_device_io_start(hdev);
> >
> > -     /* Initialize the controller */
> > -     mutex_lock(&ctlr->output_mutex);
> > -     /* if handshake command fails, assume ble pro controller */
> > -     if ((jc_type_is_procon(ctlr) || jc_type_is_chrggrip(ctlr)) &&
> > -         !joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ)) {
> > -             hid_dbg(hdev, "detected USB controller\n");
> > -             /* set baudrate for improved latency */
> > -             ret =3D joycon_send_usb(ctlr, JC_USB_CMD_BAUDRATE_3M, HZ)=
;
> > -             if (ret) {
> > -                     hid_err(hdev, "Failed to set baudrate; ret=3D%d\n=
", ret);
> > -                     goto err_mutex;
> > -             }
> > -             /* handshake */
> > -             ret =3D joycon_send_usb(ctlr, JC_USB_CMD_HANDSHAKE, HZ);
> > -             if (ret) {
> > -                     hid_err(hdev, "Failed handshake; ret=3D%d\n", ret=
);
> > -                     goto err_mutex;
> > -             }
> > -             /*
> > -              * Set no timeout (to keep controller in USB mode).
> > -              * This doesn't send a response, so ignore the timeout.
> > -              */
> > -             joycon_send_usb(ctlr, JC_USB_CMD_NO_TIMEOUT, HZ/10);
> > -     } else if (jc_type_is_chrggrip(ctlr)) {
> > -             hid_err(hdev, "Failed charging grip handshake\n");
> > -             ret =3D -ETIMEDOUT;
> > -             goto err_mutex;
> > -     }
> > -
> > -     /* get controller calibration data, and parse it */
> > -     ret =3D joycon_request_calibration(ctlr);
> > -     if (ret) {
> > -             /*
> > -              * We can function with default calibration, but it may b=
e
> > -              * inaccurate. Provide a warning, and continue on.
> > -              */
> > -             hid_warn(hdev, "Analog stick positions may be inaccurate\=
n");
> > -     }
> > -
> > -     /* get IMU calibration data, and parse it */
> > -     ret =3D joycon_request_imu_calibration(ctlr);
> > -     if (ret) {
> > -             /*
> > -              * We can function with default calibration, but it may b=
e
> > -              * inaccurate. Provide a warning, and continue on.
> > -              */
> > -             hid_warn(hdev, "Unable to read IMU calibration data\n");
> > -     }
> > -
> > -     /* Set the reporting mode to 0x30, which is the full report mode =
*/
> > -     ret =3D joycon_set_report_mode(ctlr);
> > -     if (ret) {
> > -             hid_err(hdev, "Failed to set report mode; ret=3D%d\n", re=
t);
> > -             goto err_mutex;
> > -     }
> > -
> > -     /* Enable rumble */
> > -     ret =3D joycon_enable_rumble(ctlr);
> > -     if (ret) {
> > -             hid_err(hdev, "Failed to enable rumble; ret=3D%d\n", ret)=
;
> > -             goto err_mutex;
> > -     }
> > -
> > -     /* Enable the IMU */
> > -     ret =3D joycon_enable_imu(ctlr);
> > +     ret =3D joycon_init(hdev);
> >       if (ret) {
> > -             hid_err(hdev, "Failed to enable the IMU; ret=3D%d\n", ret=
);
> > -             goto err_mutex;
> > +             hid_err(hdev, "Failed to initialize controller; ret=3D%d\=
n", ret);
> > +             goto err_close;
> >       }
> >
> >       ret =3D joycon_read_info(ctlr);
> >       if (ret) {
> >               hid_err(hdev, "Failed to retrieve controller info; ret=3D=
%d\n",
> >                       ret);
> > -             goto err_mutex;
> > +             goto err_close;
> >       }
> >
> > -     mutex_unlock(&ctlr->output_mutex);
> > -
> >       /* Initialize the leds */
> >       ret =3D joycon_leds_create(ctlr);
> >       if (ret) {
> > @@ -2352,8 +2370,6 @@ static int nintendo_hid_probe(struct hid_device *=
hdev,
> >       hid_dbg(hdev, "probe - success\n");
> >       return 0;
> >
> > -err_mutex:
> > -     mutex_unlock(&ctlr->output_mutex);
> >  err_close:
> >       hid_hw_close(hdev);
> >  err_stop:
> > @@ -2383,6 +2399,20 @@ static void nintendo_hid_remove(struct hid_devic=
e *hdev)
> >       hid_hw_stop(hdev);
> >  }
> >
> > +#ifdef CONFIG_PM
> > +
> > +static int nintendo_hid_resume(struct hid_device *hdev)
> > +{
> > +     int ret =3D joycon_init(hdev);
> > +
> > +     if (ret)
> > +             hid_err(hdev, "Failed to restore controller after resume"=
);
> > +
> > +     return ret;
> > +}
> > +
> > +#endif
> > +
> >  static const struct hid_device_id nintendo_hid_devices[] =3D {
> >       { HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO,
> >                        USB_DEVICE_ID_NINTENDO_PROCON) },
> > @@ -2404,6 +2434,10 @@ static struct hid_driver nintendo_hid_driver =3D=
 {
> >       .probe          =3D nintendo_hid_probe,
> >       .remove         =3D nintendo_hid_remove,
> >       .raw_event      =3D nintendo_hid_event,
> > +
> > +#ifdef CONFIG_PM
> > +     .resume         =3D nintendo_hid_resume,
> > +#endif
> >  };
> >  module_hid_driver(nintendo_hid_driver);
> >
>
>
