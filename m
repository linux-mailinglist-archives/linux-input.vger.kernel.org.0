Return-Path: <linux-input+bounces-16623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C57FCCB640
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 11:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DCDA304B4DD
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 10:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC1A320CA8;
	Thu, 18 Dec 2025 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="VzG1LL9G"
X-Original-To: linux-input@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26F33122B;
	Thu, 18 Dec 2025 10:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766053796; cv=none; b=GtPqvN8X+ydmeQU6FtrVtrnqi+oUelk9ne4vSJq9I7eCjdlh2mrjG3PpP+i3UkYGSKN0VOMWaV22rkKpI3KTP89L94BnFaWy6fHUg35OxGFtHPbfwMs0A5AmgpNA53c1Ax70Opq2d322psnQ3ICuzExR2QcVSpSAuhsRf6WtAr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766053796; c=relaxed/simple;
	bh=T+YYo8Bp+ZsAnA2pMvBozKE3sdLJOX2L5DkfpdzK/f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq1glPhnzri5HbpLQrsfoAlBtdszsSQaUANb3RRBmJ49KUIVpY0+ZIzW6Vn4ltserT6ilOIEoM3MArZvbYcEXtS4EJKsonujHYeJh6H+DgzkqeEeUCYKWtXMxVZmoBGPB5PY4LGaHfSsNy02kBxJcxzBhDZT0a7XxjBBK7DehKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=VzG1LL9G; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1766053330;
	bh=J2Yg/CPOLhOqJhg08nbjz25q8iqcEUT7yPZpD9kmpXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VzG1LL9GQtg7rAb5VAqToVlu5fWxRtjJXWtziZvQh9VBcR9BXKIeV+NRdu9n4L9Ip
	 AyGIDd1C9wRazTNc4CQylljg3EAoZiqrzSB/wWlsvA1LAbcsrt0avT1Xxuh3MMIsgY
	 w0PtdGd2lhV/vT6nmWTqpLzvCrP3Zw+fqNuOlcNA=
Received: from [10.1.8.111] (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id 75D90A0343;
	Thu, 18 Dec 2025 11:22:10 +0100 (CET)
Message-ID: <894b86b6-8b80-4ad1-942c-0e1120c0a4ae@ysoft.com>
Date: Thu, 18 Dec 2025 11:22:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: pixcir_i2c_ts - add support for one-time total
 calibration
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
References: <20251119175113.39216-1-michal.vokac@ysoft.com>
Content-Language: en-US
From: =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
In-Reply-To: <20251119175113.39216-1-michal.vokac@ysoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Dmitry,

gentle ping on this.

On 19. 11. 25 18:51, Michal Vokáč wrote:
> The Pixcir Tango controller has support for a one-time total calibration
> (manual calibration) procedure. Its purpose is to measure the capacitance
> offsets of the electrode system and to store these values into EEPROM.
> 
> During normal operation this calibration data is subtracted from the values
> measured. This calibration should be necessary only once in the product
> lifetime. It should be performed as part of the final adjustment after
> the panel is mounted in the product.
> 
> Add support for the calibration with sysfs interface.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> changes in v2:
>   - Removed redundant lock from calibrate_store().
> 
>   drivers/input/touchscreen/pixcir_i2c_ts.c | 26 +++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
> index dad5786e82a4..e52ec8d8e392 100644
> --- a/drivers/input/touchscreen/pixcir_i2c_ts.c
> +++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
> @@ -24,6 +24,7 @@
>    */
>   #define PIXCIR_REG_POWER_MODE	51
>   #define PIXCIR_REG_INT_MODE	52
> +#define PIXCIR_REG_SPECOP	58
>   
>   /*
>    * Power modes:
> @@ -462,6 +463,30 @@ static int pixcir_i2c_ts_resume(struct device *dev)
>   static DEFINE_SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
>   				pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
>   
> +static ssize_t calibrate_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct pixcir_i2c_ts_data *ts = i2c_get_clientdata(client);
> +	static const u8 cmd = 0x03;
> +	int error;
> +
> +	error = i2c_smbus_write_byte_data(ts->client, PIXCIR_REG_SPECOP, cmd);
> +	if (error)
> +		dev_err(dev, "calibrate command failed: %d\n", error);
> +
> +	return error ?: count;
> +}
> +
> +static DEVICE_ATTR_WO(calibrate);
> +
> +static struct attribute *pixcir_i2c_ts_attrs[] = {
> +	&dev_attr_calibrate.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(pixcir_i2c_ts);
> +
>   static int pixcir_i2c_ts_probe(struct i2c_client *client)
>   {
>   	const struct i2c_device_id *id = i2c_client_get_device_id(client);
> @@ -600,6 +625,7 @@ MODULE_DEVICE_TABLE(of, pixcir_of_match);
>   static struct i2c_driver pixcir_i2c_ts_driver = {
>   	.driver = {
>   		.name	= "pixcir_ts",
> +		.dev_groups = pixcir_i2c_ts_groups,
>   		.pm	= pm_sleep_ptr(&pixcir_dev_pm_ops),
>   		.of_match_table = of_match_ptr(pixcir_of_match),
>   	},


Best regards,
Michal

