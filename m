Return-Path: <linux-input+bounces-14066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDEDB292D2
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 13:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B35481FEC
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E28028314B;
	Sun, 17 Aug 2025 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JQZJF+ab"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0176D1E8337;
	Sun, 17 Aug 2025 11:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755429885; cv=none; b=QiwjddQznrXCCX2EC4SunZzWn71Q2cjshqk8XW1n4Hh2/DBVMB2a0WlCI50sS/5FZEx4q94YgpdVbE5jHxnqzoicS//WePHsso8F5Yvvha7AbPFOeDiDfUX39U/2tLGIOz8PX9+iBgSLmq9ipEse4AYIMk5NawWc7a/KG9+/MU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755429885; c=relaxed/simple;
	bh=LYt98MJj0RXL/eTptnEbZfFoEYZL/zn2wf8xG7XUonk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNpeR56vGxzFRb+pyKWZEbq3hUisAfsBfIss51+Lw3VnxG7ZKIK7jQ9C/zTEb3Gd9/qcGtUD0+nj8FYpkrxMz4Ce4vtH9rkeddgytQXH8cBsq1FTe+xk1UC3P+gkKiQQkNJSgBpVvxvY8shIlfWtKKGRxFfF9mPU7JcKNlkxPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JQZJF+ab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F334C4CEEB;
	Sun, 17 Aug 2025 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755429884;
	bh=LYt98MJj0RXL/eTptnEbZfFoEYZL/zn2wf8xG7XUonk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQZJF+ab5yVWD105VOwqMpVRmxU3VCglhtbXMava2ySF3tb12l/k5fcsTQypKSKBF
	 9iKRwZPt4MP/8yJIecq8XhttsREVHpRU+HJiGluKXIQYKNCyj5/Ur7YTPxQwo4AVhp
	 AEJ5cP925NJf4L0rGTcRO0koEohJt6e6S7YXNvUUN1dkdaSykWbbeSXISPKccAfqvW
	 EzdP9TTRnUnOyx62+iflAF1sHSFe5k2XmWNev6w9Qwk7r8TwtclsGyCgHC/Cytl3rh
	 7eNPvbgROFLQ3dz97X7TCuxciroCN5+mhpXbM4cy+9OF9GgRP3h2v2ZeGNvJJmylZr
	 EoxAAopoSkPqQ==
Message-ID: <f9266133-9912-425c-bebb-98b076976583@kernel.org>
Date: Sun, 17 Aug 2025 13:24:39 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] Input: mc13783-pwrbutton: add OF support
To: Alexander Kurz <akurz@blala.de>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Dzmitry Sankouski <dsankouski@gmail.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Heiko Stuebner <heiko@sntech.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250817102751.29709-1-akurz@blala.de>
 <20250817102751.29709-7-akurz@blala.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250817102751.29709-7-akurz@blala.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2025 12:27, Alexander Kurz wrote:
> Add OF support for the mc13783-pwrbutton so that it can be used with
> modern DT based systems.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/mc13783-pwrbutton.c | 78 +++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
> index 49bc5d25f098..11a97ce070a5 100644
> --- a/drivers/input/misc/mc13783-pwrbutton.c
> +++ b/drivers/input/misc/mc13783-pwrbutton.c
> @@ -29,6 +29,7 @@
>  #include <linux/mfd/mc13783.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
> +#include <linux/of.h>
>  
>  struct mc13783_pwrb {
>  	struct input_dev *pwr;
> @@ -105,8 +106,75 @@ static irqreturn_t button3_irq(int irq, void *_priv)
>  	return button_irq(MC13783_IRQ_ONOFD3, _priv);
>  }
>  
> +#ifdef CONFIG_OF
> +static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(
> +	struct platform_device *pdev)
> +{
> +	struct mc13xxx_buttons_platform_data *pdata;
> +	struct device_node *parent, *child;
> +	struct device *dev = &pdev->dev;
> +	enum mc13xxx_chip_type chip = platform_get_device_id(pdev)->driver_data;
> +	int ret = -ENODATA;
> +

No blank lines between declarations.

> +	/* ONOFD3 is only supported for MC13783. */
> +	int max_idx = chip != MC13XXX_CHIP_TYPE_MC13783 ? 2 : 1;

Ternary operator is hardly readable. Just store the number of buttons in
device match data


> +
> +	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	parent = of_get_child_by_name(dev->parent->of_node, "pwrbuttons");

Node name: buttons or keys instead

> +	if (!parent)
> +		goto out_node_put;
> +
> +	for_each_child_of_node(parent, child) {
> +		u32 idx;
> +		u8 dbnc = MC13783_BUTTON_DBNC_30MS;
> +
> +		if (of_property_read_u32(child, "reg", &idx))
> +			continue;
> +
> +		if (idx > max_idx) {
> +			dev_warn(dev, "reg out of range\n");
> +			continue;
> +		}
> +
> +		of_property_read_u8(child, "debounce-delay-value", &dbnc);
> +		if (dbnc > MC13783_BUTTON_DBNC_750MS) {
> +			dev_warn(dev, "debounce-delay-value out of range\n");
> +			continue;
> +		}
> +
> +		if (of_property_read_u32(child, "linux,code", &pdata->b_on_key[idx]))
> +			continue;
> +
> +		if (of_property_read_bool(child, "active-low"))
> +			pdata->b_on_flags[idx] |= MC13783_BUTTON_POL_INVERT;
> +
> +		if (of_property_read_bool(child, "enable-reset"))
> +			pdata->b_on_flags[idx] |= MC13783_BUTTON_RESET_EN;
> +
> +		pdata->b_on_flags[idx] |= MC13783_BUTTON_ENABLE | dbnc;
> +	}
> +
> +	ret = 0;
> +
> +out_node_put:
> +	of_node_put(parent);
> +
> +	return ret ? ERR_PTR(ret) : pdata;
> +}
> +#else
> +static inline struct mc13xxx_buttons_platform_data __init *mc13xxx_pwrbutton_probe_dt(


Section mismatch. Build your code with proper DEBUG options for section
mismatch check.

> +	struct platform_device *pdev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +#endif
Best regards,
Krzysztof

