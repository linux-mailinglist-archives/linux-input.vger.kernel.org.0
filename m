Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BBA6EF655
	for <lists+linux-input@lfdr.de>; Wed, 26 Apr 2023 16:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240838AbjDZOYz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 10:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241373AbjDZOYq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 10:24:46 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224AF10C2
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:24:45 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-958bb7731a9so876293866b.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682519083; x=1685111083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddvLBBpo8gBKXAD/L9Fptch2H58M4jlB4+ALINISU88=;
        b=HGKCq3RFAxc3VW3/U0wMKxQZnWJdo3cmgfy4IwawJzKvcte/EV46/bx7E+lBNh7EHu
         OtKzvq+1AQRjCZ6j+7ua1ppfWCjuDQm974hl26xUWLyYAFhOMPcnSeujo+aG2CLxFSud
         e4XvqcZGKaykVg2MTl18tT/KUZVb6Gr9SZhuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682519083; x=1685111083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddvLBBpo8gBKXAD/L9Fptch2H58M4jlB4+ALINISU88=;
        b=WsnfCauo2DMqJiv2AhEgAkOFsBIVjK0K8ZdJMaISlI9E27F0ybABVvxZ0g49/Mkv6b
         XpundE+GuIRFPh0zfJceqytIQiu2nmbwfEBYxu/3QagLErQhPJ9OzjhV5tlFI0r0HA+z
         FZhh3JVO5ZcK51GT4X2JT9rgZ9o41akbkpQDc8QdoXQ4NN37iTDenJ7QEFVyinyk9+D4
         XeyGpbduzXiBBqo1d4f9CgTdboGc0Z/ttxWubd/tzRy9kcQdx3mD1rx5CL2AeTvKvxlV
         1lrHod3BMA2otxOfwHdLCDZz2ArqhOD8J/MygZfA5wU9qqTHpbR5uedhsjxMdMAYwr1X
         yoLw==
X-Gm-Message-State: AC+VfDw2btCfeVe16+0AhDKQwYnZqjq1ThKZZ9JaL2ctMzq1RWxbPSJ6
        zsGvO1VjqGtlQlvKrRUbjmCe99fDso/ek6/0mW4=
X-Google-Smtp-Source: ACHHUZ4emEBiUtaNPpRA0tQOmj7YohZDPZPtYT/t+wHP8fLepDP97/8OaA1Dzk1IKl98uFdDHDd4dg==
X-Received: by 2002:a17:906:94a:b0:95e:d448:477 with SMTP id j10-20020a170906094a00b0095ed4480477mr3268291ejd.33.1682519083270;
        Wed, 26 Apr 2023 07:24:43 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906348d00b0095337c5da35sm8395368ejb.15.2023.04.26.07.24.42
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 07:24:42 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f1e2555b5aso29083685e9.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 07:24:42 -0700 (PDT)
X-Received: by 2002:a1c:ed01:0:b0:3f1:70cf:a2d9 with SMTP id
 l1-20020a1ced01000000b003f170cfa2d9mr12964153wmh.9.1682519081849; Wed, 26 Apr
 2023 07:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230426093231.1466984-1-fshao@chromium.org> <20230426093231.1466984-3-fshao@chromium.org>
 <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VY+01V7hBfUeZKR3OnnTcNuuYb-vhLWGgdS5jb4QTLBQ@mail.gmail.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Wed, 26 Apr 2023 22:24:06 +0800
X-Gmail-Original-Message-ID: <CAC=S1niMR5JBunfmMbV+FSqSOcR7rY3R4KH4Y7QQmz=LgciT2g@mail.gmail.com>
Message-ID: <CAC=S1niMR5JBunfmMbV+FSqSOcR7rY3R4KH4Y7QQmz=LgciT2g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To:     Doug Anderson <dianders@chromium.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek <linux-mediatek@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Kitt <steve@sk2.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Apr 26, 2023 at 10:05=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
>
> Hi,
>
> On Wed, Apr 26, 2023 at 2:33=E2=80=AFAM Fei Shao <fshao@chromium.org> wro=
te:
> >
> > In the beginning, commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the
> > reset line to true state of the regulator") introduced a change to tie
> > the reset line of the Goodix touchscreen to the state of the regulator
> > to fix a power leakage issue in suspend.
> >
> > After some time, the change was deemed unnecessary and was reverted in
> > commit 557e05fa9fdd ("HID: i2c-hid: goodix: Stop tying the reset line t=
o
> > the regulator") due to difficulties in managing regulator notifiers for
> > designs like Evoker, which provides a second power rail to touchscreen.
> >
> > However, the revert caused a power regression on another Chromebook
> > device Steelix in the field, which has a dedicated always-on regulator
> > for touchscreen and was covered by the workaround in the first commit.
> >
> > To address both cases, this patch adds the support for the new
> > "goodix,no-reset-during-suspend" property in the driver:
> > - When set to true, the driver does not assert the reset GPIO during
> >   power-down.
> >   Instead, the GPIO will be asserted during power-up to ensure the
> >   touchscreen always has a clean start and consistent behavior after
> >   resuming.
> >   This is for designs with a dedicated always-on regulator.
> > - When set to false or unset, the driver uses the original control flow
> >   and asserts GPIO and disable regulators normally.
> >   This is for the two-regulator and shared-regulator designs.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ---
> >
> > Changes in v2:
> > - Do not change the regulator_enable logic during power-up.
> >
> >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 26 +++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-=
hid/i2c-hid-of-goodix.c
> > index 0060e3dcd775..fc4532fcadcc 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > @@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
> >         struct regulator *vdd;
> >         struct regulator *vddio;
> >         struct gpio_desc *reset_gpio;
> > +       bool no_reset_during_suspend;
> >         const struct goodix_i2c_hid_timing_data *timings;
> >  };
> >
> > @@ -37,6 +38,20 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops=
 *ops)
> >                 container_of(ops, struct i2c_hid_of_goodix, ops);
> >         int ret;
> >
> > +       if (ihid_goodix->no_reset_during_suspend) {
> > +               /*
> > +                * This is not mandatory, but we assert reset here (ins=
tead of
> > +                * during power-down) to ensure the device will have a =
clean
> > +                * state after powering up, just like the normal scenar=
ios will
> > +                * have.
> > +                *
> > +                * Note that in this case we assume the regulators shou=
ld be
> > +                * (marked as) always-on, so the regulator core knows w=
hat to
> > +                * do with them in the following regulator_enable() cal=
ls
> > +                * despite regulator_disable() was not called previousl=
y.
> > +                */
> > +               gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +       }
> >         ret =3D regulator_enable(ihid_goodix->vdd);
> >         if (ret)
> >                 return ret;
> > @@ -60,6 +75,14 @@ static void goodix_i2c_hid_power_down(struct i2chid_=
ops *ops)
> >         struct i2c_hid_of_goodix *ihid_goodix =3D
> >                 container_of(ops, struct i2c_hid_of_goodix, ops);
> >
> > +       /*
> > +        * Don't assert reset GPIO if it's set.
> > +        * Also, it's okay to skip the following regulator_disable() ca=
lls
> > +        * because the regulators should be always-on in this case.
> > +        */
> > +       if (ihid_goodix->no_reset_during_suspend)
> > +               return;
> > +
> >         gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> >         regulator_disable(ihid_goodix->vddio);
> >         regulator_disable(ihid_goodix->vdd);
>
> I think the above is wrong. You should just skip the GPIO call when
> "no_reset_during_suspend", not the regulator calls. As your code is
> written, you'll enable the regulators over and over again in
> "power_up" and never in "power_down".

Agree, I'll resend v3. Thanks for the feedback!

Regards,
Fei

>
> -Doug
