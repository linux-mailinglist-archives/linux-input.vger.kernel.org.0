Return-Path: <linux-input+bounces-7012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB98D203
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 13:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B61DB24D59
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 11:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B923198A1A;
	Wed,  2 Oct 2024 11:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz5wP17m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9879919409C
	for <linux-input@vger.kernel.org>; Wed,  2 Oct 2024 11:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727867345; cv=none; b=gM6eCIn+VCDX+Xp+WMjaHiwaiuUgqkKdDYp/6mZWb2U/HvjsaW5T3M9shzgGLBudjp9xzdNtvn3A13UBPfwC/gOk8SqD2/TRx6uRJscryGrm/yRUIiCpcx2SwnOJCyC1bbObwk87/5v3wkWgyePRMkNFQJ7mX8M5qeoAmE3RW9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727867345; c=relaxed/simple;
	bh=1fJy2b3C11Ctmd+Ue7k54CiYpWU9WcF0qekkW81L5DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DpdiHgSZIABGof2daIUXCjUa7HFSyA4v+7cEd+cGWjt3k7N7syqOkH2JWgLCzBmU2jm4uO2WT6Yn2Ko755gOndefp1VNkjmXy8Ca8TkOisiFrdL6RT0ilPz8CSt1ePcVKGyjtX6GkRA3BSFAUVcTczF3OHwZ3G6PhJZwBK5uHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz5wP17m; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7db4c1a54easo4187120a12.1
        for <linux-input@vger.kernel.org>; Wed, 02 Oct 2024 04:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727867344; x=1728472144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EoKwfgc+XZAiIgg56wzlWc/0FjbfXSWALxjghNhCyM=;
        b=Bz5wP17mk2ciCmCyZ30m0f/GxliuZ3CKp4847d4l2rlu/ImBevTM+QyGDjYQyEQLi4
         W750Y51qtJUyFhM8vaYx+fn7l5ihNVsWl4t2+3nI0uwiw3qRZELdRHJAMcODM/AqdAkf
         rwOuvvlR3wvvRcBppKGu01vqkMiAnesn0ZP4+aJoK0RO7S1n2S18I1DFwomVa0xqEA1A
         zHXOLLtS4ehzGk0Pd3TFnCXf59d+Rs4d3QuhTnZcojaQVVM0F48LvyrZguWmAGAIcV89
         67ZVa6Ju1poRsoI+byy6J/uoCPWJfAvznzgVRQF0+QWNtBIjvl97wXrIwe8dUqZMLyR6
         OnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727867344; x=1728472144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EoKwfgc+XZAiIgg56wzlWc/0FjbfXSWALxjghNhCyM=;
        b=fxi9XDCb4g1E29Xj6BKpLQEGfgBAOHBLhHN+NZ/BTGcQBwrw1mNUKjgPAqDyKCcbYJ
         blXSw5h0b97io+A7Gsrw9x+YTOOV/gR9xPbK7mz5lQYK+3OYyyArl8Gai+PhYjgR+i8b
         RvflCtNaygdQEQdzMQAUvW833nI1vcTJI1PKS5Crihj3eJhHKJaLFnBDGyoucaEm+890
         +Thw9p0mZLGeEGzFvY+Q+OmVC8dsKL7FLo3VjO7qqTKfIahpFB6ueDuH+1hfnlLBqn8K
         CpaRM1aObZeyPwkaQSEQ4nzjSvJkYMgf547+QPJZd8KrqxZIk0U8dOXaQ1Dcyf99gwLJ
         bkEg==
X-Forwarded-Encrypted: i=1; AJvYcCUSsrqdh835lzasHm32HpJtFDLj9YeTyDX0njwy4CHYNjLuEGb+OKw3Df+A2IZmgLdTreVU65vEZAFxrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6833DReXbPjR+CMvwHd5fVT1+2rkvHAfWuOqEyDhz+X5TBVF0
	BeGbDkOYUzKA4DcoR1kYdHsmf+7eCJN5SVgWL8QrY0tXved7U3w8
X-Google-Smtp-Source: AGHT+IGFC5HLdUVKnrghVktWv3yBQNBSlI1/pqu/HmIRhiM6wv/3VV7pO4LdJ6SkmUa4iu0lBb0i+w==
X-Received: by 2002:a05:6a21:38f:b0:1d4:4a69:a0dc with SMTP id adf61e73a8af0-1d5e2cbf7c3mr3833690637.33.1727867343876;
        Wed, 02 Oct 2024 04:09:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:59b3:a140:3cbe:62fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26518a2asm9596605b3a.107.2024.10.02.04.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:09:03 -0700 (PDT)
Date: Wed, 2 Oct 2024 04:09:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: nuno.sa@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: adp5588-keys: bail on returned error
Message-ID: <Zv0pzelCZJpI0dxa@google.com>
References: <20241002-fix-adp5588-read-refactor-v1-0-28800f1b9773@analog.com>
 <20241002-fix-adp5588-read-refactor-v1-1-28800f1b9773@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002-fix-adp5588-read-refactor-v1-1-28800f1b9773@analog.com>

Hi Nuno,

On Wed, Oct 02, 2024 at 12:51:50PM +0200, Nuno Sa via B4 Relay wrote:
> @@ -455,8 +457,16 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
>  	for (i = 0; i <= ADP5588_BANK(ADP5588_MAXGPIO); i++) {
>  		kpad->dat_out[i] = adp5588_read(kpad->client,
>  						GPIO_DAT_OUT1 + i);
> +		if (kpad->dat_out[i] < 0)
> +			return kpad->dat_out[i];
> +
>  		kpad->dir[i] = adp5588_read(kpad->client, GPIO_DIR1 + i);
> +		if (kpad->dir[i] < 0)
> +			return kpad->dir[i];
> +
>  		kpad->pull_dis[i] = adp5588_read(kpad->client, GPIO_PULL1 + i);
> +		if (kpad->pull_dis[i] < 0)
> +			return kpad->pull_dis[i];


Unfortunately all these are u8 so they will never be negative. You need
to do the adp5588_read() refactor first and then (or maybe together) add
error checking.

Thanks.

-- 
Dmitry

