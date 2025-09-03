Return-Path: <linux-input+bounces-14457-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55AB423E9
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1991BA11FB
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 14:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8387213E7A;
	Wed,  3 Sep 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVW2HVwR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890641E7C03;
	Wed,  3 Sep 2025 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756910503; cv=none; b=PQ/hH5kxTwmZYqfpEmdZog26t7bE43Y7t2YRqgj1tfpT5+8EjnbrGb21pXvq9AGmqAWULA4aBUYUA/neu4XboJSmcMajZCVp4Z/biUS/cxlEOtq4nkYJ2ZGASe1kp7d8yjDxg/QjYPOxykcdMT3zZCblZcP71y3Ae8XCkasz9+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756910503; c=relaxed/simple;
	bh=k4XdbAII5aXMNyNVG/VE7oL9lq52sejPpaShUA5rWlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huhfmMKBHvDHnGB1YzbL1haSgXqq4gN9Qn6qAeqEgrXinq7BoXFBnWuXaJCA+PlCJvyADfMFkVjWGwsRXYMii2b06/czDGLNQienZcZGxPFOkyYQ0SBZ3un8OCOfsDH8Xd90g//QQG4rJdyOaG3DyzjmYLISMZoZy1BW6daA8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVW2HVwR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-249406d5878so247455ad.0;
        Wed, 03 Sep 2025 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756910502; x=1757515302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ger7eRFWOnEDsWAy5uZiueTzoJglS49TKSLyDGmKwQ=;
        b=TVW2HVwRMil8VYTQ7PJ/VEe3Yc6dzlJoVDB3r4YJYULKkdC6Hz2XAwMfWFB/bkcJd8
         aHHq4rG64aLnlQI2IcxNgZ2YfC+ceVZYDD9dfi4OyyuIXsUnI66xnuKMAdYsIgHZ3f/o
         ivIjIz9zBdBATb+bXtfVZe3f89AZhot2Pn2QSuUKQeDn49jC2MrONGbm2C7ErYT/n4uf
         7KVK05DuCFz2ykKIzNYm1XRtrMmWwx0VVIKZO3Empr/Bxia/XowAayjqQ9XEBFiMui/4
         4u9RXONqJQAv9YgGB9Q/+88zPIVLM43PvXY+fn9UUo/gpjoekDYf970D/6wuyzR5Ud01
         6GKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756910502; x=1757515302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Ger7eRFWOnEDsWAy5uZiueTzoJglS49TKSLyDGmKwQ=;
        b=sj8MD0MkIl2gLZRgPzFHj/6dQt1/ilCtc9oG+RM0gZuleIBAEkQyjZnti8yn5ykhNA
         ggURfcIewOSxgB8UYOlnG36ykDdiW7acvwX1LTK4utfL03Rbn3PtJijrjIouT1my7Rub
         +7QG9cPI6G/TSkLInaF3td5EgC2MducaxHn/Pg35UXnlGSkeIRy4QeHObBs6Sor9cxe3
         Sbs725G4QEdOkgxXToB52ytk7wps0dNP5mt9Pf2pyN/Dtc0SOEVsaKTZqUG3BKbLxN3b
         A51RqeiuKLiQ2zMDMDAtYRl3M8vpgbJY695bKzVJBtBFXBJgyikopS25G8VNFSNULZoC
         rRJw==
X-Forwarded-Encrypted: i=1; AJvYcCU8YmfoOltFHbNZ2AcB1vYUeCpNXbrQOm4qVnupXBCjA0AVR9siAuZk0WPrVcotw+bmInugYfcygOuBSg==@vger.kernel.org, AJvYcCWnLwbWI8QVjO/JAOXT+k3CkF73mcwZ90VcPzhGENN5jJB4sg3uLQo1ZnwCpVwIDHjXuq4IZde3i1Sy2NzE@vger.kernel.org
X-Gm-Message-State: AOJu0YwnCzoMcDQMroH3wsmgWRgTYD5ODTAJnGXmwy4MMtf3ahSWsvG6
	E7FAzk0Ix4Tq20c6afkJBV1MzjCMqdqZUMk+gyFf8WgTSMQKllhyYKe+pb3TUeSU
X-Gm-Gg: ASbGncu2QG04bgf3PZ8dAY3E1QRBuXCVePF20edqe9QwiJlTcaPGnkPbO19YCcHfxng
	C4QOX+UkFF6oS/xCZ5KYIDVZtuM5j+ugXNKoRuvoyD4EFOON5LP7C3jxz1UMkuQsWsPrIKTcyvK
	JUDxbrGgSauk2G+7+8RITt3c3frpktpH4RoHj2nJv/lnHsk4p/pmDg3hYKlvUgSkF+RhwwakUS3
	d9AN7M5p2LkMpWCKpdxIRt5rsxQKKQjR9jfauJ4N+qpyctD33fdVd1kyN82xPvu9CYrPwrgihNN
	tXgOTbcDG3TInby5jeCM6dbNfUnPPP7mt5oIvicTE1aPd3a97DYc5eya8HZAH4R7Wm5IXGJkAIN
	wTOiqVDANMtY2sjjZp91hTnA=
X-Google-Smtp-Source: AGHT+IFimwyJc/f9qeruGj8o1cjgUAE+cR2k36Kj1isZSiYtQPPHcXVP9wmEJKHkviN5FMCQxk6Awg==
X-Received: by 2002:a17:902:d2c7:b0:248:ac4d:23a1 with SMTP id d9443c01a7336-24944a9b18fmr228175725ad.37.1756910501698;
        Wed, 03 Sep 2025 07:41:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dde1:b1e1:74ba:18b3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24b2570cfb0sm43398915ad.139.2025.09.03.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:41:41 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:41:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Kevin Hilman <khilman@baylibre.com>, 
	Andreas Kemnade <andreas@kemnade.info>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2 RESEND] input: touchcreen: tsc2007: make interrupt
 optional
Message-ID: <shoj2hck4xennpvobmao3ydelvlaedihs7i37e3gzkrzitn3lm@q25cfufuwg5y>
References: <20250824091927.105121-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824091927.105121-1-clamor95@gmail.com>

On Sun, Aug 24, 2025 at 12:19:25PM +0300, Svyatoslav Ryhel wrote:
> In case tsc2007 is used as an ADC sensor there will be no interrupt
> provided at all, so set up an interrupt only if one is present and
> remove associated warning.

Applied the lot, thank you.

-- 
Dmitry

