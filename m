Return-Path: <linux-input+bounces-7594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0E9A7315
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 21:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C466E1F220AA
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 19:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE9E1C8FB7;
	Mon, 21 Oct 2024 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8Tax/vr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D81EEE0;
	Mon, 21 Oct 2024 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729538374; cv=none; b=d4atyoqa4KI8BQevB9mHkug3VWUXxpcoaU8msolXfE5CmzUo/CtynWBlrmoOBYOeQzmiJTBvhMWHXnqjwUavGeYLLf+UsYATsIZh87Fx5K3eMDusvKeWxbYKdDgYMfXGrKYDxBV+tg89SAXJClK2K7AfQAJvr2Lvhwv4s9whVN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729538374; c=relaxed/simple;
	bh=xyJxs4NLT8NaP7TlTozHXsYl5ZnfdnJftXyFrOr8SsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dpp4A6WFSj7MX47y5W3t/ZgNZWuHfl5hYVD190ttRPL6y/mjIp5tXX7LQlHq7d01yzrKELYX54dUyauJnE+07+uT6EnMsWZLnHkiyKWDohTWxrQRz6cj7+fmfkV2r13QkwlpufDdG+nEbyt5XzYlVTraSSjiLcvIeIrFEqLfHw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8Tax/vr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cbcd71012so43302375ad.3;
        Mon, 21 Oct 2024 12:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729538371; x=1730143171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8STVZnlFNrmdtpautcda4HE5obN66LvYKFM9OyrWkUY=;
        b=N8Tax/vr4MMNkqxJUEMeK+47iQSUbCMRig7Y+vQiqt5dV4vSpLWK3pR5oCDe40UaO3
         aMQwBla3hLO1zfLx6vFONVs2xLjeulzZn7mWHXGFx9AoIdXA5PZLm+5bjtP+ztzWs/oN
         vBZGKhrQ04KLxTseePEVgbmFdsRBRdTdyMG7lsqr/E6qadAO1hRkcz1GSuCz+8tBsfP6
         TCmZKudFOvrP7haoE0sl+mx1Fxa9hB66ZPzpIbJDtnGaYskm9/zRm0w7vc4qESnKVLC/
         C3XLpeYXgSuPe9BIIfAyR11fVq3A+wMtV8xdmcfRMpFdCwYnqXjoDlr62H5zXhIkhXWH
         jQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729538371; x=1730143171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8STVZnlFNrmdtpautcda4HE5obN66LvYKFM9OyrWkUY=;
        b=U9l5A+4NflzPor04eiC4q/gm4PMJyg2/KZhkfeDugRwT2IaIo2Z2yV7CCN+F61l+0Q
         n/L2Y1y+l3ca87SQ+LeddJVR3oLUEhctbIYMExXQCZIR+6ONJseYMV2JthM53hVmLZkD
         4eBfIRQclqgVK4jwc5DMZwi54EtUKT60TywOR8Kmswil5gbWDPLCOdHrJsF2KlRVmyqm
         4ZGwoHZuZgWGfD9IAnmGbZi0CwzMXh2BJh1AAp/xt/JRTL7e5VhS3WZIjUAmwpLQm5uA
         wJYhZ1HqhjPKsblzNBcRRv6YHAYzFWBdn+ZRJ/sC9jjQJXREliqYgGPDUJGLYwo4qtEw
         tyyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGKYmI/OFO/sCl/fblGjJtIEviwfG2/BGbNM4DVVJJSM/IelJl19sLhjkhZYV4V6c1aeWbL5c3hz1kLw==@vger.kernel.org, AJvYcCWal0xqRs3qyyCyrpdlf8rWjffobzDzmfrnyp997FdEE4ACeRC1gAJD9mCdKluO2ecoYpV9no0X+2kCAqjE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1bon7zI53rnAgDgse0TvtrRXVDJZVpJ5xUQ3uqxFQdIks6A4s
	VHVN70VgROYWBz14ioaC8qQH4oaF1KJEj5loUilqoQ3Z1f11piCV
X-Google-Smtp-Source: AGHT+IH52WO15xmHYvhYyY4+EH4EN6lFaf8jH8dwnGs5iK9xPRcYA3Z83CF7ohgW4Ojc9Tt+NYwVnQ==
X-Received: by 2002:a17:902:d50d:b0:20d:1a47:ecd5 with SMTP id d9443c01a7336-20e5a9530camr134001965ad.61.1729538371281;
        Mon, 21 Oct 2024 12:19:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3336:4a8a:d651:58bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eeef550sm29547195ad.57.2024.10.21.12.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 12:19:30 -0700 (PDT)
Date: Mon, 21 Oct 2024 12:19:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: serio_raw - initialize serio_raw_write() the
 return code
Message-ID: <ZxapQMubTgMx9Pgl@google.com>
References: <20241021103839.2828469-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021103839.2828469-1-arnd@kernel.org>

Hi Arnd,

On Mon, Oct 21, 2024 at 10:38:27AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The number of bytes returned from the write function is now
> undefined:
> 
> drivers/input/serio/serio_raw.c:204:12: error: variable 'written' is uninitialized when used here [-Werror,-Wuninitialized]
>   204 |                                 return written ?: -EIO;
>       |                                        ^~~~~~~

Thank you for the patch but I already have one fixing this up queued.

> 
> Fixes: 5b53a9d40c4f ("Input: serio_raw - use guard notation for locks and other resources")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410201730.ItNhUTIv-lkp@intel.com/
> Closes: https://lore.kernel.org/r/202410201759.qnyACw46-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/input/serio/serio_raw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
> index e058fef07f57..55fe77d04089 100644
> --- a/drivers/input/serio/serio_raw.c
> +++ b/drivers/input/serio/serio_raw.c
> @@ -195,6 +195,7 @@ static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
>  		if (count > 32)
>  			count = 32;
>  
> +		written = 0;
>  		while (count--) {
>  			if (get_user(c, buffer++))
>  				return -EFAULT;
> -- 
> 2.39.5
> 

-- 
Dmitry

