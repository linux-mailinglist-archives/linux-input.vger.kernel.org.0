Return-Path: <linux-input+bounces-6476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EAF9772E8
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 22:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EAE31F24CCE
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 20:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CF21C0DFB;
	Thu, 12 Sep 2024 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LllLjClh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAD61C0DF2
	for <linux-input@vger.kernel.org>; Thu, 12 Sep 2024 20:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726174148; cv=none; b=o9rdhfpanVnyA4JtH8G+6xWF5h0yxAT++/5FvA+lnPqF0f9CM4l0WF8IzTcSGQrDQA5V8ghy9pNoXbW+ytixDX2KFOY0qXM7X/sWgMtxgIPkceoDzLRaJ4CLlfoPgAy/rl8pjz29s20URKHwlgeEOc8NYaMpCE8VUjDJHP5gS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726174148; c=relaxed/simple;
	bh=GklJQJpk3QXMo5lOIkJGUnUbgRDxM3N1UaiENnlnaS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=tvjlxWre/MIRlnGAZLwgjzp9ZaRmYHAGH8ziEXZmRy1U1tT5HvWOkrERjJhFtijBH4KvjNI9dO/iC+uAT/rINnZUfBGgHbhhl7e6Q9/1WSLt7rTrM0H4I/Hzrpt5TsiQe0oi/EZI9V4CdaKGuphNlJKqKY6nXQ0rvTfdAS5Jylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LllLjClh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A68C4CEC3;
	Thu, 12 Sep 2024 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726174148;
	bh=GklJQJpk3QXMo5lOIkJGUnUbgRDxM3N1UaiENnlnaS8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=LllLjClh6aQg01JX7lIB1ZGCtVr47Eaea9nG+eWQu8wrpOS2+dbk6HHbgTqg/PPCo
	 URPgIvKFdbntxfTnbhr2VNBafvuawVDpu93toBrZ5eQ6k4CjxTRZx9EBw1xOyfn9pt
	 TMNoVGS1rlzR8b2RxuZI7cVAO6rcawIY2iEEw+iWBCknwYAHlMS+XCDdE+cWNTfRRi
	 qrgqEe3p83HpsczxkTMtOTKp03qcxiQlXILeCzxWHhTB2DIE9Grd6uEDGm9gpBQsTN
	 BQWhnAsGvjvxXCTSXS2KvcawmoQVqFKEsm2giaMk9bWsbgT2+JXgkd99oJZa0gILZH
	 wJnEVirwjlr5w==
Message-ID: <94265163-b2ac-4ae3-a6cd-597af2344642@kernel.org>
Date: Thu, 12 Sep 2024 22:49:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ps2-gpio - Use IRQF_NO_AUTOEN flag in
 request_irq()
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20240912033013.2610949-1-ruanjinjie@huawei.com>
From: Danilo Krummrich <dakr@kernel.org>
Cc: dmitry.torokhov@gmail.com, erick.archer@outlook.com,
 u.kleine-koenig@pengutronix.de, linus.walleij@linaro.org, robh@kernel.org,
 linux-input@vger.kernel.org
Content-Language: en-US
In-Reply-To: <20240912033013.2610949-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/24 5:30 AM, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 9ee0a0558819 ("Input: PS/2 gpio bit banging driver for serio bus")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>   drivers/input/serio/ps2-gpio.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
> index 0c8b390b8b4f..3a431395c464 100644
> --- a/drivers/input/serio/ps2-gpio.c
> +++ b/drivers/input/serio/ps2-gpio.c
> @@ -429,16 +429,14 @@ static int ps2_gpio_probe(struct platform_device *pdev)
>   	}
>   
>   	error = devm_request_irq(dev, drvdata->irq, ps2_gpio_irq,
> -				 IRQF_NO_THREAD, DRIVER_NAME, drvdata);
> +				 IRQF_NO_THREAD | IRQF_NO_AUTOEN, DRIVER_NAME,
> +				 drvdata);
>   	if (error) {
>   		dev_err(dev, "failed to request irq %d: %d\n",
>   			drvdata->irq, error);
>   		goto err_free_serio;
>   	}
>   
> -	/* Keep irq disabled until serio->open is called. */
> -	disable_irq(drvdata->irq);
> -
>   	serio->id.type = SERIO_8042;
>   	serio->open = ps2_gpio_open;
>   	serio->close = ps2_gpio_close;

