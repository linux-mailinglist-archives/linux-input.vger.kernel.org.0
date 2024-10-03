Return-Path: <linux-input+bounces-7042-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EA498EE5E
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 13:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42D271C217D9
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 11:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48AF614F12D;
	Thu,  3 Oct 2024 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUWhNOXg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCA1494D9;
	Thu,  3 Oct 2024 11:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727955990; cv=none; b=fxpMzHQE3pkbMuYwEEl/fiBIK9m+JQbckyKnilad/n73NtPz4/9IFgxplsHuZxTipGjg+EiHzfyjIFNWqUW3OzhMV3ebcXktCnJi44iXRoijfLsoO79f052C8rwhvCLNR/wfQc0xNiHK5r5G7aaZX4VFuLOGiZ1NiJCItpE5m+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727955990; c=relaxed/simple;
	bh=68mNKIXlqNGLG2uhYAKkWoYYl3vvJEC6kMaLETUDTM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liB4U/xHggXTzap/R8vQYlj/j31zAZ7a5Rp/MjzUiG8gfe3mKxWYvr5XBcIW5Epf31G1pHjIVHtp08jUk1SMoyWoXDctL5+4Ri09ch+OL2bLNlwSiQdbsdcPF+XPo9Qhfp1rgQOyZ4J+a4z8MnykQx8B4da4zTvoLv6BmHsjhfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUWhNOXg; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso716701a12.1;
        Thu, 03 Oct 2024 04:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727955988; x=1728560788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ebxdpt5SQG+JaYsNtI/G+HxEH9kRkPmaT5fKmQiCN3Q=;
        b=cUWhNOXgkoRchFPfwkUzoIhaO2uvWqPwsnmCkye7Sq6nyQgzyZLw/jAG/iXBL6A49l
         sg79f7pQcJnXxDNUlQGbFXDO5myPLznP5F5lPnG90Jd8uu7JXssDlhCR1ZiiMHouf/I8
         Wy4NihK0dQIdsqe+9uwWAPdb/li0He1IeGqPGJPH4DbcQPFLc2ko9tcTQFrgSPFQrHgn
         Oun/NAAYaXPxrhMo7LhCLrvtsA0O6I0sb5TITp8ms+bvWtk4eiluUDfFNKn0gSQ2de+H
         CuEq4vtI508Ym6EB8UnVmKbhtbxVoTHy2pofiVZlh34/ZlOJ1QFDO/dO3PT7aMtqVtBz
         l4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727955988; x=1728560788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ebxdpt5SQG+JaYsNtI/G+HxEH9kRkPmaT5fKmQiCN3Q=;
        b=ELOFxVmLM77ZhokeLxz2ssM5jK7ezb+RtYgIVJLWih8vT6jvm0ddnqmFqCJuncEhLN
         /A8nbR6Sqi8Qr43zcuU3DNV7x4zhMAK60VSTsgdgJF89t1Olc89gXt40cT2VoqrvH7hB
         Q7Z0bIGZSt6R0BXilh67WOMFWSGjxwAklGwFyxsJbirsOYnOP6At7fmcfwkHYImIgufF
         g1Kr/r+wa1aelrdC8ci+WtVe1lCk5u1b/ysQYvx9IAMNc/qi2zFHuqtTWxchuAIgd457
         wVVwwyTBv5xKryidRh9jcDYn6cUgJ0FGoG+boWsfZi2qysIcAId9YCnWjVh5Xqo8bEJ9
         TMAw==
X-Forwarded-Encrypted: i=1; AJvYcCWtbW213GyF1wfzrh3PXmKg2rKHfQeB6iNO8Ti6ZpmWemAZSYIEOZIQ/ilHTuJlGqdCZvGJaWRcI6cQdZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEIo2S/4WW+WNsArbSXG5Dr/wvj4nwyUZcl+7jD1vI02rje2Nd
	GcujQiGFNc0y9l80PMdKjYwh/3cnNTTwQuFsR7KfyKqRFrb+UgI2
X-Google-Smtp-Source: AGHT+IH2LDSN0EeoQrC+aFExRykdUxxEs9SEZpHTxGEtFaDMQRFWKLo7DLLPXYDMkY5rLR0aRYhe6Q==
X-Received: by 2002:a05:6a21:3a44:b0:1d6:97f2:4c12 with SMTP id adf61e73a8af0-1d6d3a42e9dmr4465997637.1.1727955987877;
        Thu, 03 Oct 2024 04:46:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6e60asm1178045b3a.16.2024.10.03.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 04:46:27 -0700 (PDT)
Date: Thu, 3 Oct 2024 04:46:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hideep - add missing dependency on REGMAP_I2C
Message-ID: <Zv6EETa7TAqGOOPM@google.com>
References: <20241002-input-hideep-select-remap-i2c-v1-1-6b0fa1dd5fc5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-input-hideep-select-remap-i2c-v1-1-6b0fa1dd5fc5@gmail.com>

On Wed, Oct 02, 2024 at 10:42:30PM +0200, Javier Carrasco wrote:
> hideep makes use of regmap_i2c, and it has to be selected within its
> Kconfig entry to compile successfully.
> 
> Fixes: 842ff286166e ("Input: add support for HiDeep touchscreen")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

