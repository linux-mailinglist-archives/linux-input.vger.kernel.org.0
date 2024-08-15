Return-Path: <linux-input+bounces-5587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906F9536E6
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 17:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 121DC28CC07
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 15:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98451AD9F9;
	Thu, 15 Aug 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAp/N2p5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEE91AD405;
	Thu, 15 Aug 2024 15:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723735084; cv=none; b=cQ0YImL0Q2xt4UvDahLZGO62Z1aGCUY8jqp7YJQ0Sv+cNS/KpPQRvrVstDMX+KuudWpNCCqpsknNCpdXPs29Dxi8rqryiSzmnCtAX8DWRxIsDHt+I0eNutyr0eFcAj+64lrpTtT1BaTkOKKBaDvJKeNeud7YUypM5IGwGLaMgaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723735084; c=relaxed/simple;
	bh=5tVXjoVIwxL4BMXr9WNsqyyJtiNaQdtzEYk2V1zunDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bnpZS9Tlu3acHUP1CSWYCALze71t4/3mTE+OLD2SQwfVcKum9r195rLhtCS5Oyl4R5GLctx3kTMu5uCwI93YqFx6yWpDHaYOPwIckmzKH+infIR2OwjOIRL6ubkp/uWLJv7b7X3l+LlFFnXZdnv04+Ha/2/bna8Z36vDhnCZHJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAp/N2p5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1725FC4AF0F;
	Thu, 15 Aug 2024 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723735084;
	bh=5tVXjoVIwxL4BMXr9WNsqyyJtiNaQdtzEYk2V1zunDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NAp/N2p56Ri97aK5haDod/vrIqxqCRdInU9HAAbcQ507fXyERX4rBAeJvlLp3xJJb
	 yVfqfs/UuZHZcMxsFq7SS2Dl4W/TGJApzzFp39P3QdRWmAoTajr4bSFtB7gdSsHthI
	 gBFvir0bg9BR4rJqdaNrWq3XL2jyQ6AsQokcSGLDfHVr9qRw2iqPab9twhvhw9DjxD
	 gpUG9mFy2ai72xkXYRWL1D57H3Y7Z1fzOorWQHXoAILQoNht0AK8NdkK+kf5QRGSvI
	 pWGuaTJ2k9ekkwg5hql6K5LY9gBRYSQ/UYjmtQbE1Nx1Vd1AbI9sfbY0SGx5R6Hdgk
	 LQDtAWE/zviXQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ef2cb7d562so13378321fa.3;
        Thu, 15 Aug 2024 08:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW12reKmz31HA+5BJUkIwgJBSzzazKHZzN/yu+T0p3mbScUkL3+SZtqoEZ+wNHkTcGZjV2ZNK3CfIWsScM0i41PBhKVsBVNLYO2hCLLCWCWV8DZQGN003WU4asA2U84f6CK1lJ85GQskRhklyRu7CS+EpMYKBTb7vGUhkUVm7NmQb9cIewa
X-Gm-Message-State: AOJu0YyPErCMw3V9d3HdICht7jgXA2bDyaKHPVB9AKrZY2qboaFl4K31
	14bEvH65SYBnORzwagJsTWjShS6k8hGP/P5U8q+6FQhFjMMsVHyFNdnmT9zeWrAuWF1bAyEOH1A
	Mzi18moTjpX8bwfPEYarz1QAP9Q==
X-Google-Smtp-Source: AGHT+IEXBIOuc3+RdpJo9SkRa99F7ys6LHSNNh10wDHMJa72hTN/C4a2yVCWj7kEom8UuIfOX+v3gmT+ViuJb7yQBKU=
X-Received: by 2002:a05:6512:687:b0:52c:d27b:ddcb with SMTP id
 2adb3069b0e04-532eda8e7ecmr4893752e87.3.1723735082365; Thu, 15 Aug 2024
 08:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814185140.4033029-1-Frank.Li@nxp.com> <20240814211345.GA4028598-robh@kernel.org>
 <20240814214902.GA4101180-robh@kernel.org> <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
In-Reply-To: <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 09:17:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
Message-ID: <CAL_JsqJs+aFpOLwWHi32pwAy2Q8N7qK43TuTmEJQn-BqXKwyAw@mail.gmail.com>
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

On Wed, Aug 14, 2024 at 8:01=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Aug 14, 2024 at 03:49:02PM -0600, Rob Herring wrote:
> > On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> > > On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > > > Convert binding doc ads7846.txt to yaml format.
> > > > Additional change:
> > > > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > > > - use common node name touchscreen.
> > > >
> > > > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-sym=
phony.dtb: touchscreen@0:
> > > >   ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', '=
null'
> > > >
> > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > > There are warning:
> > > > Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml=
: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$=
ref'}
> > > >   hint: Standard unit suffix properties don't need a type $ref
> > > >
> > > > I don't know how to fix it. ti,x-plate-ohms is 16bit, but default i=
t is
> > > > uint32
> > >
> > > It's going to have to be a special case in dtschema. I'll work on a f=
ix.
> >
> > Should be fixed now in dtschema main branch.
>
> Strange, dt_binding_check can pass. but
>
>  make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- -j8 CHECK_DTBS=3Dy =
imx8mm-var-som-symphony.dtb
>   UPD     include/config/kernel.release
>   DTC [C] arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
> arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:=
 ti,x-plate-ohms: 180 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/property-units.yam=
l#
>
> anything wrong?

Now fixed.

Rob

