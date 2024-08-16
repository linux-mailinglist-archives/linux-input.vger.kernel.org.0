Return-Path: <linux-input+bounces-5606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2FB954F0C
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 18:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96710B20E5B
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 16:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BE91BE241;
	Fri, 16 Aug 2024 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rzt8FJzk"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75ACE1BDA94;
	Fri, 16 Aug 2024 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723826480; cv=none; b=O7tD284fc4XdiLfjC5UlwiGdWz8KLLH6NhICnEtxLUUPn77Bar+ezkt299PlzH75LAHJsMXJyrz41kowy63T+mOYdcR18BUPmuZJS4D+pHleeatbkCYQF5ZzgOAYNYLKZMBWOyjAJhnhgnOjycDtDaNTzYhGwt/LRBOYPKnGKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723826480; c=relaxed/simple;
	bh=v6rChcYuxBEw0so4bWfxcvKXwAV37nc/MZS6YMgModQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpChyows66QZeU2bYfYVR1La5JNt0HzzD7ZkMR1mzjEipb+ww9GtRO9tW2dVyP8AIcXVtLDm7F4gUj2Q6+cV2QZV0lkRqqbBY7Li1XMSJE6vgwixYI4lgSpP+yLOgou+n5l7okCbrWP7ERPt0CQI5A1u1I2K8rE5T6Yw9rM8X9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rzt8FJzk; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CAD5F88B83;
	Fri, 16 Aug 2024 18:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1723826476;
	bh=PpQOfftn8geigz3SLUxYxKtO6L8f9VTUsBYD3jhI6Hc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rzt8FJzk0BcGY0xPM5SfqgKYhkjLTsc1z3uNWt8frcc+oTxIeTnQG8umRgRPwRYEF
	 kuezM8F6bscCu1cXnD6ABsSQAPT0n0JhjjGjRqufArFdIhefvxEng/97jCBEGWq6IL
	 dM0boyzSfaMBmhm7NcinZqGYZv8balfewOXn0o+wHYaVAUt5lKD5ERWPQYRfXXrD65
	 y6Whb7Ym3Gi2y2HrBZ2nNOdOAG9IVOS1wu/9MCt2X3agRT5mDF8vpvq+I+xZEQgD7u
	 BnCFUzHobrOBw83p5lp7uQOxjBz34PolXh7xE/M/HqUFMjVka53ZQwkKOTmJ05wWNH
	 KYBl1AlxApOYw==
Message-ID: <d42f0f37-9c17-4daa-a807-23e8b5c5668b@denx.de>
Date: Fri, 16 Aug 2024 18:36:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] dt-bindings: input: touchscreen: convert
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
References: <20240816161300.128269-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240816161300.128269-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/16/24 6:12 PM, Frank Li wrote:

[...]

> +  ti,debounce-max:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: Max number of additional readings per sample.
> +
> +  ti,debounce-rep:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description:
> +      Additional consecutive good readings required after the first two.

Should the description: and the description text be on the same line ? 
Or separate by newline ? Or should it use description: | and then a 
newline ?

It would be good to be consistent about this.

> +  ti,debounce-tol:
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: Tolerance used for filtering.
> +
> +  ti,hsync-gpios:
> +    description:
> +      GPIO line to poll for hsync

Please make sure each sentence ends with a fullstop '.' .

Thanks !

