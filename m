Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA4675D357
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 21:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjGUTJc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jul 2023 15:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231799AbjGUTJc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jul 2023 15:09:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F451BF4
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 12:09:29 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7dc16ff0so3678922e87.2
        for <linux-input@vger.kernel.org>; Fri, 21 Jul 2023 12:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689966567; x=1690571367;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u6vmBO9X/eK5G/DuUGcF8ZuuoJlqWIzi0VPtG9509T8=;
        b=c/ll5e5l9wg+gGfIhXW7haElRCwI8Sbl95Ua3nqioKaDg7wQUcyjW0tWt8Kxz4GRLk
         fPMK2avSJiiHTlg7D+mp5U/CXuhGL3JW6zosvS6DCNxorkoIQH544UL9etU6LwSYl3Wc
         nuL2Z08i6UYbDok2sRWHzAbbPTCENF+KZdd+lL6PiMMa+3yxLrQfHLW1JBzPJxi1LFlG
         oUzW/0F5lk4ruIF8dxb8GJroghuDDqTDdcpKv5zATMW0C6B9YWSFmalXvr+K9UbgC4po
         9RH0FM3w7fpTe8cxM/bqKvHC/mi6UbgRBz0rgxLsXMGfWjTA+CWh7oCx9Hh2MujBbM7F
         GYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689966567; x=1690571367;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u6vmBO9X/eK5G/DuUGcF8ZuuoJlqWIzi0VPtG9509T8=;
        b=cnHxCRqjMQTfi6ke7zZxfns6HRPl8jbpu4rwwo3sjJpZCUeBnl0phCNKn6rBL1R6Tn
         ox+/Infm2qmlpda2qz6s8QFDfoK2wttRlens36xcLBJv2CNy9o1VPOfH8/lbmn9uBx6h
         6u2mcrsTtqOEZT45OIwb7hDN5qztBjdyIfbwfDAXpbQXLoUf2ttw0dfLbTzmns4rwzHF
         0eADD3677a//QaLsNdvrd2BYoxzkyUivzevUvOckt7rgDhgHQVabimWwVXCtMY8qXRAq
         6zKivYdMyf7bTlUBQlYi6c6v+x6fg1i7VjdinZaH61wz9KfehgwoE+hdmHDj6QnlazNf
         pbiQ==
X-Gm-Message-State: ABy/qLbatf3CufhT5Ar8NDYQovtC5MfpCOmomNQXNdzDKr2yvdTyx/Wl
        zs90GSV5+x4A0+OT7DCCBbFz4hu8Y7U=
X-Google-Smtp-Source: APBJJlFb7roex6jYhrwJpqaSHyERwxrvg+MdGVDhRWcV1St2HhzJvPtz2Ru+94y1dQRs3CLvOS0BhQ==
X-Received: by 2002:ac2:4c23:0:b0:4f9:56aa:26c2 with SMTP id u3-20020ac24c23000000b004f956aa26c2mr1999550lfq.57.1689966567070;
        Fri, 21 Jul 2023 12:09:27 -0700 (PDT)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with ESMTPSA id bf9-20020a0564021a4900b0052177c077eesm2417631edb.68.2023.07.21.12.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 12:09:26 -0700 (PDT)
Date:   Fri, 21 Jul 2023 21:09:25 +0200
To:     Martino Fontana <tinozzo123@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: cleanup LED code
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20230712121433.26134-1-tinozzo123@gmail.com>
 <2KDZBNL37MH80.3RZBUHZA85LM7@homearch.localdomain>
 <CAKst+mB2wnDt6gdQhApZXydYNx6NHdGBBR8LHMng0i4RJFyY1Q@mail.gmail.com>
In-Reply-To: <CAKst+mB2wnDt6gdQhApZXydYNx6NHdGBBR8LHMng0i4RJFyY1Q@mail.gmail.com>
Message-Id: <209M4JB8WJRSY.2XPCG39LL8DLJ@homearch.localdomain>
User-Agent: mblaze/1.2-21-g48dd346 (2023-07-08)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Martino

Martino Fontana <tinozzo123@gmail.com> wrote:
> The reason I avoid returning `ret` is that, if something other than 0
> is returned, then `nintendo_hid_probe` (the function calling
> `joycon_leds_create`) would fail completely. That obviously shouldn't
> happen, LEDs aren't a vital piece for the gamepad functionality.

While this might be true, if this fails it would indicate a potential
bug in the driver. Failing loudly in this case (especially if this
was the behavior before your changes) would lead to this bug being
investigated earlier.

If we just ignore the failure, people using the code may not be aware
that the LEDs were supposed to work but failed for some reason. In that
case we may never get a bug report and the LED creation would stay broken
in this case.

That's why I would prefer to fail the probe as well if the LED creation
fails.

This is just my opinion though.

Cheers,
Silvan


> Alternatively, instead of avoiding returning anything other than 0,
> `nintendo_hid_probe` could be modified by changing `if (ret)` in that
> section to something else.
> I'm not an expert in C, so... opinions?
>=20
> Il giorno gio 20 lug 2023 alle ore 22:04 Silvan Jegen
> <s.jegen@gmail.com> ha scritto:
> >
> > Hi!
> >
> > Some comments inline below.
> >
> > Martino Fontana <tinozzo123@gmail.com> wrote:
> > > - Only turn on the nth LED, instead of all the LEDs up to n. This bet=
ter matches Nintendo consoles' behaviour, as they never turn on more than o=
ne LED (still not a complete match, see https://bugzilla.kernel.org/show_bu=
g.cgi?id=3D216225)
> > > - Split part of `joycon_home_led_brightness_set` (which is called by =
hid) into `joycon_set_home_led` (which is what actually sets the LEDs), for=
 consistency with player LEDs
> > > - Instead of first registering the `led_classdev`, then attempting to=
 set the LED and unregistering the `led_classdev` if it fails, first attemp=
t to set the LED, then register the `led_classdev` only if it succeeds (the=
 class is still filled up in either case)
> > > - If setting player LEDs fails, still attempt setting the home LED (I=
 don't know if this is actually possible, but who knows...)
> > > - Use `JC_NUM_LEDS` when appropriate instead of 4
> > > - Print return codes
> >
> > Wrapping the git commit message around 78 chars or so is conventional.
> >
> >
> > > Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
> > > ---
> > >  drivers/hid/hid-nintendo.c | 116 ++++++++++++++++++-----------------=
--
> > >  1 file changed, 55 insertions(+), 61 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > > index 586c7f8d7..89631e19b 100644
> > > --- a/drivers/hid/hid-nintendo.c
> > > +++ b/drivers/hid/hid-nintendo.c
> > > @@ -699,6 +699,25 @@ static int joycon_set_player_leds(struct joycon_=
ctlr *ctlr, u8 flash, u8 on)
> > >       return joycon_send_subcmd(ctlr, req, 1, HZ/4);
> > >  }
> > >
> > > +static int joycon_set_home_led(struct joycon_ctlr *ctlr, enum led_br=
ightness brightness)
> > > +{
> > > +     struct joycon_subcmd_request *req;
> > > +     u8 buffer[sizeof(*req) + 5] =3D { 0 };
> > > +     u8 *data;
> > > +
> > > +     req =3D (struct joycon_subcmd_request *)buffer;
> > > +     req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> > > +     data =3D req->data;
> > > +     data[0] =3D 0x01;
> > > +     data[1] =3D brightness << 4;
> > > +     data[2] =3D brightness | (brightness << 4);
> > > +     data[3] =3D 0x11;
> > > +     data[4] =3D 0x11;
> > > +
> > > +     hid_dbg(ctlr->hdev, "setting home led brightness\n");
> > > +     return joycon_send_subcmd(ctlr, req, 5, HZ/4);
> > > +}
> > > +
> > >  static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
> > >                                        u32 start_addr, u8 size, u8 **=
reply)
> > >  {
> > > @@ -1849,7 +1868,6 @@ static int joycon_player_led_brightness_set(str=
uct led_classdev *led,
> > >       int val =3D 0;
> > >       int i;
> > >       int ret;
> > > -     int num;
> > >
> > >       ctlr =3D hid_get_drvdata(hdev);
> > >       if (!ctlr) {
> > > @@ -1857,21 +1875,10 @@ static int joycon_player_led_brightness_set(s=
truct led_classdev *led,
> > >               return -ENODEV;
> > >       }
> > >
> > > -     /* determine which player led this is */
> > > -     for (num =3D 0; num < JC_NUM_LEDS; num++) {
> > > -             if (&ctlr->leds[num] =3D=3D led)
> > > -                     break;
> > > -     }
> > > -     if (num >=3D JC_NUM_LEDS)
> > > -             return -EINVAL;
> > > +     for (i =3D 0; i < JC_NUM_LEDS; i++)
> > > +             val |=3D ctlr->leds[i].brightness << i;
> > >
> > >       mutex_lock(&ctlr->output_mutex);
> > > -     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > > -             if (i =3D=3D num)
> > > -                     val |=3D brightness << i;
> > > -             else
> > > -                     val |=3D ctlr->leds[i].brightness << i;
> > > -     }
> > >       ret =3D joycon_set_player_leds(ctlr, 0, val);
> > >       mutex_unlock(&ctlr->output_mutex);
> > >
> > > @@ -1884,9 +1891,6 @@ static int joycon_home_led_brightness_set(struc=
t led_classdev *led,
> > >       struct device *dev =3D led->dev->parent;
> > >       struct hid_device *hdev =3D to_hid_device(dev);
> > >       struct joycon_ctlr *ctlr;
> > > -     struct joycon_subcmd_request *req;
> > > -     u8 buffer[sizeof(*req) + 5] =3D { 0 };
> > > -     u8 *data;
> > >       int ret;
> > >
> > >       ctlr =3D hid_get_drvdata(hdev);
> > > @@ -1894,25 +1898,13 @@ static int joycon_home_led_brightness_set(str=
uct led_classdev *led,
> > >               hid_err(hdev, "No controller data\n");
> > >               return -ENODEV;
> > >       }
> > > -
> > > -     req =3D (struct joycon_subcmd_request *)buffer;
> > > -     req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> > > -     data =3D req->data;
> > > -     data[0] =3D 0x01;
> > > -     data[1] =3D brightness << 4;
> > > -     data[2] =3D brightness | (brightness << 4);
> > > -     data[3] =3D 0x11;
> > > -     data[4] =3D 0x11;
> > > -
> > > -     hid_dbg(hdev, "setting home led brightness\n");
> > >       mutex_lock(&ctlr->output_mutex);
> > > -     ret =3D joycon_send_subcmd(ctlr, req, 5, HZ/4);
> > > +     ret =3D joycon_set_home_led(ctlr, brightness);
> > >       mutex_unlock(&ctlr->output_mutex);
> > > -
> > >       return ret;
> > >  }
> > >
> > > -static DEFINE_MUTEX(joycon_input_num_mutex);
> > > +static DEFINE_SPINLOCK(joycon_input_num_spinlock);
> > >  static int joycon_leds_create(struct joycon_ctlr *ctlr)
> > >  {
> > >       struct hid_device *hdev =3D ctlr->hdev;
> > > @@ -1920,17 +1912,16 @@ static int joycon_leds_create(struct joycon_c=
tlr *ctlr)
> > >       const char *d_name =3D dev_name(dev);
> > >       struct led_classdev *led;
> > >       char *name;
> > > -     int ret =3D 0;
> > > +     int ret;
> > >       int i;
> > > -     static int input_num =3D 1;
> > > +     unsigned long flags;
> > > +     int player_led_number;
> > > +     static int input_num;
> > >
> > > -     /* Set the default controller player leds based on controller n=
umber */
> > > -     mutex_lock(&joycon_input_num_mutex);
> > > -     mutex_lock(&ctlr->output_mutex);
> > > -     ret =3D joycon_set_player_leds(ctlr, 0, 0xF >> (4 - input_num))=
;
> > > -     if (ret)
> > > -             hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", =
ret);
> > > -     mutex_unlock(&ctlr->output_mutex);
> > > +     /* Set the player leds based on controller number */
> > > +     spin_lock_irqsave(&joycon_input_num_spinlock, flags);
> > > +     player_led_number =3D input_num++ % JC_NUM_LEDS;
> > > +     spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
> > >
> > >       /* configure the player LEDs */
> > >       for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > > @@ -1938,31 +1929,33 @@ static int joycon_leds_create(struct joycon_c=
tlr *ctlr)
> > >                                     d_name,
> > >                                     "green",
> > >                                     joycon_player_led_names[i]);
> > > -             if (!name) {
> > > -                     mutex_unlock(&joycon_input_num_mutex);
> > > +             if (!name)
> > >                       return -ENOMEM;
> > > -             }
> > >
> > >               led =3D &ctlr->leds[i];
> > >               led->name =3D name;
> > > -             led->brightness =3D ((i + 1) <=3D input_num) ? 1 : 0;
> > > +             led->brightness =3D (i =3D=3D player_led_number) ? 1 : =
0;
> > >               led->max_brightness =3D 1;
> > >               led->brightness_set_blocking =3D
> > >                                       joycon_player_led_brightness_se=
t;
> > >               led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABL=
E;
> > > +     }
> > > +     mutex_lock(&ctlr->output_mutex);
> > > +     ret =3D joycon_set_player_leds(ctlr, 0, 0x1 << player_led_numbe=
r);
> > > +     mutex_unlock(&ctlr->output_mutex);
> > > +     if (ret) {
> > > +             hid_warn(hdev, "Failed to set players LEDs; ret=3D%d\n"=
, ret);
> > > +             goto home_led;
> > > +     }
> > >
> > > +     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > > +             led =3D &ctlr->leds[i];
> > >               ret =3D devm_led_classdev_register(&hdev->dev, led);
> > > -             if (ret) {
> > > -                     hid_err(hdev, "Failed registering %s LED\n", le=
d->name);
> > > -                     mutex_unlock(&joycon_input_num_mutex);
> > > -                     return ret;
> > > -             }
> > > +             if (ret)
> > > +                     hid_err(hdev, "Failed registering %s LED; ret=3D=
%d\n", led->name, ret);
> > >       }
> > >
> > > -     if (++input_num > 4)
> > > -             input_num =3D 1;
> > > -     mutex_unlock(&joycon_input_num_mutex);
> > > -
> > > +home_led:
> > >       /* configure the home LED */
> > >       if (jc_type_has_right(ctlr)) {
> > >               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
> > > @@ -1978,17 +1971,18 @@ static int joycon_leds_create(struct joycon_c=
tlr *ctlr)
> > >               led->max_brightness =3D 0xF;
> > >               led->brightness_set_blocking =3D joycon_home_led_bright=
ness_set;
> > >               led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABL=
E;
> > > -             ret =3D devm_led_classdev_register(&hdev->dev, led);
> > > -             if (ret) {
> > > -                     hid_err(hdev, "Failed registering home led\n");=

> > > -                     return ret;
> > > -             }
> > > +
> > >               /* Set the home LED to 0 as default state */
> > > -             ret =3D joycon_home_led_brightness_set(led, 0);
> > > +             mutex_lock(&ctlr->output_mutex);
> > > +             ret =3D joycon_set_home_led(ctlr, 0);
> > > +         mutex_unlock(&ctlr->output_mutex);
> >
> > We shouldn't use any spaces for indentation here.
> >
> > >               if (ret) {
> > > -                     hid_warn(hdev, "Failed to set home LED default,=
 unregistering home LED");
> > > -                     devm_led_classdev_unregister(&hdev->dev, led);
> > > +                     hid_warn(hdev, "Failed to set home LED; ret=3D%=
d\n", ret);
> > > +                     return 0;
> > >               }
> >
> > Adding an empty line here would be more consistent with the rest of
> > the code.
> >
> > > +             ret =3D devm_led_classdev_register(&hdev->dev, led);
> > > +             if (ret)
> > > +                     hid_err(hdev, "Failed registering home led; ret=
=3D%d\n", ret);
> >
> > In the old code we returned "ret" in this case. We probably want to do
> > the same here.
> >
> > Cheers,
> > Silvan
> >
> > >       }
> > >
> > >       return 0;
> >
> >


