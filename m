Return-Path: <linux-input+bounces-322-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E17FD0A2
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 09:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0832B20F98
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 08:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C221311CA8;
	Wed, 29 Nov 2023 08:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hjdvXDGD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C14119B2
	for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 00:23:54 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50aab3bf71fso8935853e87.3
        for <linux-input@vger.kernel.org>; Wed, 29 Nov 2023 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701246232; x=1701851032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7+haveSoq7m2f2Pj8HBweyY+n64mswSOvsdXSe1aV8=;
        b=hjdvXDGDD08RCKyP1WgixBq2jpGt75z1x6E/hpnjKvO7mKkV9cul30JkBYKnQ8FVV3
         rL9BZ0tLuidlItrJOCVz+4pzpl7A9pD0LR0NcsdWdJlcMg9fYT+1y52vF+S345lXc8Da
         Gxql1X2l8GdOWSv/ZL9gGe2uMW7kc2aPHmfko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701246232; x=1701851032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7+haveSoq7m2f2Pj8HBweyY+n64mswSOvsdXSe1aV8=;
        b=KNHPrIJTZgH5kFIIaTnbx8LidRc9Zj9tV2MJaJcnciWd0ZYKFu+NQtY0Uqilazz7Ks
         aqk0AGdEpXf1U7IHVgpSgGHYNjvzoGV/0vmsFOESwcLOfKBehWfh2ski9/wRiAHARIdA
         nALZU/j5lJ3lfHkfQaQb0ex1dUAlP76f6ir8GXT8G6as6eZwS+2Ogyl0Nk93u1CR20Ox
         Pdf3CIi80++vjEhHa2cLwcbDm0bKBPMvsMsT4A3mhwqfHjtyZL2hKZnCcSfOaJ3dD/vk
         fcwtt8QXnwtSr8z0a3TOOpX+8TGOCZFvPeJ5agL8agA6LpP9jXAHR37E4YaoZMocctte
         07BQ==
X-Gm-Message-State: AOJu0YzuYzJ2mPirbIBRUD3E50r7yeocf9/2vVcR8vwYYsQwh3KqrCoP
	fLtHoAugAE2vKI7IZnYYF4bxNZ0vO1smhYpkKrMwxA==
X-Google-Smtp-Source: AGHT+IEtWhB/1EU4Pgqrnwxww3bANfSl0NJ1NAjrSVHkHzZ34kpFTEDs7eij5sHcmcrKNah8R2KVsBjvlDihDkrrAjY=
X-Received: by 2002:a05:6512:3081:b0:507:a1dd:5a86 with SMTP id
 z1-20020a056512308100b00507a1dd5a86mr12720343lfd.13.1701246232561; Wed, 29
 Nov 2023 00:23:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-4-wenst@chromium.org>
 <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
In-Reply-To: <ZWYUi3Q5ptQXR0uQ@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 29 Nov 2023 16:23:41 +0800
Message-ID: <CAGXv+5EG4wO2sD0f_j1VDTkOcyN46oyfTYs3nf7cP7xFPg1fYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] platform/chrome: Introduce device tree
 hardware prober
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, 
	broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	james.clark@arm.com, james@equiv.tech, keescook@chromium.org, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 12:26=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Nov 28, 2023 at 04:42:32PM +0800, Chen-Yu Tsai wrote:
> > Some devices are designed and manufactured with some components having
> > multiple drop-in replacement options. These components are often
> > connected to the mainboard via ribbon cables, having the same signals
> > and pin assignments across all options. These may include the display
> > panel and touchscreen on laptops and tablets, and the trackpad on
> > laptops. Sometimes which component option is used in a particular devic=
e
> > can be detected by some firmware provided identifier, other times that
> > information is not available, and the kernel has to try to probe each
> > device.
> >
> > This change attempts to make the "probe each device" case cleaner. The
> > current approach is to have all options added and enabled in the device
> > tree. The kernel would then bind each device and run each driver's prob=
e
> > function. This works, but has been broken before due to the introductio=
n
> > of asynchronous probing, causing multiple instances requesting "shared"
> > resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> > time, with only one instance succeeding. Work arounds for these include
> > moving the pinmux to the parent I2C controller, using GPIO hogs or
> > pinmux settings to keep the GPIO pins in some fixed configuration, and
> > requesting the interrupt line very late. Such configurations can be see=
n
> > on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> > Lenovo Thinkpad 13S.
> >
> > Instead of this delicate dance between drivers and device tree quirks,
> > this change introduces a simple I2C component prober. For any given
> > class of devices on the same I2C bus, it will go through all of them,
> > doing a simple I2C read transfer and see which one of them responds.
> > It will then enable the device that responds.
> >
> > This requires some minor modifications in the existing device tree.
> > The status for all the device nodes for the component options must be
> > set to "failed-needs-probe". This makes it clear that some mechanism is
> > needed to enable one of them, and also prevents the prober and device
> > drivers running at the same time.
>
> ...
>
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
>
> init.h for init calls.

Added to next version.

> > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > +{
> > +     for (size_t i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +             if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> > +                     int ret;
>
> Perhaps
>
>                 if (!of_machine_is_compatible(hw_prober_platforms[i].comp=
atible))
>                         continue;
>
> ?

Works for me. One less level of indentation.

Thanks
ChenYu

> > +                     ret =3D hw_prober_platforms[i].prober(&pdev->dev,
> > +                                                         hw_prober_pla=
tforms[i].data);
> > +                     if (ret)
> > +                             return ret;
> > +             }
> > +
> > +     return 0;
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

