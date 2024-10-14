Return-Path: <linux-input+bounces-7393-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EE199D992
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 00:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F73C1F22169
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2024 22:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427F4155303;
	Mon, 14 Oct 2024 22:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EsrX55hk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73413BC02
	for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 22:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943378; cv=none; b=Z9yneFaL58riL0k9ClCxyweQO9fQ7zS8MH/EnJmM4r2X1OH83NdwSmyTh/pp5gONwRvMmX8fx2ybMxnYkHIIdXj1LTuZoUnQbEY0AWNxnE3TMbSw2H13qUsUXEpnZuHv/pBKvqqXfoGse7e+cT2lLPLoEQWM67xjrvsdbBG9a10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943378; c=relaxed/simple;
	bh=5WRNbj2cp9F3iJ+i7Vs03QXMw6oQuMZqaujyH052TT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JL3ucbPcxdbet7V+KKE4sN4hTrIIqBsI8qhHnFLGDhCxeSizoPB+mx1/C5qIM6185b4wZh1jmoN1BI5V/JHebGRnPiZjk7VAwFvxsXmNyAJ/qOHVaBsLpuZ0cuf1LA1QOYLCshguzhR/LYaAAJWws5m22nuu/R5hSiKLU/piJrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EsrX55hk; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3e3dfae8b87so2736874b6e.2
        for <linux-input@vger.kernel.org>; Mon, 14 Oct 2024 15:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728943376; x=1729548176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WRNbj2cp9F3iJ+i7Vs03QXMw6oQuMZqaujyH052TT0=;
        b=EsrX55hkihkKhVu3jN87IDs3PlCcpJgQLE0EbuU4nFLUx6kMPzaQx10VsdjEAgPogV
         8QbW1bLN9uPWLvgztEYskeIZwnj8pCxnEtKhW4sxX6LDMejO6eUrJ7dn69csHJZd0L43
         6YoZnCZE9hXLx+CShpmRz1mkQutdHbfU8FLjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943376; x=1729548176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WRNbj2cp9F3iJ+i7Vs03QXMw6oQuMZqaujyH052TT0=;
        b=tBViqfM0m32HV3tNLLhJBOIFvCgQKJBANBC9ASxdjkzSQdOU96hmplOmTLwDqvzKRR
         jFsdELyPjxlYNWbkJVuFbx9NC0p63xGlaxjR/RS3LmadpGl9+NwYibZV/5ZtuUV5blek
         59rYV1YTpYNyEZmy8i2dqLdI7jgE3efl45SuHlooWs9JW0oUANDyrpTvHFtgycy8Y/1N
         GWtv01kTAgMDJMePdHHpQ3ZEQcgpGewU3m3WxVlbyxBROkFgFK4e4FajVHHT27EObQtE
         LNNgZA2/D+LywyIRziZXxZJ3O44A2cBFXdAEefl44aAlFBFwZSYIIFNxtqKTJAwvDwzB
         MsMg==
X-Forwarded-Encrypted: i=1; AJvYcCUbfCqdM9Sb6HT5+xs9eZme3rUZIC2GqXfffJlu5GO47HdT9ROrFZkZcra05ET6zxif4vcDdPjexrOt8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMcUdNw/DeLG/5ubc/M094nYm2HgtkmyOwpeEQtclbFkST7xl
	DPmfqPBltX1ithJtnBhe0Unbaf6jQUADn75/A9+f2G/Mra+4jYgH9i7w4K9UtQ==
X-Google-Smtp-Source: AGHT+IGvIcSWqrWdESHjLIthII1CYnetodZdGV2LYPfwsnrc+c96E5YyYN1p6df1+BswNmyWQGH3UQ==
X-Received: by 2002:a05:6808:178f:b0:3e0:4558:612f with SMTP id 5614622812f47-3e5c911e6a0mr9083953b6e.36.1728943375811;
        Mon, 14 Oct 2024 15:02:55 -0700 (PDT)
Received: from google.com (syn-076-182-240-212.res.spectrum.com. [76.182.240.212])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e5e858385dsm4127b6e.27.2024.10.14.15.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 15:02:54 -0700 (PDT)
Date: Mon, 14 Oct 2024 22:02:51 +0000
From: Aseda Aboagye <aaboagye@chromium.org>
To: Terry Tritton <terry.tritton@linaro.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>
Subject: Re: [PATCH 1/1] input: fix generic desktop D-Pad controls
Message-ID: <Zw2VC_V-AhibSnH2@google.com>
References: <20241011195808.2201-1-terry.tritton@linaro.org>
 <20241011195808.2201-2-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011195808.2201-2-terry.tritton@linaro.org>

Hi Terry,

Thanks so much for the fix! My apologies; I completely missed the D-pad
section.

Reviewed-by: Aseda Aboagye <aaboagye@chromium.org>

Thanks,

--
Aseda Aboagye

