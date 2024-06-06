Return-Path: <linux-input+bounces-4184-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B51C8FF6A6
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 23:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26333287860
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 21:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B944197A68;
	Thu,  6 Jun 2024 21:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOHuZNiz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C678D1DFD1;
	Thu,  6 Jun 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717709010; cv=none; b=ZhEJj4/KKMO6NggiDJXDv5ZJQFxR6moCtWTThJg/sHBzjthJFR37u2riXUYIvDLATQLZrvjKFcvVeWPlv4QYYcd7m6+OrTHadQYp+JEkkPxbWxv9JKfKbepQPHnWqEbhF7nb7cRlecy5Ki6M4+/+HOn5jLDnVMkhxiiJLl4H/MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717709010; c=relaxed/simple;
	bh=MlWKKowoduf1coKOO9ueG5D4siN7Sr8huDBPbThrT3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9jKt0rZ75i/0Aqe04CmT77sxLzS05r/v54I68e0zzfUQC6o7Sbf8jMJwO5poWuKNge33TtSFD0XXsm1OdrO+Pp1NeybyILn6NbBFZTO4nJIUxSqJcJmKNfDqAGPxJnqUQMB5UR+6HEaMCZQndi0vbOmA7Ma+ZOowSZBw1VCDUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOHuZNiz; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6c4f3e0e3d2so1168988a12.1;
        Thu, 06 Jun 2024 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717709008; x=1718313808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6/wrurbfyUySx6z2OKVYQ/vZalRqibSuFmNRlySgbic=;
        b=DOHuZNiz7dVt1++kmgUY16xXmdRy5JaN7a2s15Y1iGFoWuNCkaBh0pJAX/bm1JFiTh
         x132kcMzme5saSAf/oLVoFgL9gPVVB6hDjnIjE56PiF5ciy3TXTgTTGbw2WiA6aKcF0L
         MwmDsWYnfw2XFopGaSl5Qpai0HL2LpLErYtOaxSoUHRzbNHwmZMNG8DCTtxI2ezYy8DW
         lZySUzQeUXKcBpfoFqJWBzbYpswqIVlmO36ljAbK1DQmkEEAG8mWSjS/c640ccPCiBuz
         QuuPX1TGB87XIxrF66ggs9o/09rLrJBfy/owCewqRqLIe3lYeMffWt7nKhEa32GcsJsd
         ZTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717709008; x=1718313808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/wrurbfyUySx6z2OKVYQ/vZalRqibSuFmNRlySgbic=;
        b=PTMo0ZhmzAGoNSTXtbu1ryjA/dFEC6BIdCwBrBne3tfJLAyR2BDM0BU7Eq+PFaqsqH
         /h3f2l5DD8a8qfnMEoigjg7vFkgsX9fjUgQx2sAL6oWvVwnvEiSDEz+8mi81hJyK/BlF
         bOt6AR94MfQzZF9HIep2EEVn02d+DAmnU+hJ7ZMkQTiey29UVlMWDZxubRM271tIbJyO
         HTPFS1GiUBnKzwcSdQ/5J8q9h2CztVKRiwJfy0qagzpn+VKNyzVYGgJ2nWigAFGLsoMP
         S/z2t5CHKgU2Mw61ZAHxBgFglKdXlYL8jubIT2Kw0GHdGoKzUbkKBkIQAFi2m4MxTMhX
         Skdw==
X-Forwarded-Encrypted: i=1; AJvYcCXkG9UjCwVp+ow2oRw0WKkHF7/fcLX/DEodUW7OofjSu1NCDo+5b4an+dbWV7tZBxpgG1b4uvbZibo2dK/LERf9RTc86TG08JghVszl
X-Gm-Message-State: AOJu0Yys7osP3YA0aEK3FIgNbsneP8Ru4gdatpO3ZGb+8U/S4LY8AY7+
	TtZNbJjl3uDwOC4rYGg9daPv1rf8cGg2jfcSbje9JltGe954pDrI
X-Google-Smtp-Source: AGHT+IHspRto+3fOf16TYOm26vXHjGcU7EJXSft/rL9XCCrYRNyn5X9m5AsN+6mHPKnXL61lXSPpOg==
X-Received: by 2002:a17:902:d508:b0:1f6:8489:d150 with SMTP id d9443c01a7336-1f6d02d2295mr9122195ad.13.1717709007959;
        Thu, 06 Jun 2024 14:23:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cdcb:6470:dec1:846c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7d5edfsm20337705ad.162.2024.06.06.14.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 14:23:27 -0700 (PDT)
Date: Thu, 6 Jun 2024 14:23:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Alistair Francis <alistair@alistair23.me>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	alistair23@gmail.com
Subject: Re: [PATCH v2] Input: wacom_i2c - Clean up the query device fields
Message-ID: <ZmIozAu-R1nbRYHF@google.com>
References: <20211118123545.102872-1-alistair@alistair23.me>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211118123545.102872-1-alistair@alistair23.me>

Hi Alistair,

On Thu, Nov 18, 2021 at 10:35:45PM +1000, Alistair Francis wrote:
> Improve the query device fields to be more verbose.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Could you please list what has changed since v1?

> ---
>  drivers/input/touchscreen/wacom_i2c.c | 45 ++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index fe4ea6204a4e..50d159919bd1 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -23,13 +23,20 @@
>  #define WACOM_BARREL_SWITCH_2	BIT(4)
>  #define WACOM_IN_PROXIMITY	BIT(5)
>  
> -/* Registers */
> -#define WACOM_CMD_QUERY0	0x04
> -#define WACOM_CMD_QUERY1	0x00
> -#define WACOM_CMD_QUERY2	0x33
> -#define WACOM_CMD_QUERY3	0x02
> -#define WACOM_CMD_THROW0	0x05
> -#define WACOM_CMD_THROW1	0x00
> +// Registers

I am partial to C-style comments, let's keep them.

> +#define WACOM_COMMAND_LSB	0x04
> +#define WACOM_COMMAND_MSB	0x00
> +
> +#define WACOM_DATA_LSB		0x05
> +#define WACOM_DATA_MSB		0x00
> +
> +// Report types
> +#define REPORT_FEATURE		0x30
> +
> +// Requests / operations
> +#define OPCODE_GET_REPORT	0x02
> +
> +#define WACOM_QUERY_REPORT	3
>  #define WACOM_QUERY_SIZE	19
>  
>  struct wacom_features {
> @@ -51,22 +58,24 @@ static int wacom_query_device(struct i2c_client *client,
>  			      struct wacom_features *features)
>  {
>  	int ret;
> -	u8 cmd1[] = { WACOM_CMD_QUERY0, WACOM_CMD_QUERY1,
> -			WACOM_CMD_QUERY2, WACOM_CMD_QUERY3 };
> -	u8 cmd2[] = { WACOM_CMD_THROW0, WACOM_CMD_THROW1 };
>  	u8 data[WACOM_QUERY_SIZE];
> +
> +	u8 get_query_data_cmd[] = {
> +		WACOM_COMMAND_LSB,
> +		WACOM_COMMAND_MSB,
> +		REPORT_FEATURE | WACOM_QUERY_REPORT,
> +		OPCODE_GET_REPORT,
> +		WACOM_DATA_LSB,
> +		WACOM_DATA_MSB,
> +	};
> +
>  	struct i2c_msg msgs[] = {
> +		// Request reading of feature ReportID: 3 (Pen Query Data)
>  		{
>  			.addr = client->addr,
>  			.flags = 0,
> -			.len = sizeof(cmd1),
> -			.buf = cmd1,
> -		},
> -		{
> -			.addr = client->addr,
> -			.flags = 0,
> -			.len = sizeof(cmd2),
> -			.buf = cmd2,
> +			.len = sizeof(get_query_data_cmd),
> +			.buf = get_query_data_cmd,

This combines writes into one message. Is this safe and works for all
devices? At the very least this needs to be mentioned in the patch
description.


>  		},
>  		{
>  			.addr = client->addr,
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry

