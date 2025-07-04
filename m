Return-Path: <linux-input+bounces-13375-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E48AF874C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 07:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0589D1C4843C
	for <lists+linux-input@lfdr.de>; Fri,  4 Jul 2025 05:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C955F1A2545;
	Fri,  4 Jul 2025 05:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CldwMpQZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9C13596B;
	Fri,  4 Jul 2025 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751607161; cv=none; b=XQfAik3mu8wpZVJpz1cD8wPbs959MrHjAwti7PwSHJei02x2DI/bvEfToVAC4DK+TXah3KTyWTxptZWgcyuyXaeT0J0mop+M774CHcGpA+VcktlpEio43S24onGDQyV6rBO27+aWPxx70ydl9P5J3PzEpMMKNG0vKFGTExxygGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751607161; c=relaxed/simple;
	bh=hEti1TrZSe48v3cppOlc3CtRZf1mYcwrG7F2f8GimrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGHzOrZ1VK5rTSmUgzou3VA247HoNp++3tnJ/ebjeq6Uwy1PCd5Ro4yZtt5jj2q9ZI1fP05EVZnbI7JxwR+7bcNmUIBFqmIzDHQtn6z6VFw96Tup1w9styitOBIgxiHEtT7gigxVz8Csd8MM8qLZYw0MDW3mftALEcg0BQBwXKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CldwMpQZ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234fcadde3eso9715355ad.0;
        Thu, 03 Jul 2025 22:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751607157; x=1752211957; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rmexHhVXCDUpQW+1Z6yfTYfDac8TEg/EksaCoL3WLIQ=;
        b=CldwMpQZViUKew6Yl8/jEd25dadHthpjwYjATbuGdZ28MzV45QiO/IwkupbiGdbD3x
         cPlHhUWktlfYSAZjkAgv6el2zGYFJeymzNuc1iMzQuceAr/ucZD3jLAvgMaAG2neRYgZ
         t5iQBc5zLoj5rzFeYfeAS95HhNxdc3SxIt3UakkbZNtrssAD44iuFLumo8treCTMQKKM
         puLApdbg+TJOR+22F/BodiQjnm6bZatkGH3ww8JwWWYIV53k4HF3CZs9HIjU3w4waEmE
         EHBdHlg34iJkrqYrTSpJZ/Ab2v5yibSYHquAufdm2qPfyZsfJq3eoaEtyloFHNZh5aZz
         xdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751607157; x=1752211957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmexHhVXCDUpQW+1Z6yfTYfDac8TEg/EksaCoL3WLIQ=;
        b=ABodqRrvUo6TdUeKWt1F0hMselnBth8rZzYH8ouhAzQJdQGxVnxHIRYoYlTuyUGvyR
         VBOXJDvjJlL0UKFcBM14eDI/l1Tdh5teRm6aL9DUNzQuFy7yPXDyNGInIrVcAqZGS2W3
         /mIbZGuoPMvNzKH1Q26GzBa7+lytFKkBOBHbkZ9UswrlARY7dYkQ9r7zxaElL+V2vCBy
         pORTplW5m5uPMAUkSxmdIESZ4d2OXYM1as8mWgO8d77dp00mWIl+b3RMzxLoGRH+RJaM
         3jN2sNjllNC2F8WthhbcHn6dUNOEMXhMdeOaK3KuejqPe6MZb8UFsLCeGyJIthJXNnYU
         HCQw==
X-Forwarded-Encrypted: i=1; AJvYcCV+1G8gPV4ZgvExQT8HKSZ6vvqm0uOJoHy17OvqRNRFexq40zE7tUcOd4DEwI0QdB6HT8NXAOT2e/hs6g==@vger.kernel.org, AJvYcCWmfAHr3VRL23+CQpOQMQ3SrFJVmpZZxteH/nyTmeFJv+tqL/RrWE5/ojfJE1iPcpiqk7STETedbIS3qjCa@vger.kernel.org
X-Gm-Message-State: AOJu0YxN9Z+NURCZWiBppnnhbflJ3HAH/0AoeQ+Cen75Oq5FIfnCqSJa
	qc54aGOvDCA63dloQ34Ct3Bsqs9zrj+VBdQdjLc1E7b+IUFumICBnsn2
X-Gm-Gg: ASbGnctHlp5/995SnkE5Q5V7Mziaue0Ed09Jwtd8Ks0+kYG/LjbmFsfOVfsXAYLE5BW
	en+j/zNKy6N4HvCuua0f7sk3qSmSol6yHL0PM7orG0Z1WUEa4TFBGufGccu1zF06iqr7G5FbfmT
	if1NDxGgkVWBOHCVVK2nMUwTCqyZtD4XE0G72Jcd5fe8qakJVwG40R8TyBLMNWhOlsrMsGcEDHi
	na5n/33654nK0tJ56uwFpFySx38V94MUUXSxg0CneobMRFBIuBVH7Zp65uD5aPu7tUkDdNFiMjL
	hXda/KnXufY62Su2VCtQ0yVP/PgYRHhs5LYcTtdzNvIZSNsIP9VqQDjDTKV64A0=
X-Google-Smtp-Source: AGHT+IHtKTGW58fhiLNMAfT5Of81ji0ae1RG4cIW/kQpovXCTFIPJAJ+Ncmqzfve+3Xmejev2XFIpQ==
X-Received: by 2002:a17:903:1b0f:b0:234:8f5d:e3bd with SMTP id d9443c01a7336-23c8759de73mr13971395ad.39.1751607157136;
        Thu, 03 Jul 2025 22:32:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8ddd:816c:9ca2:2a5f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455eb3bsm11756395ad.115.2025.07.03.22.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 22:32:36 -0700 (PDT)
Date: Thu, 3 Jul 2025 22:32:34 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hongbin Ji <jhb_ee@163.com>
Cc: jogletre@opensource.cirrus.com, fred.treven@cirrus.com, 
	ben.bright@cirrus.com, patches@opensource.cirrus.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cs40l50 -  fix possible NULL pointer dereference
Message-ID: <25je33y6xxdqgccdfgr6r2boqzrtdq2eyb52ww25pgjox5ln4z@r5dt3ggj6bsk>
References: <20250704025838.11810-1-jhb_ee@163.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704025838.11810-1-jhb_ee@163.com>

Hi Hongbin,

On Fri, Jul 04, 2025 at 10:58:38AM +0800, Hongbin Ji wrote:
> Add a NULL‐check and return ‑ENOMEM if allocation failed to prevent a kernel oops

Thank you for your submission but I already have a similar patch
applied.

Thanks.

-- 
Dmitry

