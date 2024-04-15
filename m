Return-Path: <linux-input+bounces-3023-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234D8A4F7A
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1F03282051
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F566FE36;
	Mon, 15 Apr 2024 12:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SSJcsbZV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75AC71730
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185330; cv=none; b=d2ZBLAtjSOkHLq6qtOJL6IS/m1naeW/pgwaRpaWb5ODCe3xo94KXn6bSKYHVK7ta9B4wiqmMgJI6j/5ve4tvENyfGjwpDVnf5MT6BUsMs+fsVNOLieWERUurYQVBRchpezMcdLFMutsCxpz7dCaTcTYgHcjC2+rlVj/k66XRvmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185330; c=relaxed/simple;
	bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bklvVuKDRbAp4cW/ZuiInMnr56C83dgMNgPFSzwzDRllf9JMzVwZ++cyWmhwe9YN7TpXXIlps/0S3zVe/OTuepMw/SU3yeCBQ9gMEd3uV7pmyCYM7WfZN10jmN3ckrGz+UdPf57T7gJVwmCWRfbWvf/IJUsYbOH7ooqHLKql60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SSJcsbZV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41868bb71cfso4136925e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185327; x=1713790127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=SSJcsbZV802A6FbFgaQ/sICCSCHOxZTqj276nqflCcLgmSVhR69xhwgRgYV1/ts15V
         HQnsV3ZKaOljE8SfBHUnbp7f89J/0GVdW1c7/IyhuIV/VwCNTxcmkU4z3MVcvEvjJVeE
         QdlxHE3oC3GqPVRSbjq7LR9qH5Phjx/zCNH6SgSRErE1psCN6ePnBRXS333zMHn0U2CJ
         baqMc4zl5VIlU2TK2uxGDkMG2e78JT4T8SiJlBcYFPiLBJyrMeYzCZaxa+LfsneV+x1S
         LzPocwv/DMXuaLO2ymTAAgwOkwStmr8N3rnpO7BtaQRGXHwjIPYTKes2kbY9iheiWjBq
         EsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185327; x=1713790127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=Y5HN3dMwO4/yZRUaLYGMg7M/aHJaKv8J9R62vCe0zfX49dQx8Am5SBeTSrOWkYejT4
         tSbyutlQwtIvHWbKMCXj1qAiyHw29WWSmdDoDMMDTcJK4bj4pzZ5Qwlb9JNGNyW9I3TC
         OmPEOYQx+RXdqdxMcm5lVP591sj9Y4pR2CLDJj3O5DB/vm2TQpr3pDpIEGRlCOjxtft6
         iReSTufy7wxAtfllLiVxvQcmINasYUKKozBmsX46PSyrpqfvzctDtFLD7rUKOZ4LF+ER
         cO2qlr9iK2F8hv6KnmlQ2yV5eOdExOuIwH+SCfTxYx6YxX1vj+Im+sEKIFTD/nHoq6rH
         YHFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpWrAqxc1E8AVTOIuvSnaj3uba65efpWj5pHm7iflq7gBZdVDR9C8QFO2ic2eXgishwmBp5zDzz4JqMk84Af5ePqBnOXeT/9diUmQ=
X-Gm-Message-State: AOJu0Yy+RY4qIRaimMJSMlcQfWafObYNsIH8NF1VYu2PCGJGiPWhOPce
	dPFevCkKDjqEaQRrswRuyGVagptwHhrwis/wyTpFROdIEZyXv3qLxP+qUOa7qa0=
X-Google-Smtp-Source: AGHT+IHAa4VIIZPfYQm1PVHVmrI/agaXvepugvesuVkXOga7yarPxPBfCgzSQL+8bsNFdokUf2ibJw==
X-Received: by 2002:a05:600c:3511:b0:418:3f54:1132 with SMTP id h17-20020a05600c351100b004183f541132mr3484001wmq.12.1713185327355;
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c348d00b004186eb69a55sm2411188wmq.25.2024.04.15.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:48:45 +0100
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
Subject: Re: [PATCH 03/18] backlight: corgi_lcd: Constify lcd_ops
Message-ID: <20240415124845.GC222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:01PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

