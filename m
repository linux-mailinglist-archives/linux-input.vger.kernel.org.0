Return-Path: <linux-input+bounces-3027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 743388A5079
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 15:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312C428673F
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 13:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF0F7F462;
	Mon, 15 Apr 2024 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opsS8fXE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6178C7B
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185544; cv=none; b=NeW+PS1SgNtHID0jNax12HJEW00+Fxqe9/6wBVhDbuYVd6GhXVkjV+l4DAgzr3qWF7fUm/+qQ7Ac7ZiAcciVxfXCWpArA+6h4SNogXX0YWxuw6qC2VDEvoe9DLKMA8TkA+xd9K5FsRkzJhSmRms09SXHJiqgJutEXEsCeh4GPl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185544; c=relaxed/simple;
	bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU4u2jvv+ul+TxJ6zfVBTq3nxrJ9hfSPgS2YPLVa9RVpuBTy0O8ag3zz2COJUWFo2zG/D0JeX0WtQmwZTdQsnsh6HNBwWK/623k7TU2pUHmAFYGPz6S5/Hn8/UxU7fMzYbChUjR7OlDIzFni98YeqSG0bzguSWfAJMmfW3axmJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opsS8fXE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516dc51bb72so3332618e87.1
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185540; x=1713790340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
        b=opsS8fXE7Mt6mCYmxtKo08IBA20GpvaUNxJzYlfQP4nILCcQWHnGldYevDLj3dSHIc
         PSwXlh3PmAioUneC9zhTcpHf82EX6Ad2hOIh6eIJT+JSqM9E5svnGjTIC6GJhZMqAGNf
         qRZNsNgXU1jJXFyE8KCq5SFLRXl48V0WL12J7A6x/qnequNM9UfAFFe9j0t9CImz8qIs
         ybiN0MORO/EPoPjLNvjZynoKb3WtINFT1IvUkctMC5yg953nBcAkr/hO9lSVgDUtioCk
         Pk9rn48yE2LVB7SA4F7H4PQrEuhgEURU8L06kf27ZWYLkhrbL7ocidsE645Ia10ugtz1
         8+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185540; x=1713790340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
        b=ujSsYkNPO+C8LwzYiNh1zgLmgH8kbcfXzidWrzRbl9mhmYkaPKwSzW+zPGRSgsLGBf
         uibl4IWioExdVFKMTaZDCRtkajG2JRfYOAnbpqNPXJOIEQX0DAw+aGlpAZR/2sgKEoC3
         bGWtT7ip1GQ2SSKfO7L4ALqr7ITnKLplpNpSXUnhfqykKaOs2LZwlit3vy5dWVMuqb3w
         PxTbpSHbLMvCcLD8jcxEPllx0LJ5hFgo5i4eLqW5rasDuU6l2HMYUiMB5vsrE7IaVaO0
         PNiEYgjENex8PEgHI6ufVNsdtTbUCyRiHX6F68IgB3FVlTmNIvueLb/N13PTKcEBxt7+
         ylbw==
X-Forwarded-Encrypted: i=1; AJvYcCVbSl1YOd4XeN3I4/p4ha2UuC7URumw52VqcryjZO3r0lGOcpK6v2XZ0TBY8FXfP5mmVU7UnFYx0XrY19dnF/ufka/3WRwgwWuTFsI=
X-Gm-Message-State: AOJu0YxIWds7rc5xpZpdegJn9Ber/jVNRhT2bO6enSW8+uqIYULmWZA0
	hGD1/L6gIs1kJ9DGGbXxk7Mef7IirtxoAoAy5YeT+hdDLo2TJJ4O+iXV1QIoUG4=
X-Google-Smtp-Source: AGHT+IHu5tfg7Nur6nUM4tRHPyjM2leUDl2jKt9o9nLqolr31cl2B0ZsT4h/TE6rznaVk74mXQEafQ==
X-Received: by 2002:a05:651c:1543:b0:2da:901f:6ebd with SMTP id y3-20020a05651c154300b002da901f6ebdmr1300658ljp.41.1713185540482;
        Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c139100b0041496734318sm19430320wmf.24.2024.04.15.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:52:18 +0100
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
Subject: Re: [PATCH 07/18] backlight: jornada720_lcd: Constify lcd_ops
Message-ID: <20240415125218.GG222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:05PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

