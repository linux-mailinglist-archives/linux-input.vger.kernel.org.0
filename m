Return-Path: <linux-input+bounces-12047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DB1A9F615
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 18:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AC9C3B9778
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 16:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6718127991F;
	Mon, 28 Apr 2025 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iy4patw7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49FC2746A;
	Mon, 28 Apr 2025 16:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858719; cv=none; b=t8xa8ToxiTn7z+7Trh4bY7WK20j5Ub0hXZaMuGEd+FMy5XpOHEV2xS4j9fxMGmYuS39nENa3XB7cS1QUyOjqLxQW0mrM5cH4pCfXNqyYTOevOubvOCZuyl6LS94IkR8TZUFJ+hQNOAQknouimwoWh7DDeisxDsAbRFU7m+lj7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858719; c=relaxed/simple;
	bh=pRGwPFEAWIrYrx3rF28Rjy8j+TMBsp57mP4dErQkFG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spL6fE0FjqAFU7Ve5yY5X8tN57464MwhOzkqp3thuzKXEmcplIyxlVyMVg7RXKNbz6nnjm+ZugswrSLpuKJmSsoFNvDxd9tqCNj//gpqIamc9OkBW3IyXm4v96oiofR+SKe+PJiLm8VVCCacqmGHINn99OjlN0pAXAUie+9MG6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iy4patw7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff64550991so4068085a91.0;
        Mon, 28 Apr 2025 09:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858714; x=1746463514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=100mav8cLVh8sEyh+q20/18XyOKjalTweW1M9rvxby8=;
        b=Iy4patw7WhKP56+CAojD5P6N1NMTOEZV414GcILo7ZW3eSZdhyTjG9Nr36+xPc2NUo
         pmnz62mJ+LzypqwhDZ+L0frmUPQH2k1CEzy6JaGP07WLuyv4F8sB9Tf17ubqvtrMWZ6J
         SmQhyNMkVdd85B5/xS8V2wVpxGtDybOzNpZYqLV7+iWSoRVJgSunMooYpTweUGKIFrtU
         vnyuiUjs5NvjguRMm7fpkYSVUR0g2vcMj93Q7YYr4VWdKW8N4iRmsUPMUeKhxWYm6Mvc
         oSamAkEvoenmY+Ikq4kEBthKLcHLP8uv5VitqaA6CgIPMMwc/Ls13YOuAjngXZN/mRQY
         Y6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858714; x=1746463514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=100mav8cLVh8sEyh+q20/18XyOKjalTweW1M9rvxby8=;
        b=fskIRL/dMU4kdtrA0cVS4UGBjNyyuDzAsgMbFOTvWK0EwRoQ05o48KGKi0KMIf6c5q
         xPf3jLAcsh/mSvIlvf7ocCu3Cb7zFXhskaiK5eEfwvOdci7pflc+6ZBVoJd8ESGbjBdr
         b/c+HHj4RN/ibkBN8E9FU6o+1emyRtcjaae5sK4rQvPeXWYzp81QzxsUWZB8iOhme52m
         hQI1GEfe/DagJ3WeXeM8Bmg1TDUY36tV3u4v2Mw8g2NIrw+bkxS5PMHxJx0e8TvBFpuL
         1noqHaLlkVLDxFK/NtBT1t+OLlhTzs2b6oYaoZBiM5ctYu61hRi8tmGknIt4lUvG/Ldp
         PJVA==
X-Forwarded-Encrypted: i=1; AJvYcCVd3CRZAqEUsgiesnwcFWNAFw6hNVg06y7PtgJjr0npIHRmRGWXkG9JEHem/PaJPNTPgrJnI74C23vbGQ==@vger.kernel.org, AJvYcCXfBE1/niLvM+FXjeIa1fwgRDMIhbawscnh+Lm3J3fRCh3ijlgCtY+1RZCAhaeMpo7P/1S51WsUU4UneCnp@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxNqgkGvm/Z+MW0o0lL7rxNjgPOYDoUxsvg4KCmPq05iw3Jcs
	fEqkjtbAl4V0e2IFsSj9vWU+CnSzEIQQ7Omkn/z+vkUVOJEnvQnv
X-Gm-Gg: ASbGncsP9t9CjD2UstBgmle/f+shwZgcn17+tKM2IMMrK5JJh30F5ySkh9+cYN4eIS5
	k97WRhijVdGb+Psl1AckwrlpUzbpHHbfFjCBgjYl5e4NlKRPtSm/BvqvtGQrhRjljoZugq3bysA
	cjUGvp4r1uA7YzzCn1pOZ6xd+TrENQstIL2YtvbUXz75NIXGJ4spoPnkrXXRHVdG92+RrkTEj8B
	AGaF5MzIv5yIZ0TwBJSQ+xhl9WratPlLBxQRnP68/Pkt/3WVH0TplgZy5rfV2omLXgIGG8xg1rt
	tG1xfx4MdwkhAuy4J0ZMEzr8slqgzGOgUAUIx//m
X-Google-Smtp-Source: AGHT+IEhPQtn36fSr6Pml3/Ja6B3b7RMXZ9J+ywAr9yspIrNpTFtg024sysE7J71ueNpeI0QNRZttA==
X-Received: by 2002:a17:90b:4c04:b0:305:5f28:2d5c with SMTP id 98e67ed59e1d1-30a2155d222mr791597a91.15.1745858713647;
        Mon, 28 Apr 2025 09:45:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef146f92sm9243672a91.40.2025.04.28.09.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:45:13 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:45:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: rydberg@bitmath.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: MT - add input sync to refresh touch points after
 screen locked
Message-ID: <3c3bry7uq4njh7bzldjiabf46u3dupzc4odispwrlpmhilj4cr@kieoev2hjkac>
References: <20250427021203.1888063-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427021203.1888063-1-aichao@kylinos.cn>

Hi,

On Sun, Apr 27, 2025 at 10:12:03AM +0800, Ai Chao wrote:
> If the touchscreen support ten-figers press it to lock touchscreen. When
> the touchscreen is locked, the ABS_MT_TRACKING_ID event remains
> buffered. We need to used input-sync to refresh the event buffer.

I am sorry but I do not follow what you are trying to say. However I can
tell for sure that issuing "sync" each time a finger is lifted off the
touchpad or touchscreen is not the right thing to do and will interfere
with frame handling and dropping unused contacts that is employed by
many drivers. Drivers should issue "sync" when they are done reporting
device state.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  drivers/input/input-mt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
> index 337006dd9dcf..659d752ca830 100644
> --- a/drivers/input/input-mt.c
> +++ b/drivers/input/input-mt.c
> @@ -147,6 +147,7 @@ bool input_mt_report_slot_state(struct input_dev *dev,
>  
>  	if (!active) {
>  		input_event(dev, EV_ABS, ABS_MT_TRACKING_ID, -1);
> +		input_sync(dev);
>  		return false;
>  	}
>  

Thanks.

-- 
Dmitry

