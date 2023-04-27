Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE946EFFEC
	for <lists+linux-input@lfdr.de>; Thu, 27 Apr 2023 05:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242861AbjD0DqL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Apr 2023 23:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242829AbjD0DqK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Apr 2023 23:46:10 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C90D3C0C
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 20:46:07 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94a34a14a54so1513347966b.1
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 20:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567165; x=1685159165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjr1uyrMYaui+GtohqyXliIMiHeH1QRQFMBxyH6C+9c=;
        b=E4s/H7OOFjgkXmnOxRqmIPorV2qTHr1bb/c/Yt397ycTU/nlrwqr8RkgbUlvZLHpG2
         Dk66CTFU4iDlTyH296r+MhUry8oJFiy7xbvEAm+vXREE2Hu//mGezpz+jPzFjVolHOsz
         jWFTsrfOAmuXwANj0nqij+gmCZbe2/f0Odkcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567165; x=1685159165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjr1uyrMYaui+GtohqyXliIMiHeH1QRQFMBxyH6C+9c=;
        b=OduRmPzHUkROJ5xVYiXfWb2dMb/NuRa48GmvSMayLGcShuWe+MP7P7CxtEr4F5kRfa
         vrl8o9JilIgLB/T/d95MzCLnQrCtKoKZky0hPx3Q0fKcV+C8BnIJ4PbNskAAhywskImG
         uWtyEE4t2Sjnfi04VZMCBq5679LgIQjBhzd9C5jWDuPTL9elfD58O/zTgjbWwtDo9eFX
         yFCDZgzAJIBp5yhezlmvvyt5vUXMhrzQGcPSaPghCyEEPHsTiKFSioJBChZrb4Y74f9t
         DOBG6Lae+sveAnYerl7azWUQfG2QQZxOwNSqEPN3FLk1bEOUk8dNOl4Re/VUd4ZLG+dy
         Ldww==
X-Gm-Message-State: AC+VfDyUXjSEjAnf8zcAJgTnU+MTu2h5EARVlyaAQNfM0XcPkvBbouxQ
        0MuWl4RdEr9Ikf9n6Pm11BZ/Sq+r9/kDdk1d6GV3cA==
X-Google-Smtp-Source: ACHHUZ5DfXHThxsW5S5FVLfP9NDvfhMRU+6aR7N/0nr1W0gsvKYh1FMhWudt3mWFP+r76tajxOkMGQ==
X-Received: by 2002:a17:906:4fd6:b0:958:2cb5:9ada with SMTP id i22-20020a1709064fd600b009582cb59adamr232611ejw.39.1682567165407;
        Wed, 26 Apr 2023 20:46:05 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id f6-20020a17090624c600b0095707b7dd04sm8034815ejb.42.2023.04.26.20.46.04
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 20:46:04 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f20215fa70so34247575e9.0
        for <linux-input@vger.kernel.org>; Wed, 26 Apr 2023 20:46:04 -0700 (PDT)
X-Received: by 2002:a1c:f706:0:b0:3f1:923e:e6bc with SMTP id
 v6-20020a1cf706000000b003f1923ee6bcmr266327wmh.0.1682567164086; Wed, 26 Apr
 2023 20:46:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230426144423.2820826-1-fshao@chromium.org> <20230426144423.2820826-3-fshao@chromium.org>
 <ZEnK7bQkl+fkcHkb@nixie71>
In-Reply-To: <ZEnK7bQkl+fkcHkb@nixie71>
From:   Fei Shao <fshao@chromium.org>
Date:   Thu, 27 Apr 2023 11:45:26 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni9ii=xNG-t7jPVGhP1kXMMthmGfvoPzCyEWytazFvRdg@mail.gmail.com>
Message-ID: <CAC=S1ni9ii=xNG-t7jPVGhP1kXMMthmGfvoPzCyEWytazFvRdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: i2c-hid: goodix: Add support for
 "goodix,no-reset-during-suspend" property
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Apr 27, 2023 at 9:08=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Hi Fei,
>
> On Wed, Apr 26, 2023 at 10:44:22PM +0800, Fei Shao wrote:
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
> >   and asserts GPIO and disables regulators normally.
> >   This is for the two-regulator and shared-regulator designs.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Great work; one tiny nit below. If you do not agree with it or have found
> precedent that suggests it is OK, feel free to ignore it. Either way:
>
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
>
> >
> > ---
> >
> > Changes in v3:
> > - In power-down, only skip the GPIO but not the regulator calls if the
> >   flag is set
> >
> > Changes in v2:
> > - Do not change the regulator_enable logic during power-up.
> >
> >  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c b/drivers/hid/i2c-=
hid/i2c-hid-of-goodix.c
> > index 0060e3dcd775..3ed365b50432 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> > @@ -28,6 +28,7 @@ struct i2c_hid_of_goodix {
> >       struct regulator *vdd;
> >       struct regulator *vddio;
> >       struct gpio_desc *reset_gpio;
> > +     bool no_reset_during_suspend;
> >       const struct goodix_i2c_hid_timing_data *timings;
> >  };
> >
> > @@ -37,6 +38,14 @@ static int goodix_i2c_hid_power_up(struct i2chid_ops=
 *ops)
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >       int ret;
> >
> > +     if (ihid_goodix->no_reset_during_suspend) {
> > +             /*
> > +              * We assert reset GPIO here (instead of during power-dow=
n) to
> > +              * ensure the device will have a clean state after poweri=
ng up,
> > +              * just like the normal scenarios will have.
> > +              */
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     }
>
> I don't think curly braces are technically required here, as there is onl=
y
> one statement within the conditional despite the comments making it appea=
r
> otherwise. Maybe this would work too:
>
>         /* ... */
>         if (...)
>                 gpiod_set_value_cansleep(...);
>
> Again however, I do not feel strongly about this.

Oops, I just carried it over from v1 and didn't think that much at the
moment, but indeed I should have cleaned that up.
V4 is on the way, thanks for pointing that out.  :)

Regards,
Fei

>
> >       ret =3D regulator_enable(ihid_goodix->vdd);
> >       if (ret)
> >               return ret;
> > @@ -60,7 +69,9 @@ static void goodix_i2c_hid_power_down(struct i2chid_o=
ps *ops)
> >       struct i2c_hid_of_goodix *ihid_goodix =3D
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >
> > -     gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     if (!ihid_goodix->no_reset_during_suspend)
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +
> >       regulator_disable(ihid_goodix->vddio);
> >       regulator_disable(ihid_goodix->vdd);
> >  }
> > @@ -91,6 +102,9 @@ static int i2c_hid_of_goodix_probe(struct i2c_client=
 *client)
> >       if (IS_ERR(ihid_goodix->vddio))
> >               return PTR_ERR(ihid_goodix->vddio);
> >
> > +     ihid_goodix->no_reset_during_suspend =3D
> > +             of_property_read_bool(client->dev.of_node, "goodix,no-res=
et-during-suspend");
> > +
> >       ihid_goodix->timings =3D device_get_match_data(&client->dev);
> >
> >       return i2c_hid_core_probe(client, &ihid_goodix->ops, 0x0001, 0);
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
>
> Kind regards,
> Jeff LaBundy
