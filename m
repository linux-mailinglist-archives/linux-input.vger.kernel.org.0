Return-Path: <linux-input+bounces-7968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D4F9C1655
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 07:08:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B808C2843F8
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 06:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED391C578E;
	Fri,  8 Nov 2024 06:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hqP4vQZq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F08F54
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 06:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731046106; cv=none; b=Pwn099fqM0uw0nXkTvwYGj1IzMUrvawsMQeP+idsO8Klu2wBc1SgnTXzEHS70kEAS8MUSstF/82xPlVIf+s0v8tH37Qq8fRY8kANFLL3zZrIB/wRS7DXdsuNUULW4X6nfzdRGgODfySXBmeLr/unGs0U1RgN7a5uEzuWN/3io0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731046106; c=relaxed/simple;
	bh=P66UOV+IhICRoIhdWCcfmRKeFCYB37AWMM5jX1ZI75Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKr+yor1wXOC7IKzRbwU0EY79gDgcKKP8aCeO+7UVIPlMeIJeZGmESWK1LRxChB3qInfpM3tsAaHnF9u8qeu0bjwHzFJF6QHmt2MVyfhK1GQE9XwVa3gro3DUJ9tIZaejMRGxpDCLhG4AY1odlmDahJOPDxyJM1pJiAWCxuaKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqP4vQZq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20cb47387ceso19067495ad.1
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 22:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731046104; x=1731650904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YqG/9FTjexBMgVHn9w60AReCBMub3nhnnvUfZrSSId8=;
        b=hqP4vQZqU9m6upIs7ISFHsgwSbIRFkUlr5M4/B1WSSfTxUr0v1mYPfWcBOx6KXaGhg
         EVOVa8tBs3d8yY2zou+sbyaB3R/yLhGxz+Fpde5TNx1QWvIlUX9YFARFiCujrpfiUhCv
         FLrU8bmHpcoQKnue719RYOnDs3xzu4Nh7hJqF4qP4xQaqJfU+Kek5yW2qYCcJNW2151p
         pNPXaquxVasgusF7Syn/s0+KXmP/esBYLOoxLPCOWWsh0Xp/9JSQwL49A4hCwmjmdYFQ
         P6z/E0MS/wd+g5+4SAlMdpev8Mlc7CrsQE7T5L1MS10zh04T5Jr9Y840Gbb6+6Ige6B1
         KrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731046104; x=1731650904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqG/9FTjexBMgVHn9w60AReCBMub3nhnnvUfZrSSId8=;
        b=WlAXSnunYpms5fnLxI7AlxLk86Ln/2ecuECg9mpJ/EJXxl4zPRXKmPkVO4L1vgt6Pi
         LanNQxrVLwCxHx5bWzi+/Bt5PuIcA50o/pxAP6gIillCpj1DNFwPHPEAJKUGaM8/DQGR
         x2UJN9AYyPfi9MJ2mDjpH/0zTkgiz62Zrijr/8AbcXGkEPsS7i31UBMnGq7vai2AuKRM
         Mtuq1nZcKYZafbYUaenqgkOZpgaQkx7f6AWZDrXYIIezoUPgzJLwBn5PN5u6j6825z/s
         ZpNV9djjhBG3CD83mSJnR7mXNUp/4qbg4bsPh70AsDnrrBbFUPn6a1osKYr13kwzeG9n
         mBwg==
X-Gm-Message-State: AOJu0YxQSW+WafloKqeOnQtDXC+r2m7mm+MaVxHW4XSp7DKI6wCapnYv
	Jdd1ATtAg82CnlzOPP8YVO/Pnt7SJPHzqqro9vQ7CWMeMh9zRTvH
X-Google-Smtp-Source: AGHT+IF40KSezz4AtDHpzVqyZRM99QTRrFNWJteZTHbGynejXtrRu0Z52Kk0oO11TnooEtuPiAPZ/A==
X-Received: by 2002:a17:902:fb46:b0:20d:27fa:1911 with SMTP id d9443c01a7336-211834e6bfcmr16945645ad.8.1731046103847;
        Thu, 07 Nov 2024 22:08:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9aed:7ea4:c2e6:9e3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177de041dsm22796855ad.103.2024.11.07.22.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 22:08:23 -0800 (PST)
Date: Thu, 7 Nov 2024 22:08:20 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
	Evan Green <evgreen@chromium.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] Input: atmel_mxt_ts: Avoid excess read length on limited
 controllers
Message-ID: <Zy2q1Ar9BzecljDo@google.com>
References: <20200613145632.113573-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613145632.113573-1-marex@denx.de>

Hi Marek,

On Sat, Jun 13, 2020 at 04:56:32PM +0200, Marek Vasut wrote:
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
>  drivers/input/touchscreen/atmel_mxt_ts.c | 30 ++++++++++++++++++------
>  1 file changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a2189739e30f5..faa3f3f987d46 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -985,21 +985,37 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
>  
>  static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
>  {
> +	const struct i2c_adapter_quirks *q = data->client->adapter->quirks;
>  	struct device *dev = &data->client->dev;
> -	int ret;
> -	int i;
> +	int i, ret, offset = 0;
> +	u16 rem, chunk = count, total = count;
>  	u8 num_valid = 0;
>  
>  	/* Safety check for msg_buf */
>  	if (count > data->max_reportid)
>  		return -EINVAL;
>  
> +	/* Handle controller read-length limitations */
> +	if (q && q->max_read_len) {
> +		chunk = min((u16)(q->max_read_len / data->T5_msg_size),
> +			    (u16)count);

I do not think you need this min() here. The "rem = min(total, chunk);"
below will take care of cases where chunk is bigger than total count.

> +	}
> +
>  	/* Process remaining messages if necessary */
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
>  	}
>  
>  	for (i = 0;  i < count; i++) {
> -- 
> 2.26.2
> 

Thanks.

-- 
Dmitry

