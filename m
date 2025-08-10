Return-Path: <linux-input+bounces-13879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0277CB1FB5D
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 19:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 53A1B7AA749
	for <lists+linux-input@lfdr.de>; Sun, 10 Aug 2025 17:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8AB1DDC33;
	Sun, 10 Aug 2025 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XS110JeH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA68FC0B;
	Sun, 10 Aug 2025 17:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754847105; cv=none; b=F944olMrv7BrF7YN0QVzLCPoISKr9lpyk+gy9QqElyDjNl+NQg35LiLv+70HAxUQdDfQ7ZL3NnIyfgOiS0M1SBsdtU1sMYC6tVNCuc8sE/18hTLQuMMV2dBWGmzGIi7q9CFaxk1z7oF/ZivnUI34p+a8BYdCeJNPwfQQcXkGLfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754847105; c=relaxed/simple;
	bh=aGs02sc6LESggoW37yomq+DDwZ03g4IwHFGzac0j87I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPWBPvh7WykkHIBaju4JTe43wQ5GX6hevwG6oI62heeFfmlGMVBidNelkdhSy7z8zmBJ/sWmssQxOnAf2Mgj4LUe+yijQ6OtjV9cs6u4hCSp3NYx7E8YEi6O59iy3HOXz+QjqF7xzr6dvfoGeyh5AAdDepAWLh9UbPZBnUTTzUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XS110JeH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3322d10e29dso29533171fa.0;
        Sun, 10 Aug 2025 10:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754847102; x=1755451902; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yTaJLRTtqeXWxdYr5rgLHJrchc4OZe1+0HwTL62xei4=;
        b=XS110JeHZN3RcOCy+Rc3aYk97Xk5vPvYzrSl/csOl9QMt6pEH3Sxcnxv0QhGg9FERX
         UnNftXGirX1nBmBQg+CgTmt7eWI7BedoXZ75rZzl3CaBpdRv08Ol82Fyd+odujz4OIhF
         zKabsglU+jXqjfm8by4DyVVn2vkHQcK+thJKvPhyxryH1y7tH6WsyRCiGYrV/ET7gDiI
         Ayw1Dltcj/lcnbLVopgjlAj80pbJduW0ImoFjWzmNyQ0Lp0aLUi0+s7XC37J+Tn3JhEq
         0eNO8d7/DBICF12Ngis7YEYRN4vNtRkBJbeG9yKalzIynSbiGjm9Tq9KZUHBCs7tT+QZ
         qrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754847102; x=1755451902;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTaJLRTtqeXWxdYr5rgLHJrchc4OZe1+0HwTL62xei4=;
        b=w2A+GLKOd6QQi4JQhQ2dbt6qrcwGaYe0Qs89XhYRN+qLEYDmimRnQE+ndiLNpFFMkt
         NBNCgap12RSiGswfVUTpVF6Dyn6JKJWff+xoPhAC0OomPuPB4j82w7riejwlHUm7ee+R
         PqE+CMOSl6IsEwtDzOWDLGWBDuD4zSoS0kk3/vDTI6Um1p7s+ZepoQNmwTspzZEm9i2m
         /iiiOA7LYqalcP/UucD5+XywyaoZic4pgbsBFcHQWh+thnK1QOHz9XH0yMNhLf5v7hWu
         v83zcJqvS/Hh79uDL85B0PDLSFqIZXuAMwq9EjBmyvfEquiFbtjoDnY5V+G7U+DfkdhO
         WY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUj0oCU7xRmGoQyk0knci9cTQhw5nIP+ZcwmQBffkwaLCWsTdR3/PeR7L9og2qp54DqF3B9E2jufKx2M5oR@vger.kernel.org, AJvYcCUnz09/5Yyow7yan8gPak/Pwog/poj6/7zKxfpD2AGvPlsixULAMIC6RaF3Bfa9B4YuTnhAQleU@vger.kernel.org, AJvYcCVkY5i6hHjVP0Q2OMz8ZCMmp0NCxvnbJsNqtdq1+N5JL4pE1B/FGU10JcvGsGL/NqomIpeDFRgo90bvDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBGvgEDML5krzZMK+iDc1N7DVGjU8Q7U0O5e+P4rDLSJkV0k9+
	SUXNxoY17Ygr5+v35gji7hcMG5BMWc/qk9Ykox8AHaEf2EZDNWUXjovKVzkdqg==
X-Gm-Gg: ASbGncuHVMvhneBY6kAi+amMFn38UaGVQInrnd481jOEb1G04q+JAQ2HrF1IEpz8gWO
	aGP6ZZ+lADFDvm8IeeE71kP8cndjbleMtbh+ra5hn7BSXJbylD5H6sSzeBc5ub0G/xP3y4Hanc5
	/H2FxQFMtAm+v7J2/FEU2LxcdWzKDvjd+ABBJQkL4EAuQtA+mTFDb5sDql0ieebR8Sb3oTzHqDC
	MTmjmtYcUmPUIwNdaLu6Ts+OR1QwktXXMVwtdl8KvHg676GL2Qg8SsJUNnglw6ZXG0xv6ytnGz0
	Fk6d247lnMG84LHGvZSMuFBmaRECCFPnJDNWITmvXQ2zb5KOFkQiOlf9ph+RTdqbfY67OVkG8n1
	GuynLSkB6ZS8FWYFl2g==
X-Google-Smtp-Source: AGHT+IGexTDKokp9rk/e6fsbCXImxJu0jdE/ahX4LI8fjziTk042QG5GF6IUPrE69FOI/cc07tS3Pg==
X-Received: by 2002:a05:6512:2391:b0:55b:9376:5318 with SMTP id 2adb3069b0e04-55cc011b322mr2088594e87.40.1754847101748;
        Sun, 10 Aug 2025 10:31:41 -0700 (PDT)
Received: from gmail.com ([185.209.199.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898bf90sm3956911e87.26.2025.08.10.10.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 10:31:41 -0700 (PDT)
Date: Sun, 10 Aug 2025 18:31:35 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: fix integer overflow in set_abs()
Message-ID: <aJjXacCgSk-aNyTh@gmail.com>
References: <20250723173659.59327-1-qasdev00@gmail.com>
 <914ff45b-2260-42c0-9ccf-a3efd667d4f5@kernel.org>
 <aIJXqs-U8vDpYv0S@gmail.com>
 <f7257221-cbfa-4f51-8ac4-38060bfaf2f4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7257221-cbfa-4f51-8ac4-38060bfaf2f4@kernel.org>

On Thu, Jul 31, 2025 at 09:43:38AM +0200, Jiri Slaby wrote:
> On 24. 07. 25, 17:56, Qasim Ijaz wrote:
> > On Thu, Jul 24, 2025 at 08:58:40AM +0200, Jiri Slaby wrote:
> > > On 23. 07. 25, 19:36, Qasim Ijaz wrote:
> > > > It is possible for a malicious HID device to trigger a signed integer
> > > > overflow (undefined behaviour) in set_abs() in the following expression
> > > > by supplying bogus logical maximum and minimum values:
> > > > 	
> > > > 	int fuzz = snratio ? (fmax - fmin) / snratio : 0;
> > > > 
> > > > For example, if the logical_maximum is INT_MAX and logical_minimum is -1
> > > > then (fmax - fmin) resolves to INT_MAX + 1, which does not fit in a 32-bit
> > > > signed int, so the subtraction overflows.
> > > 
> > > The question is if it matters with -fwrapv?
> > 
> > Ah yea thanks for bringing this up Jiri. I think you might be correct,
> > after doing some research it looks like the kernel enables -fno‑strict‑overflow
> > which implies -fwrapv which leads to wrap around instead of UB If I undestand
> > correctly. So with that in mind this patch probably doesn't do anything
> > useful, do you agree?
> 
> Yes, it correctly wraps around. But the question remains :). Does it matter
> or not?
> 

probably not. From what I can tell it doesn't look like any further security
issues occur as a result of the wrap around behaviour so i think its
probably best to drop this patch.

thanks,
qasim
> thanks,
> -- 
> js
> suse labs

