Return-Path: <linux-input+bounces-12383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C5FAB8F97
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 21:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B0D917701A
	for <lists+linux-input@lfdr.de>; Thu, 15 May 2025 19:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B283F1953BB;
	Thu, 15 May 2025 19:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOrWn3N0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4917641C71;
	Thu, 15 May 2025 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335705; cv=none; b=bQdjZk2HBOe1yPtFpF+bTSyioIgyAhyqbDg5ZQon64Kem8/fc/nETuHd4zb78/LsVejc9wph54d/foILzWF983Kvsiz4/dbgEZRrxHdsTqjzXNarsJgoY+JP8oVYE2j+Zq9ELS5ZnRFAlDLHFrj/9SbN5QAzsouvWDSDvA23Nu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335705; c=relaxed/simple;
	bh=99paAvsMA9VkMv68izszffkntYyC2oz+Eo+hvcToFLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXf4+Nj3xYNF5a0SvEGx1b8Wv8Y8N8kf9Ncu8k3nTEmI+cj0Ar0JExkZM+ibWmZVamPUGG76B9ACwwDQjkTVr/NHK/tR9z5I/8z9MWJXMjFxpuguGIUr4bvU9dJVZqIqlvz1krwhNCMyhoGBLrSLj6Fyt/wnQ+U1qkF1QATPGx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOrWn3N0; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7426c44e014so1533083b3a.3;
        Thu, 15 May 2025 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335703; x=1747940503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7eXItyg6Drv6Erv84ocARBCm83y/oEXLisvw55rCN4=;
        b=FOrWn3N0nPFbJn3Emj19xba57WMFjAhcIUBRGKXb7NXObVZTtDkCLjMUf1UDoDIFg+
         GR11CsldgMOnCBvfFPTLR01rNRogzlgTVHDjHywKqxzNa9r5N2yB2dBc8ZYk22hkA457
         cXn6HY48aIhPu8f0gDIusy2hPSvXPFFzs3VkGn1pN7VV0cimWU9hzlBqiPhe6B2rFDSH
         cQtnuYjjbK1/84AWztkQsSWDUe65z+D+HNVuA14bPm3ngUSamhRac6Hi0F7STkOk33uw
         GBA1HHqa7rBwJSgPQXIDYfS2O8wtyJNN6b/ttAtiPL1KFXP9UVU8hdhTPhZSznXyqohl
         magg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335703; x=1747940503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7eXItyg6Drv6Erv84ocARBCm83y/oEXLisvw55rCN4=;
        b=hOCAtEoSJx8u88ul3D0+4J7UvdBPCMNDqcOAhcDV0pQk1y8CcJOn7tp5fFSVV3Fx+r
         J4tqzommw0esMdJo0Z7n+lp0k2SiJ7YgCEp5vcQmNNVuQYXAxwpSUhMQq12xvRCeN07T
         JvEGl9ibvJSE38CmNp/MY8F9Qwn+mJeV4gbqgTQAKuCPoTKAn0YNhEWsDdEBA5dWVXhU
         Y1EhbSZBhqOZ9q+5lapAUbgZMz5yLA9gOL33CrZJme6H6/lH8Mg1Zc4UEyFGnxNfw6ob
         dj2KDvyB7GkXg1GtlP+EWd8/VaBRC9hVuw4syzCOMFZxblcie6CopyHGQDeojFeceROk
         tlvA==
X-Forwarded-Encrypted: i=1; AJvYcCX5HnJUe8W57X/QMD+KRc98O2Jwo2xEQzOL6pCwToYdgnL9ddLurg3DD+hbvo4Xvm0ctnUz86C1TSeG2w==@vger.kernel.org, AJvYcCXEUZs6d/22Wsoe/XvWaqwHzgjbRXIvqeFe9tVb6AK3Mb6RTok+AGfreVplvu9tvA/Uy1kXqleIUq3U7rzX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0Kw8ytQLJjHrEIGKSlEYOBe02DABg8Fov+nKs4K0+vn/01Bhr
	cO6nZT8qbOrQBt+v1maN+KOFZOOSMAHOZLwYMQbuqlzVzikou94Wr6L/tO8jSg==
X-Gm-Gg: ASbGncuKqb8ChuXpYyJL7l10tNOGxOiEdXo+WnBvxu3w5xpsAQJHwnSFTuf/A13Rdjy
	BvWG3NtYTtV7GqAqX51YRwsvklfP41zArpQ5IoCRThWUuNjKtSrVDJ09kBu/DQNCuyih6sEUPy+
	j7f0zWSRGvmQ33iHFjcOTmENEkGZyQ/OKFkRu7woK0p/+k12sVXqn5gnVW+RjVdGWBYUWL9baUN
	ewB0M5jRh+0nukb340NA+BpNDoxX1Hgpe63M3kaGQWT1NFjpIesfV3lwEYJRDgMqkD2f5Dut+jT
	qir5s9ElNToxcNuY359uPcvjoYqphVv+j+yZjO1cWTEm9MByuYI=
X-Google-Smtp-Source: AGHT+IGsu34ZPpW1sqGGNpfnxzSnrvpRJE4U+AvNvX0Xd1EW5sbEw4sLv/nV+FFZJg5Sa5euqNORkg==
X-Received: by 2002:a05:6a00:1495:b0:742:a7e3:7c84 with SMTP id d2e1a72fcca58-742a97f1efcmr634440b3a.13.1747335703338;
        Thu, 15 May 2025 12:01:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4a64:9a04:f793:540])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829af3sm151817b3a.94.2025.05.15.12.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:01:43 -0700 (PDT)
Date: Thu, 15 May 2025 12:01:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: lihua - <lihua@huaqin.corp-partner.google.com>, hdegoede@redhat.com, 
	javier.carrasco.cruz@gmail.com, zack.rusin@broadcom.com, namcao@linutronix.de, 
	tglx@linutronix.de, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Message-ID: <yimq6mynlmkg54mesgknyebfbibmuq3olwwg4y4qrrnjmiwagr@mgfmfxfdtfsn>
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
 <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
 <aCG2Rx_99mP6JFi-@smile.fi.intel.com>
 <44fclxle3b7hfo44ec3vlwlth3uamceaqght3ecu3lmz4eltfz@e57uk7jw3hky>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44fclxle3b7hfo44ec3vlwlth3uamceaqght3ecu3lmz4eltfz@e57uk7jw3hky>

On Thu, May 15, 2025 at 11:57:58AM -0700, Dmitry Torokhov wrote:
> On Mon, May 12, 2025 at 11:50:15AM +0300, Andy Shevchenko wrote:
> > On Mon, May 12, 2025 at 03:57:17PM +0800, lihua - wrote:
> > 
> > First of all, do not top-post!
> > 
> > > Hello, All linux team members:
> > >       Could you please review this modification as soon as possible?
> > 
> > You even haven't waited for a full week...
> > 
> > If it's an (important) fix, made it look so (Fixes: tag, Cc: stable@, etc).
> 
> I can see that missing input_sync() might hurt, but the patch
> description makes no sense. The driver does not really differentiate
> between long and sort press.
> 
> Please provide a better explanation how missing sync interferes with
> your use case.

Also simply returning from the interrupt handler is wrong: what happens
if you simulate the key press, but the button is indeed released by the
time the handler runs? What will generate the release? The button will
appear "stuck".

Thanks.

-- 
Dmitry

