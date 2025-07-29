Return-Path: <linux-input+bounces-13710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0507B14930
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 09:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91AF4E2923
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 07:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7782641FC;
	Tue, 29 Jul 2025 07:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gI66fBEA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E3C2248BF;
	Tue, 29 Jul 2025 07:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774385; cv=none; b=T9h7/1NyZ/Ij7jJei894EwSwSZ2YSXRFDFUOkRQ0GrsDBSUdaU9q5A4muLUTF88A5VJvx+pPuz8jUnTHisZUH5heBLV033v+g1EkSlADCjjD1rfpQrGMyJXgcntIK1qV6uhUxw2W81ATLwitdaL+wtOtSPVP226hDzl93EVWbYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774385; c=relaxed/simple;
	bh=CxqkaF7ekVdwSdtSEeCYKk2cQa8nwCz+CBmrB3n4Oj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hT9iE04wrFSLnDDYNkjJqXUwWE4aiVJC/3Yf+lu16SCr3Nphq9t82qrgWXAOofTjt+URarGDF/NZsxG8b1NCu6gjcAD9VsoRERjhIDQU6atAf2YuxBZ0CsN2XhVFzp6aaQNiibdLYGocVEiqn9xpfv4dsQgDQ6cfnsI7kSagSo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gI66fBEA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C442CC4CEF8;
	Tue, 29 Jul 2025 07:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753774384;
	bh=CxqkaF7ekVdwSdtSEeCYKk2cQa8nwCz+CBmrB3n4Oj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gI66fBEAYeyg+yQpo0/8giOHu/JTcPZE+SfM52Rbbs6IYABr3wc/IfnD7XVDeGkZq
	 buh9Rv5F3TDx19bk2dvOrX6Rhj8XMtTY6DFQ2bVWNx7BZCXIJk7PaqPNMWZ+4p24rh
	 hfaWxBfLkhCpucUMSqsyN91RPDlsNUr1Ln8HKEcoY2L8G/qHEsGGLNuKU403uhD+Zs
	 AijUSdiIo+WfUJbn1xzBejAGj0cPw5P0TfsC2HqHJBSjCD4MpbvmfCRqbJ1ZBeedSe
	 xlbvaoDguj3Vb1YvS9XhmMBj5beoQFamfAHnDG/ObHgL6fPHfJ4s5YS4wYfO5RiBoU
	 aHvDE5ijywH/w==
Message-ID: <8f7cbf16-4cdd-4f95-8ff8-971da749b41e@kernel.org>
Date: Tue, 29 Jul 2025 09:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings vnc virtual input
To: marlonwu@126.com, robh@kernel.org, dmitry.torokhov@gmail.com,
 krzk+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 MenglongWoo@aliyun.com
References: <20250729064346.22834-1-marlonwu@126.com>
 <20250729064346.22834-2-marlonwu@126.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250729064346.22834-2-marlonwu@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2025 08:43, marlonwu@126.com wrote:
> From: Menglong Wu <marlonwu@126.com>

Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

> 
> Add documentation for virtual GPIO keys to enable full ANSI keyboard
> emulation via VNC on embedded devices without physical keyboards.
> 
> - vnc-virtual-input.txt: Usage scenario and implementation details
> - vnc-virtual-input.yaml: Formal DT binding specification
> - MAINTAINERS: Add entry for VNC virtual input support
> 
> The solution registers virtual GPIOs (starting from 400) to avoid conflicts
> with physical GPIOs while supporting standard Linux input codes.
> 
> Signed-off-by: Menglong Wu <marlonwu@126.com>
> ---
>  .../bindings/input/vnc-virtual-input.txt      | 153 ++++++++++++++++++
>  .../bindings/input/vnc-virtual-input.yaml     |  86 ++++++++++
>  MAINTAINERS                                   |   7 +
>  3 files changed, 246 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.txt

We do not take txt bindings anymore, sorry.

>  create mode 100644 Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/vnc-virtual-input.txt b/Documentation/devicetree/bindings/input/vnc-virtual-input.txt
> new file mode 100644
> index 000000000000..77d12308c553
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/vnc-virtual-input.txt
> @@ -0,0 +1,153 @@
> +Register virtual GPIO keys for VNC
> +==========================
> +
> +# Purpose
> +
> +To emulate a full ANSI keyboard on embedded devices without physical
> +keyboards.The server responds to key events via x11vnc.
> +This resolves the limitation where embedded systems only register a few
> +GPIO keys, making them unable to process full keyboard inputs.
> +
> +documented in Documentation/devicetree/bindings/input/vnc-virtual-input.yaml

I don't understand the placement of this file in bindings. What are you
writing bindings for here?


> diff --git a/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml b/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
> new file mode 100644
> index 000000000000..8b5414cb2bea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/vnc-virtual-input.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: VNC Virtual GPIO Keys
> +
> +maintainers:
> +  - Menglong Wu <marlonwu@126.com>
> +
> +description: |
> +  This binding describes a virtual GPIO key input node for VNC remote
> +  input.

Describe the hardware, not the binding...

> +  It is based on the standard gpio-keys binding.
> +
> +select: false
> +
> +allOf:
> +  - $ref: gpio-keys.yaml#
> +
> +properties:
> +  compatible:
> +    const: gpio-keys

So this is all completely redundant and not needed. Drop the bindings.

> +
> +  status:
> +    enum:
> +      - okay
> +      - disabled

Do you see any bindings with this?

Srsly, it's second bindings today. I think you send some AI slops to us.

Please confirm:

Did you use any AI tool to generate this file?

Best regards,
Krzysztof

