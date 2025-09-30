Return-Path: <linux-input+bounces-15176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3129DBAE90D
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 22:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E141A3210CB
	for <lists+linux-input@lfdr.de>; Tue, 30 Sep 2025 20:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A958627AC3D;
	Tue, 30 Sep 2025 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LH+G8FXF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2F619D087
	for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759265240; cv=none; b=gr968lx/hVGJrn/IMgMIz88/4C8YZSsfR1JkcGhtj5eaQ6wTO2Nhk6ktOy5izBPZOIteLOcPI/VIfPAP66Q03O5QpCws6W50iSnxsm1ZDUoPcibtgH7vVAcgdgpmQ7DlE5ytWFbaLvlR+xvPFFcRKSN2cGwV6Grjs0wIkDqd7yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759265240; c=relaxed/simple;
	bh=PQp+mzVn36GMibrfg+qbvSy27kf/GpxKYLgRVzy/VAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m6Q1m7ODX4KDEst8vS6uCGKQ6uYkBJhdZTAYK5VNTx2KJ271JF8qVLDI2vUn5kAKoOFUn39+3KiTJbPJP8GcS8bcWluWv37UjQi5JaQggmJA/NVj5bwAr0KPQQla2w9TD+FhHt4WpMPms78kRETVNRGbbxz01ZjKdpHw/UDbaNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LH+G8FXF; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7800ff158d5so4283865b3a.1
        for <linux-input@vger.kernel.org>; Tue, 30 Sep 2025 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759265238; x=1759870038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4q9dIY27yfmOm2lPjdRxqNm8D5c6q+pKNbNue3M/Deo=;
        b=LH+G8FXF1J44xHhM5DL+mnhgvpj0UTb54kLxG/iAfWCYPWecp4nyJOfW/nn0GPj/0k
         scuFKZ7Se7sNbW2pljPxRl9kyDkJhPiThknGBqqJ2N49k+qmjJLBtmJuu60rOGaASL8m
         lR0H9ik/CmXcZTvm/qgXcD3mRnErWcLiBPkxmt10LH5FLua+e3TUAcvbz/vjABsVwNIy
         B4TupSJ/IorcszD0uR5Tr1YnlEZXtl+A9wsRrx9iPSP/hOum7kOC0X6rs/ueB9ArGSax
         34viyktohDL3hrivT0/3rGVgW3LG07oZEkaQzO3k8/TtRd/t2WV6TB+hCGEjcfBMxKZH
         rCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759265238; x=1759870038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4q9dIY27yfmOm2lPjdRxqNm8D5c6q+pKNbNue3M/Deo=;
        b=hT+vexQvVXrkKqfiexlNGDjbh89e6bOQz02GJr4Mgf+mIfWbwNHjBh9puoyPJc4oYi
         xUDa6/6LtBbld52GGolVAYrZmKMUCnsojeASS0S5ZCOnSS/L1AU/1LAQeV0HtFVKIGfC
         URzUCb9zrSPixq6ilzHr0TNLWGJ0TK7AGXLZsf26Dx0Cd5KBg8KKImAd5Sn5i+UaphjK
         p36YGtUkVhnSRfNBNmvvUcGTeXkGOOp2CwREM/a7CyEbNlAnq6FioACQWM8t8NI6xTCo
         cV6RscYvOAz+xUDk2iUSsjJxoYx44wMN9pDweb6+kG5mU3s7hnbYKfN/OxxFuE7kh+4y
         U4SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWulxr+NYK6bgwR7BNsQrV6EeRc92/lv8X0mI69+0xjOPUZumEjmH307gsPnbTviroRVjoK2P45H8eE5w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ubFYHI9zEPJmln1YxqXdfswDXT+urlVbvNSpWtd0wYb2Hm1q
	lg8fsRHlr7ryazQT9V0dApomQrKOZlA1tpt4Ek++9oerKNuuqwN9asvi1YV2Nw==
X-Gm-Gg: ASbGncvMQks75SI2gBhEfjaAKpigAm2XHhqn6/ohHMyHcN4tsI5jdWTpFbWjnGr6WSZ
	l7hVACtQ9TwE0rrtVY/dunlgOAiUK7GkDOYseOa7SR660J2brZ3piUt6nWPDyUvU6tTLSf2zcLN
	iixpopXHqCmnZHsPj/HCgzTN4FRptsWlLfQZV3zKotDfi+ARCPs8ym16QxfvU/bgsRfaJjVzXWR
	b72rrFVizL+cAI4NyQ8emsH5U4HAZd6CpUXPqSr6n+z2ZcDn7P7lxYbgHQgouIlkPf2Z2t5V8a1
	K/lHbT8eUwt4BNw+DcF7yroYKmSKZvkUidlmrc3ZpIrlXZ6GL8VCl4m2Q2XInimPFJhkcNu+TSy
	ogNn/WAd3GyvTos97ife49eSd93BuTgpL5qAG4Dz4f3+zK64/2uSXCMWYoj/iO+Lk28dpYo81Do
	m3Xi3lX18a/0g=
X-Google-Smtp-Source: AGHT+IEC6dRFuhURMrPckMM2r4CsW2F51u0tQLeeyg+l2I+P6VWKxeFYlVv/8UkXSsU17ocJM17U8A==
X-Received: by 2002:a05:6a00:2da1:b0:77d:51e5:e5d1 with SMTP id d2e1a72fcca58-78af4160624mr780730b3a.19.1759265238375;
        Tue, 30 Sep 2025 13:47:18 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7998:b3be:d4f5:19f4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64a87sm14641306b3a.69.2025.09.30.13.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:47:17 -0700 (PDT)
Date: Tue, 30 Sep 2025 13:47:15 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] Input: aw86927 - Fix error code in probe()
Message-ID: <3ei3j4hkws2konaabofa7vc373n2uam7pycppzxdmnrie4efkg@42kbpjocrrna>
References: <aNvMPTnOovdBitdP@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNvMPTnOovdBitdP@stanley.mountain>

On Tue, Sep 30, 2025 at 03:25:33PM +0300, Dan Carpenter wrote:
> Fix this copy and paste bug.  Return "err" instead of
> PTR_ERR(haptics->regmap).
> 
> Fixes: 52e06d564ce6 ("Input: aw86927 - add driver for Awinic AW86927")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied, thank you.

-- 
Dmitry

