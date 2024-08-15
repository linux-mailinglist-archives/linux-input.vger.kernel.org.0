Return-Path: <linux-input+bounces-5591-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88C953A54
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 20:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 314E9B2177D
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 18:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644C2433D2;
	Thu, 15 Aug 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bgOvzTHC"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E87D38382;
	Thu, 15 Aug 2024 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723747551; cv=none; b=MfwQr/tSzZqQp2Gy2Wk2ZihS7MMgktJwKpFz9O+dWYBrc4W8Psl+GX5vwIIT9Ac1g2dlEKGEWzRqsCdu5IManyJ1qdkbdznkD1ffC4TUTHThu7VAzZvYz7O0h7C+cxedKxiCItAJOpSq8naHQjVdQw8gmAZSy5sRq69Cc1jfCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723747551; c=relaxed/simple;
	bh=zPT3igE3kKg1Yo07fMHfm9JS+hXW23iH8Uye3fGYjmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SeXYqhRQls0xjRDbvbGEXkeEtgJNrZo0W197YoWJUCskOeemzipfsPSLibFk6iCSOVQKI3qMRtSa/+mcky5f7Z9nT8i/miAv3AzqNBbstGMQexyg+7ksll4GpflIjrsTCi3Sx+entSKOk9y6Ajtr/kydZQhObciUVj5boHuhGFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bgOvzTHC; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E157F88A9F;
	Thu, 15 Aug 2024 20:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1723747540;
	bh=OPEKYYu854+ARTE531hqd4MCc69q/n3rYjuFf0lQyP4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bgOvzTHC7u2bahvGA0qKLm+TNTqWIZUQtN29580SKSfEMVxQMboqU22l3TpugqJJl
	 05qNN9na73tuuLX57LPe4m1e6z3YGbnab5YoammRbi5F4gLC7Ea+ir98TTR51JXqph
	 N9KUl5T02I0Wz7macO0guAzG5/DzGjTXNPYqRvNB36HlBkQ+7vURgAY+KwvoPdvg5F
	 af0wZs1OFSHatiEWPZHSXLyztwSqJu4u1xcafqolzWdE8XxuWf4iGE6DX+ibCAAGP6
	 U11L6P5xhs3/VuZXN5ntvLiWT4RXQqKmce4xzjsiL8oZUzEfwJ4NgqwC8WkvvX73xN
	 DpCyK4T7F4G3w==
Message-ID: <5864cdcf-a1f2-45a6-a034-a05315402663@denx.de>
Date: Thu, 15 Aug 2024 20:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
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
References: <20240815161413.4182796-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20240815161413.4182796-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 8/15/24 6:14 PM, Frank Li wrote:

[...]

> +  ti,debounce-max:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: Max number of additional readings per sample (u16).

Could you drop the (u16) which is already part of the $ref'd type ?

[...]

> +  ti,x-max:
> +    deprecated: true
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: Maximum value on the X axis (u16).
> +
> +  ti,x-min:

Is this deprecated too, the same way as x-max above is deprecated ?

> +    $ref: /schemas/types.yaml#/definitions/uint16
> +    description: Minimum value on the X axis (u16).

[...]

