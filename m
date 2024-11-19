Return-Path: <linux-input+bounces-8144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24629D1F7C
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 06:05:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33386B21873
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 05:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B58C14884D;
	Tue, 19 Nov 2024 05:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKxPoU+c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8021876;
	Tue, 19 Nov 2024 05:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731992738; cv=none; b=iXaDZeUZJEi38FP8ETZlpwv6hBjSHuU7/2/stjwpXhi7kopdDftX8l85G6FebB1g5/MP47Mt1XevACHUVO/vS6NgwD0f2OAt+F628uhiu9vS8s+p0CpvrMRWmK8t44gra8QxHm//j2ERmoJ5UHn505zbfM0BtwmJfEM8MoBD80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731992738; c=relaxed/simple;
	bh=DUZhwSDLfY4pGfB2iZms/IpaxpgR32g0c0A5In4C85E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iWGJ9yBiOVaUoY8bbEcnKwek1EOnYHYvxBJGK2RajP1meEsN4mD+j9dCdRkKyxHSqPBZu4Cu5EvjCs1GO0d/k70FjvyjHOputxxVtBgcgJYy9z+6yt9hk+61vJVNsdD8gckQf2Rwv7+ml6D4brz1Y1FClfjox9+KmmXrsplwNPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKxPoU+c; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so484859b3a.1;
        Mon, 18 Nov 2024 21:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731992736; x=1732597536; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hv1D952XZu0INoj8er13xPaMFhIq6jJe13wta8/S16o=;
        b=hKxPoU+cOE0FAVd+7wDBuETbB5aAIPn2SbesjLVHUwiOOrc/iY4Dmjle5hbbb+CISS
         JYKHYvND/qKQRWzx0pCGBGFlnXX3cUUOBy5SCtv4isnm0nbYLaODeaaEvfHB7ycCjjhw
         PYFZNzaxh2EubogjyZ39V/Ebn8acW27Kw9xbsmb6jEzxiIrKfPIvHLjbduoYHNLiNvh1
         yNh4sUk0MpdMNf7ObskTGfLRBA1k8l3hB66w1V6RANuMufS8t4Tz7OgDpwpMA3qxtcK/
         iY85Nul6Y21a7VePF0/0ea9F2q4wxQ0QPfy2o6yl34OFKbW+0faZMh0+v9f6OnUJINlN
         iruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731992736; x=1732597536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hv1D952XZu0INoj8er13xPaMFhIq6jJe13wta8/S16o=;
        b=qU/o9j/jWwjphHtG0PGROAFHGlwODYQyzHYEHnL5N/M43p1GARrQ/r8mopANGweXSJ
         VtRXAgikwkCSpsupZ0NBegPaOiwf87MvEwKKMSjBi44cvhHYC05VqfDT3Jz+QLlpM7kq
         VsH6PKuH/hEPXSs2qb9Mgvt/xOgojDUGLg41wSVeCQ+669a4f6jBmBrDNzZJci7D1lsd
         dXsFHS+i294e7uIQeRc9QFrEjvBTOMJ0j3zSobEw0ZT16zAoHoicjQ0DEBMkcMGrN2/t
         1CU8RinxhDnmaCq0jN5UurEFzkQfR6tsA0u+jRFpEnmOZOTBU65Wm3bzzQmELD5l2T+r
         cdlA==
X-Forwarded-Encrypted: i=1; AJvYcCUSL6Q/W2s6XFMddIhK3Vx8WhHPrfeirOTXk69mgRvWEBQkv5F0LQ3ERuD0qhDMymaTO1wVFCRueBEs/VI=@vger.kernel.org, AJvYcCVsrrFg3azy1EmLMb8PU9Gg4qIgFKZmoqcY6UnuWX7v2DWvhp/aYiffY6RSbVFnjIUoEqZciZyuj5WD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd9cDows/Mto4L9vfxd5iNUMNkkzPirx6GCp3z0sGWMPZOY5mS
	4Z47c6r72XSeohvaElP0KjtuuGnlJR0n4+SxUu1Z22W3oVYTUh7+zSNsbUIc
X-Google-Smtp-Source: AGHT+IFCnOMGgi+h5K1zmS9n4KartDEt6KlxQsyf77WKX1/k4ZXu/194Qh9Es/obgXJXAWt9Olaxbg==
X-Received: by 2002:a17:90b:3ec8:b0:2ea:aa69:1067 with SMTP id 98e67ed59e1d1-2eaaa691107mr2340690a91.3.1731992735860;
        Mon, 18 Nov 2024 21:05:35 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea2dd87897sm5559361a91.24.2024.11.18.21.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 21:05:35 -0800 (PST)
Message-ID: <9e7d23b2-4228-4694-b455-b32e4be7b1f9@gmail.com>
Date: Tue, 19 Nov 2024 13:05:31 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <20241119025954.4161-2-mjchen0829@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi:

I apologize for the oversight in my previous patch where I forget to 
include v3 in the subject line.

The content of the patch remains the same, only the version label has 
been corrected.


On 2024/11/19 上午 10:59, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
>
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
> ---
>   .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>   1 file changed, 69 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>
> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> new file mode 100644
> index 000000000000..9ccd81a2574d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 Keypad
> +
> +maintainers:
> +  - Ming-jen Chen <mjchen0829@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/input/matrix-keymap.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-kpi
> +
> +  debounce-delay-ms:
> +    description: Debounce delay time in milliseconds.
> +    maxItems: 1
> +
> +  scan-interval-ms:
> +    description: Scan interval time in milliseconds.
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - linux,keymap
> +  - keypad,num-rows
> +  - keypad,num-columns
> +  - debounce-delay-ms
> +  - scan-interval-ms
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    keypad@404A0000 {
> +      compatible = "nuvoton,ma35d1-kpi";
> +      reg = <0x404A0000 0x10000>;
> +      interrupts = <79>;
> +      clocks = <&clk>;
> +      keypad,num-rows = <2>;
> +      keypad,num-columns = <2>;
> +
> +      linux,keymap = <
> +         MATRIX_KEY(0, 0, KEY_ENTER)
> +         MATRIX_KEY(0, 1, KEY_ENTER)
> +         MATRIX_KEY(1, 0, KEY_SPACE)
> +         MATRIX_KEY(1, 1, KEY_Z)
> +      >;
> +
> +      debounce-delay-ms = <1>;
> +      scan-interval-ms = <20>;
> +    };

