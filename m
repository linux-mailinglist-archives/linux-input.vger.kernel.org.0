Return-Path: <linux-input+bounces-3026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB08A4FDA
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1478B220AA
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9961584E0E;
	Mon, 15 Apr 2024 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGs1PQ9h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F046084DE4
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185397; cv=none; b=SWOlgpkpknN0ei73JlZwZUCbtsHoMDnSlv5jdxp6elNwq+Nc9vhcSHff49Ws8WV5fjf8nRDcIKt40+ARdBcJMPUI8Aq7FSecsakk4kGgLGw69BsXyaPIHXJnKDvUNiUANWsrbFke6e0sFnfdaWZHdDg3oqfLP7LZVa8z0M/RMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185397; c=relaxed/simple;
	bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlMl1R+uihBD2T9C7n34qg8Dp5bxtbFsqRrksd0CPDfuQCNpeGN/MmO+S45RZX4lE5iago4QQjvOmP6hYsGeoR1PRSyVlcgE0LS+aYgacyOXMKvWLHZgGOOHcZZPWwixQfXmT+LO6B322zfK3XhW6KWDl4hnb2zFSgY46P5E4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGs1PQ9h; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4187d5f0812so1803785e9.3
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185394; x=1713790194; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
        b=EGs1PQ9h0Kx1LlOLzDvkY+m+xg9w2PKNa1RIWrGVlWEWlfaE0LZeSuWAGliuR4JeJl
         OrBCoMEFEIfu9bTHqoZ+VHbd/5ZlYywwce/h8shEpn2sYo98h9xp+VTOMwo/g1dRohk3
         dJaW9xsA3e7fJl3UifiGyuwzE/4kEqjHlMDi17bPfxabqEqNJwkQVeG+KRPzRmuOCUBY
         SrqnLXZBUYSfoze4kA+3OPasjSkOvtKhQiZkY3g95oFlzoQYtxHv8pGX4Wkqe16hb+RK
         ElbBK/kceKwMnY4TG/mmelyj1DBfu/vFH8F1QG6eacEih/TEXkiCoFvgxgnAHuW6GIhm
         bhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185394; x=1713790194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
        b=kXAWBZxidw2i7xGtbpEQNbIH3UfFmFL3V7eaAXqh+yKLhT0Aik9QGvzNz6YCIzgsV3
         K5hajUPrwP33BJM6yuBWXkDHNYzS4yeHlw/dt+DvH7pr2O7g4gnZpmd0U4CgqNlPCqdQ
         9JI2E0QWXGRdUCzwmLUAbpBem8DfZiTn2myWpiTtI6jestZzD7LmELVDEDnoozfospBP
         zjJyN+Ir6DaS5ynPhBs84rwBjj2cOM39OhPZzivI4Goy0uYojhTD/Ity0PA7j30PZlQD
         Jn+RX/4819GGDCg6KBFWUNqncwODMmInFGhjD3maKyjRZVwSS62y6HPrBG27cRMW9qO1
         toxw==
X-Forwarded-Encrypted: i=1; AJvYcCUaqxaT1zAvEQBL8QrHlqxUlFO0k+VCZdsMClzmXHR/Prg6KexzhyWUIu9nt42cUR2pa2JV0XRAfQVCJ59dNqmOX0cKSihnXezlfIg=
X-Gm-Message-State: AOJu0Yzq3pduZReIxATcdxS3Y6aEQUu6LYRujlmqbF1aeowFkf17jIei
	Yc1k8J7VMJHZD09B4lKeum0XSQ+8EV781vEWO/6HhZ46zSvIGWlguem5gLGCHFE=
X-Google-Smtp-Source: AGHT+IE0jfEg8j9eNQ32UlJgwwRwcJBMnq8mxk2glq1rj3pDzq37W/GBcRUB+mKPUDxRmuZRlave7w==
X-Received: by 2002:a05:600c:458d:b0:416:b74d:eb94 with SMTP id r13-20020a05600c458d00b00416b74deb94mr7708786wmo.1.1713185394484;
        Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b004182b87aaacsm8741388wms.14.2024.04.15.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:52 +0100
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
Subject: Re: [PATCH 06/18] backlight: ili9320: Constify lcd_ops
Message-ID: <20240415124952.GF222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:04PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

