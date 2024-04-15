Return-Path: <linux-input+bounces-3034-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A68A50BC
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 15:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C725B21551
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 13:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B96413D25A;
	Mon, 15 Apr 2024 12:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRp5mflH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0613CFA0
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185722; cv=none; b=NSsAkQ6BxzMHCbTTKOU92DQG9JKgtx2g2Wh6Rglk93pcLT1C3C4VwYlWPjWqnXUTZBHR7ThAsLBiLQJPo/DQ7WzcbtRA/4UhUkdfWw+rySCbdk551o+T/V87HykAUrdf+GXOfa0bFTsRjSrYIjQBhvZqiUOTWKqqTyn9Zg727eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185722; c=relaxed/simple;
	bh=w28Vgzy/l8vd8BHW49TVBr3mcKt4Lu6grGdOVajJg6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKLare0JWzT9XJExCRlcDZ99619xU0iejk2eEjdxB5HGDByrIOLu2WC6qAHniICNO5e7M326YkzEQf5TvZidagMCmlscq2QcCPE83/SNjGC/48cf4WQPO2MSA5NK5VfvrpQ+kbmm6bYEjisNv0aUUOr5etB0HT+Yy/kBKKL2B4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lRp5mflH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4187c47405aso1807875e9.3
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 05:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185719; x=1713790519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w28Vgzy/l8vd8BHW49TVBr3mcKt4Lu6grGdOVajJg6Q=;
        b=lRp5mflHObnS+9j81fxt5C0JNjn674hgOaIPVtkWZq8AqNw7yMJ+viv9BzJahXKISB
         C38YlUxu2TFABzsp3FvLg7xzucit1SFGvokikGVqZtnbkHmQnHsp9V3c8L5SGYPJ2Ca5
         yPNLHCJjEgrBkAWnE3T+c+rVJvCUssEPz5XA3QS0Mu1oS1ivlbf7/7KBW8tp8VrwLgWW
         IlIoT7YNp4Rm932+rzXaFSm3oC7ib5xFS7VzP7kkS9Tm0iXotZ3RklmJ5ywUGYrgPFzF
         28QBBHOf6+ES4BF1dQRdnSjeHN/Zlx/Hak2pa42H3HvMLt98HZEQel4T7HNazTFzsIj8
         v+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185719; x=1713790519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w28Vgzy/l8vd8BHW49TVBr3mcKt4Lu6grGdOVajJg6Q=;
        b=ST0wdxond8jToh7FKeZNFmr/VGZIUue+WDKXJSSvsx+fhXZHOT0MHCTxgBq5P4YP3D
         w84yNCrZW1y/kvFV6G5LQkvbXJfIWyKjszE/1Mq5Ey3a9iQA0yVi5iAZF9wWSjH6Z3SY
         xjhhvLIP0KNULnxH+tZlYvbss565iNj/0SqiIdtUsOmNK2VAgb9IuoHxtzPp1ekmSxn2
         k1c2ZgWuAsc03IdscuMef7u5h+PwK3ImroAm1MEDmmBLY9yJ/PWGnFVbughBKO41+B/7
         5Bl210lRP52pLnPLPyw63svvbNZBzZHVFK9/yka7u862Rc8B1wbjJQAe70ricqzxvVty
         JFfw==
X-Forwarded-Encrypted: i=1; AJvYcCVMZBilC78OUhoGIhbxFmXyVdQTZLH3o6zzOqMqQx3UMNsiDA/W5qV2vVdSF7MLAqzS355AAtM1Kvf0LPKSUNYgFR/3ioFge53bxvY=
X-Gm-Message-State: AOJu0YwJbyLk7S+H3Y3TXDB+x5+Ym0c/rUqrPy00Dp4to8LsdCrdJved
	BlbxWbJLa9/gV6hgpvnhvcxxNcdN10ALZmqt74Mhm6eZh1y+2/s1plYlyI40Ocg=
X-Google-Smtp-Source: AGHT+IHtbwzdHFlfRbkSxCve8iZ6ujqhwgWjkWmq8yTpU351E4Av/06V3X/v4naeroGsr+pFHM+HYQ==
X-Received: by 2002:a05:600c:3582:b0:416:9cf8:cf05 with SMTP id p2-20020a05600c358200b004169cf8cf05mr7326072wmq.18.1713185719212;
        Mon, 15 Apr 2024 05:55:19 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id s11-20020a05600c45cb00b00417f65f148esm13117334wmo.31.2024.04.15.05.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:55:18 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:55:17 +0100
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
Subject: Re: [PATCH 14/18] backlight: tdo24m: Constify lcd_ops
Message-ID: <20240415125517.GN222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-14-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-14-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:12PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

