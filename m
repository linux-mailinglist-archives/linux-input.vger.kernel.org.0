Return-Path: <linux-input+bounces-16356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 824A9C8AE69
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 17:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A554734A469
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 16:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF0733D6DC;
	Wed, 26 Nov 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5OKVRHC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937DA33D6C6;
	Wed, 26 Nov 2025 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764173813; cv=none; b=IuaRkcfJWliMOcz2qgT/R2AuSljP4CADKR4YA4ACaon9bYSCoxrksJTwILzdhyatJuKkEVKHXDeL48hBXw1iBl9hk16cY6S/36oB809dkCNRVaqC6F3+VpAtjG2RQvT9GQYysHrqaM6KtT6UafefaXI2GgaDS05QdGa472tna1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764173813; c=relaxed/simple;
	bh=7PEoEN9+uDK3o57FuGpQUCeefXb/4aKkAZjJ1c32gLc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pCZbhOXVs3hNkFwEuxhog5CDjnKnTzP2ykoKTl4H2f/FSrBS2DpsSdjmaPdVkh6og0/zN6Ss++Lq8pQHJbNMNwuKl8MY8MccYr8vPx0vjZHHcFeXGdiUour4Qt8ncZgMTwuoN6kg0OvvllUf9d1tGYj2OMuhNHXX5bc7sAd6eYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5OKVRHC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA9AC113D0;
	Wed, 26 Nov 2025 16:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764173813;
	bh=7PEoEN9+uDK3o57FuGpQUCeefXb/4aKkAZjJ1c32gLc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q5OKVRHCP7n2dUAtfNY4MlXsu2rvHt9CGqvU9GdPvKTItKB9j0uiTge1AQzVoO0b7
	 0Cif59fMYyj3mq7MmrucadzpSDKpmYEdYE/nfIrfW3sVHdUnQ/7WCikLeZ61ulx/2s
	 79Kmj7CyCrDsJ0JFV0G6AALMjVqnSoGH2lLi1PEp7drKRa+wAJeWDqtJNN9eXpNxgH
	 c6gb9b1FwvGs0uBGJFGsRCluM/Xp4DHqcBFZSd9qBTSSPjq8gFNf+U6HPOxZQJl5J8
	 kCWHGEZhzU/R+evdT29ZUDdsSUlNGRXLZRu5bMPSIP8Mi3zFhTt9C7ZmGzzp6tMFZp
	 fgoVcOtYIe7HQ==
Date: Wed, 26 Nov 2025 17:16:50 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
cc: bentiss@kernel.org, dianders@chromium.org, treapking@chromium.org, 
    alex.vinarskis@gmail.com, dan.carpenter@linaro.org, superm1@kernel.org, 
    guanwentao@uniontech.com, kl@kl.wtf, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, liqind@163.com
Subject: Re: [PATCH V3 1/1] HID: i2c-hid: Add API to wait for device reset
 completion
In-Reply-To: <20251117081046.3140656-2-Qing-wu.Li@leica-geosystems.com.cn>
Message-ID: <1707qnp0-7s29-nssr-q868-q36o33571o5q@xreary.bet>
References: <20251117081046.3140656-1-Qing-wu.Li@leica-geosystems.com.cn> <20251117081046.3140656-2-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, LI Qingwu wrote:

> Some HID over I2C devices need to signal reset completion to the host
> after firmware updates or device resets. Per the HID over I2C spec,
> devices signal completion by sending an empty input report (0x0000).
> 
> Add i2c_hid_wait_reset_complete() to allow drivers to synchronize
> with device reset operations. The function sets I2C_HID_RESET_PENDING
> and waits for the device's completion signal.
> 
> Returns: 0 on success, -ETIMEDOUT on timeout.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 27 +++++++++++++++++++++++++++
>  drivers/hid/i2c-hid/i2c-hid.h      |  1 +
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 63f46a2e5788..067ad0770dd9 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1401,6 +1401,33 @@ const struct dev_pm_ops i2c_hid_core_pm = {
>  };
>  EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
>  
> +int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms)
> +{
> +	struct i2c_client *client;
> +	struct i2c_hid *ihid;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	client = to_i2c_client(dev);
> +	if (!client)
> +		return -ENODEV;
> +
> +	ihid = i2c_get_clientdata(client);
> +	if (!ihid)
> +		return -ENODEV;
> +
> +	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +	if (wait_event_timeout(ihid->wait,
> +			       !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
> +			       msecs_to_jiffies(timeout_ms)))
> +		return 0;
> +
> +	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +	return -ETIMEDOUT;
> +}
> +EXPORT_SYMBOL_GPL(i2c_hid_wait_reset_complete);
> +
>  MODULE_DESCRIPTION("HID over I2C core driver");
>  MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
> index 1724a435c783..8e5482baa679 100644
> --- a/drivers/hid/i2c-hid/i2c-hid.h
> +++ b/drivers/hid/i2c-hid/i2c-hid.h
> @@ -42,6 +42,7 @@ void i2c_hid_core_remove(struct i2c_client *client);
>  
>  void i2c_hid_core_shutdown(struct i2c_client *client);
>  
> +int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms);
>  extern const struct dev_pm_ops i2c_hid_core_pm;

Please resubmit this together in one go with the driver that makes use of 
the functionality.

Thanks,

-- 
Jiri Kosina
SUSE Labs


