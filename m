Return-Path: <linux-input+bounces-3025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D198A4FAF
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F02761F22654
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801B87FBB4;
	Mon, 15 Apr 2024 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h42Oc/7Z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83587F7FD
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185377; cv=none; b=mTIzkx6t8kO8Xqzbz6LXV2sXIOelMrRsQa/CzDsDoo6aYaO/5BONOrdQNSNtqNDoqfbH5XMYkgRQ8sxNHNw2n7iESCtIRByfcVmZ4FW3uq7Hc18o+Pwtku67pTF0Ru5o2mEJ1XFjhkQfAilrqe2pPTW4rqDp6Z5VKQPlQcWTlfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185377; c=relaxed/simple;
	bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXg7EJDu/t/VXtMFWOV7Bb+8xZJK3/8RwXIIxs4CDyYa/6G89Asf2zFbOt6S4Ro8u7Ky37qNLbTKXp35EYIqjsCRjQMjUBfNC+KdymMeVec8iThbaLLPEcquhNrsYZEG5+GoLTlbVNbZxe5OYsPpG8Tfvw5aMxu6fXtvJ/ELdZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h42Oc/7Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41881bce2a8so536005e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185374; x=1713790174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=h42Oc/7ZaIDppUj9LBgMtk36CPgay2mkB6FjNXTWYcpcJS1EKTHZhd4R9+wbPhLeeE
         eD2LJR+pwSN2Pq+WKr+qvs7vl+wrkz8LglHmA/GzqpuHJYGw04yNLBSh01tyGL2NmhUU
         CneZggItfMkbLqoAPtkpSmuxSNT+abgnRrzc1vDdwpH2mxUjjwu2FhyYEsr5MzJXmOQr
         wAuAO3y6x2FKz+WUjzWFTejCqfHFlrneCAtGfAaVAODeKfE6dE7kQqrtxuC7YgHOEMvg
         +/E1TYCT6bMulQep/bk33kTXywBOT3vueCWsfMJoq9KXZYF3tLacGVATaCWQvn6B/BVs
         p1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185374; x=1713790174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=TYeaLnK+3/GNJiAW+7mxg1Tx3+nBAR25jinwQk5FX7LtvJ530njnNtV1Hf6qvB8Fw1
         H05m+262CppZGtnh+vnpFNRN/T+XnDKbXjlHOcXze0iADH+QhgETFC4JYBkncsJdvwmj
         J8pvX0LoeyjLEyxFlY9IGH79r4FSH9sHiN/wzM+wrZQxVJMLaN39ey55Y6yNWaRjmNGo
         UrvtgM5Cqmd/L5+xsoVYoFOhP1yMpAO5223rP7cRpzyZgi9GMfdxp5Ll2acxoQF1vTow
         k2O+ObekS00rjYE7lW7SkN1GuWs7ofeRJszrZKtAZvPyNJwRifHfhkumsVhD3YWic78V
         401A==
X-Forwarded-Encrypted: i=1; AJvYcCUYgd3nWDx00VU0jAnKZCNwIR1ycWRrY5DOXZ7EMGrLIltNMoLyhzIiu4g8M8yc1ikGO4Ycz1EEhjy6o9zyOurXGOFO9X6yqAcL71k=
X-Gm-Message-State: AOJu0Yw1A4UclkaZigCqp1HewwoiC3b6DhrVX8XIo+9Nhx+SGvao/ylt
	GGQuERnQeosZUQ0jFjj6IbyDSihy1QsOYE4Y40OVIuETl/q7JmZXpE06KDJzGsU=
X-Google-Smtp-Source: AGHT+IERNVIb7kkkXkEPWlxI4SlxeSXGIdHfAlszM7dr954BuhwHUlim2WOUoHyibBjW2LFxYJ6i9g==
X-Received: by 2002:a5d:4e0a:0:b0:33d:fb3:9021 with SMTP id p10-20020a5d4e0a000000b0033d0fb39021mr6183299wrt.54.1713185374316;
        Mon, 15 Apr 2024 05:49:34 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b0033b48190e5esm12005471wrt.67.2024.04.15.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:33 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:31 +0100
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
Subject: Re: [PATCH 05/18] backlight: ili922x: Constify lcd_ops
Message-ID: <20240415124931.GE222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

