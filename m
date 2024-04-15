Return-Path: <linux-input+bounces-3031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCCA8A50AA
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 15:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A17F11C21449
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 13:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C9113C699;
	Mon, 15 Apr 2024 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d/BAcgST"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79C813C679
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185680; cv=none; b=HkYQf6G78gFELpM7pTnBtpaHmG2yKqMTfZZRc+w3hpGYpNGSlyvfTTLSitSeipX+PwNl0kn9CKzfUb8TQOF4v6gdonhIA2Kmp49ZjHC49MTUBrKGXxvCEECn2tD0JgFQmt/LITrXDg7TYiYNWFzepNFlUZTKOahOj5/qQWo0jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185680; c=relaxed/simple;
	bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRRY9L9Uh3sZmW/RCvhnwnXPAI66kpZaqw5g4VFznSKIwRoPWqIHt5OIp45c9WCBsHRVlNKhNwux7G/A85kiLGdN85DDmW9NBJE0KKU+Xtyh4D1O8WwlQ3Tz60htSd6GaY5JD4TDL4woX0v+8a0EgDGNsK+dG9F8s8tbQ7O0HhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d/BAcgST; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-343e46ec237so2690027f8f.2
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185676; x=1713790476; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=d/BAcgST47SaMiPPMJlp/T3YZ//KtPn/8jOpR499AaNRtFKQv38KWLIwSGsHuLK0Ph
         f/8cIGW+tZtzwv7OVU7sL/CQjeiTm1uve+tL/KL0lOFhcJ6AOlrkIq7rbddA5TFfcKLt
         k+mLMws2UQ4LAmSh22dfa9GS39UpY/6tU49s8WTCSjwKmeuUYOkx6t0rcHO2RAzukSuA
         S3d6fzxWS9zvwzgDrAxo7g0t4CcUY3otBhE8K30wQRpkU4B1B0LI5dvY3oeABSZafK+e
         8yETm2KVzeEiwILc69+UmmzPXlGRSF4cmYDVTlZ2NDhUrxtA28R9i0sWKtFGOUQZa2nz
         GiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185676; x=1713790476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=vd4qlwaFiQuZ3MZxti1Asi/cpO8Vvd9LtT3JRMpY0BoJsuPZl8pz7lRh/7GGfLfE7t
         yrECrlTZmTy+ArRo7JW6D3m2Ep4wFrGozo8pSMthLGD6flVrjzIYUeyeH8mISvnxvBpS
         8qmRFi2/Pvv6suPvBp3EwUmoLiENa+KlQWORvRfGqtFYAM2RFyhSroOqtW7pCpPUpaLm
         N35iwNLb5f5IzxKq+eRiJbayHPAOX3W1uO6jtwYFOgG6qdRdm5tRsElht0UmOEoZY8Qv
         WQ5rU2MVF7f4m+0fWlI6ERIwTlwJQwIYA3JOASNgdJu+RT4aPP6UcmHvIU8p+ZZ8UH0B
         C21A==
X-Forwarded-Encrypted: i=1; AJvYcCWFwvOdOLtwYLiUQ6lffeYcjcHxfYKqe7yE1Zev1NSNNSr6iNPfLVwuntweyoFySbC2pfPyxvGsyh3whnm0v6Jr1QZmitSL5wuOkM0=
X-Gm-Message-State: AOJu0Yw2juf1+rvhQwuOT/qTgvEl2SeJw4xPNFe2mXqyAUv4RYKAp3tG
	kvJzbre6ypP0Mpr0hRgAiER4HqKlpfV3s2wq30XkE+7ch7vwqijoIZlNNKC1TcM=
X-Google-Smtp-Source: AGHT+IEPwOHcdqSsBfyETbLBvAQKa/2hIYBPy4DXezVg6jyWxDrnmy5YGJEuZgB1Fbd9ZZPXlD2MlA==
X-Received: by 2002:adf:e545:0:b0:33e:7fbc:caea with SMTP id z5-20020adfe545000000b0033e7fbccaeamr7391360wrm.34.1713185676156;
        Mon, 15 Apr 2024 05:54:36 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4b46000000b00341c7129e28sm12009728wrs.91.2024.04.15.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:33 +0100
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
Subject: Re: [PATCH 11/18] backlight: ltv350qv: Constify lcd_ops
Message-ID: <20240415125433.GK222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:09PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

