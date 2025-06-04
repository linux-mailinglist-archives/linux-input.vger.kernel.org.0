Return-Path: <linux-input+bounces-12707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6673ACD73E
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 06:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AFD03A6E14
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 04:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22A23BB48;
	Wed,  4 Jun 2025 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6xggjYx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A2217548
	for <linux-input@vger.kernel.org>; Wed,  4 Jun 2025 04:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749011897; cv=none; b=Ow05e3dIoQ8y5ZooZOaAA7O8/knuDhjKVLNEqT2LdeiJKQ4w5mWv+JMVfBtBu6TDE+VGB0ldLfU7WnYjqNtvMbyTSBiRm7+QDUGmeOcfA8Csd8jhaPjSXdGAqBG/OgGlhT+Msak11PS4i8SmkgK+rlvpjo0iAB/dAB+LUk8F184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749011897; c=relaxed/simple;
	bh=q+jMvH72wRuJdsABFbOxCP+t8Np2slzG+K8OZdbEk58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOxUeS9pDCGVpO65EwmBzj8YUkE1K8ARnTCDsKRtuuSgfgvZHIksXh0QxEz5pIYLxt6Mw+4CQt0Px4JCB0DsaHofmqd9AJ8l/75/chK4cGr2fZa4Kn6x68fHifK8W74mxnwB3/MHPMcDZ5IozlAcW2E5J7u8Yj9URvkKMxqzyGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6xggjYx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234fcadde3eso76141305ad.0
        for <linux-input@vger.kernel.org>; Tue, 03 Jun 2025 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749011896; x=1749616696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLnqMbWXxmrSOXeFYhyoD/tbhF0X4NPXWn5+Z6TrJII=;
        b=Z6xggjYx+JASO4Aicaa+aVssJZix+7ixMAZvSD7rttLMnz8IvMJnwR8EOAYvCcaSA/
         Z0lIN3byi3QlS3JssDcGq1pludflDqGlO9IwKgiD1QDWAAp2cT1LbJangfQfSec/aEli
         Gz3J23HqOlicIWAR+dUhn1gFi2P0JeEma+pMv1h8H9B0zanu3hj2KyMlUWIr5YSyEA0T
         T/tTnQJf1aoD7PQMFRTuLQFieh3s1aqybNVgLTvY9s1qYwtuOOkRkSlNtNGJTSSsPZM0
         ygYSJvl1N+yW2Ojo8qGGYFRaZswd03C0C9wH7zGfbPM8fQxRrgyNzYG5WjUEAsPTrQyI
         QYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749011896; x=1749616696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLnqMbWXxmrSOXeFYhyoD/tbhF0X4NPXWn5+Z6TrJII=;
        b=b1XgVcz3RWVZNcLxh8CevTrtzetGacDemaCz2he58QXXL51YtM9XZvR1LUBCVoItRu
         tPPrAa+Ln74iOQh2OKXzBqv2c3jtheFlw5SBVXlpQ8bQsxwnn5t4hpAD1ucuXbHz9AIr
         dDpAuJ6EqJLVo7XO4089pRMzaRr6iP/62XYcaGy3kl7nazfx6BSvw3JwINsl6tNr895k
         gRfxAg6i71FO3jarW2y4zAaRT/AnFKjPY4n4bb2HF9eQj9iwl3+mYQQrs0sq1nwCN4cH
         vwd6aqfdiR3J69iZINamifV+o4mzjp4gim7BwZdLOwzZfSgjVBCUOiHaybJmHqPYm9is
         bLkg==
X-Gm-Message-State: AOJu0YzJZiNpOLnm3wxyhW43g/JgllgZ+CTXYiVozZqQrAwpoCXaYzlv
	VDvCsw/8eBW6C98ktO7Z7lHL5DwnTcvMGc/smzDgME9m3PZGHvOVrm4R
X-Gm-Gg: ASbGncufcqua6gxDS+11fBzpBrHpMdra4wMYXRiBk5qvF2l3XiZt0x/rD1cELqNcIsu
	lkuGv6YX0S3cpfMekd9DCttZ8mVuYyH2RWsm9zvbNR2VcIGKZtBCgaoZxbxDqQ0Q5Ll6Gn+H4MS
	HejmJVTgngJTZZjq4nu+TMp39+OLyELM/65UbLqE/6ZnZcfF4LVn1uE1CPR8oIbzPVS1Rhaqqtm
	iEdHlCFS7xGikzoF6TZPjkdWIyFrJ+kDqupXukMKCcMYNf2H/WbwKuEmuaC4SJHEzgf6JRZexJD
	P2hyQwNlZqsk6Q+4Nt3OfUbd/h63Ta0UqCPfEQ6wMq5MNaeXgqdR
X-Google-Smtp-Source: AGHT+IFtbOTYNoDTuIJ1iYdF8ycN7t/9qboU24YKiUMRknehEk9R97vD2fVywbjw2hrFMVGA6J8cxg==
X-Received: by 2002:a17:902:e849:b0:234:ed31:fcb5 with SMTP id d9443c01a7336-235e11cc209mr19070325ad.26.1749011895622;
        Tue, 03 Jun 2025 21:38:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1679:3775:f8eb:4ab5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd7602sm95527325ad.109.2025.06.03.21.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 21:38:15 -0700 (PDT)
Date: Tue, 3 Jun 2025 21:38:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Markus Koch <markus@notsyncing.net>
Cc: linux-input@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] Input: fsia6b: Suppress buffer truncation warning for
 phys
Message-ID: <5hfvnapamjgjwz55brwnqtz4o653wqxulbzclbefozrlmvy5iw@i5erjhtopoma>
References: <wei2gdgywkub42bfbm7b7koh5ln2d2akz72vxo6vcqbfd53bse@4edazsdbkrha>
 <20250602175710.61583-4-markus@notsyncing.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602175710.61583-4-markus@notsyncing.net>

On Mon, Jun 02, 2025 at 07:57:13PM +0200, Markus Koch wrote:
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501020303.1WtxWWTu-lkp@intel.com/
> Signed-off-by: Markus Koch <markus@notsyncing.net>

Applied, thank you.

-- 
Dmitry

