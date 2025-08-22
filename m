Return-Path: <linux-input+bounces-14251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49347B30C05
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 04:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F6837A6E5E
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 02:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4B9B21E097;
	Fri, 22 Aug 2025 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8/1Rn1w"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400F4393DC6;
	Fri, 22 Aug 2025 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755830898; cv=none; b=u+3IYbv7gg62RyZ1hVeWlDYwi1y6rvAv+mC1itJdgpuc+X0uqv8rTSGkMd56gCtcQITNsY37sSE01xsrNH1nOc3fPXwuD0sDKgmdszrvXizem17iV0cIznYrXmB2O6Zi4HLoeZtgGvTB+eemjS4Ksrn7joC2HzuPRe7tmum3xrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755830898; c=relaxed/simple;
	bh=EFNiBrFJLR/JFecjGgoTl5VpOGAqZX9TuJDm6vuKLzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iWx5NqxvyEM2ucGOz2oVlHpUtVlewoDcAsmdoQNqUTMGKybvDy1ZqLNAW/8IiCwZZ4PWUlWAmn8L83vADEMxU1JZrrB08Dx3ZmEM+Qv+BpbBKtl+dK7PnIWCwDkv4soraVIFCNi+MlDY44lQ9CVSK4LJyOeES3bUSv2wrcRKyCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8/1Rn1w; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e1ff326bbso2110867b3a.1;
        Thu, 21 Aug 2025 19:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755830896; x=1756435696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgJ77krSnGlw5W8K5Tzki1aZ7zfHIQLYeSjxCbIRvgo=;
        b=J8/1Rn1wfxp8oTjQWZS37Ze14kBf8+Cu4JT4fIHIz5X/XpvITnxjmdes9K1TIHRLpz
         Xp5GgfrwYd3PavSb4nbz+/jQialobHIj3vaHyKecqVS/Cw48JMLxyOl+lYR11jSjYkvY
         WYTFnwovH4FdEpJDsvP7TG29OKheW3xgB2BPT+ljbE5CW7UvPj9yk97eTP1wosagJ/rs
         v73R2HDjmLsjZNhDzgwyBv/VZi9mC6yAARML1iQ/QkTPtYjfmU3Cn/KiapVEJhlvVmkQ
         iMJ/L/SX+eAZsyKVlMlrbNw9i7J/b4fMvemE+/k+1KvAyIZhfcTyGRD8ue2mQeRnIBZL
         QHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755830896; x=1756435696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgJ77krSnGlw5W8K5Tzki1aZ7zfHIQLYeSjxCbIRvgo=;
        b=TXKmYkzqSu6HYol3Z4zuDt1a9wUWqlfD0+DaMOdD+NML6pVlgyXV0U81sQ2n3FBr4k
         cQamhFaBObAHImRPwyQ830aIBZ9j/53RyxNcs7mYyTwZgdi4ubV7I03IArjCRtEgsUr+
         QcW4Ar/UkNzyhfNcv2XM6Gt0HFOWqOGdx68sgphGw7vV8fVJcXMqSyQZS954PRWT3MGK
         4/2aD5gGtcpVjVPLhrcEeLmhTEvmMAXdNjjubywUc+FDgSWoCL5yxkDS7aWOMg7F09vO
         T3hg+BVP4DzKTzuSIBMnwcexEto69Rcu6a8pdh3Tssqceg2d9BXl14NaQs4IT0OBzkEX
         iq6w==
X-Forwarded-Encrypted: i=1; AJvYcCUw6rakKOmh8FpEoI5Sv22rTWOHKpIutly6Y2nqYi8VYPBz7KEHjkGZ8VvobZG0INEqm64GzQ15XdPwGTBP@vger.kernel.org, AJvYcCVxpjIx8d2M2qA3Jh0o6pDgW57lHjVwdDQbkH8Akq7TRqFIzE4jSJQY89oGH3oIgr+UV9NSJPPtlhIeMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEdPxtk7/ocCYUmaWShjHrFgvBRajeaEhvjlK6b/gRc/Qc1tpx
	FfdMrnTfFHAw2xpF0PTOsz+mezgpli+5ifJRZRrkV2SOgvBwr7wiqh6xc6xeYQ==
X-Gm-Gg: ASbGncu9LqOjCzn1JOIzKptO6E1dEZvcIY0ZyLZFios6tMMLpQOlcufid4id02iB1A3
	qvGpvCr1PQQNY7LoEr123MIkWqN35HSxXnlcXyqQETGdqERxO9fkQVAfG1QvYms6GrPLCwf99TL
	S5RwRRP8sypmLFCtfrSb5xNXbKQmy1IYURhcuXSkQcXjbIOQLhCWE1f2an/Kdv26LH1jDBwjY7q
	LTip4/EIhfVNJjcLmiS2hoaL6Pqk2cTGDlPpaQ4SHVfJdz5OE3/2pP2q9FrYMs0G57gJaNcaGmM
	xTEk1vuJ150hjDrH+xvVhfj3AUH/HgpI0VqMGmMwBDgIqwHFPCKO7nbqM5L6PLpvpvPcivn/y7N
	0WEYwYCCRsoFNq7s3iMFBmw==
X-Google-Smtp-Source: AGHT+IFuayoNpUGH/+BFnAo3GyPpJEn1Q9wL6HdoplAOHiy0cHKsqUQmM36YvTvmyaBTETwYd1esPg==
X-Received: by 2002:a05:6a21:6d86:b0:243:25b0:232b with SMTP id adf61e73a8af0-24340bc48bfmr1828881637.9.1755830896293;
        Thu, 21 Aug 2025 19:48:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9cb2:179:b04b:be48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32515451214sm1047599a91.19.2025.08.21.19.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 19:48:15 -0700 (PDT)
Date: Thu, 21 Aug 2025 19:48:13 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: heiko@sntech.de, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: Remove dev_err_probe() if error is -ENOMEM
Message-ID: <f6cioxjpfmre4vcru7b3m45cu6axdgpzx6b2qjfggl3r73nbm3@cst5hw7bg75e>
References: <20250821094751.573411-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821094751.573411-1-zhao.xichao@vivo.com>

Hi Xichao,

On Thu, Aug 21, 2025 at 05:47:51PM +0800, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.
> 
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/input/misc/qnap-mcu-input.c   | 2 +-
>  drivers/input/touchscreen/zforce_ts.c | 3 +--

Please split per-driver.

>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
> index 76e62f0816c1..3be899bfc114 100644
> --- a/drivers/input/misc/qnap-mcu-input.c
> +++ b/drivers/input/misc/qnap-mcu-input.c
> @@ -103,7 +103,7 @@ static int qnap_mcu_input_probe(struct platform_device *pdev)
>  
>  	input = devm_input_allocate_device(dev);
>  	if (!input)
> -		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
> +		return -ENOMEM;
>  
>  	idev->input = input;
>  	idev->dev = dev;
> diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
> index df42fdf36ae3..a360749fa076 100644
> --- a/drivers/input/touchscreen/zforce_ts.c
> +++ b/drivers/input/touchscreen/zforce_ts.c
> @@ -747,8 +747,7 @@ static int zforce_probe(struct i2c_client *client)
>  
>  	input_dev = devm_input_allocate_device(&client->dev);
>  	if (!input_dev)
> -		return dev_err_probe(&client->dev, -ENOMEM,
> -				     "could not allocate input device\n");
> +		return -ENOMEM;
>  
>  	ts->client = client;
>  	ts->input = input_dev;

Thanks.

-- 
Dmitry

