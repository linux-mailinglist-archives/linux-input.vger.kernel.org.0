Return-Path: <linux-input+bounces-47-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C47EAB92
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 09:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0CB8B20B0E
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 08:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956E214262;
	Tue, 14 Nov 2023 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HqKcDetK"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0DB14A8D
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 08:26:49 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7326C1AD
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:26:47 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-507b9408c61so7299382e87.0
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699950405; x=1700555205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILq+pBwJhinz0+b5/WAiBVX8WQImwlNlm+ztZO2q0tE=;
        b=HqKcDetKENpQWacY/dZ4JYe/xR/bm6ft8FM7WjmeNlxJYB65L7fBofYOiI7nOCY5MP
         xEzS7gmeUQqSNMDisgNCZOmbxEsiaTRHy3cn0zybE9pZJPO79FS+yJy9f0tCPTvyC1da
         a9WHwpcljxVAaiHcVhrRfnmHOsGfE9odNCakU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950405; x=1700555205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILq+pBwJhinz0+b5/WAiBVX8WQImwlNlm+ztZO2q0tE=;
        b=tglNmpakQfuoDyhQuiK+MwM0tHEiwZrEiollkY2MuUjt/EztIKIolGHpNVoeAXVJtT
         zXp/r7G3DofIglFVfjzTWAslYiKJudmc0XfUdAAzRLiBL9UFgtsx1/olNI/uyU1uIuu2
         t6SDPReSaxCD6/NB89s8sBc3vDZExSZ8dgJ4WOWgZUxZzpDHChFCqx+wOjbC+TiOLB8d
         y7m8clqF0wip6bI8WT/78kuo60E9X89BAEqkKOABK2Lk5JIej5ZSGapyXtJrq8NcnsEJ
         qTHezyMAwWZN1BHa/3/OxQ2Y3Gw7d1aPZOSAR6xc802ru/69mxA2BdIA63x6XgROw3I4
         7Idw==
X-Gm-Message-State: AOJu0YyHuI0PcCFwVtm7w40mRB38HWckWceVeKYbgkcZQLk3MxFr3SwO
	7U4ZLlNdGraYDymzWoq7j/+XmXNGp8eabSWILlhXUQ==
X-Google-Smtp-Source: AGHT+IFHLJT6u/3uDCL4wRLuNxtmKORPhOhSsZa/aUIdnn6bzKIIUglORso7+jCQUT8ooc/QswCAlXzJ69DqRPKrwIw=
X-Received: by 2002:a05:6512:128b:b0:509:48ad:930d with SMTP id
 u11-20020a056512128b00b0050948ad930dmr7593209lfs.25.1699950405527; Tue, 14
 Nov 2023 00:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <20231109100606.1245545-3-wenst@chromium.org>
 <ZU0c2fuRSoqrpffA@smile.fi.intel.com>
In-Reply-To: <ZU0c2fuRSoqrpffA@smile.fi.intel.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:26:34 +0800
Message-ID: <CAGXv+5GRHHWjAqsqT+T10vZmc1otJ9ZGJiKroqDs9F40NM5FeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/7] of: Introduce hardware prober driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 1:54=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Nov 09, 2023 at 06:05:59PM +0800, Chen-Yu Tsai wrote:
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
> > set to "failed-needs-probe-xxx". This makes it clear that some mechanis=
m
> > is needed to enable one of them, and also prevents the prober and devic=
e
> > drivers running at the same time.
>
> ...
>
> > +config HW_PROBER
>
> config OF_HW_PROBER // or anything with explicit OF
>
> Don't give a false impression that this is something that may works witho=
ut
> OF support.

Ack.

> ...
>
> > +     bool "Hardware Prober driver"
>
> Ditto.

Ack.

> ...
>
> > +/*
> > + * hw_prober.c - Hardware prober driver
>
> Do not include filename into the file itself.

Ack.

> > + *
> > + * Copyright (c) 2023 Google LLC
> > + */
>
> ...
>
> > +     node =3D of_find_node_by_name(NULL, node_name);
> > +     if (!node)
> > +             return dev_err_probe(&pdev->dev, -ENODEV, "Could not find=
 %s device node\n",
> > +                                  node_name);
>
> With
>
>         struct device *dev =3D &pdev->dev;
>
> this and other lines can be made neater.

Ack.

> ...
>
>
> For better maintenance it's good to have ret assignment be placed here
>
>         ret =3D 0;

Ack.

> > +     for_each_child_of_node(i2c_node, node) {
> > +             struct property *prop;
> > +             union i2c_smbus_data data;
> > +             u32 addr;
> > +
> > +             if (!of_node_name_prefix(node, node_name))
> > +                     continue;
> > +             if (of_property_read_u32(node, "reg", &addr))
> > +                     continue;
> > +             if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_S=
MBUS_BYTE, &data) < 0)
> > +                     continue;
> > +
> > +             dev_info(&pdev->dev, "Enabling %pOF\n", node);
> > +
> > +             prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > +             if (!prop) {
> > +                     ret =3D -ENOMEM;
> > +                     of_node_put(node);
> > +                     break;
> > +             }
> > +
> > +             prop->name      =3D "status";
> > +             prop->length    =3D 5;
> > +             prop->value     =3D "okay";
> > +
> > +             /* Found a device that is responding */
> > +             ret =3D of_update_property(node, prop);
> > +             if (ret)
> > +                     kfree(prop);
> > +
> > +             of_node_put(node);
> > +             break;
> > +     }
>
> ...
>
> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +     { .compatible =3D "google,hana", .prober =3D i2c_component_prober=
, .data =3D "touchscreen" },
> > +     { .compatible =3D "google,hana", .prober =3D i2c_component_prober=
, .data =3D "trackpad" },
> > +};
>
> Why can't OF ID table be used for this?

My intent was to have this accept a probe function, which may take an extra
data argument. So either a new structure like the one here, or use OF ID ta=
ble,
and then another layer with a struct holding the prober and extra data poin=
ter.

I'm guessing this will change since Rob thinks the next patch that adds a
different prober doesn't belong here.

> ...
>
> > +     for (int i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
>
> unsigned?

Ack.

> > +             if (of_machine_is_compatible(hw_prober_platforms[i].compa=
tible)) {
> > +                     int ret;
> > +
> > +                     ret =3D hw_prober_platforms[i].prober(pdev, hw_pr=
ober_platforms[i].data);
> > +                     if (ret)
> > +                             return ret;
> > +             }
>
> ...
>
> > +     pdev =3D platform_device_register_simple(DRV_NAME, -1, NULL, 0);
>
> -1 is defined in the header, use that definition.

Ack.

> > +     if (!IS_ERR(pdev))
> > +             return 0;
> > +
> > +     platform_driver_unregister(&hw_prober_driver);
> > +
> > +     return PTR_ERR(pdev);
>
> Can you use standard pattern, i.e. checking for the _error_ condition?

Ack.


Thanks
ChenYu

