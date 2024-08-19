Return-Path: <linux-input+bounces-5658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 458E9956B44
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEF3A1F22CA9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 12:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A11716B74B;
	Mon, 19 Aug 2024 12:53:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD516B3AC;
	Mon, 19 Aug 2024 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071982; cv=none; b=uNMw9HbG8w4Lxj8xKxhzwRiW0LVG7v212jKBb5PvmlybDJxqHS7dJpMbP1e4oAdnBOMbm/ycnXKkdklA+UC129zxD5i0kmHKpLHoSQgcXUYyEkF5dxTCEuvOAFbQrkqDXi1abo6Bj/pZ1BB+vPzt4vZqDTHO3Vmv60fd+DCvha8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071982; c=relaxed/simple;
	bh=LQrjW2DfJxg9W0ZJD1zXVuq95BIrA3U9FWfRRc4f4MM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSI4E6V7ppCvgHSRubSj15gMMu4V63u8qt/ZWk6SUD4Sb4jW+8nh8lrc+eANV3xvK7Xvs1u8XAwnADgQQER1d/GBO5AVNitroRYG4GIUu6OwqmfQOjKZA2uKkcQpQBANL8faXhcJ0VMs8sYQdS4z5N6Hca/aYFQpwgqFeYOwHMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-429e29933aaso32347785e9.0;
        Mon, 19 Aug 2024 05:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071979; x=1724676779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXCaTISKENHdz0jLwxzg835EYPXDRfoyijdiHgRnBeI=;
        b=L3ql50cBjqBZO67GI2WWPlGfovXjk9ZAsvKQDgucgCeFfD7GzOnWZInM4enPFLrmbW
         oRp2Llhiy+iDU/XDSlr22dnnhIuaAvYqz1xHHYFZk6/jx519UFtUenn/c8P5H+ywnbI2
         eas/2ci4nXHiSCz7ZBuihw4ji4xJl2lzR74OCP45VO7CV7MExb9kCR6TWeuncgGH6dgu
         fdDP7iKPrzyTQ9h7b+l35ahu6cywyhy0J8KJK3F807ON+AbEgoqjcvS1CkHXvnlXTTUr
         Y37SuPZTqCktCyuf0P+lN0oiUoqbOXSGVkV5g2Z2TTuZJQjtgdHpNvxhtEqm/I6yJKxy
         DuGw==
X-Forwarded-Encrypted: i=1; AJvYcCU/K1VCs64/qOTWrMHDMNIZ98F4MFwP8jA+tLSCkioAxo+ff6WfHFGvsvsqXeqK/OmDZv348aMMbt3FAPOW1I6DQcanIh93FXLry9x879TMamTdFcvi7Z1rFTR5RTCbBGCnSw5WUZnSRrtVHVzCXdfywDKZ0rVL9iVV3iNZ5JZtyxpwdHReU3hlYK+Rg3yfkT+bbpkTeeisjP5wzed3lrFG0Jifa8a7Z/Y=
X-Gm-Message-State: AOJu0YyWKnmKrcpRPcLQ56HE5rD9sUXAX15/FkcQNooclnb0UlwPheTJ
	kPsdiaHelv3Z0Lc0kCW3dsKIhZsE5fvmALsetFFRhOLy2uXuvMTW
X-Google-Smtp-Source: AGHT+IHo55QPwPgzGcTcFGwxtp0bdCvSuUcZoxolgjxKqkV5JJ3TofgJJ7gUigo4bQ8LxtEJt6jpEA==
X-Received: by 2002:a05:6000:1286:b0:368:334d:aad4 with SMTP id ffacd0b85a97d-37194315077mr6153147f8f.4.1724071978884;
        Mon, 19 Aug 2024 05:52:58 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3718983a13esm10500687f8f.22.2024.08.19.05.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:52:58 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:52:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 04/14] Input: samsung-keypad - use struct_size() helper
Message-ID: <6gwb3xrviwjn2bsztrxibsx6qnfac3xxhyxb3kekh4adtdlw7m@n3xqf6ldqsrd>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-5-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819045813.2154642-5-dmitry.torokhov@gmail.com>

On Sun, Aug 18, 2024 at 09:58:01PM -0700, Dmitry Torokhov wrote:
> When allocating memory for the keypad use struct_size() helper to be
> protected from overflows.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/samsung-keypad.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


