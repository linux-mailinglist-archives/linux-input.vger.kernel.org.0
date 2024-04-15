Return-Path: <linux-input+bounces-3024-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728398A4F92
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 14:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7972841C1
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 12:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07FF757E8;
	Mon, 15 Apr 2024 12:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HX7DPTIZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6BF73186
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185356; cv=none; b=EwHXqWCOg8pAWJ0Daix0Svuhv/snlUk4xyld/tLu5xJ9kI3xUXbmSNu375DQ77nEFMt2dFxRfGMceXcENuhR+GRjKBv6wMUk788u6MsMPbptrvkPyCNZFf1OTmuXs8hObmwDpjtaV/iJAetQMuQ3KyxkWN0Di/MGYvbvwp+HvvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185356; c=relaxed/simple;
	bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+/JKeqfq8mHi35ktWV1lCOdWx/C1Cgc9qrCKei2ay2tZWc+0+jPR+FUhLpNF/2RGjmJ48z+v+2hDuvrT4H/rFjK1A2ur7XpZ+4pccbtZq5tFC0iyHR/Cj1Jm8zSA8PlvIiOYBucHsaSDNpX2Bt1bPRiZwHRjm5DgIE2cFY+yWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HX7DPTIZ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4187731a547so3065095e9.0
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185353; x=1713790153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
        b=HX7DPTIZaxzoegN3sHKimHkG3nrx5yoTyOBKQKZo2Dcc9U17zD52ndDLR5kPE8PV2V
         xbVd/UB0rgu+BHp4gkc59Z22M+hSsOv3DU6wIzlLkc6DWsolBvqpxwPLP6Gk8twxvzmG
         TpkNuITDDhAb4MhZvmo2ogQobMEL4cJ2usPiY7iwgQfuN8oTdjzmWl9lSRg5qc6VIaO3
         bAKArGlO7lcPD11osxYdiljVdPCRkMVaWLmmrpT88p5lMbIPOMS8MsUvQvDAL80sdpa7
         w6KnIQo3+1XnNFVR4F4kvvddDpK3GTO80BZsk3AaiOmaXqP6OzuIEYWg/ROThGn9h35l
         o1rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185353; x=1713790153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
        b=sy0949mGKXZd1HUD/bMwhhHKPydaNYq91bEH7B+IEvHAiG1HSpCYLaq6sriQ8UgaXt
         ocfP2D4qEji1AAFFgsLLcv+YNxAMSpuqI7O0ojtGo4kxk5orU1dawy2aL+WGWCFthre2
         YySXxGGyMElvKBaKVkX6OKYnBm76RQVEh6RON5eG/zlO8scVFOMjOuiJ/GI8zxQzULn7
         YqDQs0vYvE/Kd2AyIffy2ya4jzRj+dJsTieW6XRcqvgue22bPZLcfIlp6fQQu2vqMNLf
         /Ojsd6amPabiV5v9KiHrXaNW2LqJWVO+lbHRi/SFZWzd61X8x2NUnn3JlCQmQ/X3gRFa
         4/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+u6meoV1hvsJv6IqAFBeC5EErdOUdjcjfeTsCYcU87QLj4dLVl0Qnn+WmIw/KTmiylsIO7cbHWhl5GFSh/Ijs7D8AkhcJEOk+q1U=
X-Gm-Message-State: AOJu0YxDxuejYilRgE3qWGM/mMK5ix65NK1BzgjuaR08i4BXl1cwXk2U
	SLhAPIJsFl+rvfiskXDVHAGxdhLkRX35IuuUul4MPxeU/HWxnZyDOx2YTGYSOy4=
X-Google-Smtp-Source: AGHT+IGio3O7mWx35mEvR609b07A+RZnNzN0tC57IoZigX+R2Bsw1mIXox4a962UuZkyigWVe02A1Q==
X-Received: by 2002:a05:600c:358d:b0:417:4ff3:391a with SMTP id p13-20020a05600c358d00b004174ff3391amr7933682wmq.31.1713185353445;
        Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id d4-20020adfc084000000b00343c1cd5aedsm12044366wrf.52.2024.04.15.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:11 +0100
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
Subject: Re: [PATCH 04/18] backlight: hx8357: Constify lcd_ops
Message-ID: <20240415124911.GD222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:02PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

