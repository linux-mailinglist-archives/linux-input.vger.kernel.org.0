Return-Path: <linux-input+bounces-3021-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 402DC8A4F70
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 715FE1C2126F
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1BAD6FE23;
	Mon, 15 Apr 2024 12:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zMhMOAIR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9A66FE3D
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185258; cv=none; b=sj9nPKZDlspITO7p6XXxlxDPRx5HyqU3gui8NBOd2IsFjl17QKGOOckbZF6D/ytidoAOXQYKFaOlyidlTFS6eFyMLreT2W67XMv75mu8EW8N444f9CAjAlmkysVtA/scKlyXq1WAaMi51gNa+leJcrtW1ZXa92uX7o9dyN0HkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185258; c=relaxed/simple;
	bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdjGGXoLQcBIOZy6RzD3fBaOADAsRMR0urvfjbS/GGKG46LtYOAN5BNiSjjI8HWALr4vyvQZCkK37q+jkhQrse9ny9stjW3N2KL9PBMN8e2ExewNB6VqX0RNnej/Lphtc/ZNmlcyXGYQMfbJvYhGfQFryIpRSsRqCJlUDkSyw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zMhMOAIR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4155819f710so21238925e9.2
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185255; x=1713790055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=zMhMOAIR2xHVidy3q7bh2Eg1kxU1D5a/eh4LmM+imz0betaRFq0zd7DvVp3BC46NKp
         dusdIc69deorbnMnYI74A3rSI69fxUkyQwD90y+M13gq8mDeCC+4w970wQuaUZHBrPZd
         ChuyElUAjMf9qOm2cj98/TSvbazx/qcsJMJsFCrXvXnFCHOHqD8jx9UEXDGdFug7f/zY
         7259diEnulw9wGo0cRY39nrjhoreVc4yxe1g6WL9YoSjcE5ykGjNVRtbHYtE0sJBeZB9
         gm3IibcmR2mzEFtFmeBju9ki1ZHIMdxl7BCt/9OGshcmeEOYxozmJCOdypjDrFRR50p8
         8uCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185255; x=1713790055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=AjY8Yx0/tazC9FiIJk/UOSZ6S2fPc/nuFl9N2sB89PV/y4D4xWf1JrLHZe5OeBqqc/
         BNBqDIFETBG1WaQQidbVBhfrJbRbXsD3uZ23mI6Ef7aDwfhAL+Hp0nD6dZwQQN9/lJul
         tD7RZ4CfAlWW9b1RyNL1P9ZErGA2bYur92fByp/LZ/Mmzs9CnNS0IGT1F2HElNjFOW1A
         kKqGKnm/Lt4LKros3tHNiNza2Xao8n4I5BXCbrUClpzjuEmvqLKkVna+0OGCn8F1xZlw
         Gm5zi5ZTOW78/tPLCpd14Czm8hLW9r93hxeYJ2J4cMI/aH7rm44wLgGdGMAxJLhGb09L
         o3eA==
X-Forwarded-Encrypted: i=1; AJvYcCWr4Pi6Q2NNvdvZItQfFFcd1tHGtG2oIyJWGFy+TEnG/C6eDZM2Nvcq/Nf6eSJIIpkYmCQkqqcC4wlzD1aTvM+WS8cK7j0lwTKm7LE=
X-Gm-Message-State: AOJu0YxSdkrELkAQtEJpbpxCvVaYBceTXWYyjSlD8GnMykyAvy9aNXkS
	bMC/lSRYvahJ9hhDlA03Ew68M00QmE+bRnepcP1yCqledX3gW/z0V14A6juw+kc=
X-Google-Smtp-Source: AGHT+IFkh12z6YoZcRxE26DaCtpPtJRpH8bNSc6xGkmU2C8eUzmYQG+zsWzJQF76MdI0E3ybiY+H/A==
X-Received: by 2002:a05:600c:4e8b:b0:416:3f85:d49 with SMTP id f11-20020a05600c4e8b00b004163f850d49mr7937971wmq.18.1713185255476;
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b004165315d885sm19315874wms.11.2024.04.15.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:47:33 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 02/18] backlight: ams369fg06: Constify lcd_ops
Message-ID: <20240415124733.GB222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:00PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

