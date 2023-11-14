Return-Path: <linux-input+bounces-50-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F767EAC44
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 09:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6642810FE
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 08:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9B915495;
	Tue, 14 Nov 2023 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k43WlMaW"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC56E1549E
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 08:58:04 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD96D1A8
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:58:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5099184f8a3so7264589e87.2
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 00:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699952280; x=1700557080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpeuhvaUzx9DVrRpRRSAt7VSJx9fLxiy0TG7WzmpI+s=;
        b=k43WlMaWKYrcJE92FaqbGGMaeyU30nICPFYc4b/V+suaZVPRg+q2X9RhqoX8zOSeZE
         UoT6UvdPuc9twuRytd5mo/73gwao3eMiAuIOhH/1xa1JOdPIB11Yw63ypU0fwgcmaBAp
         ICFodVa71nyjLJeQ7cbohiVW4VrGN1lvUMCE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699952280; x=1700557080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EpeuhvaUzx9DVrRpRRSAt7VSJx9fLxiy0TG7WzmpI+s=;
        b=w48iyt2p9WmEwh1fOQp2peej1jeFYbgRlRfIzawgtAlzjXxh2rSyqEQIfNB+IJHiN5
         CqhdVIf2lkT0zs8TCFzVxF2+adA57mbrZrmXoW1tlzCMRSUOZU3ZyaE2mgOzt0M3GOQq
         9gBfKdf+ZDI162MmFX4BW3lJnXemxAf2YPoefrsojQR0qIP6/GSbE3mqTaW0+HOXE34v
         eDf3KX4QQfd70HbzzCoHsqXMA3Ssr2+WkYLIX9wiPcbGwqdzawyQrSivdrKblCmXnmZ3
         flvVx9P7vS2xHiLTsMVbPDrCVFl9VIjHw5bP76YcdTN3vV4igOG7FabFYx5tUl119AMh
         IHgA==
X-Gm-Message-State: AOJu0Yzy4bm+Hgglm5V1+zsp5b0dV8e4NYm4ouxmNdq7O+OMUaNdaALP
	yoZ1mgMi8MlBr3+dvwcKBB3yRWWXA5ZawabtuTMgAQ==
X-Google-Smtp-Source: AGHT+IGoap3T5IdklsK8edLZEnTxgQRmoWUpdkrbLlyk6n1CM0MxLtok/B+HS4P8gwV2D437XxUZL/WznF8YciQmScQ=
X-Received: by 2002:a05:6512:3f0:b0:50a:6fc5:e95c with SMTP id
 n16-20020a05651203f000b0050a6fc5e95cmr5220855lfq.60.1699952279990; Tue, 14
 Nov 2023 00:57:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
In-Reply-To: <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 14 Nov 2023 16:57:48 +0800
Message-ID: <CAGXv+5G+J__Z_YBySxrkthhwa71shq7aCeKZ_DEZCK=PLgYwUg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, rafael@kernel.org, 
	tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 6:54=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 09/11/23 11:05, Chen-Yu Tsai ha scritto:
> > Hi everyone,
> >
> > This v2 series continues Doug's "of: device: Support 2nd sources of
> > probeable but undiscoverable devices" [1] series, but follows the schem=
e
> > suggested by Rob, marking all second source component device nodes
> > as "fail-needs-probe-XXX", and having a hardware prober driver enable
> > the one of them. I tried to include everyone from the original Cc: list=
.
> > Please let me know if you would like to be dropped from future
> > submissions.
> >
> >
> > For the I2C component (touchscreens and trackpads) case from the
> > original series, the hardware prober driver finds the particular
> > class of device in the device tree, gets its parent I2C adapter,
> > and tries to initiate a simple I2C read for each device under that
> > I2C bus. When it finds one that responds, it considers that one
> > present, marks it as "okay", and returns, letting the driver core
> > actually probe the device.
> >
> > This works fine in most cases since these components are connected
> > via ribbon cable and always have the same resources. The driver as
> > implemented currently doesn't deal with regulators or GPIO pins,
> > since in the existing device trees they are either always on for
> > regulators, or have GPIO hogs or pinmux and pinconfig directly
> > tied to the pin controller.
> >
> >
> > Another case this driver could handle is selecting components based
> > on some identifier passed in by the firmware. On Chromebooks we have
> > a SKU ID which is inserted by the bootloader at
> > /firmware/coreboot/sku-id. When a new combination of components is
> > introduced, a new SKU ID is allocated to it. To have SKU ID based
> > device trees, we would need to have one per SKU ID. This ends up
> > increasing the number of device trees we have a lot. The recent
> > MT8186 devices already have 10+10 SKUs [2], with possibly more to come.
> >
> > Instead, we could have just one device tree for each device, with
> > component options listed and marked as "fail-needs-probe-XXX", and
> > let the hardware prober enable one of them based on the given SKU ID.
> > The driver will also fix up OF graph remote endpoints to point to the
> > enabled component.
> >
> > The MT8186 Corsola series [2] can also benefit from this, though I
> > haven't implemented anything yet.
> >
> >
> > Patch 1 adds of_device_is_fail() for the new driver to use.
> >
> > Patch 2 implements the first case, probing the I2C bus for presence
> > of components. This initial version targets the Hana Chromebooks.
> >
> > Patch 3 modifies the Hana device tree and marks the touchscreens
> > and trackpads as "fail-needs-probe-XXX", ready for the driver to
> > probe.
> >
> > Patch 4 adds a missing touchscreen variant to Hana.
> >
> > Patch 5 implements the second case, selectively enabling components
> > based on the SKU ID. This initial version targets the Krane ChromeOS
> > tablet, which has two possible MIPI DSI display panel options.
> >
> > Patch 6 drops Krane's SKU-specific compatible strings from the bindings=
.
> >
> > Patch 7 merges Krane's SKU-specific device trees into one, with the
> > device tree now containing two possible panels. This unfortunately
> > introduces a dtc warning:
> >
> >      arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dts:81.13-83.6:
> >          Warning (graph_endpoint): /soc/dsi@14014000/panel2@0/port/endp=
oint:
> >       graph connection to node '/soc/dsi@14014000/ports/port/endpoint'
> >           is not bidirectional
> >
> >
> > Please take a look.
> >
> > Johan, I'm not sure if this works as is for the Lenovo Thinkpad 13S
> > case, since it looks like the trackpad shares the I2C bus with the
> > keyboard.
> >
> >
> > Thanks
> > ChenYu
> >
> >
> > Background as given in Doug's cover letter:
> >
> > Support for multiple "equivalent" sources for components (also known
> > as second sourcing components) is a standard practice that helps keep
> > cost down and also makes sure that if one component is unavailable due
> > to a shortage that we don't need to stop production for the whole
> > product.
> >
> > Some components are very easy to second source. eMMC, for instance, is
> > fully discoverable and probable so you can stuff a wide variety of
> > similar eMMC chips on your board and things will work without a hitch.
> >
> > Some components are more difficult to second source, specifically
> > because it's difficult for software to probe what component is present
> > on any given board. In cases like this software is provided
> > supplementary information to help it, like a GPIO strap or a SKU ID
> > programmed into an EEPROM. This helpful information can allow the
> > bootloader to select a different device tree. The various different
> > "SKUs" of different Chromebooks are examples of this.
> >
> > Some components are somewhere in between. These in-between components
> > are the subject of this patch. Specifically, these components are
> > easily "probeable" but not easily "discoverable".
> >
> > A good example of a probeable but undiscoverable device is an
> > i2c-connected touchscreen or trackpad. Two separate components may be
> > electrically compatible with each other and may have compatible power
> > sequencing requirements but may require different software. If
> > software is told about the different possible components (because it
> > can't discover them), it can safely probe them to figure out which
> > ones are present.
> >
> > On systems using device tree, if we want to tell the OS about all of
> > the different components we need to list them all in the device
> > tree. This leads to a problem. The multiple sources for components
> > likely use the same resources (GPIOs, interrupts, regulators). If the
> > OS tries to probe all of these components at the same time then it
> > will detect a resource conflict and that's a fatal error.
> >
> > The fact that Linux can't handle these probeable but undiscoverable
> > devices well has had a few consequences:
> > 1. In some cases, we've abandoned the idea of second sourcing
> >     components for a given board, which increases cost / generates
> >     manufacturing headaches.
> > 2. In some cases, we've been forced to add some sort of strapping /
> >     EEPROM to indicate which component is present. This adds difficulty
> >     to manufacturing / refurb processes.
> > 3. In some cases, we've managed to make things work by the skin of our
> >     teeth through slightly hacky solutions. Specifically, if we remove
> >     the "pinctrl" entry from the various options then it won't
> >     conflict. Regulators inherently can have more than one consumer, so
> >     as long as there are no GPIOs involved in power sequencing and
> >     probing devices then things can work. This is how
> >     "sc8280xp-lenovo-thinkpad-x13s" works and also how
> >     "mt8173-elm-hana" works.
> >
> > End of background from Doug's cover letter.
>
> I think that using "status" is not a good idea, I find that confusing.

It isn't a hard requirement. The current I2C prober actually just looks
at the node name, which already should be a generic class type. It then
assumes that all the components of the same class that it is supposed
to probe for are on the same bus. I think this is a fair assumption for
replaceable parts connected via ribbon cable or co-layout parts?

> Perhaps we could have a node like
>
> something {
>         device-class-one =3D <&device1>, <&device2>, <&device3>;
>         device-class-two =3D <&device4>, <&device5>, <&device6>;
> }
>
> so that'd be more or less
>
> hw-prober {
>         trackpads =3D <&tp1>, <&tp2>;
>         keyboards =3D <&kb1>, <&kb2>;
>         touchscreens =3D <&ts1>, <&ts2>;
> }

This was already nacked by Rob.

> Besides, something else I can suggest here is to make this more generic: =
actually,
> this issue is spread across way more devices than you maybe think... for =
example,
> I know of some smartphones that may have the same situation with DSI disp=
lays and
> they're sometimes distinguished by an ADC value, sometimes by reading bac=
k the
> manufacturer ID (or panel id) through DSI.

ADC strapping is common. Though we might need some kind of binding about ho=
w
to describe the ADC strapping scheme, as this is bound to be different acro=
ss
boards.

Reading back from DSI feels problematic to implement. But I don't know much
about DSI ATM. Doug implied in our offline discussion that DSI panels might
have power sequencing requirements that are all over the place.

> Also, if Chromebooks really need something "special", such as that corebo=
ot sku-id
> parameter, I think that this should be registered externally into the hw =
prober
> and not embedded inside of the *generic* hw prober driver.
>
> We can even reuse of_device_id instead of inventing a new hw_prober_entry=
 struct...
>
> Idea:
>
> drivers/platform/chrome/cros_of_hw_prober.c
>
> static int cros_sku_hw_prober(struct platform_device *pdev, const void *d=
ata)
> {
>         ...this is your cros_sku_component_selector() function, anyway...
> }
>
> static const struct of_device_id cros_hw_prober_ids[] =3D {
>         { .compatible =3D "google,hana", .data =3D something },
>         { /* sentinel */ }
> };
>
> static int some_kind_of_early_init_function(something)
> {
>         int a,b,c,ret,something;
>
>         .. some logic if necessary ..
>
>         return of_hw_prober_register(cros_sku_hw_prober, cros_hw_prober_i=
ds);
> }

This feels a bit too layered, and requires all the board specific code to
have an early init function. I think exposing common helper functions for
boards to implement prober drivers would be better. Then the prober could
also be a module if that made sense. Given that SoC vendors are making
clock controller drivers modules, this doesn't seem very far fetched.

> Btw, thanks for starting that. If this will be done the right way, it's g=
oing to
> be useful to many, many people.

Right. I only have a limited view of applications, so input is always welco=
me.

Thanks
ChenYu

> Regards,
> Angelo
>
> >
> > [1] https://lore.kernel.org/all/20230921102420.RFC.1.I9dddd99ccdca175e3=
ceb1b9fa1827df0928c5101@changeid/
> > [2] https://lore.kernel.org/linux-mediatek/20231012230237.2676469-1-wen=
st@chromium.org/
> >
> > Chen-Yu Tsai (7):
> >    of: base: Add of_device_is_fail
> >    of: Introduce hardware prober driver
> >    arm64: dts: mediatek: mt8173-elm-hana: Mark touchscreens and trackpa=
ds
> >      as fail
> >    arm64: dts: mediatek: mt8173-elm-hana: Add G2touch G7500 touchscreen
> >    of: hw_prober: Support Chromebook SKU ID based component selection
> >    dt-bindings: arm: mediatek: Remove SKU specific compatibles for Goog=
le
> >      Krane
> >    arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees
> >
> >   .../devicetree/bindings/arm/mediatek.yaml     |   3 -
> >   arch/arm64/boot/dts/mediatek/Makefile         |   3 +-
> >   .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |  20 ++
> >   .../dts/mediatek/mt8183-kukui-krane-sku0.dts  |  24 --
> >   .../mediatek/mt8183-kukui-krane-sku176.dts    |  24 --
> >   ...ukui-krane.dtsi =3D> mt8183-kukui-krane.dts} |  47 ++-
> >   drivers/of/Kconfig                            |  13 +
> >   drivers/of/Makefile                           |   1 +
> >   drivers/of/base.c                             |  20 ++
> >   drivers/of/hw_prober.c                        | 314 +++++++++++++++++=
+
> >   include/linux/of.h                            |   6 +
> >   11 files changed, 418 insertions(+), 57 deletions(-)
> >   delete mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sk=
u0.dts
> >   delete mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sk=
u176.dts
> >   rename arch/arm64/boot/dts/mediatek/{mt8183-kukui-krane.dtsi =3D> mt8=
183-kukui-krane.dts} (86%)
> >   create mode 100644 drivers/of/hw_prober.c
> >
>

