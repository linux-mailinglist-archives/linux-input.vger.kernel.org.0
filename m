Return-Path: <linux-input+bounces-14640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA41B54558
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 10:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 798743BB4AF
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 08:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A284F2D9488;
	Fri, 12 Sep 2025 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B2zDjiL7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51C42D8382
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 08:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665681; cv=none; b=B5892Sh7A34CPKj0/Ye7409SX5keMmFh33TMtA9hdG9fodnGVXej8vB9+sOcQmdV0v5zI/dk+I0N8sfYLi5wvsNO9Qq3B+K4kp5mQYoH8pLu58VfWhhI89m73gj+WcMe0ksADMPfIeK2k1H74rklvcCG5yBfkXeK3llSkGzkgB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665681; c=relaxed/simple;
	bh=M4UFtGv3HJ7UUX5/e1FKWhwvIsp06D8ghh/PjljWBns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGiwKv+DbBBBYRFSvkg80Qj5W/kJq4bNCtvCC9cq0yhiWPDjZdh71CUk6lS3CB3CyZuoGjSJODbvtvBxoCCyTPNNUJOdw5MAuB8POSSw4DF2qh+m2CGN0yruTVurU5AHvdEifmH1wiBJoMoV+sVgCdBsG+HVXK1CCH//bten0nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B2zDjiL7; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336ce4a894cso13391151fa.1
        for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757665677; x=1758270477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
        b=B2zDjiL7rZBnxNGGG1W/zmptbbexjIiboTdiZnl8P4MXjlQtPzFfRQpdeok/XTS5Jp
         2tYa7NiJe80HLUyXzUiCGN0k7CE9Hp1tLLFZNilsU6onniafBlyY6lVXUsv5BDI15KVt
         LDURTgbjXb1Z1OrajtBcuSgIYEK2gWqlUUQu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665677; x=1758270477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zi88VRbZEuFnGbKkriA0LDu6mR+gOJpwP4/2p/PnZ1A=;
        b=fCokq7xPyqrB9R7w4b+vg6ofX1kGPrXuAWx6x/WHVwpNywJu8FaKqzrBOC6z6qeyfX
         O+wOjUQmvbja7W7MNuvITdx1ehLzQRyk9rdSk8IHmFDCYthhTjGXHo0Mx02lzA4x9nSV
         FOEDS1IYxjM4ryHonuZQQkSfElTtbtCYnlcBDORcnGrhHtBr5PGdBv0AEwIztcquZwhR
         YO4ESRDmlOp7ywEhx8riv0KpE5QOqTZPObJb9gBZ9TKyFG6Oit8jUGQ6p2gpM7HKgxHI
         eH3SyaWxF6VhX4/RZ78+OixASiuleVYL8fSxnW80QrMbCLLnb4xpxS6lxH+6dUBy1UGz
         4NWg==
X-Forwarded-Encrypted: i=1; AJvYcCWl7rESZIEIXaa3j6AMwfQLjhjJNGb9wsla7019Vfn+tGwHLM1re/KJAOQ89gJLtfzkokT8iW9c9yjjsg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp2XEQFmzwpeADeubenLM6ecDe5/YX6dGpzHGJ46rLplmdDnlB
	WRkFEdS5BUs4GYdjFgd8bMlOQloorIcHIVSjfLakH18tq85SEi6YvAGmtgP466WnCHwgh0pf9+D
	zq3Aijyp/Sd4C+EnN1tFIrIJn/temZCk9ufhYC8Dw
X-Gm-Gg: ASbGnct96gpj0QcXWTpILj/dZQ10ybYpVasLAZdF/wJc/GRRsURoSNt5dmGuMsWCIiZ
	8cXDh2vC/N/j8oxWikTDHkLogHv9xKN3EMq6aqyWsr6bzYdOCcBztJU1AeiWZ+pNDkQ5TxzjFox
	y7m4/DEq359niQ/Mnd8/NbVrevu4W0OHz8Ek24wud7hj9aNE1pZ+DdlnS+y8LIAOEcJpQsc1EGF
	yObDYnGouZAcs8gVrAgoMSBinxvad1fuPSuVw==
X-Google-Smtp-Source: AGHT+IGuFu/6x8GGdyKs3uZP46gycKBj+oJ6yMQK+fd/K5sFBfDmEqPc/X66Qf0G8U/XPK4phpEvZh/Ddpcm0n+c0BE=
X-Received: by 2002:a05:651c:4350:20b0:336:6481:1549 with SMTP id
 38308e7fff4ca-3513aeb2e2amr5142751fa.12.1757665676867; Fri, 12 Sep 2025
 01:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250911151001.108744-2-ariel.dalessandro@collabora.com> <20250912-alluring-turaco-of-conversion-dca193@kuoka>
In-Reply-To: <20250912-alluring-turaco-of-conversion-dca193@kuoka>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Sep 2025 16:27:45 +0800
X-Gm-Features: Ac12FXxVG1RuSVKZojzF8lrEoj8T-u7pZlbyr1abmA13aynWyYRO-SXBCvUw2XE
Message-ID: <CAGXv+5GovP7NuG042AwfmtC-sPJMGuFAm6iZ0iqNZgU0VE+qmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] dt-bindings: media: Convert MediaTek mt8173-mdp
 bindings to DT schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
	amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com, 
	kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, 
	louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com, 
	maarten.lankhorst@linux.intel.com, marcel@holtmann.org, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 2:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Thu, Sep 11, 2025 at 12:09:50PM -0300, Ariel D'Alessandro wrote:
> > Convert the existing text-based DT bindings for MediaTek MT8173 Media D=
ata
> > Path to a DT schema.
> >
> > Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > ---
> >  .../bindings/media/mediatek,mt8173-mdp.yaml   | 169 ++++++++++++++++++
> >  .../bindings/media/mediatek-mdp.txt           |  95 ----------
> >  2 files changed, 169 insertions(+), 95 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt=
8173-mdp.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-md=
p.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8173-md=
p.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > new file mode 100644
> > index 0000000000000..8ca33a733c478
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/mediatek,mt8173-mdp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT8173 Media Data Path
> > +
> > +maintainers:
> > +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> > +
> > +description:
> > +  Media Data Path is used for scaling and color space conversion.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - mediatek,mt8173-mdp-rdma
> > +          - mediatek,mt8173-mdp-rsz
> > +          - mediatek,mt8173-mdp-wdma
> > +          - mediatek,mt8173-mdp-wrot
>
> Why there is no mediatek,mt8173-mdp here? What does this compatible
> represent?
>
> > +      - items:
> > +          - const: mediatek,mt8173-mdp-rdma
>
> Still suspicious. Device cannot be simulatanously: compatible and not
> compatible. This is not a well known cat that has superposition of two
> states, whenenver you look the other way.
>
> Maybe the old binding was incorrect, maybe the in-tree DTS is incorrect.
> Whichever the reason, this must be investigated and documented, because
> by standard rules this is wrong. Each wrong code needs very clear
> explanations (and "someone did it" is not a good enough explanation).

My guess is that "mediatek,mt8173-mdp" is meant to serve as a single
entry point for the implementation to bind the driver to. The MDP is
a Data Pipeline and there could be multiple instances of the same
IP block, as seen in the original example.

The datasheet I have doesn't cover the "RDMA" block specifically, so
I can't say whether there is an actual difference between the two RDMA
blocks.


ChenYu

> > +          - const: mediatek,mt8173-mdp
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  mediatek,vpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      phandle to Mediatek Video Processor Unit for HW Codec encode/dec=
ode and
> > +      image processing.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp-rdma
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +            - description: Mutex clock
> > +    else:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Main clock
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8173-mdp-rdma
> > +              - mediatek,mt8173-mdp-wdma
> > +              - mediatek,mt8173-mdp-wrot
> > +    then:
> > +      required:
> > +        - iommus
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8173-mdp
> > +    then:
> > +      required:
> > +        - mediatek,vpu
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8173-clk.h>
> > +    #include <dt-bindings/memory/mt8173-larb-port.h>
> > +    #include <dt-bindings/power/mt8173-power.h>
> > +
> > +    soc {
> > +        #address-cells =3D <2>;
> > +        #size-cells =3D <2>;
> > +
> > +        mdp_rdma0: rdma@14001000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma",
> > +                         "mediatek,mt8173-mdp";
> > +            reg =3D <0 0x14001000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA0>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA0>;
> > +            mediatek,vpu =3D <&vpu>;
> > +        };
> > +
> > +        mdp_rdma1: rdma@14002000 {
> > +            compatible =3D "mediatek,mt8173-mdp-rdma";
> > +            reg =3D <0 0x14002000 0 0x1000>;
> > +            clocks =3D <&mmsys CLK_MM_MDP_RDMA1>,
> > +                     <&mmsys CLK_MM_MUTEX_32K>;
> > +            power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
> > +            iommus =3D <&iommu M4U_PORT_MDP_RDMA1>;
> > +        };
>
> My previous comment applies.
>
> Keep one or two examples.
>
> Best regards,
> Krzysztof
>

