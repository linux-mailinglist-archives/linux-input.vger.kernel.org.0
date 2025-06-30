Return-Path: <linux-input+bounces-13237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8768AEE4EB
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 18:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B263E7A4EF8
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 16:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3184328F933;
	Mon, 30 Jun 2025 16:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEdnNNLh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58932580F0;
	Mon, 30 Jun 2025 16:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302036; cv=none; b=SV14HH9yzH/zfq3RWYdVeqJOKPfwHEWz8r7sA/oXNRTgjnqwvLuyutuU/zVYaSBpfHCy4tQvRomRCmfPUzBkloL2TIkRxkb3IJsf8BUtv4I5IHBHROPF9IuugmsSXySlG8mTKovUD5J0c3qZ49g6Oo3uL8gYw2JKodJPzc8xB08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302036; c=relaxed/simple;
	bh=Kdnnb4D69VxZOJNmENQk4mHq7LJOEUjRiIRlpgviKn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh/Y5agj5I8/wxrQFT2yGmglDEhuqK2wasKouW7egar8r8NrE/ljFXOuJzez6j3u9vgp9GnKBkqn3X4P9BPQiQZ/jTRJEZiHQkHdq8VgPH1l5cCOBPhgGDUMqSmGqiOVG5P8mni44G77rUUIyU/CbzgyV+U9OfTdF1SZG7HLo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEdnNNLh; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2257646b3a.0;
        Mon, 30 Jun 2025 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751302034; x=1751906834; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iY/hTIZ/gvLsdKZo7lZtiHxsOyS7iQMgBig8vPRRf5w=;
        b=iEdnNNLhCvo+mW8KmZHFjNEckWilKKAOJT38MhulquR/HqMbwh1GmYzQxhMfQaV+if
         NPmGVV7dDUYqSHJINO45hd49/ynrxc+awSX0fx25GEfkPXmQjmfjcVWnsMu/YixB9c9Q
         gp/jGi4YMRphGkTlfSEx4YmHCI2I+UNIXLs1u3QRJW8CpWcQdetlBOvdMiOqXPzCoag0
         HeQZ9YDH1vs3utyvqFmyr5EcQ+Sg3uVEk8PNdISb0/qbv3TM34mB8k1AhczOCFjvJ1id
         dp/L/XHvG6yPKTU37XPd8mWfXhhYmy4shAXsTKgYBzRAOJ4Q5yVSCdkkGH6Yizk3fX9n
         Wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751302034; x=1751906834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iY/hTIZ/gvLsdKZo7lZtiHxsOyS7iQMgBig8vPRRf5w=;
        b=Rh3B4+LIh0YJ2YDitkJ1muRsM8jnkCYbHYlrICcxwCoOXuhT6uRCLUkRVT7AjhFERm
         xjIjQvv4zNdPDFGQZ6YR+eiISF/JTbn8bAcflJHKTCf0mcWKaHfF9gvmGyjQ4riedpCl
         suBtggToeCbMTFiNcYzMoVSGUY1eC/ItTueZYHxf9Qk4irIHkYA2/Jiw+g20V1B4PoZL
         1LJfw+ezpS4nim1mNfCmCXv9JqQat5gqb5rVOjWqkj6pYUSQBd7MUlkALcfK+SKxw46G
         uKcKy//TB/Zm3jSy1LLyP5+ibMf5ZBkH08xrnS5Ftc/Jt5YFvjVsqVk3PtjM2iy2eG9P
         dGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0HuySZ9P6GeJbo5mR05z80md5C+SVJTdGNnJficjlCIJ2Gt2wVHvHQEXd2P+FHGhXpiSscVdUC6MA1TY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzECyJPreUIdWXjp/tZMvQXJ9091kphJaFXEzEkgfgjW/f0NnOV
	5SLyDzJvIgHxBFWBH7sHo03cGiOjIhEzc5sftlUAf0MbP17HKTSjbZSy
X-Gm-Gg: ASbGncuGoGMDKBJqB66ubimw3qFxnVUoEaHc6oSlLAK5beDu5FRnFB0BIOVk1kTrIcr
	M/kFA6/j5nwNW8bVFKFst/5dpoxSFaueQlJRO03pJyoXu+XSOWPy56iBp2KX7oKAR5s2ib3++LO
	EmpAcInQH8yCPaSSOu4F0ttd6iso3ZjpoS9+Hg1T6kz2wqNGkwVj4d3yssr0HVW1c0AqIRSvVh7
	eoRetpPzJE4+Z/WzsQFnfedtGZNYkt/kalpSBXrwN9db/hdS8jrjxlSvBpAP1XNDSqajzj0kRCQ
	/+u4Z+TCK/F3godsXp7mAu01YVySaAQvMgX5Il/5p06TV+yaPD3dEA4yxCNOjw==
X-Google-Smtp-Source: AGHT+IG9jq9ZJLejjxDTbu7m8qrKofqReKrLSPHkpNKE10yzAigb30sRcx2Iag6Mho41WtMtEwm6qQ==
X-Received: by 2002:a05:6a00:240c:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-74af6e89170mr16767121b3a.2.1751302033802;
        Mon, 30 Jun 2025 09:47:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541c399sm9742119b3a.52.2025.06.30.09.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:47:13 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:47:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v1 1/1] Input: alps - switch to use scnprintf() to
 suppress truncation warning
Message-ID: <ibj3zqv7amhu6yqyfjunpj6ibv3pna7zou56lp3cry3ibwvw6c@wts2psxqswjd>
References: <20250630082245.1416796-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630082245.1416796-1-andriy.shevchenko@linux.intel.com>

On Mon, Jun 30, 2025 at 11:21:52AM +0300, Andy Shevchenko wrote:
> The commit 76c968e75715 ("Input: alps - switch to use scnprintf() to suppress
> truncation warning") converted one place in the driver while the other left
> untouched. Convert the other place as well.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Dmitry, thanks for fixing those problems! This one can be folded into mentioned
> commit if you are still can / want to rebase.

Thank you Andy, I strongly prefer not to rebase for-linus branch so I
applied this as a separate patch.

Thanks.

-- 
Dmitry

