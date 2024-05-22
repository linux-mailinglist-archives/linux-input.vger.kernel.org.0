Return-Path: <linux-input+bounces-3778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499E8CC733
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 21:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 581DB1C209DF
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 19:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7367148839;
	Wed, 22 May 2024 19:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KegHVOdk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA2148314;
	Wed, 22 May 2024 19:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716406130; cv=none; b=G9VEYih0YHoQrjU2QJ05/7IA1xIjDZ2zvnTWCLnuk6gjpcAYhGGEIDGMoB+ccYcyMb5cqdzD3GFoX5JrP+Y0u0k7IBcwl7DFlvanqhyYdm4QOvonB0yiRxkduJwC33ZnBKyc82+Sb+9NTahBCpY6l/Y4Q1vzPEEzLX8mpvxSMbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716406130; c=relaxed/simple;
	bh=asqTH8IVJLtiuy+OydqF1YSC4+AWx5xmAD1qinDcuos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+lGwa+Sg8UM8mbNwRUYmlzbf1vt6XHxL9AFfeE85iKk/sfrm3f54aJKt57n7RwnsJCjaYaeR7FOyFuf5qcOCnq5ai467TBQzguhgvOadcuJN8DkBi3wUpugq9m5l6i//WuyS856y/GlsVmn5KLoRO/N3OAfAy1xefrUpIt6D1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KegHVOdk; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5b31f2c6e52so2272434eaf.2;
        Wed, 22 May 2024 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716406128; x=1717010928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9CpjKztRQ/VjY+lu7XUjYKlv0LD57wkTyNwyxdQqMc=;
        b=KegHVOdkazxBTpoOfVnG/sjcnPDuE/pQUrxSc8AWVpdZGghcjHkRafW67LEHXWoT/c
         TyomOsRuGEQ3n83O9g5i9TjbY7u/dywOr3RIgZ1yFdNONqDLHKwinpHbyLNU3h1wzXWb
         WapdD2ae9cc4Qs3j3zPg+Kx3+M3Zr/iXweQv8qRP4nWuNxHu5qyD0ZT8UMvhiQrLhHEz
         9+R5qEJrwYjNMajYTygu+yZ9S+ggaKN2zeKeSf2/x0Q98JsB9s7Cbt8OlVxeMspJy/I0
         IglAxNCKsq+A28c6dKvcXKGMN6AzMHelzsB4Lx5Qtj/E0g0lO+xo6Y9I/apLY3goiBas
         3hZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716406128; x=1717010928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p9CpjKztRQ/VjY+lu7XUjYKlv0LD57wkTyNwyxdQqMc=;
        b=fDVEo2sXObOqIEhebqkGCmziHrRfAhQoIxJL5secRnv9bkcLLYbRu/P4XQemXIymcz
         phAmt56wGzPZLK8GuSR1+6TYAwkkn8stoW4Y+MCy4uG7mZc1OCDvItMtdpMHUSP0Pd5v
         oSLGc2BmjSqdGVNR0StKbp7ojDWkQ14t4vHAJt/MclM/uWi7gc6VdEm8raaurLvxmyWN
         hyDP65+A2Jiqywp0TKMB32ch69IMwriyzWH018WnpqhpDak2OGghsYAp1+KhyYOb1Q9E
         g6rnIpYZb22f8sJZhGQWlPA0ufImrqbLDnxNBomYnfSM6enwp6V7lHXAM+maJFni28C2
         rUbA==
X-Forwarded-Encrypted: i=1; AJvYcCWZvu8QVlrwaf+QUa4bh1yh1K3GjCH4uNLzCS5ASwUCEHT6+gh+0/wtqpH/wj6FytFj1kcA4hIns9YAmyuhhAo0TmJ0rECTFeeqwCoh
X-Gm-Message-State: AOJu0YyDsFecU6AH4hOh/XPRlqejs6o6qdBbrxV3b7FLfvDcpijR0vLx
	ngdKwEk3kJwHRG9Mlqip0W+n73aaep4Y4NYMZ7USTUaWLbwjJJpf
X-Google-Smtp-Source: AGHT+IHuNrKoXEFiaRZX1E47Xdrl9Xv8ilNKbTR2scVi8VwkWewMUYlUC2tfGxuI8NqekB93CD5A4g==
X-Received: by 2002:a05:6359:2d05:b0:18d:7b30:eec1 with SMTP id e5c5f4694b2df-19791f23572mr243689555d.19.1716406128041;
        Wed, 22 May 2024 12:28:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d9d8:1fc1:6a1c:984b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a819e7sm22826164b3a.56.2024.05.22.12.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 12:28:47 -0700 (PDT)
Date: Wed, 22 May 2024 12:28:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ili210x - fix ili251x_read_touch_data() return
 value
Message-ID: <Zk5HbaC7FbIia3RV@google.com>
References: <20240522100341.1650842-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522100341.1650842-1-jkeeping@inmusicbrands.com>

On Wed, May 22, 2024 at 11:03:41AM +0100, John Keeping wrote:
> The caller of this function treats all non-zero values as an error, so
> the return value of i2c_master_recv() cannot be returned directly.
> Follow the same pattern as ili211x_read_touch_data() to return zero when
> the correct number of bytes is read and a negative error code otherwise.
> 
> This fixes touch reporting when there are more than 6 active touches.
> 
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
> ---
>  drivers/input/touchscreen/ili210x.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 31ffdc2a93f35..8846c6d10fc0d 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -255,14 +255,15 @@ static int ili251x_read_reg(struct i2c_client *client,
>  static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
>  {
>  	int error;
> +	int ret;
>  
>  	error = ili251x_read_reg_common(client, REG_TOUCHDATA,
>  					data, ILI251X_DATA_SIZE1, 0);
>  	if (!error && data[0] == 2) {
> -		error = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
> -					ILI251X_DATA_SIZE2);
> -		if (error >= 0 && error != ILI251X_DATA_SIZE2)
> -			error = -EIO;

Thanks for noticing this. Can we say

		if (error >= 0)
			error = error != ILI251X_DATA_SIZE2 ? -EIO : 0;

> +		ret = i2c_master_recv(client, data + ILI251X_DATA_SIZE1,
> +				      ILI251X_DATA_SIZE2);
> +		if (ret != ILI251X_DATA_SIZE2)
> +			error = ret < 0 ? ret : -EIO;
>  	}
>  
>  	return error;
> -- 
> 2.45.1
> 

Thanks.

-- 
Dmitry

