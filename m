Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29C8A75BB59
	for <lists+linux-input@lfdr.de>; Fri, 21 Jul 2023 01:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjGTXzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jul 2023 19:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbjGTXzh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jul 2023 19:55:37 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6782D53
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 16:55:33 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7748ca56133so15152139f.0
        for <linux-input@vger.kernel.org>; Thu, 20 Jul 2023 16:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689897332; x=1690502132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSKNPPUD4vA+lZtlOkcoDSkghvy08JHuXu3ICjzN0go=;
        b=gVphAfyvXwpRtSoYvDB6qw8iSO5eb88gRhYiydNWXBJgor/R4VS+k8U64Vq4sexoAW
         oD9PZVTdntXl8nWBoH++60uJ9toc9Nhp2giLNfmXy3KokiaSIB3aAPlyDJ8QC3sucQTV
         v+gUrU2ReCzhl8e0S850in9GbeioT6VEzWo4iifpG/i7QefLCdWSdzlaDWy1qrg5qcF8
         4hWC0Q2Iq9kIsR0A5X92KgBoqPhmD9u5u5gnEx6Aaxiqnh9yXiYb63TDLW6aVD1aThzr
         oIOQxe5kUFNW+e6UON+DxJ8hMF8AvvMVJmb9ryvFvmRnen9MmfTLs2dXpmLx4n0rGeGy
         /hGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689897332; x=1690502132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSKNPPUD4vA+lZtlOkcoDSkghvy08JHuXu3ICjzN0go=;
        b=fQ+2s/QhMXdxUVgijc5zSBAmf8+RdzGlBU73FxaYu1NZVGor1dmq0OGxaS9XcjA2yy
         AVi6oX7iYj5OnBWlhTr2gjzuV9yMP00o0HXiEVblYsOM8uszJuzG+oSSVWSP5tzv0ER7
         rfoqFc17DtzWepYUkuhLMChliIA4umWDouZRem6GjlxClGYKb/0SIoMYuHuvV+TG+sCk
         PsPe505ku/W1Za9BKB7zrs3FvhB/8mRkQIJyTwiEUx9J/rrWdrtbIPYTUWKIrIMG67pK
         zNoFdyHTj2q1mEhFBcCjuq6iTF02Zs1CA6s1YvVELZo143z3HbNOn7ivphsbd5g+XEwh
         f2tA==
X-Gm-Message-State: ABy/qLbNHzRkHy6MRC30IHbHuwokjLQRvixzHWSjTr7W3gdjN0I5xNHj
        l0QlX3ttDsVIx78b2y88ZwqXCP5HJ3f/Tp1dlFq8/rQqILbxMA==
X-Google-Smtp-Source: APBJJlEBRHjelK/O3B0p62zNUwUzGA1+kIrKd292eKO6K8tuLAndjjC0/V9AEojbaVwqXee9hbZMDq0iCGPRgNvvIGU=
X-Received: by 2002:a05:6e02:111:b0:346:3173:2374 with SMTP id
 t17-20020a056e02011100b0034631732374mr499800ilm.0.1689897332255; Thu, 20 Jul
 2023 16:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230712121433.26134-1-tinozzo123@gmail.com> <2KDZBNL37MH80.3RZBUHZA85LM7@homearch.localdomain>
In-Reply-To: <2KDZBNL37MH80.3RZBUHZA85LM7@homearch.localdomain>
From:   Martino Fontana <tinozzo123@gmail.com>
Date:   Fri, 21 Jul 2023 01:55:21 +0200
Message-ID: <CAKst+mB2wnDt6gdQhApZXydYNx6NHdGBBR8LHMng0i4RJFyY1Q@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: cleanup LED code
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

The reason I avoid returning `ret` is that, if something other than 0
is returned, then `nintendo_hid_probe` (the function calling
`joycon_leds_create`) would fail completely. That obviously shouldn't
happen, LEDs aren't a vital piece for the gamepad functionality.
Alternatively, instead of avoiding returning anything other than 0,
`nintendo_hid_probe` could be modified by changing `if (ret)` in that
section to something else.
I'm not an expert in C, so... opinions?

Il giorno gio 20 lug 2023 alle ore 22:04 Silvan Jegen
<s.jegen@gmail.com> ha scritto:
>
> Hi!
>
> Some comments inline below.
>
> Martino Fontana <tinozzo123@gmail.com> wrote:
> > - Only turn on the nth LED, instead of all the LEDs up to n. This bette=
r matches Nintendo consoles' behaviour, as they never turn on more than one=
 LED (still not a complete match, see https://bugzilla.kernel.org/show_bug.=
cgi?id=3D216225)
> > - Split part of `joycon_home_led_brightness_set` (which is called by hi=
d) into `joycon_set_home_led` (which is what actually sets the LEDs), for c=
onsistency with player LEDs
> > - Instead of first registering the `led_classdev`, then attempting to s=
et the LED and unregistering the `led_classdev` if it fails, first attempt =
to set the LED, then register the `led_classdev` only if it succeeds (the c=
lass is still filled up in either case)
> > - If setting player LEDs fails, still attempt setting the home LED (I d=
on't know if this is actually possible, but who knows...)
> > - Use `JC_NUM_LEDS` when appropriate instead of 4
> > - Print return codes
>
> Wrapping the git commit message around 78 chars or so is conventional.
>
>
> > Signed-off-by: Martino Fontana <tinozzo123@gmail.com>
> > ---
> >  drivers/hid/hid-nintendo.c | 116 ++++++++++++++++++-------------------
> >  1 file changed, 55 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> > index 586c7f8d7..89631e19b 100644
> > --- a/drivers/hid/hid-nintendo.c
> > +++ b/drivers/hid/hid-nintendo.c
> > @@ -699,6 +699,25 @@ static int joycon_set_player_leds(struct joycon_ct=
lr *ctlr, u8 flash, u8 on)
> >       return joycon_send_subcmd(ctlr, req, 1, HZ/4);
> >  }
> >
> > +static int joycon_set_home_led(struct joycon_ctlr *ctlr, enum led_brig=
htness brightness)
> > +{
> > +     struct joycon_subcmd_request *req;
> > +     u8 buffer[sizeof(*req) + 5] =3D { 0 };
> > +     u8 *data;
> > +
> > +     req =3D (struct joycon_subcmd_request *)buffer;
> > +     req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> > +     data =3D req->data;
> > +     data[0] =3D 0x01;
> > +     data[1] =3D brightness << 4;
> > +     data[2] =3D brightness | (brightness << 4);
> > +     data[3] =3D 0x11;
> > +     data[4] =3D 0x11;
> > +
> > +     hid_dbg(ctlr->hdev, "setting home led brightness\n");
> > +     return joycon_send_subcmd(ctlr, req, 5, HZ/4);
> > +}
> > +
> >  static int joycon_request_spi_flash_read(struct joycon_ctlr *ctlr,
> >                                        u32 start_addr, u8 size, u8 **re=
ply)
> >  {
> > @@ -1849,7 +1868,6 @@ static int joycon_player_led_brightness_set(struc=
t led_classdev *led,
> >       int val =3D 0;
> >       int i;
> >       int ret;
> > -     int num;
> >
> >       ctlr =3D hid_get_drvdata(hdev);
> >       if (!ctlr) {
> > @@ -1857,21 +1875,10 @@ static int joycon_player_led_brightness_set(str=
uct led_classdev *led,
> >               return -ENODEV;
> >       }
> >
> > -     /* determine which player led this is */
> > -     for (num =3D 0; num < JC_NUM_LEDS; num++) {
> > -             if (&ctlr->leds[num] =3D=3D led)
> > -                     break;
> > -     }
> > -     if (num >=3D JC_NUM_LEDS)
> > -             return -EINVAL;
> > +     for (i =3D 0; i < JC_NUM_LEDS; i++)
> > +             val |=3D ctlr->leds[i].brightness << i;
> >
> >       mutex_lock(&ctlr->output_mutex);
> > -     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > -             if (i =3D=3D num)
> > -                     val |=3D brightness << i;
> > -             else
> > -                     val |=3D ctlr->leds[i].brightness << i;
> > -     }
> >       ret =3D joycon_set_player_leds(ctlr, 0, val);
> >       mutex_unlock(&ctlr->output_mutex);
> >
> > @@ -1884,9 +1891,6 @@ static int joycon_home_led_brightness_set(struct =
led_classdev *led,
> >       struct device *dev =3D led->dev->parent;
> >       struct hid_device *hdev =3D to_hid_device(dev);
> >       struct joycon_ctlr *ctlr;
> > -     struct joycon_subcmd_request *req;
> > -     u8 buffer[sizeof(*req) + 5] =3D { 0 };
> > -     u8 *data;
> >       int ret;
> >
> >       ctlr =3D hid_get_drvdata(hdev);
> > @@ -1894,25 +1898,13 @@ static int joycon_home_led_brightness_set(struc=
t led_classdev *led,
> >               hid_err(hdev, "No controller data\n");
> >               return -ENODEV;
> >       }
> > -
> > -     req =3D (struct joycon_subcmd_request *)buffer;
> > -     req->subcmd_id =3D JC_SUBCMD_SET_HOME_LIGHT;
> > -     data =3D req->data;
> > -     data[0] =3D 0x01;
> > -     data[1] =3D brightness << 4;
> > -     data[2] =3D brightness | (brightness << 4);
> > -     data[3] =3D 0x11;
> > -     data[4] =3D 0x11;
> > -
> > -     hid_dbg(hdev, "setting home led brightness\n");
> >       mutex_lock(&ctlr->output_mutex);
> > -     ret =3D joycon_send_subcmd(ctlr, req, 5, HZ/4);
> > +     ret =3D joycon_set_home_led(ctlr, brightness);
> >       mutex_unlock(&ctlr->output_mutex);
> > -
> >       return ret;
> >  }
> >
> > -static DEFINE_MUTEX(joycon_input_num_mutex);
> > +static DEFINE_SPINLOCK(joycon_input_num_spinlock);
> >  static int joycon_leds_create(struct joycon_ctlr *ctlr)
> >  {
> >       struct hid_device *hdev =3D ctlr->hdev;
> > @@ -1920,17 +1912,16 @@ static int joycon_leds_create(struct joycon_ctl=
r *ctlr)
> >       const char *d_name =3D dev_name(dev);
> >       struct led_classdev *led;
> >       char *name;
> > -     int ret =3D 0;
> > +     int ret;
> >       int i;
> > -     static int input_num =3D 1;
> > +     unsigned long flags;
> > +     int player_led_number;
> > +     static int input_num;
> >
> > -     /* Set the default controller player leds based on controller num=
ber */
> > -     mutex_lock(&joycon_input_num_mutex);
> > -     mutex_lock(&ctlr->output_mutex);
> > -     ret =3D joycon_set_player_leds(ctlr, 0, 0xF >> (4 - input_num));
> > -     if (ret)
> > -             hid_warn(ctlr->hdev, "Failed to set leds; ret=3D%d\n", re=
t);
> > -     mutex_unlock(&ctlr->output_mutex);
> > +     /* Set the player leds based on controller number */
> > +     spin_lock_irqsave(&joycon_input_num_spinlock, flags);
> > +     player_led_number =3D input_num++ % JC_NUM_LEDS;
> > +     spin_unlock_irqrestore(&joycon_input_num_spinlock, flags);
> >
> >       /* configure the player LEDs */
> >       for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > @@ -1938,31 +1929,33 @@ static int joycon_leds_create(struct joycon_ctl=
r *ctlr)
> >                                     d_name,
> >                                     "green",
> >                                     joycon_player_led_names[i]);
> > -             if (!name) {
> > -                     mutex_unlock(&joycon_input_num_mutex);
> > +             if (!name)
> >                       return -ENOMEM;
> > -             }
> >
> >               led =3D &ctlr->leds[i];
> >               led->name =3D name;
> > -             led->brightness =3D ((i + 1) <=3D input_num) ? 1 : 0;
> > +             led->brightness =3D (i =3D=3D player_led_number) ? 1 : 0;
> >               led->max_brightness =3D 1;
> >               led->brightness_set_blocking =3D
> >                                       joycon_player_led_brightness_set;
> >               led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> > +     }
> > +     mutex_lock(&ctlr->output_mutex);
> > +     ret =3D joycon_set_player_leds(ctlr, 0, 0x1 << player_led_number)=
;
> > +     mutex_unlock(&ctlr->output_mutex);
> > +     if (ret) {
> > +             hid_warn(hdev, "Failed to set players LEDs; ret=3D%d\n", =
ret);
> > +             goto home_led;
> > +     }
> >
> > +     for (i =3D 0; i < JC_NUM_LEDS; i++) {
> > +             led =3D &ctlr->leds[i];
> >               ret =3D devm_led_classdev_register(&hdev->dev, led);
> > -             if (ret) {
> > -                     hid_err(hdev, "Failed registering %s LED\n", led-=
>name);
> > -                     mutex_unlock(&joycon_input_num_mutex);
> > -                     return ret;
> > -             }
> > +             if (ret)
> > +                     hid_err(hdev, "Failed registering %s LED; ret=3D%=
d\n", led->name, ret);
> >       }
> >
> > -     if (++input_num > 4)
> > -             input_num =3D 1;
> > -     mutex_unlock(&joycon_input_num_mutex);
> > -
> > +home_led:
> >       /* configure the home LED */
> >       if (jc_type_has_right(ctlr)) {
> >               name =3D devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
> > @@ -1978,17 +1971,18 @@ static int joycon_leds_create(struct joycon_ctl=
r *ctlr)
> >               led->max_brightness =3D 0xF;
> >               led->brightness_set_blocking =3D joycon_home_led_brightne=
ss_set;
> >               led->flags =3D LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
> > -             ret =3D devm_led_classdev_register(&hdev->dev, led);
> > -             if (ret) {
> > -                     hid_err(hdev, "Failed registering home led\n");
> > -                     return ret;
> > -             }
> > +
> >               /* Set the home LED to 0 as default state */
> > -             ret =3D joycon_home_led_brightness_set(led, 0);
> > +             mutex_lock(&ctlr->output_mutex);
> > +             ret =3D joycon_set_home_led(ctlr, 0);
> > +         mutex_unlock(&ctlr->output_mutex);
>
> We shouldn't use any spaces for indentation here.
>
> >               if (ret) {
> > -                     hid_warn(hdev, "Failed to set home LED default, u=
nregistering home LED");
> > -                     devm_led_classdev_unregister(&hdev->dev, led);
> > +                     hid_warn(hdev, "Failed to set home LED; ret=3D%d\=
n", ret);
> > +                     return 0;
> >               }
>
> Adding an empty line here would be more consistent with the rest of
> the code.
>
> > +             ret =3D devm_led_classdev_register(&hdev->dev, led);
> > +             if (ret)
> > +                     hid_err(hdev, "Failed registering home led; ret=
=3D%d\n", ret);
>
> In the old code we returned "ret" in this case. We probably want to do
> the same here.
>
> Cheers,
> Silvan
>
> >       }
> >
> >       return 0;
>
>
