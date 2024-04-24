Return-Path: <linux-input+bounces-3237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7E8B06F4
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 12:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5B3D1C23447
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 10:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7AF41591EE;
	Wed, 24 Apr 2024 10:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqfmimjy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA0B1E898
	for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713953301; cv=none; b=S1W+2v/HusVf1EYbK6dJVtkfs3j5WjbOolihHdrEuFWmBLJcZiL+ILgfXjJVjHdleZJO3zhCqBCK12QFAC3BBpcSyodUbq2RZl6p4ZV6mn9jiKqHE/ch/nBhNWpzVYjdaowikW6s3vRwHht8g/miCz5ODngFMcvIOQ2Hwqsu4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713953301; c=relaxed/simple;
	bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5B6bGunhYyePBzkqYl1xIpkwuhoOflkPUx2cKP+y2PkiuEwWIcNKNPF+RZkLUCpv/UbM+qO+er3o9BSpsnX8h6ZhGZm5yJIdouuhA3X0vb9vinLRSeu1w/NA0YiEs3WpIgTj43MyHWOrZ0qoPjfiJF0ppJ3wNc+Lso9pQ1mOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqfmimjy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41aa2f6ff2dso16620305e9.3
        for <linux-input@vger.kernel.org>; Wed, 24 Apr 2024 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713953298; x=1714558098; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=jqfmimjyh6Ph85Ik1D42j92UKFDe+J8sCm3BwsLMho4z4kb4JO878CtrnSZANbAzaZ
         WNeZvgcnsJPFaC+BowwBDcbEIAXkawGnMA7D41FPCwfTiRgy+W6ZZQt6VQye4dEIYMX2
         dzuP3zveiqLBJ8ebmzeW/0f+WxmJdxyeOGHalVUUsP/jotgUwCzrKZ5kJT0+LI1OQ3cc
         sVVFkYxI1OgHO2nMaddsCH93J7pUPLc4NtDUJxDx8bfCVMmhhIuH0jVUsVhK5wQMPBPP
         oeZ+YoLZNnNElMEXwWM0onrXm0775179DKNWsNdF2WEnWxKjVc07MXmf5lpX5ocTvaqI
         M1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713953298; x=1714558098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=c5ysjp55acQFVMx+uwnnZWhAe/mFrS6RNp0iHWo36f0Jgm0rXDUVcsapzh9qxovu9q
         bDQjdLduXi5ba/a65MZbZe21NRPUO4F6HUZplbUJEM4BerjUQ3Gy0z+ZZRw+YKBImZBa
         6Hoo2nniY//phHGc0Hm29pt5SJ6he16s4HzA1svdDGdoYPi7qRGEYKOHfrwcj7VbVYtZ
         yGdtz86fcKw4v8+0kRrxhc85I2F5Y9uRjDAv5ycSjmfag0wxt3Rabe8xJmZen8hEq+90
         373xYmpk2hfX3JZ+qZB+CuXAn8oQwMYhiwjCxNp/edzUxS397gCPswl68UyerPE2OGsZ
         6bHw==
X-Forwarded-Encrypted: i=1; AJvYcCVFRZvY5m7DjFdEMkl5nOtqIjwNk9PyNEImU/Oci9+MokhHUdGghZKfnU5EBx7UOLjGdf6yPDnKaDaapiGX9qG2UcYPmvG9l7lCYwc=
X-Gm-Message-State: AOJu0YwUGwH1QFkPIog2nRjhuJ1iAFrk0YAOxNKGR5mTV4nWywkdowSu
	odlCOjFiR2SedFIeKnhUt5lcTnZ337QX94ae87YiJDripv5xFTzHIwaMApCE+FE=
X-Google-Smtp-Source: AGHT+IF77S0eO7Dutrp6EQMSf6hVu3p2iJBEOx/XxaPtob8SJQvhDdTvZkjJjS4pcN8hkeXUmu2lXw==
X-Received: by 2002:a05:600c:45c6:b0:41a:a521:9699 with SMTP id s6-20020a05600c45c600b0041aa5219699mr1556544wmo.4.1713953297960;
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id jg3-20020a05600ca00300b0041affdeeb99sm1634085wmb.39.2024.04.24.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:08:15 +0100
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
	linux-omap@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
Message-ID: <20240424100815.GE1567803@aspen.lan>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>

On Wed, Apr 24, 2024 at 08:33:45AM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core code.
>
> Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

