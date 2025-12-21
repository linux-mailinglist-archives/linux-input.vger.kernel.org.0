Return-Path: <linux-input+bounces-16659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3703CD4662
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 00:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9ADE03006F66
	for <lists+linux-input@lfdr.de>; Sun, 21 Dec 2025 23:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B5026ED46;
	Sun, 21 Dec 2025 23:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfXpFUpM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91226462E
	for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766358890; cv=none; b=ausSNZOEFoKH5fOSuA7/y8yuUiTczMVBtqh1jrN7xJ63UG141eUBZ951hZHKNWZxvQbRpFJL38J6Zg0mSU+F7HX4IHzUEp6oglQEBbbMMDCqdp+6hJpShp2HSvp0oG05VgdZlqC58tx/VYnCe5PjQxOZMuDXpOIZpXYCvtQibsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766358890; c=relaxed/simple;
	bh=S2y1X7O8SS+jWDUGEisOZ+QJc9TMj1qVxdkJPsL8ZsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw2Ufnxq66R4Lu8/M6XwSSQKrokPBW0KIRWKqidQLi7hwoZ2OgKywpiDOljUZlfJcsG95icrYPwH403QmVCaIuoDbasVI0/XI60DmrWZQOLgctYbQ039Nq+r3P4/jJKwsiVJ0ewvRNnHTEV44qtOyv3UvEv+OFUSa+OJhvNWOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfXpFUpM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c902f6845so4717562a91.2
        for <linux-input@vger.kernel.org>; Sun, 21 Dec 2025 15:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766358887; x=1766963687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6vltu7i8/zHFJM2bs981Uk65CA0Yc1TXEwbzv7n5d+s=;
        b=QfXpFUpMmSGstrvCSMsCkqPRe7iS4CnfK3wsTX1lLYqvKXbr4IIWfQf1oN3tVo4mJA
         9ck2y+4+ytBLKcVsYWsZx4n5eDrF08mDwcge+h6UA6dxwCmM1RkUWvfYERySnswbhGhi
         R0P/H9BSenCzSCE/gbfxpadac24MoF4y3YWEglKxIhoYwOgmU/WSJrxZoTzsEymgfsdf
         zNAvWX2aUYi2uWY11FHXvkCqHfUhXMQE9AVzJ4MM0V19DwsAHnx/cig2QDjlupiuwBSz
         xgIEnCXrakH95MCVAbTRqvdvoWPqq/mL2G/dpj1JYzQsdp7SpdePuMcHJp0BPFQuum1g
         Ahyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766358887; x=1766963687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vltu7i8/zHFJM2bs981Uk65CA0Yc1TXEwbzv7n5d+s=;
        b=b+XNCby6acy8z8TM7RC9yvVCxGkiPE8Gd/9ZootlfJaIshLTbXClytyeyhhk+9hYsk
         +Yz6HbOazixHkCCqgnnuIC/MZB5aB5leJyZXytNM2ZpJV6NWFpa79uF8jGw37+Eb/5Qg
         9lI7U+TOSBjhrYtpmMRily1n1c4TKA9A3mKxsv9/6so1l/aR6EPTr/1luhOEk/DeiYWS
         Lk1FXOU/i1PRimVa8PI5lStw+Xp9wthKEO3x8w/1yijvnuVjtosA3MHhwPiI2VWxKNk5
         CkTcaMLPa1VaJaLFR0C0cRvaS/+noEnwcRXQx/L5StmhqWUQiEafaJpJIZdFVaM6ueBD
         dGhg==
X-Forwarded-Encrypted: i=1; AJvYcCUXBRMzHHPZk66FTKSZdg6VzcLQmmxuaJp7MocOY0Ub6b20qJcZS8CYkGJPOlaodGohFL+Bg/8bhUgOvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzooqkh9/r+4IxXn6XO3tr1nMvc+ntI7o5nCI1iGDl3YxDWVReE
	riYeVHMBzihGjdfoXgf6oZqYaTiIczVyEs38ic9+EHarPmb0CCuhNVvu
X-Gm-Gg: AY/fxX6jMCc8reeHQhLikgVwh4IbfNrNVaOkcX7qhzM64L+DfBHlEIYHz8FM+bsCHs/
	B/sAxhk36BF34zJ+JuIYaxVBZdBvyv6wWto4lKpvLyUim19jlwq2d2FA4KjfBe0pa159RT1Foli
	+zgCUb3L9tmN/YLyrulVxsVkKmtEF066S7RlyAhEtkDaZAS8+wUnv7JXEcvBcXwpm2PvAROyBp/
	3R4TkL5YeHuODGlmN5kL1bYBPAKIM+ln7D7F+pOlSh/R5VUnranWNcDqcMipLxQkcvfeA6SQ/mr
	BfI3JlZg8jTmvCP4R7QrKFWUkicE327DV0iKoi2pkaDND/VrPxeuTzY3rizJniOYtj2a14Nr3j0
	m+wb8suZn0yeefQJRBMq8NBy/Gmz0d1R6SxU8cdQssBVPhCi9uMsVJSE9A5QWA7r4tGCVu/Za8O
	pFneC2MoKOPeLv764zn7YreOu5qG/XGD9/bD8Z6Zw1i5fVuwfEmCCIQ680dk8OpA==
X-Google-Smtp-Source: AGHT+IEO8+GFMBfucNs2MBbOQCyHQgSztRL0ORr9rwFcITKatGXpd55VENbJ+6qmVJAjCBbX5BUmzg==
X-Received: by 2002:a05:7022:ef0b:b0:11b:9386:7ece with SMTP id a92af1059eb24-12172309509mr9428823c88.43.1766358886959;
        Sun, 21 Dec 2025 15:14:46 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a8e9:9a4:3711:628c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm40795575c88.12.2025.12.21.15.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 15:14:46 -0800 (PST)
Date: Sun, 21 Dec 2025 15:14:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [git pull] Input updates for v6.19-rc1
Message-ID: <hskdedbh3qwprw3w4mak35qfxpiedl4jl4stpnh3siqzj4yhlo@ogjce6azg3mu>
References: <lxy277le4ku73e5xf4yawoviapa5ii3msto7wjgzl3o5fmwnrr@3bcntrq7tk4i>
 <CAHk-=wghOVD4usUy9Jowte5OXN_mnVJgHHMYyTS0O3KvR_J12g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wghOVD4usUy9Jowte5OXN_mnVJgHHMYyTS0O3KvR_J12g@mail.gmail.com>

On Sun, Dec 21, 2025 at 03:05:33PM -0800, Linus Torvalds wrote:
> On Sun, 21 Dec 2025 at 00:40, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Please pull from:
> >
> >         git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git tags/input-for-v6.19-rc1
> 
>    return -ENOSUCHTAG;
> 
> Did you forget to push?

Oops, my bad. Should be there now.

Thanks.

-- 
Dmitry

