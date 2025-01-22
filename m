Return-Path: <linux-input+bounces-9479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1895A1988F
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 19:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F06847A26F7
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2025 18:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD3C215057;
	Wed, 22 Jan 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMZ1htTM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5C3215171;
	Wed, 22 Jan 2025 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737571042; cv=none; b=WZW8z3MKGsWrJtpDA7A2cQEYudUg7NbMwhPgSC8djppTUQJd1527i7NiwyjsNfsOOebKzQk0y0xLga4CQfHeaLoshX9OCyQ+hMjIkm253j7Cx8Fp0If4ifelOq09uxE2bwe6o7GhIlLUcYyzqC56Za3OyyahbWkrVxHlwgOoaLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737571042; c=relaxed/simple;
	bh=PkKc2FekKHtrYk/ahKCQ0RU+13P78H2J9KLrj2XpF0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkaVd9B8cAUcyc22RZlM0x5jkAka983gV1ddGv59mp90UJqUNqFMfo7Stv3ORGYSr2SSsdzv6HKrpAJ7tlRXKNs6fgcsytG3mrNicq6jsDHwD62nQeCUxWx5PSUwtdYr02QXm+YO0RU3HGuHldRD2D2J31Stcss7Q8TUrlZvEgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMZ1htTM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso2063763a91.1;
        Wed, 22 Jan 2025 10:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737571040; x=1738175840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ewQpNsUmSQyTvxQK3I0XkA8N3pmyVpLTs39gHbtrNZ4=;
        b=bMZ1htTM/bY5v6F/Cp2xUOTiuGiAqFOLL3wcCGuU9ATsz3Hr+h99zEF7/ZMCV5eKES
         5NV7F9RsQKSRrrcRdPcecjKsY0LwstZuaRsRqpMESvqgLb/Avb80BXJQtRlkkt+L5hMM
         3ZJ+cS8AIk03sZPgTQxBqWUlK57y2boV2IWCXpRf7paACWKRMD+HssJgzDCHCdMS8bjI
         Y7GQlRxuBCuDdMKfsgmm0IjaFcKQLdKc0FqLb80T6dx33gqQivffSAaJxoxS/MDmsC2V
         COqnraZtqDz+dLeOR4O4kcUbkYQOKrgtVw5veN15DCjtWX4a6m36oD52pzX6Vk3hIk8l
         KeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737571040; x=1738175840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewQpNsUmSQyTvxQK3I0XkA8N3pmyVpLTs39gHbtrNZ4=;
        b=rMvOSPiHirulskm5fzJajTsPkah7eIF8p4j3QcCcixI//8jSwGS3kS06+DXx8iSvA0
         QNn3utsXwDEo8uBqTBPuNqcu2dcCvO/GwJJfm1s5BGwHr/1VQFB+6elOGg72TPHd4EY+
         W5K4k/A0mTvISvG7EN+/8PWYpmTDaCTpEDK+8/FcvOj2BX4qE+P39U1CjRWdd8lT7Tb+
         ITORgdSSmtaiLDyVaUBQ+jL0GK/nwI9rhFWNlObGwZbRhkcTs1iSGExaYU7D6bl80TDA
         L34AvRenRUWeAxE2qaaI6CK0+Bh2kNduHXFiXsGQpKxJlu3X4yv9d9GnsxOGAF9Qe36Q
         rKRw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCUBeBxG98OOdcFgcoCb9BNNZ3UqxJBTs8p+D8ZnEjDA7WkzKsdJKHcRT520kKUYRXLb4HS3ZBuSkjXrn@vger.kernel.org, AJvYcCUxrO8Gcwcdruqldn6r4VKDyqiN046GMSJznFEYTVJB8O06BWFEqOTEMurgAM9HToZYlXmBWiUuY673/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQtGpifpNbzOmlcNVBtssX/Jxla+do5GYqVfj9p+Z1flRbZS5K
	gfgmsji8GMG08fGausgJ71ikVD+zThOAdZoUyPAswvOAzYdYq9BVtVsAyg==
X-Gm-Gg: ASbGncsXkob7zJ9zxEidRCIaPwQXKS8vUF8DM/JL1F+5YtP20EMl4lsbJbpBwQQBF/3
	DfD3KCMJfDYLmidpA4J/KTmBL34pII3M6r8jR0rv/4paDgI0jKQLyAvZoycHnss1IwB9XUrZxpo
	WTmfkqV5NYV+/fU2jYuCymU6MGbkNHMMHXEoY4PyL+wR5Txe/oj3OxxwTu7avEoZDxZw8qjfjkB
	ra7KyUGYTqKY4XSkFa41G0OUQNl8U6IoQT23sJP3S/UARAXZHi5QLdtp5s8K7MdjTE3DQ==
X-Google-Smtp-Source: AGHT+IF9WOhbTeFTKtLXUAsreSPBxEqvr4Pa0lYN53i2PME6jX+zdFBHY4mlsykQ3mKVoL6DC1ZxZw==
X-Received: by 2002:a05:6a00:9159:b0:725:4915:c10 with SMTP id d2e1a72fcca58-72f7d2ad1f6mr516820b3a.10.1737571039795;
        Wed, 22 Jan 2025 10:37:19 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:824e:c27f:8742:e4e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f2a44sm11427707b3a.36.2025.01.22.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 10:37:19 -0800 (PST)
Date: Wed, 22 Jan 2025 10:37:17 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dmitry Mastykin <mastichi@gmail.com>
Cc: job@noorman.info, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, felix@kaechele.ca
Subject: Re: [PATCH] Input: himax_hx83112b - fix event stack size to clear
 irq correctly
Message-ID: <Z5E63X6qnpIEvWji@google.com>
References: <20250122121409.1374602-1-mastichi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122121409.1374602-1-mastichi@gmail.com>

Hi Dmitry,

On Wed, Jan 22, 2025 at 03:14:09PM +0300, Dmitry Mastykin wrote:
> The datasheet suggests that the size of the event stack is 32 x 32-bit.
> Reading less bytes did not clear the interrupt output. Extra interrupts
> were called with zero himax_event_get_num_points() result.
> Only every second call to himax_handle_input() cleared the interrupt
> output.
> 
> Tested on: HX83102J
> 
> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
> ---
>  drivers/input/touchscreen/himax_hx83112b.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
> index 31f18860dbd3..fe7bdf8cec50 100644
> --- a/drivers/input/touchscreen/himax_hx83112b.c
> +++ b/drivers/input/touchscreen/himax_hx83112b.c
> @@ -24,6 +24,7 @@
>  #include <linux/regmap.h>
>  
>  #define HIMAX_MAX_POINTS		10
> +#define HIMAX_EVENT_STACK_SIZE		128
>  
>  #define HIMAX_AHB_ADDR_BYTE_0			0x00
>  #define HIMAX_AHB_ADDR_RDATA_BYTE_0		0x08
> @@ -292,9 +293,9 @@ static int hx83100a_read_events(struct himax_ts_data *ts,
>  static int himax_handle_input(struct himax_ts_data *ts)
>  {
>  	int error;
> -	struct himax_event event;
> +	u8 event[HIMAX_EVENT_STACK_SIZE];

If you need this it should go into struct himax_event (wither padding or
making it a union).

Also if this change is needed to make HX83102J operate properly it
should be rolled into the previous patch adding compatibles to the
driver.

Thanks.

-- 
Dmitry

