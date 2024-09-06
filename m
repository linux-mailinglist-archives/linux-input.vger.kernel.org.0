Return-Path: <linux-input+bounces-6273-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F7E96E932
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EF82286489
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 05:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555E946447;
	Fri,  6 Sep 2024 05:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhUdV2eo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C269C3CF73;
	Fri,  6 Sep 2024 05:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725600266; cv=none; b=oKPOLv/G3KzdQEFxySFnMmmcIfcjfHKbZ2tZ4lJjqk+M2hA7QQ0J3FZSKzaJPtSR2uIkrMz1tHHbTOmrmvAhEm/aHMD+DcUhajMQV5Z5QkK5QxnGs210y4SLtn3cwTePOzxmrUdGcIQxZTyqVhytjHWi2s/wnfHcpPIa0pCUChA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725600266; c=relaxed/simple;
	bh=wUtVHpZhYqSdiOvfq27tx8qTLyYDpQLKoLioMztavQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG+wIO18dCBmVO9u9rt+khaNrcDVshTObWxdXQ3DS3FDd5gwSJhbzr/xE/bmSznFJWJnfahGOFOtYIz8JXxiz9E2QUZbLkUSiIHGxKKT/6wLwIcpcvOVP/ZWtXDRXeqnDVszzbq9Sy1yHUkcJlIuoFGISG7tKy5yDYd1Isuiupc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhUdV2eo; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-26fda13f898so996790fac.1;
        Thu, 05 Sep 2024 22:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725600264; x=1726205064; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g0hUiLACmrvnz1yXtrSQ1wQ/roWbnuIi1O6fdmIhG60=;
        b=QhUdV2eoZ3iwgtP4g7osdVFnhb0O3OHmVrmSoWpA7nCwtqHxLehSe6Nm1YS0p60TcI
         YiD9xMejDoLxL70V10HFg2wdvaa6peOrvhBqU7cuFI5kP9gMBgpjCKibPsUl5EbiMY0P
         5b2STxyXR4XYSikSFc7IUpx+r2T3vCuAEQPq3grGQfx724YHzVScBoQfk7e9IWmdZktQ
         +9RI6GYIBmKiU7f+0yZX5ODUyHXBl4ZtG00fHx6ElOWK+x+aouhQ+hIyBqJ9Jf+i9nm1
         9UddXQO4sx80jx1rCAD+oymstXjLLI93Flx+v06FMCXTK3cHC0tQ9KQ4SRRLiJZ4v+qE
         YMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725600264; x=1726205064;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0hUiLACmrvnz1yXtrSQ1wQ/roWbnuIi1O6fdmIhG60=;
        b=DX5k+QPtWWRGMQoduR0F9+2wv4xyY/kXRAAFWYcXkWa/Y/fBrU1L2oPW+OF/CLWqzS
         OzYkGZjnJ/9qzsXqwMDyvmwSozVYj6bmuBhe5LDoyxe6FlSqiRxTWjHepX7qE22C6qVS
         r15uPLl9SqCJh8VMYgvAFgkqYBFDGJEb1sgRzArj30OLfZANmZBP+svvVjAL39TQjisf
         +/6525tgJtKhoPuk5j1QaRzXV+iuXU+QrfqXqQW++2xXEUZOMKsBzlNzMyuAWWUc+CGG
         QkQs7U0a6Jz9J3LlTF6BfoMkF2hXAuko5ryT5kKvT3oGK7X6NZ1QP9/vgEHPsxQbUHuF
         A6Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVGIuu7gtE24ExcXgZVoak51Vt4ETbHGsBPBLp00te2cEGssl1elWMgmZQ05kog5Kd7MjDIkfY9unHAhhwI@vger.kernel.org, AJvYcCVmgP2pPHnamJjf0PHq04Psh8eqcYovVAtL0DcKpyON08LFWNo9aYOOh6B6p9u5ktlXDWmtM+VueLe+ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZYqpoLK2WXZX4V+F86//c6DXD0P8yYivTWOaw5jkcPvJzWVEh
	3BxG5E6tD1oPjRDmiNN9G6xd/4O1VOHmkm/6n+iW4mHgVcTeKuT8
X-Google-Smtp-Source: AGHT+IGdYz//gUlPTOdJCgjsgIKN0yi8MM4ZuYXDy4L3MaGfGGYtupsSkoRabCZzG9XrbLK7/cYsYw==
X-Received: by 2002:a05:6870:9111:b0:25e:940:e934 with SMTP id 586e51a60fabf-27b8302d160mr1610491fac.47.1725600263547;
        Thu, 05 Sep 2024 22:24:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1de8:3062:3230:1a45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71778520e83sm4080229b3a.42.2024.09.05.22.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 22:24:23 -0700 (PDT)
Date: Thu, 5 Sep 2024 22:24:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 0/5] Remove support for platform data from matrix keypad
 driver
Message-ID: <ZtqSBLDeClX9Bq3U@google.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
 <CACRpkdYFc8vuz__7DkFSMFxUC=LSwCJmEun2KXgUvPMq+_e17A@mail.gmail.com>
 <ZsiygIj9SiP4O0OM@google.com>
 <CACRpkdZ_y=2WKCLwi5or-=MasvNw2bcxht6a+bFjV=yAfvQhdQ@mail.gmail.com>
 <513f718b-b964-4af1-9c51-9e0ba3809225@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <513f718b-b964-4af1-9c51-9e0ba3809225@app.fastmail.com>

On Thu, Sep 05, 2024 at 02:36:15PM +0000, Arnd Bergmann wrote:
> On Mon, Aug 26, 2024, at 08:52, Linus Walleij wrote:
> > On Fri, Aug 23, 2024 at 6:02 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> >
> >> I'm glad that we agree that we do not want the elaborate merge process
> >> and instead push the changes through one tree in one shot we just need
> >> to decide which one - soc or input. I am fine with using either.
> >
> > I'm also fine with either, but let's take the input tree because the
> > you're in direct control of it so it will be easier.
> 
> Sorry I dropped the ball here, I just saw that these five patches
> are still in the patchwork waiting for me to apply them.
> 
> I'm also happy for them to go through the input tree, and have
> marked them as not-for-us in patchwork now. Dmitry, please add
> my
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> and pick them up in your tree. I've checked that there are no
> conflicts against contents of the SoC tree. If you prefer me to
> pick them up after all, that is also fine, but please resend in
> that case.

I made an immutable branch off of 6.11-rc6 with the changesi and merged
it into my 'next' branch for the upcoming merge window. Please feel free
to also pull it - it does not have any unrelated changes:

	git pull git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ib/6.11-rc6-matrix-keypad-spitz

Thanks.

-- 
Dmitry

