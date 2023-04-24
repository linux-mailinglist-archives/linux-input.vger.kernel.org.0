Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB0046ED43C
	for <lists+linux-input@lfdr.de>; Mon, 24 Apr 2023 20:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231418AbjDXSRH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Apr 2023 14:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbjDXSRG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Apr 2023 14:17:06 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20476900C
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:16:24 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-32adf94ac1bso13423885ab.0
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682360183; x=1684952183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j798mRgzagav4OXiZ0yBmBHNPfVDqUqZ2VrQzSezYUw=;
        b=G9KdJUHkkTe/bsKhq9J+4u0KFgFeFlCihRF4Y4sDSojvSCKNKBYWjVPGn4hUv2QAOt
         HaEbHGEhDVK4SDeNjFnDo4iuM5w1pYk3ZsnS4tlp2M53c7dzr6a51F2A4gQB+IgzDSyF
         0UtGy+7aTo2bjwqw63zoPf4pyKYVWE3MBtywk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682360183; x=1684952183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j798mRgzagav4OXiZ0yBmBHNPfVDqUqZ2VrQzSezYUw=;
        b=iC5N2Bg4EGQlPBYcomoBpwtv9KIxWUwv3Zs3gi9fNB2rz70M10h27rEK2kTgGcGuby
         rlULrJJ/NnxZms0ilDCirOkOZuuUcAjAy8lDWBVLuifJvRBvz5PV5zpAgL81pCfLl7qU
         vbkXoUchOxDwLPcyWOVmvf2bskiqCpVLUaG6Udfk5TZ7K9nVdX0lvk2elnTTh+/YjhIi
         Ot0+O+dVXGPSphe9WdofmNprFW/ML/piEbPUcz080BDW9Y+tMWQhtOUaJY5wLGKdq216
         BD3BLil8OBoWthfVHro3HTLbAB0gcyJ8KpccBTfvOkFm8c25aDlA/2QWF05h/Z/cqMYs
         mKKg==
X-Gm-Message-State: AAQBX9fMBWlak/jx6NhG8IZ/Ma7ouT+SyXQ03w2pm41IWqNK03p7/nWf
        pfCA0/10zGjFa02PyqmwauiXvIbzw6veCB+nIOc=
X-Google-Smtp-Source: AKy350ZsqNA8IEjC3UCv2JM6pRoiUtq2jCAyCTDT7Hd8NXmZfh8drzTznaYrtyIm9pY4ZeXb6MLrQQ==
X-Received: by 2002:a05:6e02:60e:b0:32a:bc1d:5417 with SMTP id t14-20020a056e02060e00b0032abc1d5417mr6482705ils.12.1682360182800;
        Mon, 24 Apr 2023 11:16:22 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id cs19-20020a056638471300b0040f9c1c1461sm3558189jab.48.2023.04.24.11.16.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 11:16:22 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-325f728402cso1100275ab.1
        for <linux-input@vger.kernel.org>; Mon, 24 Apr 2023 11:16:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b83:b0:32a:f2a9:d1b7 with SMTP id
 h3-20020a056e021b8300b0032af2a9d1b7mr19498ili.10.1682360181408; Mon, 24 Apr
 2023 11:16:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
 <ZEX5tc2LSZoVswc2@nixie71>
In-Reply-To: <ZEX5tc2LSZoVswc2@nixie71>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 24 Apr 2023 11:16:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
Message-ID: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Fei Shao <fshao@chromium.org>,
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

On Sun, Apr 23, 2023 at 8:38=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> > @@ -37,13 +38,34 @@ static int goodix_i2c_hid_power_up(struct i2chid_op=
s *ops)
> >               container_of(ops, struct i2c_hid_of_goodix, ops);
> >       int ret;
> >
> > -     ret =3D regulator_enable(ihid_goodix->vdd);
> > -     if (ret)
> > -             return ret;
> > -
> > -     ret =3D regulator_enable(ihid_goodix->vddio);
> > -     if (ret)
> > -             return ret;
> > +     /*
> > +      * This is to ensure that the reset GPIO will be asserted and the
> > +      * regulators will be enabled for all cases.
> > +      */
> > +     if (ihid_goodix->powered_in_suspend) {
> > +             /*
> > +              * This is not mandatory, but we assert reset here (inste=
ad of
> > +              * in power-down) to ensure that the device will have a c=
lean
> > +              * state later on just like the normal scenarios would ha=
ve.
> > +              *
> > +              * Also, since the regulators were not disabled in power-=
down,
> > +              * we don't need to enable them here.
> > +              */
> > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > +     } else {
> > +             /*
> > +              * In this case, the reset is already asserted (either in
> > +              * probe or power-down).
> > +              * All we need is to enable the regulators.
> > +              */
> > +             ret =3D regulator_enable(ihid_goodix->vdd);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D regulator_enable(ihid_goodix->vddio);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> Please let me know in case I have misunderstood, but I don't see a need
> to change the regulator_enable/disable() logic if this property is set.
> If the regulators are truly always-on, the regulator core already knows
> what to do and we should not duplicate that logic here.
>
> Based on the alleged silicon erratum discussed in patch [1/2], it seems
> we only want to control the behavior of the reset GPIO. Therefore, only
> the calls to gpiod_set_value_cansleep() should be affected and the name
> of the property updated to reflect what it's actually doing.

This would be OK w/ me.
