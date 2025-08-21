Return-Path: <linux-input+bounces-14231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8ECB2F731
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 13:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CC477A4287
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 11:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B552E0B77;
	Thu, 21 Aug 2025 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EeTlcgdw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4592E03E6
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777240; cv=none; b=ebWcbw1wiy/7q4RtMQevOC7OHdWoH078iJSmEnZDKIAKf2kz+n5hU1OSKfE1OhJOU9jUQXP2U8bVPi+/nBy7X7632rViINvxorjvI21O9amPWlCV083nDP4n33xaF6WLOOLAvS4kdIRzPUtVDQlmxQLVJuWXEy89fdWvfd1mTVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777240; c=relaxed/simple;
	bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4eredic0DU8+YkhSC7fGGjrTv75d8Qm3hElZjPqxbBnZxGKMJWJeCy07P1EWYKX3S8VMixNoCVkQlQQuuTEhZEs6EzZlJGQG5g5IbPGUsPJbeKaeLZlMlOyJa197yiu5PdaqxJl0eFWb+eUvwSZreMUZOAv0ONgY2KQ/nQMyaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EeTlcgdw; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-335360f9b6aso16795451fa.0
        for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 04:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777236; x=1756382036; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=EeTlcgdwYygVPvWzZ81l5IByZT3GZgdfLnceLEVRtnLKn5kjZAK18d9RTZKllNN3R9
         UXNJuNZYhZL2/q7EIlmuqT/RNnXonu0xTXfM7Mu1hvzHJXxGStRwQ8wUjUvu1nmWe5kJ
         bOvHqJiyfkTBFnPalQCG/zkNmCKpV4C//WOnsggDAKiSq2dxxWaUdzQDpOv4icRLO6jy
         FLT1i4qApSx7t3oDdCbKZI6Uo/XCgFeugJGvh4s4McwDReUaIaDZCi4GNX1+YPb88r4q
         FyMPyu6OD1xEbix9HWqrFIy2K24Qt+lvmhMkS4VLBb67YbyhwsoovUIdJ3elz5ONpvok
         A3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777236; x=1756382036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L7PbAw7tFxkqZThPb3yJ9U2UGY2pHnuSaci2IGV7yfc=;
        b=VPIECTJrky28dmspwCgGiBt28gDVpHNDsUUHIly4bbogL/f1bli59533qIrS6KZtaF
         1PAe7KYKyK9Y7qoI9lG+/o9HEMu5md/NPanYQQTkhMUUQrrpEKwdPa8mnjQpwLsUNUkV
         wzJ/HtlmsR2YbVECifpLbOm0dovxCEWbVIWFK7zFCUnFUuFeSk4mrpayn7a9QlWo00Z2
         V+ORu/FlHidWkTEB3iwvgQ0NrE/OW6+J20EA+nZhr/205a14oymXVoRrhxJoSxJEdbsb
         rXxAUJCzhAkQHn0PEF2HVC7vGbeTT6K1EsaZ8IcgTh8rnn09nDcKvoI0Rr+FuCi8rHxz
         PotQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqvayDoE1dU/JX7BHSDJVxRfih2YG+j82NolWimd0/Pxib/kANzLLxWLI8xWV4q5GwQfFmXjLZI0CcnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0g/JhLFWoSqsAt7qSiFcHHzBRH9Ea0nwXDJe7puCNevIiOUR
	DpTLdXMHRdaqxs9z4rMy/ROKdTCidVbpkSINPEF5Rj01EW+eA2qtIgI72ALPF4KNXY9t/yFPoBl
	0X580Rzih7M8R4U6WOEGjG0rBFOHBtUw0xkup6WHO8Q==
X-Gm-Gg: ASbGncvYgUcLPQuQkxusJrNaozjZ/gEgJYEPwhesMH18zVHS3Y+7Jz3lozN2J5cz/q7
	CEsHm8M4HihIl0Gwzgg+/reVxu35eKbqBTUs8RC1px3VXaMoDuaQcsuL+B9Kdqx1OhkjWDkbwKh
	wUU5JQNg7OfezPE4/mVyQtZG8PZewDm066gH7++Fqz4R1t1o9fOXhZrp2zh7c/Ny/7zI5Wu2py3
	LnEedA=
X-Google-Smtp-Source: AGHT+IFoewdvNuLwpOMDi7tPmb9FEQKLI5JEdERuyolhueuXHZ2+5KnKdkT/j3cc2QMbmt8jG7ipw7ObSBOoHSZHVLc=
X-Received: by 2002:a2e:a013:0:b0:332:2d5c:e171 with SMTP id
 38308e7fff4ca-3354a275fd8mr4061531fa.11.1755777236482; Thu, 21 Aug 2025
 04:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-10-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:53:45 +0200
X-Gm-Features: Ac12FXy1SuiUzS280qDRSJHcA_2jVr4y-FjGItB1ru8eWVK-JVnc9Ql5XGWxM9c
Message-ID: <CACRpkdbVqNpz2HiAz+_vFUkDy1TE6ZDxp6X2g9rRWAt4s=jRgw@mail.gmail.com>
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
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

On Wed, Aug 20, 2025 at 7:16=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

