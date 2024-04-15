Return-Path: <linux-input+bounces-3033-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 854368A50B5
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 15:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08DA7B22FFB
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 13:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4910984A4E;
	Mon, 15 Apr 2024 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UkKI1Ju2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F6084A45
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185708; cv=none; b=e8lOQNenAjjb1XOEjDAY62YtNw9QAQ8JG2UemG0CKiuy0rbYr/HwnYXwPE7u1v4xpTXPv5fJjWIiEbxbnZPDZQWK7HMRCrP7Pyu02zugd0x4RytYwsSunbB7x5m2JMg294H1TkjIW+StTAxLC4ilACGK+sTdROHd81fxt7tuvzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185708; c=relaxed/simple;
	bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX1/bKCJ62TIntNR8q0p0Y8hCWqUu/BYy1iH8erxzOI1ub3+Y89l4zVO/Obm6B6RMxUznqexFMgj1wdDoehh79j5zK5rRpzsopwO1mWsTjGHw48W5viuY8ukaPgTy7m8fMOdl4hG/2uqSCMGudA4Y6chhLekBoJChchQk7JLVU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UkKI1Ju2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41551639550so19285825e9.2
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185705; x=1713790505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
        b=UkKI1Ju2OPqZvalCzzZ6yxajJxmFkF02Tp/3LzjJ/qJgXVwhWKQZMVOXjLWiruDa0s
         B+xQnvMPy6lVIVf6fNoedWVDj6JgqtmexOfR9LWKUfg709RmGq/+z40u/I7BzGr7FMqx
         MDhV70X0pr9YTWRpbR4clr9ZPhemWMcuaPcJCUagpfuCNOkNbNy8ch0dVI0/YwhW8+63
         ZqvUxuXhFUE+WysZRCSBK8C4P0XsOJqJm82VksJu9FuhisMgEfjH6Q8TdGHqfKnrYt5i
         RL24//6yR5srjtUKyYGbPGhZJ8XSUrHKvA35AfT8ZQrW0KpDEdp6Vd4wPeROjREEazjf
         J76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185705; x=1713790505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
        b=Qi2NF7dRgOack4z+Z/OiFsKNjXyNqUqwcuOOtmArQ3rhP4NWtCN/2pcVJnJgpauHsL
         qrhIw9pa5WIyVlfNruUJ4ixBC40wyj4RQdaZz2UrtTmhBW0GXTd47+vmXPbTTex8H+O4
         wHb9Y3VecSz24zJ7x1vxIZ0cn06Zg9N4aaaKHrh2gAzFngEB+oulOA5a9QJdOoJLitvf
         CMgjPJov3wAv8PkF/dWdUe11MGsJeTX1RS6mLvwnVvhaKh1BRhHPWqttjC2qbY5j1Fbc
         sQfuM3YH0iOaXrCMvwFMarvv6HD+svzPVibh/LPfbJVqhJgZq7wj3XZ4SPF1LCiV2zAy
         SGhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkU6/oFvY+LWgDqSLX+bYxxNxEwmaBMsvT1UT9U4qQEOsY76w/oxwR5kUfZcv3RHLmsaaRBAUlFo9X7awq1JUK2TI6hbqIUjfPdbE=
X-Gm-Message-State: AOJu0YzYyUNvif5Fvl3bV2klpKC7Ryao9iyFGH8i/ijdSETtJlTbfhaa
	ri1dEX6l7NSeVc4OvY4viLvwW8+HfWVZbqwu09OybZJKPfLy2N7x3rbpoJ7J1Ak=
X-Google-Smtp-Source: AGHT+IGHxu6Q4avREKIopyDMuH0F/FlZ8s8HVBOhkgD8sUoGIYcp5Z+UXW61HEvkoXH2alvv3fo09w==
X-Received: by 2002:a05:600c:19c8:b0:414:d95:cc47 with SMTP id u8-20020a05600c19c800b004140d95cc47mr9336810wmq.30.1713185705260;
        Mon, 15 Apr 2024 05:55:05 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id l23-20020a05600c1d1700b004163ee3922csm19404762wms.38.2024.04.15.05.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:55:04 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:55:03 +0100
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
Subject: Re: [PATCH 13/18] backlight: platform_lcd: Constify lcd_ops
Message-ID: <20240415125503.GM222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:11PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

