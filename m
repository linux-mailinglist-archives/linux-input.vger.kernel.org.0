Return-Path: <linux-input+bounces-13181-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D54AED3F2
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 07:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B30C18938CF
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 05:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247B319D07A;
	Mon, 30 Jun 2025 05:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBOqbdy9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B045227
	for <linux-input@vger.kernel.org>; Mon, 30 Jun 2025 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262102; cv=none; b=EBEzXrUlf5dBf1bEtRc4IYGDSHDT9J6EC2P8nsd6SIUy7+gkqWiUoTbi+VWtDNpjkvt176ZWbVIEe7dMdOFnym/g4c6Q3S1cY2uqNrD7JcJKDCEpJx4DxREplZT7cBmJVK4aV1grNbflum/X7hEPRbsQlTYTQ9xa8TsGXEKr0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262102; c=relaxed/simple;
	bh=sVee7GUzvGoO14nl/AyaaV/1hzRHWurHsiWiNrNbuM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZSz/JJknk3ZZqt8drpnrfIJLI7UJHdUV6cYE6IdyUMPZRR+zAOQCSQCgEElBBJuVE+IDI8anxmsB1l9IdBczlff2u9rPhT5dNo7ALslmfdBnATpzxewMIyPjpBykGUJpgmsV9e/pLT0jXTYge9OXlX8ay/BoMq96+oQ69NlZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBOqbdy9; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1221084b3a.2
        for <linux-input@vger.kernel.org>; Sun, 29 Jun 2025 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751262100; x=1751866900; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvkRgj8h4tPFUdQLI2JezMk5kykHwcs0S7i8YqD4KTc=;
        b=gBOqbdy9O5l/QmukBuuIM7kkBPVfhdF/j7ukbe2vgsPZQHRJiU75knl3csnz7gbuVK
         Mgi7qomLQ9lpl0r855+u9wvPtQwaeL+L+CN7Dz4I5+7NM9Dhpe9zIXKN7W8UxNpLBFGn
         I6MEjtPxH677zWHIgvcI/OZwcPq/USfBSLWqhj+dLZL2tpvuv0QmQvp6F5Go7KJOqAyL
         3BjWaUmjANf3TV9hecukzEwy3pf8wxvMpZn02twyMRPiiIssgaBJ0zXiuRqJMjGULNIl
         In5buGBDkYWw37bX6qagmpJ/PrPeIfGtYxJt8yC3Ki4kiSp25zf4t8A26NZOmfoBOHbE
         d3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751262100; x=1751866900;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvkRgj8h4tPFUdQLI2JezMk5kykHwcs0S7i8YqD4KTc=;
        b=bijxKHvw7zPG7bU0qOqKPX/6qkAYCDAtEubSpfh8Uh4Rr6WfJNgGCJaoJ1rG1LJyOP
         7i9yMI2+2ZI87oh26aDgS/HxMKWrd5uRWN9boyCsGII+C8LaPK0gU4FX+NRNWRKieY56
         ci8iQT6f5pGRB60rvGoE4BT7ITygaTNVQMC6rrgiwkaxWoziF+zXFOe0jkMcumjfm30u
         PcE6danVenBPWQ7HyIXoSwwBxnk6A6cLSBVIb2qt6D+hH+lpxn1VIKVMgsfN432fV0fK
         ZYmfqz0YSUBwfh0Rxzi9Siam/QyTMiLkjcZP0i/m8v6XQ+HJa1e0HUuGRTrL2VnnH2U1
         vOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtpkM6Js/bUf1ZlGcL8JW3Q/3fvfkStdzC7KZKdlt9+2d2dwG8mSY2W6OGAg7uVBn7z/gMjml6nJB/yw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+y7524WTfxThhJXiaqeHZ4F/m5WwkDrzIFQGPT81u/FfBf0BO
	7KjXfmWnZ+hNtoXA1o1tIKuKVK9kp4ym1L0v3BUghFGtap3E34aQ2T9XZNUkNQ==
X-Gm-Gg: ASbGncvtJ7DFWynq5R66MI9tG2MP4gxkfLb9K40VaCTqtDqyt42Vhvuh//kZuW25ySu
	wkoDARZwjpVc3wf6LZSjY/kP7UV3gatdhgcQvWv6qgDU3d3BLYiBxHmpatUmQlotqiHmWqgZUDJ
	Q8OR+ttGxJU7XbTgT83WEXBymf3UV5zD50YittaEmdqrp1NUChZ4+cjBxKOqexmMsNjBAmJnHk/
	P1E/1nDvwIk3TWzvu32a7ZD5vpI50Ynd3nZU+RIPscZvDaoJDJfNPpt7OM1sIPsljpycc5xAciT
	2O58GXTQE8q0xri7pyByPwikQcFXym2wyJykrY4Jv1qZN56ilr1hY8XH3wS0aA==
X-Google-Smtp-Source: AGHT+IEoROTSlRtnGOqrrcP8XSK0oaCzJ948AhHKDgJxAyVzHa2pBOkJX+jX1jYQ7LPKuVFKF1azqQ==
X-Received: by 2002:a05:6a00:889:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-74af6f43cb7mr17333564b3a.19.1751262099963;
        Sun, 29 Jun 2025 22:41:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57dda03sm8314550b3a.147.2025.06.29.22.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:41:39 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:41:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: max77693 - Simplify suspend/resume handling
Message-ID: <ijmemuk6lhdzy3wlm67jr54gvza3zft4473ofgfoeuxknegc4o@ysm62a64dvxy>
References: <20250623110016.1370622-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623110016.1370622-2-u.kleine-koenig@baylibre.com>

Hi Uwe,

On Mon, Jun 23, 2025 at 01:00:16PM +0200, Uwe Kleine-König wrote:
> max77693_haptic_disable() is a noop if !haptic->enabled, so it can be
> called unconditionally in max77693_haptic_suspend().
> 
> haptic->suspend_state can only be true in max77693_haptic_resume() if
> haptic->enabled is also true. In this case max77693_haptic_enable() is
> a noop and the call can be dropped.
> 
> After these simplifications haptic->suspend_state is essentially a
> write-only variable and so can be dropped, too.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> found that simplification while trying to understand the driver enough
> to improve the PWM handling. Not sure that the result is what is
> intended, but if you think the new behaviour is bogus then so is the
> status quo, just better hidden.

No, after your changes after suspend/resume the device is disabled
unconditionally, whereas the original code would enable the device if it
was enabled (because of effect playback) or keep it disabled.

It also does not compile...

Thanks.

-- 
Dmitry

