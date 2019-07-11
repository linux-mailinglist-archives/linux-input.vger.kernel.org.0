Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3036066011
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2019 21:39:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfGKTjX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 15:39:23 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:42908 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbfGKTjW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 15:39:22 -0400
Received: by mail-io1-f67.google.com with SMTP id u19so15106058ior.9
        for <linux-input@vger.kernel.org>; Thu, 11 Jul 2019 12:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x0OfFyDSv7uqZ4H9kFB70rUY+FxjLYehEf95uMRcOJw=;
        b=TCtEU4xAG/2PFpFTwZCGQm8fp1CJunBDFrUfWNvzOXfrcb6Z0h4IN4eJs5ZNdtKBHC
         1awKYob9n5HiaCmBUjGNfUzfhKhYDUSuQayEw2wJfwhiai7JRZ6FFVJq60HuFX91x8I9
         OfGPGdpuej7Eicw8dWPvIqWmHE+ZAHJyyGmv1RuqSh8xcTIHeN4ZGMvE48Iq2rPx5Vmm
         zazpq7uBXz+JeObPIKG8J23P0c9ryxyr/8lxyvE8fdQFZWp/ynm7yuVXv1sATUwcEEKW
         xvbZCkf/Bas8YCXzx8uOWGlK3puNSWy49SfhuVdHWa1QQEwdfrHWhBAlPVw8rbm/zWIY
         k1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x0OfFyDSv7uqZ4H9kFB70rUY+FxjLYehEf95uMRcOJw=;
        b=LgybFTwSRHfz79olgR/oyHlm3+mMkOyOrWFUFTTJaY3jWm2+PfYuJN8JLgX/Sl+JFu
         Dqab85X3qIZQ1CJZ1tdjwLDpLCupJGGDYLgcHrpt9NG4Zp7XTr698O+pwzS6p+XShDSI
         pWrhdFhNVXZnQcpdq7fuUdZV4+TnPT7u4EjtFkS9F9u0HRXon2r7/ObbRfGNyhJsUSKL
         EJNQZP47n/ZQPxcEpvLYJ9Lcjyz2GfV7/T7fKkPlRK5xYIHRlzayV0dAZkTvxfOFTeqH
         YMeBBMWhmRFrefxkjkvCchfE/k+MX2iiCYb3ai37Lo4ZectOUH13brjAwQQORzYRru9Z
         QcHQ==
X-Gm-Message-State: APjAAAXUW230/IQSkQ++2UHvaivRvN0nj3Ap2CH6xup9xpDC75b33tqU
        8IV1GQY2pQ1K9j7ywIjqv30p3jThZKCJmCZarekO1TSs8vk=
X-Google-Smtp-Source: APXvYqw+aCosuTpDrixR7DpUCuQLyuw245INjlb7yGJWA5V5P3qr0JNuNuRPoEeyKdxVV8zUJH1eECoRJfZWz7kXyLs=
X-Received: by 2002:a5e:a712:: with SMTP id b18mr6112048iod.220.1562873961976;
 Thu, 11 Jul 2019 12:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190610092945.6330-1-amergnat@baylibre.com> <20190610092945.6330-4-amergnat@baylibre.com>
 <20190616163945.06bdbef0@archlinux>
In-Reply-To: <20190616163945.06bdbef0@archlinux>
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Thu, 11 Jul 2019 21:39:10 +0200
Message-ID: <CAFGrd9ox2FGpL5a26_weZ9tC9XDTL_QnANR5PNTDYXcus2TJGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] iio: Add PAT9125 optical tracker sensor
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        baylibre-upstreaming@groups.io,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le dim. 16 juin 2019 =C3=A0 17:39, Jonathan Cameron <jic23@kernel.org> a =
=C3=A9crit :
>
> On Mon, 10 Jun 2019 11:29:45 +0200
> Alexandre Mergnat <amergnat@baylibre.com> wrote:
 ...
>
> > +/*
> > + * To detect if a new value is available, register status is checked. =
This
> > + * method is safer than using a flag on GPIO IRQ to track event while =
sampling
> > + * because falling edge is missed when device trig just after a read r=
eg value
> > + * (that happen for fast motions or high CPI setting).
>
> So we have an edge triggered interrupt that doesn't have a 'minimum low'
> period? If so then the only safe way to handle it would be as a level
> interrupt. Can you do that here?
> (I once had the delights of a sensor like this tied to a edge sensitive o=
nly
> interrupt, but thankfully those are a rare thing these days).
>

Trigger level is the first setup I tried (and retried during
modifications) but it cannot
works despite of ONESHOT flag. I'm wrong or it's probably due to
nested_irq because
it works when I reset interrupt (by reading data) during one of the
IRQ thread, that what
I did in my V1 patch. I spent a lot of time to try to use level
trigger but this is the
best way I found to do it properly without corner cases.
The result with nested IRQ and low level trigger is a spamming IRQ
(probably due to IRQ no more masked during nested IRQ thread) who that stuc=
k the
board because it hasn't time to make an I2C read to reset interrupt pin.


> > + * buffer mode and kernel warning due to nested IRQ thread,
> > + * this function must return 0.
> > + */
> > +static int pat9125_trig_try_reenable(struct iio_trigger *trig)
> > +{
> > +     struct pat9125_data *data =3D iio_trigger_get_drvdata(trig);
> > +     struct regmap *regmap =3D data->regmap;
> > +     int status =3D 0;
> > +
> > +     if (data->sampling) {
> > +             regmap_read(regmap, PAT9125_MOTION_STATUS_REG, &status);
> > +             if (status & PAT9125_VALID_MOTION_DATA_BIT) {
> > +                     data->sampling =3D false;
> So we only ever do 2 reads?  Why can't we be unlucky on timing
> twice in a row?

That can works indefinitely, I tested for some retry in a row by
moving the chip fastly.
If the method blocked at 2 readings, I should have been stuck during this t=
est.

If read status return "New data available", a new read value is done
through the same
process (that mean data->sampling put to true) thanks to nested IRQ
thread which will
call try_reenable again and then re-check pat9125 status.
