Return-Path: <linux-input+bounces-10557-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D47A4F7C8
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 08:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39C091888C2B
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 07:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2BF1DE4D3;
	Wed,  5 Mar 2025 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsMULsQn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDBB84D08;
	Wed,  5 Mar 2025 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741159137; cv=none; b=bpPT+IlIB2bDVTMGN4oJXQ0rOxIJs8lxZwmprWAMj1KsJQ3Z1UhmJrxfwCeztK8iJg02h2q104oJsDcA85O/TsNcU7MR4t0K2u+Cb790i+nnbkjsi0qIPsWjUaT4hu/iCRCc9JoDrh2oc5lTdILQ4SeusI1ReQN1/F9gh69CwgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741159137; c=relaxed/simple;
	bh=/zT0/aEZz/bFk5evh2Bt4bylvJ7seck4/y5hF8UUwpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORTsvVeETOWHSqgUPfezTsOOTN6K185Q2vs7q4JZCZYLg6Qy39E9YG5Oq9Pda6Gpm/Yje8SlVap8JvEmxbys2pQ3pJro7GnopmSRP0i8/ZRfg7eWStbNr8WO921igQNqaLAt5ad/3LDX7kq6PhNQJzIvmz85uxxkU+ukZysbaEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsMULsQn; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22356471820so104290935ad.0;
        Tue, 04 Mar 2025 23:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741159136; x=1741763936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kH/cZ5DivUQPBY7pbsVy9JuHqIfz3Lrs9JDw6PfArnk=;
        b=XsMULsQnN9xy1tp+JqGEFExd4KHTOugcNvq5fBgLFyl6kNWL8s/sdH17N0i1IuJi7b
         LlFOBY3j1e0wfBi9pvNxOMGi09Jg30xjAd5hEIg7vDHixsTjBcMT7cTIXcLbfcfztviR
         h9QIMeVoFk+XIqIIm/2OyV4ebrqtU+aLKzMfj/P+xFOODWyCYDkbLDYHrmtuUnB6GPkB
         rMmgoIKdpEtWctMBl1W+W90/uz8CIgJ294QdogZexeTMCukRGyFK1/Lw95nif6zlGi7t
         QstqaY4YehypGHWorGyd++fg/QTGLEn88/8wv3mub3PwWpJs8Xrn8p7ClKRPSkJEh6ey
         mZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741159136; x=1741763936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kH/cZ5DivUQPBY7pbsVy9JuHqIfz3Lrs9JDw6PfArnk=;
        b=fcssvr8X7pg75tmTTuHMWSTXdFcgACW+n04FUfkEsGfInMluVYAt0LHs1H70wvAcDv
         LbiHSZUbAwoj6aBP01cRAkgXK+/AtghPTK9xBADdxomqiVvsG8paNunQGD1p4yaqAw5N
         TbnQADAloIhiXSY3Vs7u/O82p8+NGrtNBl2EAcycqdct9riUGxY/u8OF2ANxrbg+jvEt
         HPcYlV94Cp1us8/5zoY/0wlaNMoS5Pz9QneKNUKalCfpfjQTCklHpBddiMCO3LzPMJEB
         onJvYr6eGDYesn3g3KGj1T/H7BILffCUUADI0Ce8bTvjUXmuCg6sSHTr8VNBvA+Io/F7
         gOng==
X-Forwarded-Encrypted: i=1; AJvYcCVpR+pYeVZjdc1Xv4gAu+yt5Dxvny5oanVlEHkXkTD9O+tzSQtiMXow4QGXsyM6c/M7tGn6Sx0Wk0ADHnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwlgqlGdPaFlOf5Z4PumtCpz3Yzij87uSdqfbYHzW+8fALOnbv
	lMIMHQdDgi4Q4QmllgNs60HshYWZgo65PhMEof0Yj+gJriBUdzWF
X-Gm-Gg: ASbGncuQdDzp//sG00tWNZVN7lhn7neqnPnRE9SH8oEyv9NIlliZxwx7n/iYYFhqGER
	V6ZvIFnpmUfEOu6PKUS+HaOtfWpp56DxGyxGA5IrEgQNcFfA2zPqwexwW8vIjY1tEX55r8VoPFf
	ICCE66IEbkexvzIN89YNsMRvZTnM9+J+z/Yr3nE9jvLKNKa0oLld5L23c8itzPiyQ4Z/dQL8+Pl
	iv8hoITCdQ1IMbRIfJoeQ63N0Gc7XN42+WMPrhvbu0mAgxo/jeR0nvmNDHqnYVYjgp8RY2zu6x5
	XiqaKV25mU/VpQUJyMeKsGU/sEiLhqW8OVc2pnhRx2Cz0w==
X-Google-Smtp-Source: AGHT+IGFXEiv0DaEo6/DRJTfQPM7VNMKkefxST+1FyR3NRZNpPC9HUwQUA+jChITs0SgD80bG1fDvQ==
X-Received: by 2002:a05:6a21:7001:b0:1ee:cdda:b8f8 with SMTP id adf61e73a8af0-1f34947ed20mr4497607637.7.1741159135705;
        Tue, 04 Mar 2025 23:18:55 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:438c:d5a2:41a6:66d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003eb8csm12208988b3a.128.2025.03.04.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 23:18:55 -0800 (PST)
Date: Tue, 4 Mar 2025 23:18:52 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v1 0/4] Input: Increase size of phys in the drivers
Message-ID: <Z8f63ImfQMB-Wp5R@google.com>
References: <20250228121147.242115-1-andriy.shevchenko@linux.intel.com>
 <Z8bulFaTKJ06YLrL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8bulFaTKJ06YLrL@smile.fi.intel.com>

Hi Andy,

On Tue, Mar 04, 2025 at 02:14:12PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 28, 2025 at 02:07:43PM +0200, Andy Shevchenko wrote:
> > The drivers are using local member of 32 bytes to hold up to 40 (one-byte)
> > characters. GCC complains on that. This series fixes the issue in the affected
> > input drivers. Note, this is currently the biggest part of the warnings that
> > are being treated as errors with the default configurations on x86. With this
> > being applied we become quite close to enable CONFIG_WERROR=y (which is default
> > and basically reverted) in CIs. Clang, OTOH, has currently no issues with that.
> 
> Would be nice to have a comment on this rather sooner as this impacts
> the compilation by `make W=1` with WERROR=y (which is default).

I do not like the change. There are no bugs, only GCC being paranoid.
Are there any other ways to shut it up? In [1] Jeff says that switching
to scnprintf() shuts GCC up...

[1] https://lore.kernel.org/r/Z3rIvp0hzS+yzvJA@nixie71

Thanks.

-- 
Dmitry

