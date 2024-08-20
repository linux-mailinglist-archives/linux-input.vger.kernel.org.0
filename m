Return-Path: <linux-input+bounces-5700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6DE957BEC
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 05:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2F88B21D37
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 03:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54790481CE;
	Tue, 20 Aug 2024 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="wb9gJB8E"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E14733DF;
	Tue, 20 Aug 2024 03:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724124673; cv=none; b=uylatWXuWz6z9gjKNrMeC4tGCckCsgL2JTmvoGtJ8DJFgHvciRMHAfICuPYXEruHoofoM4sfu/t9CyAHTN68nXtLd8XPm+LYrmnGRKl//9atZ9FFyxQP+PZvjTcbS7x/lhY26tmamK2Hrd8CK0cPkRCmRhSEznxaUBet63XKNe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724124673; c=relaxed/simple;
	bh=o2y4NtQw6PkMCLcvj2u3PAmkBMrJLxt98FGyYIjlE1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfkmKSIdnfxxbmz5D50wOvyIDfZf4H1UeULS3PpOansKAunJN8yzqd3nQECpJUuGVr4HScuIQU88QTkXztsKzA8X6woaxm6j12t2HA5EIjfmeESnxs7sBDp7dwNaLuSGT42bSyR6pr2faOo70VWRSrizRiFo6kP2QuAT3n+hgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=wb9gJB8E; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 857AC88D3C;
	Tue, 20 Aug 2024 05:31:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1724124662;
	bh=RD4icbSIhX45rwxUUXSTQSGNIkWDW0xKEjDV/wBBn0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wb9gJB8EVjoeuiBshusKsHO/UqSyI6NkyHahtgV7GUIs6IYl46dUPN6+VFs3Yrs3o
	 WmAeTrSQbUSrJiq0QiYUoyh7hRv/3O9IZil2yQXh5TmSElUEsaJ/hFQgeuYZZvSTB4
	 Q+/k/vD9Cc4eX2h/IcDdjabs5X9JCEaDMWDdn/YcseocgPdG2emZq11gH0STAU8y7a
	 jRuDwEvMe3DRGV7TtjblRJhLohuzPljuGy22K+EBdcVcujTJr/u+SeSScZ25/dxOub
	 47fS/lj/dGI6MNGSxuY2i0mg665xu4ZBEDier2H6xhcaUHUaReGK+ZdbIRYf20Yw6c
	 pRnJImsc6wU1w==
Message-ID: <cd8b6c1e-f7d7-4db2-b178-7391e3111237@denx.de>
Date: Tue, 20 Aug 2024 05:30:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] dt-bindings: input: touchscreen: convert
 ads7846.txt to yaml
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Hasemeyer <markhas@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20240819180535.368902-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240819180535.368902-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/19/24 8:05 PM, Frank Li wrote:

[...]

> +  ti,keep-vref-on:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      set to keep Vref on for differential measurements as well.

Please start sentence with uppercase letter.

> +  ti,pendown-gpio-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Platform specific debounce time for the pendown-gpio.
> +
> +  ti,penirq-recheck-delay-usecs:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      If set to non-zero, after samples are taken this delay is applied and
> +      penirq is rechecked, to help avoid false events.  This value is
> +      affected by the material used to build the touch layer.
> +
> +  ti,pressure-max:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Maximum reported pressure value.
> +
> +  ti,pressure-min:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Minimum reported pressure value (threshold).
> +
> +  ti,settle-delay-usec:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Settling time of the analog signals; a function of Vcc and the
> +      capacitance on the X/Y drivers.  If set to non-zero, two samples are
> +      taken with settle_delay us apart, and the second one is used. ~150
> +      uSec with 0.01uF caps.
> +
> +  ti,swap-xy:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      swap x and y axis.

DTTO

With those two fixed:

Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

