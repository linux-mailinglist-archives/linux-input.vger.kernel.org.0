Return-Path: <linux-input+bounces-12886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C46AD8EEC
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 16:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85C2C7A2A69
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 14:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1C15272818;
	Fri, 13 Jun 2025 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fg80NS1r"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9599924EF76;
	Fri, 13 Jun 2025 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823870; cv=none; b=Z1otUhXx0YefQqO7ZQUui2p0+jnB4++JtKvWlPSW/zdH4Hiz0KWsgSsjQmaxBUKvIOyVBL8jDsIe62gzR9sWugjeXxJNRTSnlwTystTkt5Dld1gk2ajpbytzOpWZ9/yXQSFLMuqdDF6JU/ID77ZERGY9/voh/fih2UQ3o7Ljnug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823870; c=relaxed/simple;
	bh=CXdDV5RZX9NAHKpJrTG0aap19fFfXLe8jGSP+6lFlZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLQb+HQdLkNKE5ywgdbHe5j8qVV+idZRq4kEatf17O/rPP1ouZywS88BNpsijzBNGxPsL8o1EO0bgKldXQh5Cazddq4a1+bVcWqUS4KDfoVraVuQ0W3YU2DuiD2HQBmLazQTOfqqIwv/BHDgAjY/R/jcS3YafUXPPUwa+QND7LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fg80NS1r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A93C4CEF2;
	Fri, 13 Jun 2025 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749823870;
	bh=CXdDV5RZX9NAHKpJrTG0aap19fFfXLe8jGSP+6lFlZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fg80NS1reIecjAK+K5IzG4qz1egVVu4m9WDgoJ0qQ+N2d4hSwaApaROhWJ6UQECfD
	 iV1sN1zHzYERYGrV+OxEIUwXKZhCokn2fDJyT8425YzIB8M+kfPLU6awbBcDsLEKci
	 SL4HMIH1OjLULlx3je8rf29NZZyMQHaNG+AknM8RikRgA5UyCks36VATmWgOS+7Cjo
	 nB9tPU5cMxOp6wqXBRq0NIx2FTGeaSDFsuKMQKddV+RS9fpWls8eEla0X1HUljzVgk
	 +4nzQVF17iiJl278BN8C99611fTtSGf1R627TYH9SNY1OOKH/hcDdwHsrtxd4+M99y
	 23GNW0pvEB3CQ==
Date: Fri, 13 Jun 2025 15:11:05 +0100
From: Lee Jones <lee@kernel.org>
To: Job Sava <jsava@criticallink.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Panis <jpanis@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, jcormier@criticallink.com
Subject: Re: [PATCH 3/3] mfd: tps6594: Adds support for powering off the PMIC
Message-ID: <20250613141105.GG897353@google.com>
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-3-0cc5c6e0415c@criticallink.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250520-linux-stable-tps6594-pwrbutton-v1-3-0cc5c6e0415c@criticallink.com>

On Tue, 20 May 2025, Job Sava wrote:

> When the FSM_I2C_TRIGGER register's bit 0 is set it triggers TRIGGER_I2C_0
> and the PMIC is transitioned to the STANDBY state
> (table 6-18: SLVSGG7 – DECEMBER 2023).
> 
> An ON request is required to transition from STANDBY to ACTIVE.
> 
> Signed-off-by: Job Sava <jsava@criticallink.com>
> ---
>  drivers/mfd/tps6594-core.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/mfd/tps6594-core.c b/drivers/mfd/tps6594-core.c
> index 1b0b3d1bf6c4..f4c434c0d87a 100644
> --- a/drivers/mfd/tps6594-core.c
> +++ b/drivers/mfd/tps6594-core.c
> @@ -10,6 +10,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/reboot.h>
>  
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/tps6594.h>
> @@ -615,6 +616,19 @@ static int tps6594_enable_crc(struct tps6594 *tps)
>  	return ret;
>  }
>  
> +static int tps6594_soft_shutdown(struct tps6594 *tps)

Why do you have a whole separate function that itself is only called
once and only conducts a single one call to one other function?

> +{
> +	return regmap_update_bits(tps->regmap, TPS6594_REG_FSM_I2C_TRIGGERS,
> +				TPS6594_BIT_TRIGGER_I2C(0),
> +				TPS6594_BIT_TRIGGER_I2C(0));
> +}
> +
> +static int tps6594_power_off_handler(struct sys_off_data *data)
> +{
> +	tps6594_soft_shutdown(data->cb_data);
> +	return NOTIFY_DONE;
> +}
> +
>  int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
>  {
>  	struct device *dev = tps->dev;
> @@ -623,6 +637,7 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
>  	const struct mfd_cell *cells;
>  	int n_cells;
>  	bool pwr_button;
> +	bool system_power_controller;
>  
>  	if (enable_crc) {
>  		ret = tps6594_enable_crc(tps);
> @@ -681,6 +696,15 @@ int tps6594_device_init(struct tps6594 *tps, bool enable_crc)
>  			return dev_err_probe(dev, ret, "Failed to add RTC child device\n");
>  	}
>  
> +	system_power_controller = of_property_read_bool(dev->of_node, "system-power-controller");
> +	if (system_power_controller) {
> +		ret = devm_register_power_off_handler(tps->dev,
> +								tps6594_power_off_handler,
> +								tps);

This alignment is odd.

> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to register power-off handler\n");
> +	}
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(tps6594_device_init);
> 
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

