Return-Path: <linux-input+bounces-3700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F038C49D6
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 01:02:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 663C31C21480
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 23:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E40D584DF1;
	Mon, 13 May 2024 23:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDOjzt5G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E2433C5;
	Mon, 13 May 2024 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715641324; cv=none; b=Yytc7nNu2MzCLWZtr66Dpg0p9CoAxqHLtIK3PGRMgi2mW1hY/oBBdBhqjaZ9W0ltnN0xnRKMgGGL1bXv9g11lNXW3fbUwTyt3RVhPjWLiq7vkfZaPraZ7PulXwcXoiAcIpRP9jc+4szJUhcNQp6Iew9x96SpIeiHE173dpndYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715641324; c=relaxed/simple;
	bh=eCmhF+W5lLreJ4G8pKBhmRZ6BpomICcH/3M7iRYdRJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anX+JsByX+Kmx2zxOZUAgSwf2P6p5Wji7DWVDiN1edQkYrW7bDmd8NB18Z6MyXLkSPwftANal7iiv353yK+F32ehwo3MbnUb98tPxc6ztQ/oG17L0gx579kI7UEKbSB8CNJ+wZpaaAjBVupmSbbEf0VEhzjO7bEqum3rHf/E0sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDOjzt5G; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36c8bdc30f7so20338025ab.1;
        Mon, 13 May 2024 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715641322; x=1716246122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+7BhooU6bHeR/fWEX79jtV3kxO2cLbs/OzgM/zbHXBw=;
        b=GDOjzt5GHDds68yaIxKhSE79+xkuLFrMpBpfhwx7HsIVxOcBTl9ph8rEOkpyjhT0iR
         OhQLHUMnSjS2AdqUPyo1FRiwcmbcS/6+LLVgyHK19sTh4DQDGRRjc7G9B6DJeHmSFN11
         gXfFeJfOAnmMtIiNr1PvwopdY8wzm2nxe7R6vVR6buOJ2EubMqbM8ip9AFTdChqaFbAX
         vba3FK5V/vj1yozO+aF9Z+5MATzZsKsuXOfTC3FjYu0jZZw60BLeiawW/GfivHCCm32F
         1ilj9hwbrks08al4kcSbkqKO1pwnctlkUHm/ffRhPeixR74sBbm3DGGNewDKqe65mAm7
         mlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715641322; x=1716246122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7BhooU6bHeR/fWEX79jtV3kxO2cLbs/OzgM/zbHXBw=;
        b=CJicAPJXru6l4iNXeUPeYtslK4+PlfOelQUZ3J8i5cL6zA3Ysmw+jV7S+izg2coGH+
         UMaR4lebIU3erS/ButTdCdmHS1pS/dV3v3A77/f8ZRA64glEsBQ8ZbwUR8jmivLssQQh
         1caHUwXe+YdYFw0i+672bZuA55JSTcGos6xNm4dJj+CpcfSoFKb95W1dyEnK46/eOIbV
         2746gCzi9H9HwFGEvJUHxOEx/Q+KmzF53QzNtvDHzeBPV2dwsk779Imqc2Ry6uaB2w2F
         Z7ciSFC4jzvfl8qWm8cXUwupuPVOXjCnFUz/4h3xLA1yNgyQEBaqYGf8M4eoAaUUY9gU
         1KFQ==
X-Forwarded-Encrypted: i=1; AJvYcCViWwD/PPhaDvrM5mXb+dZiL1Hh31n9pxcmUfxYwOk60FAr9LLUMoyOa0BC1urIV+FdSBzispIU4/upUQh2nrCTJ/POpDGrCmc9R1DBllf7WjsmH+pAVdAh/0jc5HaUWA6QYNjBUmLhUp0xZPnDIhEk73US5Fqy0VbWO6vzqbrNTRCRuuWR
X-Gm-Message-State: AOJu0YxsIFCjGFXoouQg+40TiVRm8R6+9qkqpT5NmzBhsvEF817m+ftU
	1ur9FYNHwAurTf8R5+9UaUbGO+xARllHDDUN8z//LD0I01MdZoDiTmmNZA==
X-Google-Smtp-Source: AGHT+IHIJ+Fq6kvwZ7I5DeZYMNNP2kTEydDf/w9IZPwHT3WLru1cSHF6NHgNyr5f44LXhZUDok96+A==
X-Received: by 2002:a05:6e02:12ee:b0:36c:51c0:5564 with SMTP id e9e14a558f8ab-36cc1499419mr146904555ab.22.1715641322181;
        Mon, 13 May 2024 16:02:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a449ffbsm8394685a12.2.2024.05.13.16.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:02:01 -0700 (PDT)
Date: Mon, 13 May 2024 16:01:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Felix Kaechele <felix@kaechele.ca>, Mark Brown <broonie@kernel.org>
Cc: Job Noorman <job@noorman.info>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] input: himax_hx83112b: implement MCU register
 reading
Message-ID: <ZkKb5_SRNwG1pRou@google.com>
References: <20240511121245.109644-1-felix@kaechele.ca>
 <20240511121245.109644-4-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511121245.109644-4-felix@kaechele.ca>

On Sat, May 11, 2024 at 08:12:24AM -0400, Felix Kaechele wrote:
> Implement reading from the MCU in a more universal fashion. This allows
> properly handling reads of more than 4 bytes using the AHB FIFO
> implemented in the chip.

Mark, do we have anything in regmap to support this better or having a
wrapper is the best solution here?

Thanks!

> 
> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
> ---
>  drivers/input/touchscreen/himax_hx83112b.c | 50 ++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
> index 2da2920d43f9..67ef3255cc8b 100644
> --- a/drivers/input/touchscreen/himax_hx83112b.c
> +++ b/drivers/input/touchscreen/himax_hx83112b.c
> @@ -27,9 +27,13 @@
>  #define HIMAX_AHB_ADDR_BYTE_0			0x00
>  #define HIMAX_AHB_ADDR_RDATA_BYTE_0		0x08
>  #define HIMAX_AHB_ADDR_ACCESS_DIRECTION		0x0c
> +#define HIMAX_AHB_ADDR_INCR4			0x0d
> +#define HIMAX_AHB_ADDR_CONTI			0x13
>  #define HIMAX_AHB_ADDR_EVENT_STACK		0x30
>  
>  #define HIMAX_AHB_CMD_ACCESS_DIRECTION_READ	0x00
> +#define HIMAX_AHB_CMD_INCR4			0x10
> +#define HIMAX_AHB_CMD_CONTI			0x31
>  
>  #define HIMAX_REG_ADDR_ICID			0x900000d0
>  
> @@ -65,10 +69,34 @@ static const struct regmap_config himax_regmap_config = {
>  	.val_format_endian = REGMAP_ENDIAN_LITTLE,
>  };
>  
> -static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
> +static int himax_bus_enable_burst(struct himax_ts_data *ts)
>  {
>  	int error;
>  
> +	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_CONTI,
> +			     HIMAX_AHB_CMD_CONTI);
> +	if (error)
> +		return error;
> +
> +	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_INCR4,
> +			     HIMAX_AHB_CMD_INCR4);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static int himax_bus_read(struct himax_ts_data *ts, u32 address, void *dst,
> +			  size_t length)
> +{
> +	int error;
> +
> +	if (length > 4) {
> +		error = himax_bus_enable_burst(ts);
> +		if (error)
> +			return error;
> +	}
> +
>  	error = regmap_write(ts->regmap, HIMAX_AHB_ADDR_BYTE_0, address);
>  	if (error)
>  		return error;
> @@ -78,7 +106,23 @@ static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
>  	if (error)
>  		return error;
>  
> -	error = regmap_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0, dst);
> +	if (length > 4)
> +		error = regmap_noinc_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0,
> +					  dst, length);
> +	else
> +		error = regmap_read(ts->regmap, HIMAX_AHB_ADDR_RDATA_BYTE_0,
> +				    dst);
> +	if (error)
> +		return error;
> +
> +	return 0;
> +}
> +
> +static int himax_read_mcu(struct himax_ts_data *ts, u32 address, u32 *dst)
> +{
> +	int error;
> +
> +	error = himax_bus_read(ts, address, dst, sizeof(dst));
>  	if (error)
>  		return error;
>  
> @@ -104,7 +148,7 @@ static int himax_read_product_id(struct himax_ts_data *ts, u32 *product_id)
>  {
>  	int error;
>  
> -	error = himax_read_config(ts, HIMAX_REG_ADDR_ICID, product_id);
> +	error = himax_read_mcu(ts, HIMAX_REG_ADDR_ICID, product_id);
>  	if (error)
>  		return error;
>  
> -- 
> 2.45.0
> 

-- 
Dmitry

