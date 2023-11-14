Return-Path: <linux-input+bounces-48-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5B87EABA4
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 09:31:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7AFEB20AFC
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 08:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9BC14F7B;
	Tue, 14 Nov 2023 08:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U86BdM2d"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5822D62D
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 08:30:57 +0000 (UTC)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C807D42
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:30:54 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5098eb6690cso7044880e87.3
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699950652; x=1700555452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obryca9n2eNb5yg2DndPtpmeZlGBNrVGOB13odmFpHw=;
        b=U86BdM2dMN4FNMh5eiDMcD3u3/tNizcTaertRLnxeb8PQEJLjTVV8xb8EMWq1i4YlV
         sklrp7Hmgju86aLEkT13a/tANPmBpy/DDmyqopNknGr3UQBfTc+oh2dk4WfWx2t+DuAS
         htz8l1fLy8AFl2ckI6+vHGkZRuACcG79d5CWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699950652; x=1700555452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obryca9n2eNb5yg2DndPtpmeZlGBNrVGOB13odmFpHw=;
        b=kQc9kkoJh11fDaHTTDD0a1mExPsbFfYEFp9TEu+bRfJ6OBY35G2kW/swAPHyalalw8
         UZXMHL118opOaRdwx9nkCOUoYjA8e4nOxkZ34BQn0f+nq1mgq2GjedeWILy5dHs0Z/PF
         kOdG9IG9hdKMKA1Q4cDFs5JbEDobmS3D5kCo9pG4Oo09g67S7JCOVzgDwulZVwwl4qVe
         Y4ruSJ95GNCWQVq3vCwx/pylAEd/WC9PfFR+PgCNjr7BCjWOejmM2FSJMPiMvM350afg
         ZeWkDBokKMmRLMPXZ/dvXRVE/WlpZA3lNhb5Szo3Li61rgk8W5e6MayRrzRIINafmqm0
         ghfA==
X-Gm-Message-State: AOJu0YwMcbZ5+sfHYNArNbryHoMdSvmicgJ/lfx08f26wKx3xLdl2S4i
	S32PJ1GoFAuNX6TUmXU0S1R3s0KYCLtsCbgrVshahA==
X-Google-Smtp-Source: AGHT+IGkiQteXVxpQxEnN5T5mBHos8SiV3ZYgzB1M48PVBVO51h7FzcCr3+88xaVaOrfvXnrEkoxyrFPYL6ySRMKMIA=
X-Received: by 2002:ac2:58f3:0:b0:507:b1f8:7895 with SMTP id
 v19-20020ac258f3000000b00507b1f87895mr5865847lfo.38.1699950652551; Tue, 14
 Nov 2023 00:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <20231109100606.1245545-3-wenst@chromium.org>
 <CAL_JsqJgUNcuXqtzHKdz5FdbxsrnLeZpgq-F+E21BvYS9qL0xg@mail.gmail.com>
In-Reply-To: <CAL_JsqJgUNcuXqtzHKdz5FdbxsrnLeZpgq-F+E21BvYS9qL0xg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:30:41 +0800
Message-ID: <CAGXv+5GD1VugmdGeU+YL9EPoBkPZXSzwimM4EgsVZVyLbMZ5WA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 11:14=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> On Thu, Nov 9, 2023 at 4:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
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
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/of/Kconfig     |  13 ++++
> >  drivers/of/Makefile    |   1 +
> >  drivers/of/hw_prober.c | 154 +++++++++++++++++++++++++++++++++++++++++
>
> Not sure about having this in drivers/of/, but fine for now... Really,
> the I2C bus stuff should be in the I2C core with the rest of the code
> that knows how to parse I2C bus nodes.

I think we can move the majority of this patch into the I2C core and
export just the one prober function. The remainder and the other SKU
ID based prober could be moved to drivers/platform/chrome.

Not sure how we want to place probers for other platforms though?

> >  3 files changed, 168 insertions(+)
> >  create mode 100644 drivers/of/hw_prober.c
> >
> > diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> > index da9826accb1b..269d20d51936 100644
> > --- a/drivers/of/Kconfig
> > +++ b/drivers/of/Kconfig
> > @@ -102,4 +102,17 @@ config OF_OVERLAY
> >  config OF_NUMA
> >         bool
> >
> > +config HW_PROBER
> > +       bool "Hardware Prober driver"
> > +       select I2C
>
> You should not select I2C, but enable/disable I2C functionality based
> on it being enabled.

Ack.

> > +       select OF_DYNAMIC
> > +       help
> > +         Some devices will have multiple drop-in options for one compo=
nent.
> > +         In many cases the different options are indistinguishable by =
the
> > +         kernel without actually probing each possible option.
> > +
> > +         This driver is meant to handle the probing of such components=
, and
> > +         update the running device tree such that the correct variant =
is
> > +         made available.
> > +
> >  endif # OF
> > diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> > index eff624854575..ed3875cdc554 100644
> > --- a/drivers/of/Makefile
> > +++ b/drivers/of/Makefile
> > @@ -12,6 +12,7 @@ obj-$(CONFIG_OF_RESERVED_MEM) +=3D of_reserved_mem.o
> >  obj-$(CONFIG_OF_RESOLVE)  +=3D resolver.o
> >  obj-$(CONFIG_OF_OVERLAY) +=3D overlay.o
> >  obj-$(CONFIG_OF_NUMA) +=3D of_numa.o
> > +obj-$(CONFIG_HW_PROBER) +=3D hw_prober.o
> >
> >  ifdef CONFIG_KEXEC_FILE
> >  ifdef CONFIG_OF_FLATTREE
> > diff --git a/drivers/of/hw_prober.c b/drivers/of/hw_prober.c
> > new file mode 100644
> > index 000000000000..442da6eff896
> > --- /dev/null
> > +++ b/drivers/of/hw_prober.c
> > @@ -0,0 +1,154 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * hw_prober.c - Hardware prober driver
> > + *
> > + * Copyright (c) 2023 Google LLC
> > + */
> > +
> > +#include <linux/array_size.h>
> > +#include <linux/i2c.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRV_NAME       "hw_prober"
> > +
> > +/**
> > + * struct hw_prober_entry - Holds an entry for the hardware prober
> > + *
> > + * @compatible:        compatible string to match against the machine
> > + * @prober:    prober function to call when machine matches
> > + * @data:      extra data for the prober function
> > + */
> > +struct hw_prober_entry {
> > +       const char *compatible;
> > +       int (*prober)(struct platform_device *pdev, const void *data);
> > +       const void *data;
> > +};
> > +
> > +/*
> > + * Some devices, such as Google Hana Chromebooks, are produced by mult=
iple
> > + * vendors each using their preferred components. This prober assumes =
such
> > + * drop-in parts are on dedicated I2C busses, have non-conflicting add=
resses,
> > + * and can be directly probed by seeing which address responds without=
 needing
> > + * regulators or GPIOs being enabled or toggled.
> > + */
> > +static int i2c_component_prober(struct platform_device *pdev, const vo=
id *data)
> > +{
> > +       const char *node_name =3D data;
> > +       struct device_node *node, *i2c_node;
> > +       struct i2c_adapter *i2c;
> > +       int ret =3D 0;
> > +
> > +       node =3D of_find_node_by_name(NULL, node_name);
> > +       if (!node)
> > +               return dev_err_probe(&pdev->dev, -ENODEV, "Could not fi=
nd %s device node\n",
> > +                                    node_name);
> > +
> > +       i2c_node =3D of_get_next_parent(node);
> > +       if (strcmp(i2c_node->name, "i2c")) {
>
> We have functions for comparing node names, use them and don't access
> ->name directly.

Ack.

> > +               of_node_put(i2c_node);
> > +               return dev_err_probe(&pdev->dev, -EINVAL, "%s device is=
n't on I2C bus\n",
> > +                                    node_name);
> > +       }
> > +
> > +       for_each_child_of_node(i2c_node, node) {
> > +               if (!of_node_name_prefix(node, node_name))
> > +                       continue;
> > +               if (!of_device_is_fail(node)) {
> > +                       /* device tree has component already enabled */
>
> This isn't quite right if there's a disabled device. To check 'is
> enabled', you just need to use of_device_is_available().

I wanted to distinguish between explicitly disabled, i.e. components
known to not exist on some specific variant, vs fail or components
that need probing. I suppose this is overengineered since the previous
of_node_name_prefix() already restricts the check to the class of
components we are interested in.

> > +                       of_node_put(node);
> > +                       of_node_put(i2c_node);
> > +                       return 0;
> > +               }
> > +       }
> > +
> > +       i2c =3D of_get_i2c_adapter_by_node(i2c_node);
> > +       if (!i2c) {
> > +               of_node_put(i2c_node);
> > +               return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "Couldn=
't get I2C adapter\n");
> > +       }
> > +
> > +       for_each_child_of_node(i2c_node, node) {
>
> The I2C core will walk the devices too. Perhaps if that saves off a
> list of failed devices, then we don't need to walk the nodes again.

I will look into it.

> > +               struct property *prop;
> > +               union i2c_smbus_data data;
> > +               u32 addr;
> > +
> > +               if (!of_node_name_prefix(node, node_name))
> > +                       continue;
> > +               if (of_property_read_u32(node, "reg", &addr))
> > +                       continue;
> > +               if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C=
_SMBUS_BYTE, &data) < 0)
> > +                       continue;
> > +
> > +               dev_info(&pdev->dev, "Enabling %pOF\n", node);
> > +
> > +               prop =3D kzalloc(sizeof(*prop), GFP_KERNEL);
> > +               if (!prop) {
> > +                       ret =3D -ENOMEM;
> > +                       of_node_put(node);
> > +                       break;
> > +               }
> > +
> > +               prop->name      =3D "status";
> > +               prop->length    =3D 5;
> > +               prop->value     =3D "okay";
> > +
> > +               /* Found a device that is responding */
> > +               ret =3D of_update_property(node, prop);
>
> Use the changeset API instead and make an update flavor of
> of_changeset_add_prop_string().

Ack. However I don't really like the API, as there is no easy way to free
the allocated property if of_changeset_apply fails and we want to clean up.

> > +               if (ret)
> > +                       kfree(prop);
> > +
> > +               of_node_put(node);
> > +               break;
> > +       }
> > +
> > +       i2c_put_adapter(i2c);
> > +       of_node_put(i2c_node);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct hw_prober_entry hw_prober_platforms[] =3D {
> > +       { .compatible =3D "google,hana", .prober =3D i2c_component_prob=
er, .data =3D "touchscreen" },
> > +       { .compatible =3D "google,hana", .prober =3D i2c_component_prob=
er, .data =3D "trackpad" },
>
> Not generic code. Needs to be somewhere else.

OK. How about drivers/platform/chrome/ for the non-generic bits and the oth=
er
prober patch?

> > +};
> > +
> > +static int hw_prober_probe(struct platform_device *pdev)
> > +{
> > +       for (int i =3D 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
> > +               if (of_machine_is_compatible(hw_prober_platforms[i].com=
patible)) {
> > +                       int ret;
> > +
> > +                       ret =3D hw_prober_platforms[i].prober(pdev, hw_=
prober_platforms[i].data);
> > +                       if (ret)
> > +                               return ret;
> > +               }
> > +
> > +       return 0;
> > +}
> > +
> > +static struct platform_driver hw_prober_driver =3D {
> > +       .probe  =3D hw_prober_probe,
> > +       .driver =3D {
> > +               .name =3D DRV_NAME,
> > +       },
> > +};
> > +
> > +static int __init hw_prober_driver_init(void)
> > +{
> > +       struct platform_device *pdev;
> > +       int ret;
> > +
> > +       ret =3D platform_driver_register(&hw_prober_driver);
> > +       if (ret)
> > +               return ret;
> > +
> > +       pdev =3D platform_device_register_simple(DRV_NAME, -1, NULL, 0)=
;
>
> This should be dependent on platforms that need it, not everyone. IOW,
> this is where checking for "google,hana" belongs.

Ack.

Thanks
ChenYu

