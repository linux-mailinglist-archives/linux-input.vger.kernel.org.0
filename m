Return-Path: <linux-input+bounces-8416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB49E610A
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 00:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 257561885705
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 23:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726A71CD210;
	Thu,  5 Dec 2024 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="035i0Ejl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C74B17E019
	for <linux-input@vger.kernel.org>; Thu,  5 Dec 2024 23:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733439961; cv=none; b=XhxggwBbYS3BcEMLh6dQdKg+wdWWw+N8knkUjMds8kdw5b+/7nSa5hF9tDCjPFmAaxC4X/f3PGFKbhdJLueC9sO78RxmyR9zyB9+Juwwem3YHnOGlzVKQN43lb7hq4UwNFM4lJ0QdytbOgSJjBH96iy7A9BfMaE78qjJRQlxP2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733439961; c=relaxed/simple;
	bh=KtxXe4kgB0BnW3MsFzYn465Cqu75ZgmvR8VczHsk0ts=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XrBc+hCDnIfWxiw9JBmYlaU4NADO3TnVa8Lme8KiT44P7Mqxq6xd5noMsaqjXaojxnElmjmwNEykgs6mQk0vqp+wy0Kw3soE2JCfEWGnx9n6Mo8+DBGqe4D0UOmqKBfRao8TgUu3ZhDizI3UYczuVBM2akwB7PkD3FtM6hvEpsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=035i0Ejl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-215b13e9ccbso14521785ad.0
        for <linux-input@vger.kernel.org>; Thu, 05 Dec 2024 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733439958; x=1734044758; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JF86DSQKrbpE7zkN2nZ2brMlp1Djxw82gJt7o2CQPAc=;
        b=035i0EjlumNK2kL3E73CEI22yu/W3Cz+/ySlvV5hxJbhYCOgWW9u52L25pH4xHOElp
         DMc1vnF3jDAKd08M9sUEU/pLHYHIwfVxi1ICfyhq4mSjojGIZ344IT8x7l6tblc7ASxX
         cT0sz2k/id7+3R2u1I8gPgCPDfDKUa6FBTCdgNuHgto2SBSloQSWCBg80IVofiZwii+y
         gDDnrAwv9/ud4gjlJZ08D0d3CIEtcVe7qeB7fc1ORMCuK7NOGOFNUYyfYRv3kslhAihU
         AQan1aaDS9oDNO8ujM+qrWv/AqL7JCcVREnNjgx6EPMnVFI6OUPYe69MgKe9A/mFuV7R
         gFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733439958; x=1734044758;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF86DSQKrbpE7zkN2nZ2brMlp1Djxw82gJt7o2CQPAc=;
        b=WQTIZyIUIL5WKT7K4t0fvFu9qMJoI6wQbPxxG5De+7n9Kez6yECbyhIP5gEaDiEicz
         iaZ9aE21Yiklrd/Il2lpQN+Y4q68T4DrAELLz1XG1ltGS/wOfu3iHrQQW9MsNshfnoDg
         FQZHkyj5idU8ZcwZqoFWRUcebFvfTOpT1PIKOtbmtDUNBLgYetnNl+Puhcrsd6+1A78p
         MUVNwm3iqKK4AYAvvm30pjWY1x08LfNkMg2mY82HmHXLPBxyJ+1qcQ8R7Eqh98vUu1Ho
         N0Q8mZ/bf/C5dRtwZ1vtOnt1MEkGeJNpuwYKMuyhKGgVlPAjU3W+YUsNqpzZpA3WfNL4
         Zr0A==
X-Forwarded-Encrypted: i=1; AJvYcCV+yhuW81ph4xniTLehfv4aLTd5R7KuJxMpHHgBsXHNAD4ySRbR82y51va8PptE8jmBeqqgSPFwuhef3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzIyS6BLlm2v3j0Z5qeRgMqtsSNO5AJflIN7Y+j4ven0T92Omx
	46xeHjw/AMho/ftkF0qBiAZGMTDvwhZr8tabmyiSduFAkuriBhYL3GQyLQFvm8I=
X-Gm-Gg: ASbGncsY3/7dfxJMcU7FAnZnFb7KDdON0kcP+Pvk6B2VJMDRQbMnGEhYxMbOIdSIkt+
	19gMz9kPOVv9G+D/Gp64r4ZaCw3gL9dJiItzzC/uPb3C7wTsHvRa8QWIue4x4dqI+aot5vXMnsv
	Ksjp+KCdkJhZ/9mIi/GBQRiPFoSbztpAL1hMMXWxZ7MSm9uBDzv1f305tIHG/jDCfKx/Yqqf03L
	BCGaTHEN1cfv8e66M1RMbNFyeCfEdfBvGXblcIWKqO7cKZC
X-Google-Smtp-Source: AGHT+IH2vKnwRVJfKJzkSGh5FdTz/wRZJhZsXQWgmQ3KNajlOo7D+P5OBQ8tqAAXIc8fvqH0d73N5g==
X-Received: by 2002:a17:903:1103:b0:215:acb3:3786 with SMTP id d9443c01a7336-21614d445d7mr8493235ad.19.1733439958591;
        Thu, 05 Dec 2024 15:05:58 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9df9sm17546475ad.148.2024.12.05.15.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:05:58 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andreas Kemnade <akemnade@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andreas Kemnade
 <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, Conor Dooley
 <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
  devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] ARM: ti/omap: gta04: properly specify GTA04
 touchscreen properties
In-Reply-To: <20241205204413.2466775-1-akemnade@kernel.org>
References: <20241205204413.2466775-1-akemnade@kernel.org>
Date: Thu, 05 Dec 2024 15:05:57 -0800
Message-ID: <7hldwthgru.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry,

akemnade@kernel.org writes:

> From: Andreas Kemnade <akemnade@kernel.org>
>
> Specify touchscreen in a way that no userspace configuration is needed.
>
> Note: if the devicetree patch is in without the input patch, things
> will be broken in a different way.

Due to this dependency, I can queue this driver patch in my tree along
with the DT patch so things go in together.  Let me know your
preference.

Kevin


> Andreas Kemnade (2):
>   Input: tsc2007 - accept standard properties
>   ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties
>
>  arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 6 ++++--
>  drivers/input/touchscreen/tsc2007.h        | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c   | 5 ++---
>  3 files changed, 8 insertions(+), 5 deletions(-)
>
> -- 
> 2.39.2

