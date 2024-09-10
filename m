Return-Path: <linux-input+bounces-6421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B5974615
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 00:41:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEF1CB22388
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 22:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566A71ABEB9;
	Tue, 10 Sep 2024 22:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfDRIZBm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5C1A76BE;
	Tue, 10 Sep 2024 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726008100; cv=none; b=WY3GYPZAcCub5Ghlz3pxAr8GWgP3Jm+3c/mjfN7kb0Q7S+d6UH9q71cdziZPP7ZxSQQXUvdFX+o+Y/0kfslEeciNTFQabWqnJVzOsYkIFJh2mEg41/0Svc0ra/0yhn3aZWg0S2ATxQZt8phnlSK2ja0Vn+ash4yoCab3kLeJcuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726008100; c=relaxed/simple;
	bh=bRYRG1YdSSBfG5SOFxpfbV7FJ/3+ErU3mg8gq30DZMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFW4QI8uSbOQNzWd2qZxTfscX3+YH3F+cBZb0Rr4IvgMcumiowezXv4KYMI+YYpKjeiSvfmdmSiac/jDxdCbMlSVxYwxZKHbrfyhB7Kvc0WgDUNKz61vfOlFsKYymJxlN7PyXtgJtCgbYP+m4tp/UNIb2avxEHjOz9EoYz72kpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfDRIZBm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE67C4CECD;
	Tue, 10 Sep 2024 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726008099;
	bh=bRYRG1YdSSBfG5SOFxpfbV7FJ/3+ErU3mg8gq30DZMA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QfDRIZBmuKjHgPUwixShEmzzqEtP/ajV/StqF5aue4rlj/ivZ+nRB6TYvNz8KGrel
	 Xg+cYcDcf2sAox5IUwz1r3tqBDiV+hohlC5mO3XgjKNXJ/KxuxeaNBo9YHAgcKExj0
	 S1i7RjZy1mv4w+rnPOR1MDMazizG6oeEqZmoqSyd6h9b0clbMhs14abiGuq7rUj8c+
	 Y0V7k1I/lAC62Vv9aKxgAiMODSESOcjMUrehpjNHVG8vpd2ffSQENB84NmKnmZj73+
	 QYPcMs8lcQdHgvOxkRoS07ulN7zDq+jMwd2WHBIX1UIFYz6zH1rhe4UmYSag+mgDAL
	 717L9iA+/1Ctw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so5683082e87.3;
        Tue, 10 Sep 2024 15:41:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9h6+8MCXq5iYi9agN8R0kJqg5QZwdFmG3P6qkivOArPK4rrFdBB/5gbi8285vx5k//QemKEsGqNskcscQ@vger.kernel.org, AJvYcCXHthsSlUAG1PeXtpia3KVNlZvYM1Gyexll3ZpWFY87ZFh1BPp1rJcN4AaEi/vKjIpM4qC1q5SrKc/O@vger.kernel.org, AJvYcCXy7bCxOjt+2jpgrJmOwXwSI8pIbUJJmwy2ebIpnpoEIEyrh2ucNW6ST8U7tG8FSUNS8v9ii3d6qQrHfUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRic3HnSDiE35oTPV/GA8IYKRLQXB/66UMqp+hJ5spJ+E2r+z
	0hd8toxWy/7E2kITVY36BhsnBqGjoYFwVadggCeUKBq/hof7GFyfWxPIZpojH4TuHR0Gw9+F2op
	HYggWUz79bsjNqQUJB+puh0YoNw==
X-Google-Smtp-Source: AGHT+IHcdk6LalhjtKRQr2LdWIrY818yRhKcp+0lcngVX+pIgcfNBt1PKKR6k7KgToEZ/dmBNiCCV4BsrnjrxC7jUPM=
X-Received: by 2002:a05:6512:318c:b0:52e:9b4f:dd8c with SMTP id
 2adb3069b0e04-536587c5fdamr10841069e87.35.1726008098142; Tue, 10 Sep 2024
 15:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com> <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 10 Sep 2024 17:41:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
Message-ID: <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dianders@chromium.org, dan.carpenter@linaro.org, 
	conor@kernel.org, krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024 at 3:28=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Aug 13, 2024 at 9:45=E2=80=AFPM Charles Wang <charles.goodix@gmai=
l.com> wrote:
> >
> > The Goodix GT7986U touch controller report touch data according to the
> > HID protocol through the SPI bus. However, it is incompatible with
> > Microsoft's HID-over-SPI protocol.
> >
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt79=
86u.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yam=
l b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > new file mode 100644
> > index 000000000..a7d42a5d6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > @@ -0,0 +1,71 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GOODIX GT7986U SPI HID Touchscreen
> > +
> > +maintainers:
> > +  - Charles Wang <charles.goodix@gmail.com>
> > +
> > +description: Supports the Goodix GT7986U touchscreen.
> > +  This touch controller reports data packaged according to the HID pro=
tocol,
> > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > +
> > +allOf:
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - goodix,gt7986u
>
> This is already documented in goodix,gt7375p.yaml. Now linux-next has war=
nings:
>
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodi=
x,gt7986u.example.dtb:
> touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> fixed:
>         ['goodix,gt7986u'] is too short
>         'goodix,gt7375p' was expected
>         from schema $id:
> http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodi=
x,gt7986u.example.dtb:
> touchscreen@0: reg:0:0: 0 is not one of [93, 20]
>         from schema $id:
> http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodi=
x,gt7986u.example.dtb:
> touchscreen@0: 'vdd-supply' is a required property
>         from schema $id:
> http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goodi=
x,gt7986u.example.dtb:
> touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
> match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id:
> http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
>
> Please sort this out and send a fix.

I should add that it is intermittent whether you see this error or
not. The tools select a single schema based on the compatible string
and it is undefined which of the 2 schemas you will get.

Rob

