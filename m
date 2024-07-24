Return-Path: <linux-input+bounces-5133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5728893ABDE
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 06:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CEE41C20F6B
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 04:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CDD1BF2B;
	Wed, 24 Jul 2024 04:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENmnDZmI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEF10F4
	for <linux-input@vger.kernel.org>; Wed, 24 Jul 2024 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721794263; cv=none; b=DAQpXGK6pIyh1h2JI4WwqNgS1sde1sz+LY6iwacF9GLZAdulip+m87aCPTO/CD+Mq0FDF6thQm6c2BAtY1D1MFq2MO37i5VWW+bzJzaGgaSuNoO1YQTLXaZ/t/JaDcmTtrZR1rbeLcj8h7yspiFyrXVljZJfgGm4rSb5KARE5z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721794263; c=relaxed/simple;
	bh=nKcFkbWhP9MRa9KYEtLLwMEBtGsj37dlXQVYBLO1DOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krnD4L41D6rf9TfNx8jBEoRTB7n2XWyOc9ZwKH7XyOeEL5Z6bP+MYbDRCUN6fG8x+j5xsuiczL6rx81b+sXlZtRruerWSiZkxRbT0o/A0WtRikveuUbzFGKIcELJeSAXILje/Tz4OVFze0p31RqL6l9T9kCPOrDD8P22kcK09Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENmnDZmI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fd6ed7688cso13531495ad.3
        for <linux-input@vger.kernel.org>; Tue, 23 Jul 2024 21:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721794261; x=1722399061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1sIxsPPbVayrMIs89+4Rll0hjyOx3GgdQOC+QwptAY=;
        b=ENmnDZmIHQJiTBY8sPaYM3tGhyRpZz99TgcxOMY9ExnO8tMFeRJLaXQrk02JD7z28W
         2UBAivXmUwl1XiWQb2nVFOw0V1dqTHyOyG89432944u6LsJ6pwqOAo+kEyxSHBPLB7HI
         QmAmoHCOVFm2w6OL95fdLnUiIL/5Z7hKw6djlQiLl4YlnUUcduycateVGeM72Rk0PSpI
         evy8pHN6a7vFdWnMc9t3kUdh2pP/m4Fg1QvywwyN8xqivfyjlb/j5bhRgSAGJ07lpVtN
         iOkRwZbqXiVPOs9DhEPSIVzOdYqcKK9tED8hyIhWmhNny/yXr1HgT5mTvBh3MuDxg6Wd
         Otvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721794261; x=1722399061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1sIxsPPbVayrMIs89+4Rll0hjyOx3GgdQOC+QwptAY=;
        b=hubI4248d0H6PoKpZ3eAeQWxz1P6P5KrLUZjxwq13WQqnXm8pOIbRn6BGlpUckvPdE
         /HdI1iEUuaKJbu8loSPDL698t2BnvjKu1WLbX5gwWTNHjzXoaJLMJELc9VKapuA9qpmC
         8ggcS8/j8G37sfQh4VcZeM+agLDJih06YZ7rxVRlKCyCfxxMMrtzcySS34EIJfTSXRwB
         XvU9hbz0r77zPD+mKYUs4ctg+cbWnyy4fdyDNqpHPpqLQa+/UY12bsWDrrOzqCMKgoUo
         bQjBX9xEXaS2QhlsusZ3yR8F8b/cWbpSlwg7qdjjBo1tTQf9p5Xi/vdjKG/5qUl1N/0q
         wyJQ==
X-Gm-Message-State: AOJu0YyalnAn5+H53NZ+m6OUiKrdoH/VkcBql99dslnpVCkUjPHubU8I
	AgBen55Ysc3PqVkCiWRw1gYYckvzCKgFv3kKwYl8yAi/TfzJohyz
X-Google-Smtp-Source: AGHT+IFHzRJlo4lYuJ0q0UiwZx+3z1C6wy9jBnO40CsDFLyi7sjSH4VqqK7pi5NUKSad3aNveC19Ng==
X-Received: by 2002:a17:903:189:b0:1fd:9a23:90cc with SMTP id d9443c01a7336-1fdd552f247mr11291675ad.26.1721794261171;
        Tue, 23 Jul 2024 21:11:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c2d6:b5c3:537e:3830])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f3181f4sm84114605ad.163.2024.07.23.21.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 21:11:00 -0700 (PDT)
Date: Tue, 23 Jul 2024 21:10:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com
Subject: Re: [PATCH] Input: ads7846 - ratelimit the spi_sync error message
Message-ID: <ZqB-0kn_zN2Bdeaj@google.com>
References: <20240708211913.171243-1-marex@denx.de>
 <8AA709E7-9739-4CC9-B6EE-77D152B35984@gmail.com>
 <ef0cb137-5155-4956-bda0-70757a05066c@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef0cb137-5155-4956-bda0-70757a05066c@denx.de>

On Thu, Jul 18, 2024 at 02:02:50AM +0200, Marek Vasut wrote:
> On 7/8/24 11:39 PM, Dmitry Torokhov wrote:
> > On July 8, 2024 2:18:57 PM PDT, Marek Vasut <marex@denx.de> wrote:
> > > In case the touch controller is not connected, this message keeps scrolling
> > > on the console indefinitelly. Ratelimit it to avoid filling kernel logs.
> > 
> > Instead of ratelimiting, maybe we should try reading touchscreen state when
> > probing and abort if the device dies not respond?
> 
> Ratelimiting also helps if the touch controller fails or disconnects at
> runtime, which would still trigger the scrolling messages. With this cheap
> prototype hardware, that happens.

OK, fair enough. Applied, thank you.

-- 
Dmitry

