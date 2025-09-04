Return-Path: <linux-input+bounces-14488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7B7B43F65
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 16:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0330A1884132
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21D01EEA54;
	Thu,  4 Sep 2025 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f93Yo6WQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310DB1DFDB8;
	Thu,  4 Sep 2025 14:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996686; cv=none; b=s/ODp2vG72/JW9wxFd2J3g4T+aLojZZIVMas1/uI+fJ0nzp4s9t4dpHbCTQob4T6hKP4RrudOqc84LnWVlCDWzJMewXUjQOQ4954SCDW4FTLIJPHlQH3BtrG1PFniu9x5EqSxwhghJeu2evOCd2WkYyOCnWgG6yntiWUL0WuFE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996686; c=relaxed/simple;
	bh=GuK9J3MneFwPzbwDB0BBKu3kuuMX32Rmipt8p+5YdHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZzu2vgfc5HIUrdMWBrCNRAS0ywljQe48PPwqMDK1fLdVPOeGePNLbHEOJoaR5FkSu3s9RZaFkgVGILhwNG2CXS3lwntbmTmyTlzyGdEfAkn+wZoxVceJrScpeRwqdgXiAiadoMvGdad/gEbe/8SI91abZEvhUJllPTUj4hRUS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f93Yo6WQ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-772301f8a4cso1538463b3a.3;
        Thu, 04 Sep 2025 07:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756996684; x=1757601484; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hIXnFpgK2P/uUPvA6WgkrL2qP19IF4VUwFF0Y71+IU=;
        b=f93Yo6WQu37Uh9WuIKxhq6hNUWBIKKDJFt4ZQVfqq77ws8PfOZnvQI/C52LvLdgbhv
         gk4hbOUSknngEH/hX5CV69hWQigj1DXaQE/GBcyXSuCoHKlqNlRPqEERaS2hdmfswYsy
         LT7jTjzgnx8t2gxaWS5shccLPeH6yKoemb6kMpVjNHjRXBQZvrJ1Bs0ZOl3m83v4iiAT
         QB9VYumehmuLMGMiIwHcMmMCD96MwcPPrigwuA3tSuP7dKS1Tm9FC9OHfy/rdSQtPZx3
         zN1fD6+KSScjcIuxajyqLRqHs+K5mUvUng0VxKklZj6QdStOG1UZEc8lyvcq8UCrwEru
         hlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756996684; x=1757601484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hIXnFpgK2P/uUPvA6WgkrL2qP19IF4VUwFF0Y71+IU=;
        b=MxQPKhYMHwRVMi5Z0ljXpsaM4Kvq2dzQPmuKPDfOLztB922GFYT5XvMChyoXGbejsO
         ui5UjLRGpi2OUu+hv6WHZAjePTFrRepXM3ncGSYEFJY+0tgSokTQ3s+pleYilwurQXtu
         0yAd/a4uliil1V5elGilrA6HAZ1/TN1yxjXOfRjJvKQa29JvPKHxdXfpUEr9E5HjruqU
         8eOcLpnr6v85kctn+JFCUURnoys1/oqnCzHZ4UxKL5goTS0eNuSg5WY6NEL7tOK7nbjc
         jeqjE3dgpoCeBb9WGVivREPS6VIYNpNavD67+zUy8Nnbqr6sTX5EywzMPLKSOGpwQ+rG
         EWbw==
X-Forwarded-Encrypted: i=1; AJvYcCU6+mTlpaS4HQhs6XxzBA25S7pRaHlSC7/LsNkk5rZ9wkxNWOeepZEA6QoeXF48Tryt3swDT1Bbf8nJhZlA@vger.kernel.org, AJvYcCWjpjKbtHXorZMtLvCMeHSEjaPjrR51yvHnQH1Z49fT6X2bzA1bIzbxV+6mNcKq31S29r1eawqH/e04hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ywklynR6BcgAKdrlVGRWKvtVOy1VcMnzyE4LFrISlRSAmymy
	m9cHIzQKIokkBeyPGAXOW2dZ2rB6OEGWSGhWrs3DpfnER5lyJqlKB7xY
X-Gm-Gg: ASbGncuqJI87KAPGfYdkkPgT833xUsHWzi9BKuxVelSplfvYITCA0EI311BwrFoaGTr
	anV9MtX/X2b8PLn52RbQBzdr5AJnetXf4F4Q/yqa/G49d7iIeOoQewvfuip0gd1UyWM31yvLt2U
	JBAr73Djl1pfPUPwjCWJAGEvnc7V+TyJ8cr/cF6zY8eSH/xheeQjdOwtpAAa6/HgE5h0bE7QHXz
	/XHQdWow6crSJQsyUvkISA7p9QaThKdZrdeu5iEN1kSQvEB5vQoET4xsVSgOjBUZiOnHdStP2eR
	gXByZ6fPGLYXv43EssntgP/Mo1y2RbWVXHyjrd7EuSZfk9zmNvOL6MymyZQX5drPsxrsa3quOQA
	PvYb0S54++tOq2oGXm2t4n0frWE+TK1zKQQ==
X-Google-Smtp-Source: AGHT+IHr7asjdV/VUMhsI1xXNsQH3WgFHSKaIJaT2rG5DICdHHEhNrevUzDKT3MSck9pNDyFMCPpwQ==
X-Received: by 2002:a05:6a21:32a5:b0:249:c68f:7ac6 with SMTP id adf61e73a8af0-249c68f938bmr5870521637.20.1756996684342;
        Thu, 04 Sep 2025 07:38:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e5b44sm19238520b3a.88.2025.09.04.07.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:38:03 -0700 (PDT)
Date: Thu, 4 Sep 2025 07:38:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Christoffer Sandberg <cs@tuxedo.de>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to
 i8042 quirk table
Message-ID: <wy4rqtj2xszioqfxamhpxjzdlk3azn2tt2ilv7lweaaplpi5cl@lkf244ubywnz>
References: <20250826142646.13516-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826142646.13516-1-wse@tuxedocomputers.com>

On Tue, Aug 26, 2025 at 04:26:06PM +0200, Werner Sembach wrote:
> From: Christoffer Sandberg <cs@tuxedo.de>
> 
> Occasionally wakes up from suspend with missing input on the internal
> keyboard. Setting the quirks appears to fix the issue for this device as
> well.
> 
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Applied, thank you.

-- 
Dmitry

