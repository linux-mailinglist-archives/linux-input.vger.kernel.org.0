Return-Path: <linux-input+bounces-5596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D011953C9F
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 23:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 416C6B23A0C
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 21:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E031509AF;
	Thu, 15 Aug 2024 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd+2e0yb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E4814BF9B;
	Thu, 15 Aug 2024 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757480; cv=none; b=EGhhiRN+6dXaVcULd4YjAItLIyzdCIGMKC/x0OuU954EXissBxwazWbv9+SpKeYd081rMZFrjUDsHYMQXdXO8T1zOlW4YlhEek0YNRwjQ+YBDoxe6M+ZWA1MCGfl76At9pZpEBgthQCNKfyq1ygDaepSe0efm5loQnDbwJWU2/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757480; c=relaxed/simple;
	bh=y29BbustoMLewPRt81MfznS0rO4+SLRhzWeXcBj4WPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r1AhBaKxDz1W82nbIGoZAs/bXkMLBchoaKsHBPA1Zosx658MpSHEez/JoPHKaVuEGnKa6RGu8iW/oLupXfESMVBoCksUQc9ucF/9yYJRmEy+tq8OxqL1wb/kepX+8kwwDU4Ro9EK3kvBWw+2ESDQSfsW7q59TtvQjB/Az83Ih88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nd+2e0yb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA10C4AF0E;
	Thu, 15 Aug 2024 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723757480;
	bh=y29BbustoMLewPRt81MfznS0rO4+SLRhzWeXcBj4WPY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nd+2e0ybFtUiqfOGY2DfQV4kzaFOa78aY++ncoQ3Nun01UCeGviI5lhlNMlg+Ka1R
	 zz2TRUEzfnrqoSHlvII8zMlDVqIm+rd/5SioXwZflr7JkoFf1tD+18OF8FBsG/tuBY
	 OqalULd4pH23F6Udp/SwbfQNpNup5SOuAxOsEWQnREBx0J/4UjI8G44U6YoFSCZD0d
	 5e1QhQE62oRfhojuJaCWXO25Vwmkwj9160NRqp91zrmc2UinkKsSmD+lgnVrrkCB5Z
	 6RKGxcruhm7kv1WGVN0vPDD6+RxulPBp0SqCQkHjlZIdQXjqhyx5Jq9MhbqyIxn3sA
	 WrJqSOa8LCsPQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so19229341fa.0;
        Thu, 15 Aug 2024 14:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK4M9Uv+nUf7pc+Pb0tkde7CsKYSuHDch6Zy34prkLymNahBzKfIWhzpf240x2Zj72utkg6wgzmJuWVc+C5bUPPKFEaxEPRpDoAyQk2vEFBzJLG+31zVPJxilK17puOR8gNHlx53LRFStzb+OR1NT4/DQ1eIy0ukSTJAuuDdu14AA3g3+g
X-Gm-Message-State: AOJu0Yw8O7yKeiRlyHCk4IuCMPHgfqeKKqTYzjpkR/S42WoVuxAeZmPd
	5eZCqDbfGvE3CgsIGn33Xi6efQ933xXYKcm3iC6Xj+M4+WCNKNA3ELxEEihneY1CotYC5QwrZ+E
	8QGkRs9U/p8EeScPyqWWc1sDI1g==
X-Google-Smtp-Source: AGHT+IHbw2Ci3GPt62XAxOLHUDxkesDk1wSg5AJZLEzVnTay9yA/b2u5/hxZzBon0Bt7Z/aLUXeTAngSTpB7Kb7GzVE=
X-Received: by 2002:a2e:f01:0:b0:2ef:286e:ca68 with SMTP id
 38308e7fff4ca-2f3be5975dcmr5993031fa.23.1723757478269; Thu, 15 Aug 2024
 14:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814185140.4033029-1-Frank.Li@nxp.com> <20240814211345.GA4028598-robh@kernel.org>
 <20240814214902.GA4101180-robh@kernel.org> <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
 <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
 <Zr4eLg+CUQuJHc45@lizhi-Precision-Tower-5810> <Zr5lKNy08nbtjz9n@lizhi-Precision-Tower-5810>
In-Reply-To: <Zr5lKNy08nbtjz9n@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 15:31:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL1DkNDM2Xpj=9KVA+ws0DbsEVYNAfrVPoKED7dC0YFVA@mail.gmail.com>
Message-ID: <CAL_JsqL1DkNDM2Xpj=9KVA+ws0DbsEVYNAfrVPoKED7dC0YFVA@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
To: Frank Li <Frank.li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Marek Vasut <marex@denx.de>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 2:29=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Thu, Aug 15, 2024 at 11:26:38AM -0400, Frank Li wrote:
> > On Thu, Aug 15, 2024 at 09:17:48AM -0600, Rob Herring wrote:
> > > On Wed, Aug 14, 2024 at 8:01=E2=80=AFPM Frank Li <Frank.li@nxp.com> w=
rote:
> > > >
> > > > On Wed, Aug 14, 2024 at 03:49:02PM -0600, Rob Herring wrote:
> > > > > On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> > > > > > On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > > > > > > Convert binding doc ads7846.txt to yaml format.
> > > > > > > Additional change:
> > > > > > > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > > > > > > - use common node name touchscreen.
> > > > > > >
> > > > > > > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-s=
om-symphony.dtb: touchscreen@0:
> > > > > > >   ti,x-min: b'\x00}' is not of type 'object', 'array', 'boole=
an', 'null'
> > > > > > >
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > > There are warning:
> > > > > > > Documentation/devicetree/bindings/input/touchscreen/ti,ads784=
3.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'cons=
t': '$ref'}
> > > > > > >   hint: Standard unit suffix properties don't need a type $re=
f
> > > > > > >
> > > > > > > I don't know how to fix it. ti,x-plate-ohms is 16bit, but def=
ault it is
> > > > > > > uint32
> > > > > >
> > > > > > It's going to have to be a special case in dtschema. I'll work =
on a fix.
> > > > >
> > > > > Should be fixed now in dtschema main branch.
> > > >
> > > > Strange, dt_binding_check can pass. but
> > > >
> > > >  make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- -j8 CHECK_DTB=
S=3Dy imx8mm-var-som-symphony.dtb
> > > >   UPD     include/config/kernel.release
> > > >   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
> > > > arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscr=
een@0: ti,x-plate-ohms: 180 is not of type 'array'
> > > >         from schema $id: http://devicetree.org/schemas/property-uni=
ts.yaml#
> > > >
> > > > anything wrong?
> > >
> > > Now fixed.
> >
> > Yes, thanks.
>
> A new error in dt_binding_check
>
> Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x=
-plate-ohms: missing type definition

That one is intermittent and can be ignored for now. It depends on the
order the schema get processed. 'mac-mode' is another one that shows
up sometimes.

Rob

