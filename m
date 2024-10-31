Return-Path: <linux-input+bounces-7815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A459B828B
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 19:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B2211C20ECD
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 18:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A971BE852;
	Thu, 31 Oct 2024 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="EgzUnie2"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F357F1C57AD
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 18:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730399039; cv=none; b=DzObEcKGGh6mjVIwz61gnzTBvJCOjEdx/0sVQmRT1/ln9sJ//BwHIv+I16DRcCFsQadjE9FHUMF0JQ7VdM9mOvzW+fHIdOy+NFDlrhArbwNS60j8HStktV20js/kcAxw4VpErTHFlO8QdJlX99aaQm9jE4S2coVXqVSHmmi7s3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730399039; c=relaxed/simple;
	bh=pFmD4Gp8iUHEVovVTrzITTFyj765SZ6D8SpS3LDgWIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oBfHhpT7vGrCxKeTZy6RW37spXwmQNd2r3ZaBp0ZbjcOYgPfhvggpLZ77f48z/5/VxuMld5YhvPwrD5i1x2wVfqOaqpgmlMJrnwIugc/v939ALJgQ1Lzvm7edkLO7bJfZTp4PXn5s0QGQZCkx/EfSOzNaGqoZtquXLj6HgVWO3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=EgzUnie2; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A797088DB1;
	Thu, 31 Oct 2024 19:23:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730399035;
	bh=0KholVrTX3Z7fIoF1yq4CF1GPac8D1QKrQOM0e71wNo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EgzUnie2aXuhz8vXEqe+biNeSBt1DOUlPNnYenPhWgLch5riFGx4Tkt0y+kOFgU+1
	 LtDeKF5tYcb9/x7WefgoOOMEOKlCfwMZWnsBQrs8ET/n54+1j6nIiTFkqjejb25R3T
	 rEeuHYMHLDbYMNiVrtaSYmibnC18f88Yd7tevXA0wK62UQIqdvJzHdtlYTjSsBiusb
	 GChAoSyYDU7UZJm5w9311nh+LJmkcRBkV/ngrysPwM56wbtPqcW1aQNb2r7TAkqN3s
	 PpLTVs2vWvfwouS/7ELFjRbixGXYmhyJaTa9tp24WugdHTx9zMwk1LNXVwGkve9zaf
	 Lafo7Vq6PafoA==
Message-ID: <1b5fda0d-326b-4ade-ba2c-e4dbcc337bc5@denx.de>
Date: Thu, 31 Oct 2024 19:20:45 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atmel_mxt_ts: Avoid excess read length on limited
 controllers
To: linux-input@vger.kernel.org
Cc: Nick Dyer <nick@shmanahar.org>, Evan Green <evgreen@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sasha Levin <sashal@kernel.org>
References: <20200613145632.113573-1-marex@denx.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20200613145632.113573-1-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/13/20 4:56 PM, Marek Vasut wrote:
> Some I2C controllers have a hard limit on the number of data they can
> transfer in one transfer (e.g. Xilinx XIIC has 255 bytes). The Atmel
> MXT touchscreen driver mxt_process_messages_until_invalid() function
> can trigger a read much longer than that (e.g. 690 bytes in my case).
> This transfer can however be easily split into multiple shorter ones,
> esp. since the single T5 message is 10 bytes or so.
> 
> This patch adds a check for the quirk presence and if it is present,
> limits the number of messages read out of the controller such that
> they are below the quirk limit. This makes it possible for the MXT
> driver to work even on such limited controllers.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Nick Dyer <nick@shmanahar.org>
> Cc: Evan Green <evgreen@chromium.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Sasha Levin <sashal@kernel.org>
> ---
>   drivers/input/touchscreen/atmel_mxt_ts.c | 30 ++++++++++++++++++------
>   1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f5..faa3f3f987d46 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -985,21 +985,37 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
>   
>   static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
>   {
> +	const struct i2c_adapter_quirks *q = data->client->adapter->quirks;
>   	struct device *dev = &data->client->dev;
> -	int ret;
> -	int i;
> +	int i, ret, offset = 0;
> +	u16 rem, chunk = count, total = count;
>   	u8 num_valid = 0;
>   
>   	/* Safety check for msg_buf */
>   	if (count > data->max_reportid)
>   		return -EINVAL;
>   
> +	/* Handle controller read-length limitations */
> +	if (q && q->max_read_len) {
> +		chunk = min((u16)(q->max_read_len / data->T5_msg_size),
> +			    (u16)count);
> +	}
> +
>   	/* Process remaining messages if necessary */
> -	ret = __mxt_read_reg(data->client, data->T5_address,
> -				data->T5_msg_size * count, data->msg_buf);
> -	if (ret) {
> -		dev_err(dev, "Failed to read %u messages (%d)\n", count, ret);
> -		return ret;
> +	while (total) {
> +		rem = min(total, chunk);
> +		ret = __mxt_read_reg(data->client, data->T5_address,
> +				     data->T5_msg_size * rem,
> +				     data->msg_buf +
> +					(offset * data->T5_msg_size));
> +		if (ret) {
> +			dev_err(dev,
> +				"Failed to read %u messages (offset %u of total %u) (%d)\n",
> +				rem, offset, count, ret);
> +			return ret;
> +		}
> +		total -= rem;
> +		offset += rem;
>   	}
>   
>   	for (i = 0;  i < count; i++) {

I just found this patch still in my upstreaming queue. Any input on 
this? It seems to still apply and it is still needed on Xilinx XIIC I2C.

