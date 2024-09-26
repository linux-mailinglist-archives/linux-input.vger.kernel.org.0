Return-Path: <linux-input+bounces-6725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E5D986AC3
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 03:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E24741C215C8
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 01:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408A216A92D;
	Thu, 26 Sep 2024 01:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5nJQGju"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC6C125;
	Thu, 26 Sep 2024 01:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727315490; cv=none; b=pwOGgxW7jpFEswTLIqcQl5N4BaMWB1Thh116kDODi/P9TXx4T0mmpHaHZVSNdfzr4BUEtxUxshJHN4yPILinWsoLYLbtsd1cxYG/1Z3oB36t5PbRPBdAPpgNVSvCotD/yAx/J+F1Uv4aSW+4h3Ct2bLN3bAkHQ5QK5BiS4CHiRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727315490; c=relaxed/simple;
	bh=zmniUrX/60l3nZXiIX8G/+d8ERVzLHFShiCtMEjBaT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=It7xppQ4bsDQVecNXdMKDHsLILJCfZfkB6ucVjNTFsxZNQsKmWXIJsRo3VYQ2+rBEFYjf33DK4AbYe3pi8wMLtFtRwTgZAuyr2dpqUzsM2XQTx9uT6JISUF6/gXi6Z74nJS2/dBgQ00RBBdmKJ9NLyqXQlfkzRTjY/83g+bpQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5nJQGju; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D188C4CECD;
	Thu, 26 Sep 2024 01:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727315489;
	bh=zmniUrX/60l3nZXiIX8G/+d8ERVzLHFShiCtMEjBaT8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J5nJQGjuJYG/3kIjQ3GPWUsXVnLGL3NloFzCG8kfXJ1IrV2cn8SUM6/IyBSwAsvAL
	 zOmqpRQH7lsRKH2bfmMSOUg8XZdnypj3w1Wr4pKyBoTQtIWGTbGSbejYb8HjOvPqp3
	 yyLeExErPvmcVJx+oBD+XVmN1xX+GC/XPMeuwNdlRqvZ/b+Wvw5WxjSKJ1T54yJd6w
	 sPhwWh6cocDP5zBfdI1Srqju7vlyJvLJO+qccFb31Jme4JMEgqRYP+9Hu14A1EOIrk
	 3COkiW1gGzf/o0FBY8ddLdrDwCRJeNygk7s0ACvV/EXT2ZRgt55eaDYAdyCIUFKgLY
	 NB3LN4CRV5chg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5356bb55224so622012e87.0;
        Wed, 25 Sep 2024 18:51:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7fNn4iA/qhDQPHTPS4PCPSAMMWIMedA3hAf4WSEqgFExIQYMQeNmWaVDDINQ5vQqudNafu/R8l0Sj@vger.kernel.org, AJvYcCWa5SmnNPgMqOSgiqDQK41F1s/INzyiw+yEVv8M6qFtY02Vz+Qhs6M6EqkDIW4vNftsihDYaJv8nLUYXzjW@vger.kernel.org, AJvYcCXgxZpQGXvMcT7IbvefpyDTP5AB3DdS2wzo7CsOA1vv4zkejLTSlnHPdGct6k75QckWua1ubzn3gNzMQHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHStwvjKVrhE+LIcRT89Xz2t6W2dmFOhuOIwSz2ESvRoBz+/F
	C6gouYmXxR7rsm8GJZYsJ4u0dC8WxNehzrByo+iJmfvoL60SvI8ZXIocdg/aFOSx/B3Bw4fGLvc
	SQLOKOWI7fjF5eF77T3r79gCHzA==
X-Google-Smtp-Source: AGHT+IGCt9Yyj748HQEDuTnOEpxj1vC8ZiYgiNLWVgA7RN5u4PsNuE0keloke/9LPArWb/GCufESyC1kuypAjFsG2us=
X-Received: by 2002:a05:6512:401e:b0:537:a864:dca7 with SMTP id
 2adb3069b0e04-53877565c70mr2813506e87.55.1727315487750; Wed, 25 Sep 2024
 18:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com> <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
 <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
 <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com> <ZvSEkn66qNziJV0M@google.com>
In-Reply-To: <ZvSEkn66qNziJV0M@google.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Sep 2024 20:51:14 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJhchCn8QbT2kV7hPfgtYP=-32YE4WT51fy_5iSOLMZ=g@mail.gmail.com>
Message-ID: <CAL_JsqJhchCn8QbT2kV7hPfgtYP=-32YE4WT51fy_5iSOLMZ=g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Charles Wang <charles.goodix@gmail.com>, dianders@chromium.org, 
	dan.carpenter@linaro.org, conor@kernel.org, krzk+dt@kernel.org, 
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 4:46=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Wed, Sep 25, 2024 at 12:40:56PM -0500, Rob Herring wrote:
> > On Tue, Sep 10, 2024 at 5:41=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Fri, Sep 6, 2024 at 3:28=E2=80=AFPM Rob Herring <robh@kernel.org> =
wrote:
> > > >
> > > > On Tue, Aug 13, 2024 at 9:45=E2=80=AFPM Charles Wang <charles.goodi=
x@gmail.com> wrote:
> > > > >
> > > > > The Goodix GT7986U touch controller report touch data according t=
o the
> > > > > HID protocol through the SPI bus. However, it is incompatible wit=
h
> > > > > Microsoft's HID-over-SPI protocol.
> > > > >
> > > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > > > ---
> > > > >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++=
++++++
> > > > >  1 file changed, 71 insertions(+)
> > > > >  create mode 100644 Documentation/devicetree/bindings/input/goodi=
x,gt7986u.yaml
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/input/goodix,gt798=
6u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > > new file mode 100644
> > > > > index 000000000..a7d42a5d6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > > > @@ -0,0 +1,71 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: GOODIX GT7986U SPI HID Touchscreen
> > > > > +
> > > > > +maintainers:
> > > > > +  - Charles Wang <charles.goodix@gmail.com>
> > > > > +
> > > > > +description: Supports the Goodix GT7986U touchscreen.
> > > > > +  This touch controller reports data packaged according to the H=
ID protocol,
> > > > > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - goodix,gt7986u
> > > >
> > > > This is already documented in goodix,gt7375p.yaml. Now linux-next h=
as warnings:
> > > >
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input=
/goodix,gt7986u.example.dtb:
> > > > touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> > > > fixed:
> > > >         ['goodix,gt7986u'] is too short
> > > >         'goodix,gt7375p' was expected
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input=
/goodix,gt7986u.example.dtb:
> > > > touchscreen@0: reg:0:0: 0 is not one of [93, 20]
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input=
/goodix,gt7986u.example.dtb:
> > > > touchscreen@0: 'vdd-supply' is a required property
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input=
/goodix,gt7986u.example.dtb:
> > > > touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
> > > > match any of the regexes: 'pinctrl-[0-9]+'
> > > >         from schema $id:
> > > > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > > >
> > > > Please sort this out and send a fix.
> > >
> > > I should add that it is intermittent whether you see this error or
> > > not. The tools select a single schema based on the compatible string
> > > and it is undefined which of the 2 schemas you will get.
> >
> > Still an issue and no response. Please fix or revert the series.
>
> I see that Krzysztof sent a revert, but what a proper fix would be?
> Apparently Goodix is using the same product ID gt7986u for both I2C and
> SPI parts, and covering them in one binding is not really easy (well, I
> guess it is possible with a big ugly "if"). Do we just slap "-spi"
> suffix on the compatible, so it becomes "goodix,gt7986u-spi" and go on
> on our merry way? Is there a better option for such products that
> support multiple interfaces/transports?

Generally we just have 1 compatible and 1 schema for both. The schema
can reference spi-peripheral-props.yaml unconditionally. If someone
wants to put SPI properties in a node for I2C connected device, then
that would be allowed, but who cares.

There's been some discussion about having some sort of pseudo property
similar to $nodename to define the bus for a node and then we could
use that.

Rob

