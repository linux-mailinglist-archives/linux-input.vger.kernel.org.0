Return-Path: <linux-input+bounces-6973-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A298C0AB
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 16:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDA01F22ED1
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 14:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF891C8FBC;
	Tue,  1 Oct 2024 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1aGWSxu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72CC1C1AD9;
	Tue,  1 Oct 2024 14:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727794204; cv=none; b=rlCOsiaoHZRZux3dBNLzHvfb7FTh65SHOc2YF/+zQF6weBlRdrv3me8kxqWr3/ZerKgK0BTAKVu/Kv6ZYre6VCSdMVN4OVhM4iNsGfeVYWnvssi4Ix7JO4J/BqG+UVPxlVxeCWdBf3xu64LMRGWQJtrEBWBXi6QB23cSL4kgiiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727794204; c=relaxed/simple;
	bh=qVDTcAol42wEeSuUlrcQ3eBnT6RTeZHXXkfTTQqu8k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j85CT0M3y+9BOgPSme5IyvSqanhzISOIgVvSOxlqFVY/mhG80XsEaYGKsXJMfXS6TjDlD/TGXapHKqdHpsP4RJQwCvOtw5wuT42ypgtJIrYWtVPw2LZjPb5bGo+FEh/S4GxmnoJcVIGSE2ck/OMMllSiPaZpMJtKDYOVFkDw9o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1aGWSxu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b7259be6fso28449945ad.0;
        Tue, 01 Oct 2024 07:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727794202; x=1728399002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6rajhrojHkVRisUU8jir5cqTAbpJIJx1r1H69v4hBkA=;
        b=j1aGWSxuTtU+UINXsFXDH6OlH+0V6VQCyhIgaBxd51WnjXMFHEM4LC5coiG4d6UYS1
         msCcjpFp0ziQRlHXAnqhZV4ND5N+yUA5dSdlXzyf43kRuC+3GV9ANiRtzJVoSIMZMi81
         aXCQYy9yqCdnb9AREDAh+EpRFlMu7s1mUxUAVsffpro9ICI+ToM1IwHmN1bI8PFpXj96
         WTAy2ufS+J8D89i8fHRJvReAARuDbd0XtX+qanxnBDaSuX1pK96teSAQDU01gu5TR5BX
         /LqTTrtKmsv4B9kCJic44saKST1NI7CycXN11D467VI7BXcbNnlr6jHIdUBV6i2XUzxZ
         To0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794202; x=1728399002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rajhrojHkVRisUU8jir5cqTAbpJIJx1r1H69v4hBkA=;
        b=c54TS32x1CJasKXiC3du87FBYecrmENfQGRqKkG/julSNhoRNu7zPq6FYOpAFLvCUS
         TODpi0F2rZyi/qi3lZ2YI396h3Mo7GSFaNHlnJDvGy5EAWUHzqEq42RLjZiz3y9fSCGt
         z2JivEZJOPGNY9CnI72EtqJQrpV3O2RRaai+222KCopW/5f7jnamdWSK89k6zmw8fScu
         QJ6doUAodGYdKMyWzh+gkGtGZlv8zgwnJn9u5+nnvHh7cg8UwXRISIvYWr923b9luLvn
         tTaxPxGr9DmyztappRitLXzzSvAyX/ELCTD3n5GDBh45aCN7nBwTeRQ0QcTvGlOFVzBU
         DzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOHQ8j+Uw54UgRU/d+r/6Hk5mamUKMzNnltyZ7qa7jPHct8vtCwd7RV5Pz26WMJPfP8qSzsXpnIkSB@vger.kernel.org, AJvYcCX9jnNeRaC/OGjyRlqjqprWINy4SWvpy4xs1KVj4C70g/2tmSo0s4twFoOdFJA4sDRTk9znY70PF3G//ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhdkxGhD8/kZnI6LrG2e3SZSW32C9izn8opP1PJ7eaUBfRF5+z
	mZVs9Bs0sgVru3PpQkXcVNjwa15mFd9eAbiqmEwznaEQogMYf8hS
X-Google-Smtp-Source: AGHT+IFjqQRDNZY7IGFmkc2i6hJq04soBESqCZTayNUUy0sGsTqut0wNATXWCJ5oaH5FDbtpxXyGpw==
X-Received: by 2002:a17:903:2450:b0:20b:6d47:a3b0 with SMTP id d9443c01a7336-20b6d47a99fmr132592265ad.21.1727794201885;
        Tue, 01 Oct 2024 07:50:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d8a2sm70505885ad.137.2024.10.01.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 07:50:01 -0700 (PDT)
Date: Tue, 1 Oct 2024 07:49:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Mike Frysinger <vapier@gentoo.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/13] Input: adp5589-keys: fix NULL pointer dereference
Message-ID: <ZvwMF9bI_QhBH9VG@google.com>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-1-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-1-fca0149dfc47@analog.com>

On Tue, Oct 01, 2024 at 03:41:32PM +0200, Nuno Sa wrote:
> We register a devm action to call adp5589_clear_config() and then pass
> the i2c client as argument so that we can call i2c_get_clientdata() in
> order to get our device object. However, i2c_set_clientdata() is only
> being set at the end of the probe function which means that we'll get a
> NULL pointer dereference in case the probe function fails early.
> 
> Fixes: 30df385e35a4 ("Input: adp5589-keys - use devm_add_action_or_reset() for register clear")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied and tagged for stable.

Thanks.

-- 
Dmitry

