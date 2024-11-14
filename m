Return-Path: <linux-input+bounces-8070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EF9C8257
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A38EAB23891
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D377F157E99;
	Thu, 14 Nov 2024 05:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyQQu8dB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD24801;
	Thu, 14 Nov 2024 05:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731561668; cv=none; b=lD43ffwRnYqJq8yV/GPrjlNNXlBrwywDYPmULxTXVYEn1c6aynbMgH3cHvBHpogetI5Rm1yddI0oebC7kCfRf70tdaFshckrrHR8HpGZ8y1PGh/aV0gSwpuNSBlNJWiJW9K3nW9IkMR/fq9b0HKEd7WRP6tJ1kngJh5wWgdYo1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731561668; c=relaxed/simple;
	bh=oHGls7AFam4mHGfb97rToOT6Py3SFlaBEqck0d1zEDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ado6Ucv/Zibca4FcFxGYEdiZjcFmnPrPHNMto8Y2uzordObHQ7e0HNuswc71cp2QqdCzjpIbM2k1lLqA31i0moYxm2E9kbshs/dQfuCaHccdKfKXiEY5wnBRPeTfZByBa0xlOiHKMRCjHKpgFCswlH30xhLdleQzxF1ckqE1198=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyQQu8dB; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7edb6879196so135511a12.3;
        Wed, 13 Nov 2024 21:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731561667; x=1732166467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NEkWqFarO5ZGDl+Zrp7Ih3f6HDMm6lKhnmGDf8HG6T0=;
        b=DyQQu8dBt1P+ETBd5R/Llg3VQ0nMdFXvCkyUomZox1OJ0F+BvQvFs7Ij0/UQdjAK8L
         rXb+pk39KHUwQzU1hTgD9GpTL4xd67GFbwEfX+3ocfOCu1fiZt0JeGEQtOwPFb9T+jNs
         GzxNGFdTYT5G+dZKlvnSCxHBSIicw34LyQj6ht3ni7cgl9Q19JZ+DJASZVv2Bn0EgCcc
         vBSUvifOTuaNHQPMkQ7VXRnYyc8u4peCKM8ADGvk5e4GjikPkEkn6rdgFW2Lp3AMiKC6
         OhszMYf+u5KOQTB5sRQPKokxedMeqyPzQn/HO6Z/Fef2tMy5gXbvjcVL0ePSCHuwZtHA
         p1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731561667; x=1732166467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEkWqFarO5ZGDl+Zrp7Ih3f6HDMm6lKhnmGDf8HG6T0=;
        b=tJ+qv04fCSTdrKKUcxQw2nrDuo/bkZTri2knB9lptVzBbjnUAHO9sfvID5Jd1eu3XT
         pYMsOkRkNwmvfMxOonL4JTBVssmEe2Wx6zMlcxv7BGLRgqHZag5o7dxREF40HtC+4AWJ
         sMaXfQlYyS7+xFaSvHdhz/IVvyjchAxX8A8e6nhkyixVr36puzOKcTVJ+Lv78D17Ldp3
         1UhWsMQ4ZL15RGux4Dk9nHkxsHwtPnIt2cRZplOD8nlxE3T9lN9BygkGLXoPgSXRT02M
         ttED8tRz4a/lY0TAgD1/QjVouERZqZ/uj9o8Ru7FHUXGnbHL9mgpecA+0eikiZy5ayaO
         puig==
X-Forwarded-Encrypted: i=1; AJvYcCWyY0EUU/Jbe6tZ/ULSnoz+E+KfZZshYKn+BQrvjbwMdcIqYpasc7+YOVoOJIk8zj9vHjcR5J3tppBoW32l@vger.kernel.org, AJvYcCX5RRgvWwGzGPnmkr7h4jI4ocb+eHyYo9MGArP2aD9mFNIO/k+q6/6zthKF0GrV1p0BkJax46ucSDis/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg2oUeScy5/ieAfTWCFzEEsBhAwcyftD7sKpVXQHHdZ8WAytLF
	KBuUld2gucwq7z9Jn/0euSJ/XcMA1vsdMrawQNAT0EfZbHNPiYO/
X-Google-Smtp-Source: AGHT+IEdp1I/bu3ifbL07hCMBvjgh/TPoqDJCgLCPVuj6JFRHoE5AZJ9s//YRxuHnGj8jKhGXaJiVw==
X-Received: by 2002:a05:6a20:43a4:b0:1d9:61:e783 with SMTP id adf61e73a8af0-1dc22b642efmr32654349637.36.1731561666586;
        Wed, 13 Nov 2024 21:21:06 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:aaa0:6660:6a33:f019])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06fbb549sm320869a91.52.2024.11.13.21.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 21:21:06 -0800 (PST)
Date: Wed, 13 Nov 2024 21:21:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Shivam Chaudhary <cvam0000@gmail.com>
Cc: wse@tuxedocomputers.com, tiwai@suse.de, hdegoede@redhat.com,
	eshimanovich@chromium.org, szfabian@bluemarch.art,
	tjakobi@math.uni-bielefeld.de, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042: Fix typo dublicate to duplicate
Message-ID: <ZzWIv89-BBOqQsxi@google.com>
References: <20241107174918.78335-1-cvam0000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107174918.78335-1-cvam0000@gmail.com>

On Thu, Nov 07, 2024 at 11:19:18PM +0530, Shivam Chaudhary wrote:
> Fix typo in i8042-acpipnpio.h dublicate -> duplicate.
> 
> Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>

Applied, thank you.

-- 
Dmitry

