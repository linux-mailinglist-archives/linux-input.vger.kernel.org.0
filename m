Return-Path: <linux-input+bounces-5253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D51943600
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8E69285C9B
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E49946F;
	Wed, 31 Jul 2024 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEyTMbbM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7171396;
	Wed, 31 Jul 2024 19:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452436; cv=none; b=XJ1+fFStilYqMO9bR6VlHbaM2/dfcZ8xHr+lthbvGyZOA4a8ZnD0oFwTBtAGRfwUHNJMJSGP6fgUrLYsLLUKa9uGv3Heh6LDyHjhiMjXbh9DbEwFWDeBWaNhbs1vX5M4WOegyxLH/wjhz1RDwRvnBS7WkfMy0u99cAdZf089nC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452436; c=relaxed/simple;
	bh=dfjG0nkpDi+PVFo2iKDqqWAVFvkKDak2CdcBdbqs9z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3ghlsjbLtqnUiwhDbq0nJBkz+8XioN+nacPL/KN640SoGe+bocXmikLDbCyOe19zGi2fYuxO3yXunH3KEHlVHwoMkabktiwB5IXWog8wbE9SPV0Vj+jj8kght120OSFInEGC/wHSxr7v77d7O+Sw7Hc6RNgbZg6JCKafhh9oqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEyTMbbM; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd6ed7688cso47882015ad.3;
        Wed, 31 Jul 2024 12:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722452435; x=1723057235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhBhpwLr2HpmurRTx9ZSvRWlLOyBcjMFLfekALkXPIs=;
        b=IEyTMbbMYMjVxLxZ9PFf2XEfsGhAA0aYjR+c5xHPof0jNK0c9de4MIwQUO2+NBNpLn
         //+3BYS30Z1YEkiGza5699yBmgr2T+lADInfHjSrV8TyJ7M8dWjCqfDoqQBWMvRLg63y
         DfrMrHBxAUdRYb+bLc0ixh1t6tgHaurtQ9+F+ytlxLsiZEHXFRgeKSfq3Qi3BFs0iDZa
         5CHIpzlDuv+v6lQHURKNRL55wmZBSgR6mJVbqIUH6LMa6Vxj0HEm6jHhDkgtSmGS/VZz
         Uqk5HuONRnMm4xnGMM/pBOKVUDo0imXHKRHWKknKTGTep8XnGvsOq8lFV2uzVtzkozv5
         uc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722452435; x=1723057235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhBhpwLr2HpmurRTx9ZSvRWlLOyBcjMFLfekALkXPIs=;
        b=ijVJSXXBZRRp/VnEhHFwm/dXCJADZUjaRXOSqcFzgAQXteSswrz3f/ayd2QmSrf5dy
         TuIyznPJ5NfY0GuyK+BBUkflUWq8gowjyl5e8uTh8o9GSe85T5vbI+KKVHgRTLNW4H3I
         jWmjNLqKclaWAdlsyGQ03KY/zuellsc0jtdLZ/JDr52TuVakg+wdRNuhrEG+6+T9CpId
         IuJspDPumLLvDlm9MB0fnJEhpYwEMWn7eAwwAYG7jvfN77u53xvX1/QjekZDR47Sd8l/
         xMD9nlKD3L9vwRDQ8fq5YRwzpCG7uT1oIKs3qMMjQkYPk72UIQVeVluVt+M+JxJTErsp
         NagQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+MZvpBnlzTWLD55Qaszp/bzCMu6vJgjtR3tvMpYaaG8IzUXgPH/UACY8M9HRV/sJ8HZnpLrv8MrFWgcs8ma0qJp2cYIaI1EeQojgPKwYndedVqivHjgu9CQvnI5XaUdJF1TmenNEHAuY=
X-Gm-Message-State: AOJu0YzlILAuR/brdgdPrlms7KP8j17nTCvl5px0aGnmyt60YDSKZTdH
	zTq0/CpHjTYP64LMxFGmSBATjei2cljJfGJJjd9jrB3ae4OQn1Nz
X-Google-Smtp-Source: AGHT+IH8paNnuD4C76PDoddZdjgnSFW/JdZaJ4AqmIjT/T8p0H6d5BZrgkicVB32ZNtYCfZSmhnK3Q==
X-Received: by 2002:a17:902:e547:b0:1fc:2b3b:1482 with SMTP id d9443c01a7336-1ff4ce587c8mr3297435ad.12.1722452434468;
        Wed, 31 Jul 2024 12:00:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7cb0370sm123650325ad.65.2024.07.31.12.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:00:34 -0700 (PDT)
Date: Wed, 31 Jul 2024 12:00:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v3 2/2] Input: ilitek_ts_i2c - add report id message
 validation
Message-ID: <ZqqJz4Jw8dU7uA7a@google.com>
References: <20231222183114.30775-1-francesco@dolcini.it>
 <20231222183114.30775-3-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222183114.30775-3-francesco@dolcini.it>

On Fri, Dec 22, 2023 at 07:31:14PM +0100, Francesco Dolcini wrote:
> From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> 
> Ilitek touch IC driver answer to plain i2c read request, after it has
> generated an interrupt request, with a report id message starting
> with an identifier and a series of points.
> If a request is sent unsolicited by an interrupt request the answer
> do not contain this identifier.
> Add a test to discard these messages, making the driver robust to
> spurious interrupt requests.
> 
> Fixes: 42370681bd46 ("Input: Add support for ILITEK Lego Series")
> Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v3: added reviewed by
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 250133f0d68f..557362490244 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -37,6 +37,8 @@
>  #define ILITEK_TP_CMD_GET_MCU_VER			0x61
>  #define ILITEK_TP_CMD_GET_IC_MODE			0xC0
>  
> +#define ILITEK_TP_I2C_REPORT_ID				0x48
> +
>  #define REPORT_COUNT_ADDRESS				61
>  #define ILITEK_SUPPORT_MAX_POINT			40
>  
> @@ -163,6 +165,11 @@ static int ilitek_process_and_report_v6(struct ilitek_ts_data *ts)
>  		goto err_sync_frame;
>  	}
>  
> +	if (buf[0] != ILITEK_TP_I2C_REPORT_ID) {
> +		dev_err(dev, "get touch info failed. Wrong id: 0x%02X\n", buf[0]);
> +		goto err_sync_frame;

Please rebase and use direct return once you fix the previous patch.

Thanks.

-- 
Dmitry

