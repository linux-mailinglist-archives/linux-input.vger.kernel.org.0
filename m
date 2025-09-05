Return-Path: <linux-input+bounces-14506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B802CB45662
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 13:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86AF65A4D76
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 11:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DD33431F5;
	Fri,  5 Sep 2025 11:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wv1ats1l"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D2B32A3FD
	for <linux-input@vger.kernel.org>; Fri,  5 Sep 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072005; cv=none; b=O/uT0QQ4Y/xkqNKEpJ34DFyMOc/sWo1RnXJOkHWy56XX8wVlJMqLfi06vYi1CnHfi9lBN/FvV3ZStJtZj3GsEcXwe93YkKRgt67u/eTlYHFFAoM1VQqG7ertgB7mtS4uq3ufYnflC4LX4p3d2l9+43oFI6Tf5VYMpDuASbhAvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072005; c=relaxed/simple;
	bh=o3hildMwaW8SKO7ju4TnjzbgldI5VhKTu/M3PBEf9Pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nnK7vsB4AYcut3Budea966GqpTS5G8a1oxAujBLbtWgQKcMn4J3cYLnD2AoR5lLUbLPZGmdHKR4Hmd7XN5HQX0h2P4ZMxHsO2LcUftncZ1niSWCRyP+ACkuO5PfoYj/EAvS6MEnF+G3BmMtxADYJLvld5EE3jB4UZMSJjc2TUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wv1ats1l; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-336bbcebca9so15591911fa.1
        for <linux-input@vger.kernel.org>; Fri, 05 Sep 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757072001; x=1757676801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=Wv1ats1lENeDFeCHltS6z4eXYjp2PkHp41U/KSjwkprIJpiwUA2iVdzBaZiRrx1Mt0
         qHGzczd2Z5jSluwCy8P8ACWB3Gle0ScrGvwq4D87K+DQ+Kn1EKuy9V/NtvOQhoVvhDw1
         VlhaCRenYJr1p6TqCwmNzarskvRPWlEJDa2Nj8Rx+vO3RPTFL8o/Q46mAI6+DAl6RbDn
         ZYZKDb0HjPYXY9TG0yQXthJbEdx7DvqMucAOcim7XURySnkfmfW2beuJwk8vwC9AIaRY
         bPmuFP2vDrK4ShsfmwWPEdFTsf1mqOJIf3RdGn/j4v4G0Gq7NWGy2otXfxbf4BukM+3s
         cpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072001; x=1757676801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e737NFCnB1pAiZwFeuIFUAdoH1qix+jNDtR6tlkeuzc=;
        b=qE0MwyouFPFX7vwLr85+Wj77ih0xGZ2WGpIC7khBg/IxlfTdsP14uyCkfGqs8AiZvj
         /buKgeH6xe9seBFwXOd+HowRIhtIHGrwGKMph1g2iREsnysiDmBS3msO4kkl25TldCuZ
         bBA322i24UV5enj65piYEF1Kq6NtQj4k8kTU0xzxnp5S45Ki8Zb+rOGDurFqbL4P6HyC
         oCQe8u3BdJnZ4MPUJxlMjiglhGs2Hip7O7R49CiIIURs9pZT+t2RdUUqqASowx4/V5ty
         F9OWa89/w3DmSYYK+tuGt7kfHOKbdUWjm5JFwQEmb0ELVBBoeuoEVXXTSdZF7PTMUwbN
         QMWg==
X-Forwarded-Encrypted: i=1; AJvYcCVh4bvxDlTBQQzYGmm/Y8oRXVhDUmUQxLfM2K8BzkIxc/Ij8XMX1rN8+js5bgoYfbpVkXT1/3upHKMkMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweJLwDlPmfGnxyBtnEUhYFNS/vpxeb3TciKbHgepUGzGr3Pqdc
	9nqvwhoRdVO6x8+gikY86y2dWmwS6HeoR1wPcK/OsMdG+ag9pN4q9J5E5sGLIJPiYBYUw7B2gVC
	OD+WW+gryCkhWTKM2nJ3p79fV+7BDInJW54vb+M2eXw==
X-Gm-Gg: ASbGncv8hh3Pv+0txS45dJ/WiCUdS8OF2/ndjzK47u6k/hiQRwW7x7RUJi1glPRCsnC
	MGLwgEX9yxPRtKp9t0HAqegQsMXA04V9ZNBtxf472Rx/xGbbFyFKpfgcR77vapjttZLC3diqh5r
	yfNycwcUT3DQol8VS0lYz6pi/2hXUiF+qCjEDrn/pQochv9C7fQR5uB57QvGFzBk6LtcIxzSByA
	eqfd3oMPu5kiPAl2Q==
X-Google-Smtp-Source: AGHT+IGSWO4nCHB8o/6t/y6RH8BOysPzoQ6jiv8gZqcTwwokf+Kq7hYmaaHYY9kCJZ1mu3fJ8bEoY6l6Nt8aDc5ponQ=
X-Received: by 2002:a2e:a482:0:b0:336:7c7c:5ba5 with SMTP id
 38308e7fff4ca-336cad21f17mr50388961fa.23.1757072001159; Fri, 05 Sep 2025
 04:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com> <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
In-Reply-To: <caguo7ud4dapb4yupeq2x4ocwoh4dt5nedwjsyuqsaratugcgz@ozajhsqwfzq6>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 Sep 2025 13:33:09 +0200
X-Gm-Features: Ac12FXx6o0aglHH6TQGfVH200HSX_9WYooYS5LFefZX_Ln3xQz4XYXPyVN0c3dY
Message-ID: <CACRpkdZRHQ6vuchN8x8d0uPCVMPPHOdBVWiUhzFJNs2paHGbYw@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>, airlied@gmail.com, 
	amergnat@baylibre.com, andrew+netdev@lunn.ch, andrew-ct.chen@mediatek.com, 
	angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, 
	davem@davemloft.net, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, 
	kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:02=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Thu, Aug 21, 2025 at 01:56:24PM +0200, Linus Walleij wrote:
> > Hi Ariel,
> >
> > thanks for your patch!
> >
> > On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
> > <ariel.dalessandro@collabora.com> wrote:
> >
> > > +  ce-gpios:
> > > +    description: GPIO connected to the CE (chip enable) pin of the c=
hip
> > > +    maxItems: 1
> >
> > Mention that this should always have the flag GPIO_ACTIVE_HIGH
> > as this is required by the hardware.
> >
> > Unfortunately we have no YAML syntax for enforcing flags :/
>
> Theoretically there can be an inverter on the line, so from the AP point
> of view the line is active low while from the peripheral POV the pin is
> active high...

Yes, I think someone even proposed adding inverters to the
device tree and was nixed.

It's a matter of phrasing I would say:

"Mention that this should nominally have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware."

s/always/nominally/g

Yours,
Linus Walleij

