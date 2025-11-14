Return-Path: <linux-input+bounces-16118-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49DC5E53D
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 17:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C13E4FAF15
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 16:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B3A258CE5;
	Fri, 14 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVmTsKuu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED61283151;
	Fri, 14 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136787; cv=none; b=pFNDBw+2gXd1y9DI5auPg1yMjo22t9qG7jkeIDIyornAttWLiY9/6JIYMsSFEhmDkbxLte+tjCScDUqYBG3ubgzLRKSo30eZoRWoyA/4+nYOXh/Yp7OGCGIGospmooNV2drO0RxNfKuLO1EKeIRfV8IExPZRaYqaXRYBt5H9bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136787; c=relaxed/simple;
	bh=wT3KFGMLWGCo3KNjpwYB7vVghTghW1pxKK1CXeF1mwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Cvur++cAJA/wed59ndgDc7GpaD1lzM/7ojgMmB1ZSxxhnJ6Azawbkmd93sMaev+bHVH0bt8Qn3PfAPcdRu3ykFRDT0houPdJuQFxFFXZQujnkr3AjslgCgO+RlUyquVxIfaST8DxHJP06Bsew40FAh4+NqtvMpxCx6XbM8ejUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVmTsKuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB5AC4CEF8;
	Fri, 14 Nov 2025 16:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763136786;
	bh=wT3KFGMLWGCo3KNjpwYB7vVghTghW1pxKK1CXeF1mwE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CVmTsKuuK/JIdR/9po0cS7zdb8MoSQeRIwY51NtRlZzR8Er7nWMRbEj2MCbuokNgC
	 Wm2GLXyOj0Q9RZBMNdGA/8xbqjvov1VChQfo9XvYwDst0vlMgWgZuk8eWFA++F/6TW
	 lb0AL8v1jNowCwNCE7OTCF51cRbEc52VC5Vv913RIY4RLEnbP8nLs6ICTTdUBqujc0
	 Nu5P1PqpKOh7UEhDFIDOu7m+amn600ea57wdybP6QmrrQO2mhsAKITTxzp2iuaUZzN
	 r/xlfja16wQIsOOBQsNfRYWo4H5/RD6+SPPFcaeNoRXJQ26Z1giy/ndsXgapqwc33n
	 j2Iww9w7arUGw==
Message-ID: <dc85cf29-7b89-4eb3-99a0-b66572ceca9c@kernel.org>
Date: Fri, 14 Nov 2025 10:13:04 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: i2c-hid: Add API to wait for device reset completion
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, jikos@kernel.org,
 bentiss@kernel.org, dianders@chromium.org, treapking@chromium.org,
 alex.vinarskis@gmail.com, dan.carpenter@linaro.org,
 guanwentao@uniontech.com, kl@kl.wtf, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251114112418.3275211-1-Qing-wu.Li@leica-geosystems.com.cn>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251114112418.3275211-1-Qing-wu.Li@leica-geosystems.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2025 5:24 AM, LI Qingwu wrote:
> Some HID over I2C devices need to signal reset completion to the host
> after firmware updates or device resets. Per the HID over I2C spec,
> devices signal completion by sending an empty input report (0x0000).
> 
> Add i2c_hid_wait_reset_complete() to allow drivers to synchronize
> with device reset operations. The function sets I2C_HID_RESET_PENDING
> and waits for the device's completion signal.
> 
> Returns: 0 on success, -ETIMEDOUT on timeout, -ENODEV if invalid device.
> 
> Upstream-Status: Pending

This tag is probably useful for your downstream tree, but it's not 
useful upstream.  You should strip it when submitting upstream.

> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> ---
>   drivers/hid/i2c-hid/i2c-hid-core.c | 24 ++++++++++++++++++++++++
>   drivers/hid/i2c-hid/i2c-hid.h      |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index d3912e3f2f13a..4feab2327e92d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1365,6 +1365,30 @@ const struct dev_pm_ops i2c_hid_core_pm = {
>   };
>   EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
>   
> +int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms)
> +{
> +	struct i2c_client *client;
> +	struct i2c_hid *ihid;
> +	long ret;
> +
> +	if (!dev)
> +		return -ENODEV;
> +
> +	client = to_i2c_client(dev);

Check if client is NULL?

> +	ihid = i2c_get_clientdata(client);
> +	if (!ihid)
> +		return -ENODEV;
> +	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +	ret = wait_event_timeout(ihid->wait,
> +				 !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
> +				 msecs_to_jiffies(timeout_ms));
> +	if (ret == 0) {

Shouldn't need curly braces for a one line statement.

> +		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
> +	}
> +	return ret ? 0 : -ETIMEDOUT;

Why not just:

return ret;

> +}
> +EXPORT_SYMBOL_GPL(i2c_hid_wait_reset_complete);

Can you please include a second patch in your series demonstrating the 
usage of this in a driver?

> +
>   MODULE_DESCRIPTION("HID over I2C core driver");
>   MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
> index 2c7b66d5caa0f..1c6d959716858 100644
> --- a/drivers/hid/i2c-hid/i2c-hid.h
> +++ b/drivers/hid/i2c-hid/i2c-hid.h
> @@ -40,6 +40,7 @@ void i2c_hid_core_remove(struct i2c_client *client);
>   
>   void i2c_hid_core_shutdown(struct i2c_client *client);
>   
> +int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms);
>   extern const struct dev_pm_ops i2c_hid_core_pm;
>   
>   #endif


