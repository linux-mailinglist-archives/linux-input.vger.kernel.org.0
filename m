Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5D3C6EDE4B
	for <lists+linux-input@lfdr.de>; Tue, 25 Apr 2023 10:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbjDYIkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Apr 2023 04:40:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234065AbjDYIkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Apr 2023 04:40:09 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49D0114F5E
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 01:38:21 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-94a39f6e8caso1019657066b.0
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682411849; x=1685003849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35rY/v6zf6GtIET4fBOnZv9nYjXqazObgmroXAHCvWo=;
        b=IbFEWZMaLeo9gL3Fnhqb/dfjJleRavs7Fbz2ayDxgLNZt9F9InIHDPhZC1yvBMjiDl
         dltpobCqtqSb3dW9KRXtTNjS2wIKjtP0AxhXcw0TIbPB8SNsk1cnMZTdy5lCjVeA5wzF
         ofwXDEBMMurgbOq8Xk2aznBDOGJElJ8pHwmlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411849; x=1685003849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35rY/v6zf6GtIET4fBOnZv9nYjXqazObgmroXAHCvWo=;
        b=h1TTd6PzPjko7Ynu2Qw1zEA86ra1UnOCqXuRv+yp/+iZfwvIgbncs/no7rxcsBvVYS
         FEgAOgxyTRhYnhwhfoV/E+VVvYFRwMhAHCU7Wt6LtWvfuajRiFJAqyfjbZE5hmEVPB4i
         0nvPLa/8Tbtjmt4hXBFNhu5wNBZXDyvSAXKvvFJ13mUdy36cICQK5Ssxk1NtRbEHtRVf
         1XytWoW3JdZlX13CRB2eMz3iImcoJvjgg9ow/Sx9+6T3rxFMIdVHFvsanssa14QxCiy2
         WIzRhlxryqJEPZqMmUJnoBKLwzR0aOeSO4QlI7evbIQ6vqrr5DfW4thMpBBVRTeNWcQh
         dR0A==
X-Gm-Message-State: AAQBX9ejTnjFV/y6+xa4B4vkDBMxV0jPS2c7ZPcKT8o29ZwDRj/pDDeS
        TdgjLT24u1Xa/QRDWd282eoEWlhLVlgKZ3j1BUJT7A==
X-Google-Smtp-Source: AKy350bZg2TjcgKPDKTV3V+BMLzX85khGqt6RtCxR09uvde6TMUun2ZUpWYx5EK3GtQLZJtKBxmu1A==
X-Received: by 2002:a17:906:2457:b0:94f:5d1b:d33a with SMTP id a23-20020a170906245700b0094f5d1bd33amr11491236ejb.40.1682411849580;
        Tue, 25 Apr 2023 01:37:29 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id 28-20020a170906225c00b0094ee88207d5sm6434163ejr.191.2023.04.25.01.37.28
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 01:37:28 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2f7a7f9667bso3288909f8f.1
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 01:37:28 -0700 (PDT)
X-Received: by 2002:adf:d091:0:b0:2f9:338:743d with SMTP id
 y17-20020adfd091000000b002f90338743dmr9864217wrh.23.1682411847907; Tue, 25
 Apr 2023 01:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-3-fshao@chromium.org>
 <ZEX5tc2LSZoVswc2@nixie71> <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
In-Reply-To: <CAD=FV=XnrSskS=0UKRGGPBxSnPYQtUkJeoBm44bDnwKVBHJLyA@mail.gmail.com>
From:   Fei Shao <fshao@chromium.org>
Date:   Tue, 25 Apr 2023 16:36:50 +0800
X-Gmail-Original-Message-ID: <CAC=S1njkYWfvqs5x4nYk0YxoFEcivunKP1T0pG3pO_tapfHivA@mail.gmail.com>
Message-ID: <CAC=S1njkYWfvqs5x4nYk0YxoFEcivunKP1T0pG3pO_tapfHivA@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: i2c-hid: goodix: Add support for
 powered-in-suspend property
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
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Apr 25, 2023 at 2:16=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Apr 23, 2023 at 8:38=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > > @@ -37,13 +38,34 @@ static int goodix_i2c_hid_power_up(struct i2chid_=
ops *ops)
> > >               container_of(ops, struct i2c_hid_of_goodix, ops);
> > >       int ret;
> > >
> > > -     ret =3D regulator_enable(ihid_goodix->vdd);
> > > -     if (ret)
> > > -             return ret;
> > > -
> > > -     ret =3D regulator_enable(ihid_goodix->vddio);
> > > -     if (ret)
> > > -             return ret;
> > > +     /*
> > > +      * This is to ensure that the reset GPIO will be asserted and t=
he
> > > +      * regulators will be enabled for all cases.
> > > +      */
> > > +     if (ihid_goodix->powered_in_suspend) {
> > > +             /*
> > > +              * This is not mandatory, but we assert reset here (ins=
tead of
> > > +              * in power-down) to ensure that the device will have a=
 clean
> > > +              * state later on just like the normal scenarios would =
have.
> > > +              *
> > > +              * Also, since the regulators were not disabled in powe=
r-down,
> > > +              * we don't need to enable them here.
> > > +              */
> > > +             gpiod_set_value_cansleep(ihid_goodix->reset_gpio, 1);
> > > +     } else {
> > > +             /*
> > > +              * In this case, the reset is already asserted (either =
in
> > > +              * probe or power-down).
> > > +              * All we need is to enable the regulators.
> > > +              */
> > > +             ret =3D regulator_enable(ihid_goodix->vdd);
> > > +             if (ret)
> > > +                     return ret;
> > > +
> > > +             ret =3D regulator_enable(ihid_goodix->vddio);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> >
> > Please let me know in case I have misunderstood, but I don't see a need
> > to change the regulator_enable/disable() logic if this property is set.
> > If the regulators are truly always-on, the regulator core already knows
> > what to do and we should not duplicate that logic here.

Your understanding is totally right, let me restore that in the next
revision. Thanks!

Regards,
Fei

> >
> > Based on the alleged silicon erratum discussed in patch [1/2], it seems
> > we only want to control the behavior of the reset GPIO. Therefore, only
> > the calls to gpiod_set_value_cansleep() should be affected and the name
> > of the property updated to reflect what it's actually doing.
>
> This would be OK w/ me.
