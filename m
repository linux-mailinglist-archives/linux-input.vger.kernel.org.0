Return-Path: <linux-input+bounces-5017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18319930249
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 01:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3C691F23052
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 23:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1AD12FF6E;
	Fri, 12 Jul 2024 23:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEKnA22W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC7F20B20;
	Fri, 12 Jul 2024 23:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720825474; cv=none; b=akpp/45W2qsIbgks+nS9NZjxxtk+0qY/sPB5tuV7v36ZYtruQDt7Ue/mqon4DHvLYBa2WgQAQoLns0sm5YE/fB/7ciNh7Qa06zxCYACFHjpSrK5P3ueN7SUebnrJEDt83hAMN7FFeMC6LcersPlcKZahHwlXSnBVngkR7TqMH+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720825474; c=relaxed/simple;
	bh=4tRm09TPXpCEyy3LvCmgwHvnRENscf9x+aOAnSlP5h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDBWWQ/VxDmHUsyAyWznEbfioNCKcdYJXTkbPqMrxJeq/9h3mHj2fWQVc6cSorKPFFbAUFFscR8DZ+MvsC2WzNcbxZ3/MjYa0gPKEgKmmpB01UaW9n6ulZXpkhWFFsDWZV8D9i09zJz+Bckoilg8RCSog4MMsWSIe40Jd8xa7/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEKnA22W; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb0d88fdc8so16650705ad.2;
        Fri, 12 Jul 2024 16:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720825472; x=1721430272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6PkwLVXmjDu8JCo3lFiQsP3XB0Gj7L4wUEjZB1YeKs=;
        b=cEKnA22WASb/F0bK6QjVgNgmSfgZKPWOcFZhQMadcVlExk34Tv+auiGIWPgYb3AOOF
         F2CjPWK98y5AFDpcQulv9vL+GDBYW0lFn7ad9mEtG0lLo7rlodQWT0R6HCrQ8oO7/AKV
         dvo24K4+XzVWDz0Qi1jFmR0NyfBmPSScX/QSmuJDqNZrwl2gkbVMJOcmqTecjAEhxP24
         Msl9aefFrO1cLVVVqc+VPeJG+BvVsfL0UUn+c79IVLEyO5xp/lv++oeXuHgm2GOkqxuW
         5aVgGJlSKsc6UxV74lyRFftVfe/m0i/M+14B6aPpcJ5y78DuU2n8WC/6H9h5bU/A3JMa
         dJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720825472; x=1721430272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6PkwLVXmjDu8JCo3lFiQsP3XB0Gj7L4wUEjZB1YeKs=;
        b=OEYthYzU/BtVtNm0wS8xB1Wrpc0wA6Zp1JfoUn9e+uaHi8/aSe8uP30LTkZzTIVHhB
         e6vaWo2G0MU57cq1uNbfOWH2DE1P8qTpSN8dE9x6X3iFMYKq9TBPsrs8/329eu6X7Ss4
         AZWZvT2MK8XRjJRVl4OCNKU7qLKsdfP/SY5qd+MFKY4KOcS6RWJq+1GdGLnnSruKW2p+
         P7Sa0UkKT4Bsft8Kc+ZNBdp2HYH/DSV1QFKIpUXnLWW/qVuzFoGTg11RGt5nDKK3Ef+T
         VtEv985fj15y4yHoQ5XAe+t6DwhXh3StfNyvPhYFDdPTLjiUavm/7onVQIW4hnCC8+FK
         MurQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZqh1H+npoGJR0rqpWcmbowQbj3ycCj9ZXBUD8NsF/DiB1BPjqLOnRQzpzUUwadw42O5YRZyc4OrkHVEaqHnMhiS9dj9pMCnQyOFrIb72R8olkSinaumX2Vu/nNa9iWdViFszCo6isgUs=
X-Gm-Message-State: AOJu0Yzv1FRJ/GH+b5xdlcmvy+Gv6vk5c31xuOhD6yMUq2iNDmpzgPDH
	POrResxaOxfzpsW9nSV4pw4iRmRciBezYX4xRTSgGGmzmYS/sqzZ
X-Google-Smtp-Source: AGHT+IH6LwHfJ9xNahECYgGCkYn+Fym6L86i+95zmDKv3irVaet+zCM7AP+TDWGT6r30YuMn2QY4zg==
X-Received: by 2002:a17:902:e5cd:b0:1fb:6794:b474 with SMTP id d9443c01a7336-1fbb6edfa99mr112486295ad.60.1720825471793;
        Fri, 12 Jul 2024 16:04:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2bbd2sm74117565ad.90.2024.07.12.16.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 16:04:31 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:04:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpG2fNQ9-inLN8-Q@google.com>
References: <20240712224352.82190-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240712224352.82190-1-Frank.Li@nxp.com>

Hi Frank,

On Fri, Jul 12, 2024 at 06:43:51PM -0400, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Report input event directly on wakeup to ensure no press event is missed
> when resuming from suspend.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> index 1d99206dd3a8b..9675717ecbdfe 100644
> --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
>  	int irq;
>  	int keycode;
>  	int keystate;  /* 1:pressed */
> +	bool suspended;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
>  };
> @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +	struct input_dev *input = bbnsm->input;
>  	u32 event;
>  
>  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> @@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  	mod_timer(&bbnsm->check_timer,
>  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
>  
> +	/*
> +	 * Directly report key event after resume to make sure key press
> +	 * event is never missed.
> +	 */

How do you know that wakeup was caused by the key press on this device?
As far as I can see the driver requests the interrupt as shared, so we
could end up in bbnsm_pwrkey_interrupt() even if button was not pressed.

Thanks.

-- 
Dmitry

