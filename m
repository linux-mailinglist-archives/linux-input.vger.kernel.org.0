Return-Path: <linux-input+bounces-13999-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059FB255D2
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 23:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E57525A1AD3
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 21:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7EE22D23AD;
	Wed, 13 Aug 2025 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyOB0rhW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370773009D2;
	Wed, 13 Aug 2025 21:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755121647; cv=none; b=qIIw4N3lOxeGbOuQseU//gj1KxjjQZGaj7AcBg9wsIWYXy+ocD6nqGyGSLrUS/w2/HmwYhNzCWDGbprQbKNs5+TYNc+BdcZZKkWQCMIUEWlFydeshpHhj+LHMWdZ25XbOcm0nWouIeLusXe7uQK07rp9RkMGUX939lmS9rmF6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755121647; c=relaxed/simple;
	bh=1VQIRUsprnF3Mig8oiLKRbOl5bzLLP0G72cXjJYWiyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaYRoJXTbmb5H6vB3gnFt183FJN+9anpqbCboSuv4AqwoLexDSp/sdmzah0llSmX20lBFI0N9Uo55bqXrkblzxvpvZOETD15SmM/aJ/rLJxfseTd4Fwe9yqbV6mm+HFjALuTfP6ylNdNPgwr5yryZwoPGpahjFOloNvV9sWO6mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyOB0rhW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-323267bc2eeso283904a91.1;
        Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755121645; x=1755726445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=HyOB0rhWDHWMiQiPQoNlIPH3RMGLr/zZc3Yji+yfjx9Zuuq0POGAXq+pp98cVNigwj
         5DT9FVu5LfErEPNpNZyja/E41LY3s+gAY+ssOi82hK+myjIsTPXPyrrhFQmocWbeu+5j
         +3vF6TFFK1QIuZgdFZQTmWrmpKWmZVjNctxt2Dw+1LoGTUXjysHgOkQCIzWSMRM1KV+h
         ZSj71JaTWbUm4dHvHyXd3+fgSpGsKJutXQIcfJdxKUQ1Xd4M3MKyGQCH7cSEBaG02z+A
         SkktbEgAKB1wXcnsI1uxUE3kRHN4u7iN4efwkfKy12fIYbBYY4oBa2sm0TfCX+HwWIWf
         0aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755121645; x=1755726445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jONifV3SAqgTpD6n3pEouquJmVfQbYGkPJ7FQpi+OiA=;
        b=geiCL3cXVIxUUSea+4XvJKnxpWu30x29CkEo2iuKRfZ1yfHVe4Ajj/rUztwjOzWRwE
         EkJpcglqAV08k+izqat2IkBYvnACLa9UUWTLJMxaqNtb/IJXspvFhCpJhf6E+HCYBw5T
         A6gnxUemVHNHAr0F/i07Ju44dtN6xzCfQ6E310oeAQMFovh4YcaxobAJx8/jCnMPh4y8
         RmUZMpx/mGBgkuu6I1SUBsGo2RHpiRJ9KhyVxfqqKV1MUSK6+ZCfCAr3RPZ053TSU/T3
         43m+k17iFEI8J1bYQxDSATTir3LnwY8Tg/qisBb1d9NeWtWu7OnvrlLlomVzkKya9Smj
         c2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYi3TIwKO/T/3n/2qgdbPppSlLBUm6bh2wv8NqtIq9O+7fs+xOIqLqFioMrsysxSSWLKhsAzCNM0XYOA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9gSYxqbqxlSku1okj+7vKTWQEgp/WDAvWkZcoN0u/xnQQ1FwT
	AE+VE5UurQS5SxUtAVk9wVbE8tl21BrEUIdD9SX2KMxlfejbTcHUztNY
X-Gm-Gg: ASbGnctB2fnq7w75faQDxcPSOp4VTFypLJBV1ck23I7o9MXYpRMIg6UU4qk9jplCkff
	w3zwg2H7Tk3SwiO9i8sfVcPwdnfpa5MOcWSFpB6rqCOrLvtb2Uf8mUeVv2p/vgnlA/LGzQvasRB
	IesUU4GqvYfnUkXOzKYVmMGurIos7s7bv5P+fXaK4vVgk4+kw1OzHl1nF88j7vCsCQS+oecgvpa
	VG4PQwM8KHipP3ssMusaRLs/aW3R2WHNHrkBFfYmw1UVPjdK7aRteb9Bt/mDx3onwdI9gBn4hsY
	zWAn/z+sNwKpv1R/+Cw9QqUQLR6lGU8fwITurTDY2U+6WEs0Zcg9aJge4l83DFb6YN6sHbvqU1Q
	tEeev1l1WhNkIcQwixYo8wlTd0kvUoGFOwQ==
X-Google-Smtp-Source: AGHT+IFnG1VfjTfFzYy9SU6px68SStWgfbepA09Klycfgu1ndr7pAZJLu+JzXbLn9aZDNRQzy9oRlQ==
X-Received: by 2002:a17:90b:39c7:b0:320:ff84:ceb5 with SMTP id 98e67ed59e1d1-32327a634e5mr1308738a91.16.1755121645110;
        Wed, 13 Aug 2025 14:47:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:89af:72ea:c356:f3f0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323257c27absm1022898a91.27.2025.08.13.14.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:47:24 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:47:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/21] Input: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <3hjodmfpiuh3xeiwugtpfs2sqoinb2toir2v2rchhv3nd3wdwj@2uiynsb5bzlt>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-7-wsa+renesas@sang-engineering.com>

On Wed, Aug 13, 2025 at 06:14:52PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied, thank you.

-- 
Dmitry

