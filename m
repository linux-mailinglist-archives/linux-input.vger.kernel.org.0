Return-Path: <linux-input+bounces-6038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD896742E
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 04:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FAA61F21D3C
	for <lists+linux-input@lfdr.de>; Sun,  1 Sep 2024 02:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EFFA94B;
	Sun,  1 Sep 2024 02:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJA/QVWN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBAA3C2F
	for <linux-input@vger.kernel.org>; Sun,  1 Sep 2024 02:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725156428; cv=none; b=l7nTdQ4TbBrHQjVz2aj2Ots+noRqsGUF01PwYKKbvCaQcl47WSiIMBHVmrnpBescMCxHdokLFqUNpDcldKxZVxyj3Z1jYwPngGw2mv77LhZPgcqHupNtzJt0NNTQgEAA0jn1wZNxsjwXQbpWLXxtD6D+xRcYkBJOR9Dw9YrNbfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725156428; c=relaxed/simple;
	bh=tkU4OQ7bLQIFdRsCMtOQyOu8Eqd+7ULq7FT0k2WBqnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oym8xRnPI/UYmIfR1KPpNG6EBRkZkyZk1MAQb4SlpHkixcYHI6kRvJXYIOHnUNMDia57EMCUtkyRWz2uCb0+DH84irbZLLawD8VnwcD8IhGjilfTC+TGuQZK4jDtGiZK1wHNrPZjrV725cKJUES8rdps/rD3YfzfvIUDT5/psN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJA/QVWN; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70f6cb5518aso1106021a34.1
        for <linux-input@vger.kernel.org>; Sat, 31 Aug 2024 19:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725156425; x=1725761225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1rDtG7EVGcuM1aHU9C7eVlojpsO7eP5cMMQ62ELkGeM=;
        b=YJA/QVWN19xLx0mcV4n/kf/DOMPdPA8trQsZAvjeod33ikRJ1v8iGAh+exEa3Ll0Aj
         9icPCaJJKiV4uS982S64pR+wsMuzS1h0UPMdXPykCP3wT8nIhaYJG0bAP9CeEeVt7Tja
         sjKf9885y3N6a0RUEtnN4D6zB7aTzwmH3KBxkK9XOgi0wSsH4Fs5IHsKgww/yJX8sAlH
         fp6zTBtreaGBMrEacIo6YHCcnLmuJ0eR2MXbN0mXLlft86FGhWwHsIwUtZwyaqJ9J7uo
         HIJATSSTl8HfgP33BSaOO+4xrSrOXtVX9DnpsVdKS7XFdGaFc8xluaOo5rYirdQQdQ22
         ZP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725156425; x=1725761225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rDtG7EVGcuM1aHU9C7eVlojpsO7eP5cMMQ62ELkGeM=;
        b=UCsrsjgAmJqCVVgbHz8oFDAyPRLi6ErPyZD3CKm7g17m6n4TGTQIgjH/8w8nb5c7hF
         YEB+hlQn9IjTqVEqfDrRPyu5A9sGA9WoLPw+K3hWnJWthRSPAnBwK63vKc7o4T5IDGXK
         C4oLn96NnPq9qq5FYj38FVzSjz4o3nO181LEMgzdCp/xZWuiwHHa5ukwxqCvsbrn6YFx
         Aai1k/NGc/iX9rbLoO4Q3MJrEyhx0vtfgP1aKH1pGfKX/1EV8XcM+2rTh80p55qFf6Yc
         /WHY39Y39b0/c62pzUKDP9QTCvj1LLqlXO1riBegC729kqu/aFukhScZBnRpGE62kqXI
         VxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKakUU91uBPBsQpPcjonb0nQ+DlSfZi9S0grhe3JRkZ/3779sx+8ADr4KKU78nj5/6bo60IRoqv3pk+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXISsFpDiVnUPQ7gYiIu4Zb/UXrBXBMIKo/rYes09ZWrLbXmiq
	joT2epfNcv3EmTWvtxaNi796VUjFduB7PrMFOiXp1FCmKpvlvi2h
X-Google-Smtp-Source: AGHT+IEc0XZjqDdRcKyuJ49VQFju4z3qlbDF8gmZiYocuuu/flSfbEbhQnnCeNAf+4N2MM+Sxfj0lw==
X-Received: by 2002:a05:6830:3908:b0:704:45b5:6464 with SMTP id 46e09a7af769-70f71fc8134mr4149668a34.29.1725156425373;
        Sat, 31 Aug 2024 19:07:05 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1922:345f:3ad8:d306])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e7822dfsm5219931a12.53.2024.08.31.19.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 19:07:04 -0700 (PDT)
Date: Sat, 31 Aug 2024 19:07:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: zinitix - Read and cache device version
 numbers
Message-ID: <ZtPMRlR3X_s2-O9R@google.com>
References: <20240830-zinitix-tk-versions-v2-0-90eae6817eda@linaro.org>
 <20240830-zinitix-tk-versions-v2-1-90eae6817eda@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830-zinitix-tk-versions-v2-1-90eae6817eda@linaro.org>

Hi Linus,

On Fri, Aug 30, 2024 at 04:04:27PM +0200, Linus Walleij wrote:
> The chip hardware revision, firmware version and regdata
> revision is needed to discern because for example touchkeys
> are handled by different registers on different versions of
> the chip. Example output from BT404:
> 
> Zinitix-TS 3-0020: chip revision 4040 firmware version 0088
>   regdata version 0004
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Move read status into the per-device struct.

Thanks for making this change.

> ---
>  drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 1df93c96f6bf..e47e0bff80db 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -150,6 +150,10 @@ struct bt541_ts_data {
>  	u32 zinitix_mode;
>  	u32 keycodes[MAX_SUPPORTED_BUTTON_NUM];
>  	int num_keycodes;
> +	bool read_versioninfo;

I renamed this to "have_versioninfo" and applied.

Thanks.

-- 
Dmitry

