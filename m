Return-Path: <linux-input+bounces-7678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ABD9AD69B
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 23:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12C81F24D51
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 21:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC7E1EC01E;
	Wed, 23 Oct 2024 21:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uw1EnKix"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B820C15B0EE;
	Wed, 23 Oct 2024 21:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718575; cv=none; b=lSA5J96NhVECQa76Cq7N22BFmgAwh9OEnZ9EnDyKKw5rOzC3clIWX5QcwXO8WYmG/1qkgfZSjUswOGMyeqFHFQf8ZXUIKmWKP8M2IkLlvxKLRwj3Hd9qozfvqO5BG5f3cS0eh5g/u0jj2T37L+9z2mIvu2VvR1vIF7kendZMSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718575; c=relaxed/simple;
	bh=ECpkooAsK43cCNCwIMttxSvAewIH5d28w9CoAi+YcIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oT5go6xV0WIRQtT+nOik4jl1GsaZJhlyeY6Cvxsvx5aW6FaUTIsKTpYuWXR5bymiL4Kb3jkOBxXUc/y+85+7DJ3Scsshnp50i1LAgqFIldACFRbltMunG+KnUll6wStcHfkcO2zOAWh/9WBEaB327ZI+i0rK9trJf3x4qvG7Fxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uw1EnKix; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so209977b3a.0;
        Wed, 23 Oct 2024 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718573; x=1730323373; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gv0/36hzmOzdM70FrAI8TdgGFkAi2wD5VDJAxglbS+A=;
        b=Uw1EnKixxLuxnCBPI4YI69xLKk1E1urI1bF0aVVUTeDTPXG0jsnwMJjYYSDfR0nEL2
         ckNBHUUi78AfAJfFedXTkaK9kRyshCzDpSPL8wJ3SJcTaGek/RliHFV6SI1dt34Eucru
         YWi20IcND6t6sIJiE4zvAxe8W7krtUBX1mfhg0MsnruPxzjrZIp5NjPG5zSBDnEus+Ph
         rIdpYBjtnUb6sQciVmzgDlVI825vN+BuLrwRKInCBhatupxVUFm4TykzDV6IxnIdcFlO
         H6vMwOXQuTQh9QMIjxw/SFXu8OKYaS3vH5C3SPccouVz2nVQmln7qcpHHTl3msZWnte0
         z/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718573; x=1730323373;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gv0/36hzmOzdM70FrAI8TdgGFkAi2wD5VDJAxglbS+A=;
        b=KdTouhfl4JHGW8fZga9+3IBr2DFpiQwPwPxeEoSoolIYAXJBQrJk2E1OdTkpmDO+1y
         QnN696UpX75kmbXHDFc8jCb81a2dk50KU3AvVbLLc3A6bLYie721T1BbRK3JvkO1Ntjp
         +61RfcmKhseVAk6YxnDbQCl4jaNhIvhqoy90GJkY0ieNeKAj1FSMGNcv4TLsG7VfgM0g
         BWdT8eubDFTHrZRXr5Ei0AGHEfiomT+ZE0p1xrxvtg2TpAw3cqqqTeR4DYz97MxWHZ2S
         RVGsylQDDbyZLDlZOG6xMmde6ig1xpEuNoGILfmuP96IiJ6j8RVn1iNqzy9QrivaBOcs
         mV/g==
X-Forwarded-Encrypted: i=1; AJvYcCUv10Ad9d2SUGfoBwuPrRrXVGLLYTN9xgzOEmVszcbiIuzNXVZO+C/hxHukX/EA0jdgIzxUw2mwAgQwLg==@vger.kernel.org, AJvYcCX2lmYPq9KKZZfPH1WXWNxTsBhQoaPPJiRhSRmvVbXpgnJYt2bjtpjjhMUTzt2BD4Po4lXfO0KBOeqcQxsV@vger.kernel.org
X-Gm-Message-State: AOJu0YyVD4pFeKhTME0BfFOxKCYwdqBYdEnTChVvyvACNtzy2tLQyp6O
	MK1UzsGAszlkZT9KdAh7XL2wZzKex9FvlJA6dmX2YZcycemi+7N9D1VkCQ==
X-Google-Smtp-Source: AGHT+IGWO3RublAKQB7/m8S4Zs41UsVHLd42sYBzseBX9Djfp4UazhBgaG/kRW8ykxEmgXojRxdNbA==
X-Received: by 2002:a05:6a00:4b10:b0:71e:69e:596b with SMTP id d2e1a72fcca58-72030cbcd7bmr5317181b3a.17.1729718572760;
        Wed, 23 Oct 2024 14:22:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:84b7:953b:674b:513c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13d7509sm6807845b3a.117.2024.10.23.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:22:52 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:22:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Zeng Heng <zengheng4@huawei.com>
Cc: raymondhackley@protonmail.com, markuss.broks@gmail.com,
	linux-input@vger.kernel.org, bobo.shaobowang@huawei.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input/touchscreen: imagis: Fix not used variable
 'imagis_3038_data'
Message-ID: <ZxlpKmrYy8srtckn@google.com>
References: <20241023094831.1680214-1-zengheng4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023094831.1680214-1-zengheng4@huawei.com>

On Wed, Oct 23, 2024 at 05:48:31PM +0800, Zeng Heng wrote:
> Fix the following compilation warnings:
> drivers/input/touchscreen/imagis.c:422:39: warning: ‘imagis_3038c_data’
> defined but not used [-Wunused-const-variable=]
>   422 | static const struct imagis_properties imagis_3038c_data = {
> drivers/input/touchscreen/imagis.c:415:39: warning: ‘imagis_3038b_data’
> defined but not used [-Wunused-const-variable=]
>   415 | static const struct imagis_properties imagis_3038b_data = {
> drivers/input/touchscreen/imagis.c:407:39: warning: ‘imagis_3038_data’
> defined but not used [-Wunused-const-variable=]
>   407 | static const struct imagis_properties imagis_3038_data = {
> drivers/input/touchscreen/imagis.c:398:39: warning: ‘imagis_3032c_data’
> defined but not used [-Wunused-const-variable=]
>   398 | static const struct imagis_properties imagis_3032c_data = {
> 
> Only define the variables 'imagis_303*_data' when the CONFIG_OF
> is enabled.
> 
> Fixes: 1e48ee99f603 ("Input: imagis - add supports for Imagis IST3038")
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Applied, thank you.

-- 
Dmitry

