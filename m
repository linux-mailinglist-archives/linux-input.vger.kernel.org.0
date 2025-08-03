Return-Path: <linux-input+bounces-13768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E89AB19409
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 14:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2FB83B9072
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 12:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A348223DDA;
	Sun,  3 Aug 2025 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKCR2EbD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF29221280
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754223746; cv=none; b=gxtSIcPePAExkXMFLxsGHltzynsx7QYskZrc62q7kTyfiyGCcxQts3x3Yi2jWMIOyZQ8b/P8eGJV4LIn47gHY78EBJlS/kRcWIUesGnASd1nONGCTNzDi6dmOgiSDW7mPvx1O43c6IPM+cUTFnX9qdH4cJGeIluEq2ton95e8jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754223746; c=relaxed/simple;
	bh=KjCH1Rw8+FTGgbJyQOWlvbGUa6u/JLfA53yKuicMt80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e42ZR9Z7ja7QURn8YG+Z4IvSakaqgBCxBMHg6kHXJFpxnlt+jbfpJVcfNIzFm2doHuHxG8Ihp2prybmpX6NYjb4ZSirjoBpmnMkDQRxKe8JH7dYr+h/c02c1k1LOYkMKLZouL5pT+yMDSy1p9ycCXzLH4Jk0MUAQkLDQ2J4jwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKCR2EbD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2401248e4aaso45368275ad.0
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754223744; x=1754828544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=32Wlon19FkuSOIQyXEWQx5ts4XK/HRWCbcLAdJDYMI0=;
        b=FKCR2EbD4fX0x7SpbUcvEanNWDrJ3ts5muqIBGQLd8mKxQoun1lJA+ggLNJgSbN7jC
         9TEQOTLI7GEyG0kdncT7UeO51xpB9LVvD93eloZ5NlGjFoJg/cYmgOwBkS1oiCpz5mo/
         n9o0w+ZyA+OT9uBjTUcP/rByfMg5ZTHoJZo9JyYI6nUMHiVTlCtwmN0ICl0QpVcaDBOL
         JzK5w1JWOjKK/HszsRiLnvgE4E0CrZwRjNE5cEf5kT5VMlUr0i/iZln032sDjVjAiNaf
         VWa7b7hlEaDpu7WD9YjdCvjgW6Gy6MkkqShWafRqvyA4gjy1KhRZiTfYHB5QcKhgHORr
         Znrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754223744; x=1754828544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32Wlon19FkuSOIQyXEWQx5ts4XK/HRWCbcLAdJDYMI0=;
        b=A3Qc6b3ajk6f2D4RXM+OeSWOYPJ4K/TTx5YM+v6dVdyHL8bvx2UO6xXDcxPbfgAihR
         SkcyWHZnT95Xn/dNFg+kJsk+/9cNYWhEASoSMKB/iupuXp/gBoqB7yghCsV2F5wuCHkv
         jlGA5rK/cXU83i19LdpC4XrTd8US0Pq63ZwqGwQrBkyyl0tHXLVPFFtruvVtWlKWWBtW
         qIzPpP2qamvfs32JblpOkKaP/aEkRIgJzawspMOku/Xw0vDAZ6wFRMBMizM2WbDXXjaI
         VPXIc1o5wGn25XPQdB/yUpHUsYvEYqroWu9pjoa3jW4bXQfYp+IMnNwEprg+K4qEdwDF
         37Mw==
X-Gm-Message-State: AOJu0YwD4xQk0N/xjmerI+NGPZCf2dX8D29IL9k/ASqJXE+z/rO/biI4
	Xb87OStBkd/3XiApcB2B0teNpGL9UTjh236bf1yFFbZ9a8DeLacAAww7
X-Gm-Gg: ASbGncvA0GKWiulJszpBUtie1NRc691WJ79qGQBjlCsoag5eYNor+OQRXgUogr2UoQW
	dR/sNHMZTbziMMBZ6r/OKYkOveklzRUbmQWMcrQpk46GRHXhM3Xf1/HxDqYeuLsGSmX6TLtPdeS
	xlMWg4EB84BLP0URhLyuX6bhifK2XPVuvG1++sNuGJoS5t2QqniDdUGj161dU8LXPzZl6p2JGT7
	tsIX/KYltHJuenPPwTZ3NNkXEPEoMmogvH4bxNsqJ6NrQBlNtljefcWh18Ag3AdjtC9vOjkwfRz
	0URlSH4TzN7AmGKIvu39bFdryt+nakqTdCcrYbrbye8ILBa+TjUmUr9gYx7tECXvtQ0BAID1ubL
	Y7s5DZe2xGCfppytkrvRPhoBH7TZFgxCybtmfcaOVccs03YMkZH4ptWaQm2VFiEMUOPZDxA==
X-Google-Smtp-Source: AGHT+IEGqCELu0ZQtGw5SwZpVAotNU9y35NN+YHswaN+jOCGKul++afE7WryElZ1g+JPZPynPFqjvQ==
X-Received: by 2002:a17:902:c408:b0:240:38f8:ed05 with SMTP id d9443c01a7336-2424701d6ebmr84404105ad.36.1754223744269;
        Sun, 03 Aug 2025 05:22:24 -0700 (PDT)
Received: from ?IPV6:2804:d51:499a:5102:eba:f73:4340:53c7? ([2804:d51:499a:5102:eba:f73:4340:53c7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef7d96sm86067015ad.18.2025.08.03.05.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 05:22:23 -0700 (PDT)
Message-ID: <2e1b645c-8374-42e4-94ae-826abb4fb138@gmail.com>
Date: Sun, 3 Aug 2025 09:22:20 -0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add keycode for performance mode keys
Content-Language: en-US
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org
References: <20250509193708.2190586-1-marcoshalano@gmail.com>
From: Marcos Alano <marcoshalano@gmail.com>
In-Reply-To: <20250509193708.2190586-1-marcoshalano@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

@Dmitry,

Could you check this patch, please?

Thanks,


On 09/05/2025 16:37, Marcos Alano wrote:
> Alienware calls this key "Performance Boost". Dell calls it "G-Mode".
> 
> The goal is to have a specific keycode to detect when this key is
> pressed, so userspace can act upon it and do what have to do, usually
> starting the power profile for performance.
> 
> Signed-off-by: Marcos Alano <marcoshalano@gmail.com>
> ---
>   include/uapi/linux/input-event-codes.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 5a199f3d4a26..f410394cd769 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -765,6 +765,11 @@
>   #define KEY_KBD_LCD_MENU4		0x2bb
>   #define KEY_KBD_LCD_MENU5		0x2bc
>   
> +/* Performance Boost key (Alienware)
> + * G-Mode key (Dell)
> + */
> +#define KEY_PERFORMANCE                 0x2bd
> +
>   #define BTN_TRIGGER_HAPPY		0x2c0
>   #define BTN_TRIGGER_HAPPY1		0x2c0
>   #define BTN_TRIGGER_HAPPY2		0x2c1

-- 
Marcos Alano


