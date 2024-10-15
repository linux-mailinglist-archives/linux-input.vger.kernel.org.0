Return-Path: <linux-input+bounces-7416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4999F5FF
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 20:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B695282108
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 18:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2BB203704;
	Tue, 15 Oct 2024 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLuTRnbg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A482036F1
	for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018050; cv=none; b=ko/XGmaOe8x8tnreN23PayDzcUJ0c7+BHyT/vdC9IXKYWmA2Ja0keSmmAonz0g3/XDXJd1vOMETWpE/PTBo0C7pd2im5CYIMDJWY0db1WcxRDVzvPGe6TzP+nZRgOYtw8CIvfdeSfdD/rYH111wYe2bTi6FBX91ABFKdZ1NsEKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018050; c=relaxed/simple;
	bh=Ke77KfxzaDmjYiH+GukMplqCOg32z6A366AHghniAOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNzLwVUsBM5kz+B8lzHISMmXIGpm3ifxV+NfWr7CNfu6wQi8G0cCCGw08YMWg6z5/oHW7gi7k/emZ15KCktyBw6RDYX1a85+CZQ5J5hbDokpCixhlQSC392rn5ti1Gp3XyZSXuSdnenXwX1AFKebmSNnIZnART0hJidjJG3H8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLuTRnbg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so4443501a91.0
        for <linux-input@vger.kernel.org>; Tue, 15 Oct 2024 11:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729018048; x=1729622848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5D30CRDeKaHUx1+HC/+RruqLrStjv+HlawnTTFGXV24=;
        b=XLuTRnbgWcTezG2H6BF/UEtZa/tXqPhgLauIuUiTnM0gXaY19ocW6r5FhgvegWmgcu
         E9h7UTugslmu6bGGbJAsj3xJbBK4n/WNytwrN502Fd/BrAitCnqdZHAdcVbyP6TLRaZ3
         oVy63AdVltmtFppgdOUMfOeYNo29IdZ0imckjFSvJPQXdnvPcdXKYI8YyOhDt5/spkbo
         yb0ZeOuy/u/dyErtRiWaJhUcIFSOswlQFMAPzU5kGU3J+RcbP/BfDFk24MO8FyAqbDH5
         /iEw/cQxGNfoOsZGBaOSj+kYws8KzGHqpZeXT/GHv93RS9ij2+uRlNwQGToZVrRD/+hD
         hYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018048; x=1729622848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D30CRDeKaHUx1+HC/+RruqLrStjv+HlawnTTFGXV24=;
        b=p6t6o7+kgNVBIg7yuldDjYY9XphEK09OU5/7QACsBViOw9DROlZMOQfrwmi3m+9Xhb
         5a++TQgLZBcyMGyjE4t77IBD16RUhn/xetUCEwm721524j+r8b5Oc4+s4Jt0ly8WRW8f
         gn0Cl87amawJHaMD1eF00oWLqef69lDIfrdtVn/1gJH8jvOoqXZ6k/SQO8eVoOOcb8yZ
         bhv3eVB/M1vUCYKJO4KakUKeRi+BxwiH93oDpHqItWpzXDoYaqa+CEKINuIqyPxJYEZv
         wg07nTl2mU99rw7qNO7JoU/eCCeX66aD4wMb4NFsSoRkPGV02qyIwrIbTHGDiM1nQYSa
         2VXQ==
X-Gm-Message-State: AOJu0YyyUlj+VptBN5GOoYJbyg8PYrK52rnQB5fvc085XZMmfRqTkXVe
	S4+ojO3KWhw8r/TprF6peei0SA9UemKkx06+D7mpkFH5W0KO7FiW05SRlw==
X-Google-Smtp-Source: AGHT+IFfpp0qlnAo5qw/DtdXAs/u2d8dfxpqyk6ZhYB9pzb6tTY6iuqWRnRprSqHwAGvsYRZd3rH6w==
X-Received: by 2002:a17:90b:360b:b0:2e2:8995:dd1b with SMTP id 98e67ed59e1d1-2e2f0a5d65emr17188013a91.3.1729018048205;
        Tue, 15 Oct 2024 11:47:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4bfb:6b8:82e3:75b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392f03a2bsm2221075a91.27.2024.10.15.11.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:47:27 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:47:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aseda Aboagye <aaboagye@chromium.org>
Cc: linux-input@vger.kernel.org
Subject: Re: hid-input.c && vendor defined usage pages
Message-ID: <Zw64vVlkV6wyOUd-@google.com>
References: <ZvNaHt7ePvoUpgy8@google.com>
 <Zv1gKyTELpTngKIq@google.com>
 <Zw2X50VzyzF4AyBT@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw2X50VzyzF4AyBT@google.com>

On Mon, Oct 14, 2024 at 10:15:03PM +0000, Aseda Aboagye wrote:
> On Wed, Oct 02, 2024 at 08:00:59AM -0700, Dmitry Torokhov wrote:
> > Hi Aseda,
> > 
> > On Tue, Sep 24, 2024 at 07:32:30PM -0500, Aseda Aboagye wrote:
> > > Perhaps this is a naive question, but why does `hidinput_configure_usage()` in
> > > `hid-input.c` configure vendor defined usage pages? In actuality, it seems like
> > > it's mainly handling some HP specific usage pages.  Why aren't those in some
> > > `hid-hp.c` file that's selected by a kernel config?
> > 
> > It is simply a historic artefact. These usages were mapped way before we
> > had HID sub-drivers and accompanying infrastructure.
> 
> Do you reckon that we're stuck with this behaviour now since migrating them
> out, will likely break users who don't have the appropriate sub-drivers
> selected in their kernel config?

We typically do not commit to keeping forward or backward compatibility
for the kernel config options, it is distribution's task to configure
the kernel properly, so I think it can be changed if desired.

Thanks.

-- 
Dmitry

