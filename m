Return-Path: <linux-input+bounces-6905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 216C798A7FB
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 16:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDF691F23828
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 14:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51291922D5;
	Mon, 30 Sep 2024 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK66Ung9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43187191F99;
	Mon, 30 Sep 2024 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708324; cv=none; b=DB10/fKuRArc5AZKunVogH108Z9F3eC4Hkf7glsdcHm4Q3uOW1kaq4wc+uL2Tbsh7nSZENsanfIvF6K+013CTlvgzW0bY7g6vWfWysnGS6o6yUZvpUNpKFNN+fIICsv1uVs18MTsDZPimgHcSSUKWlYD5nOjZjmFY1soQTgG/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708324; c=relaxed/simple;
	bh=uAcUUF3nDJ05QCqguDIzNnY2Lo1Vw0b5QLq5s8L02og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzJhU3XRYd5mRba1BCZ2tN6dNGa439F+odOuAUjWazde2vO3QTAafyzjw2hN/DL37uIyBt9lwGdlZg4ZZSnhNXSiKL7squSsYXBWow3H4WOUh+XG4F5AtJk4WJosfUZD8zHQaL9iiOgSG1ugci1bFgZUoXhCgjIsCsG3VLbJJhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK66Ung9; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e6bb2aa758so1710322a12.2;
        Mon, 30 Sep 2024 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708322; x=1728313122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq6kqoFKN3iUQrNTZUafncGjrGuFhq23v+UUWt2olZk=;
        b=ZK66Ung9TvqZn2+k51JyXbL4lQmsZjA2lF012omNiboJuVAgHaVu7jBdydzzHsyC3J
         tOtPSJ9gqSBhcmQbbvEFmqSjgzNcYZy4KjZpb+AoeP7Hgs1DUEgDgXZ6+tSx7K0Q6tzx
         0K0pCWKGNwYYeBofbCbvm3KX4/vc/4gzGZGBXc1DunoQElURmJW21ZWtLbE1ZRXH3+wi
         4RTNh/viYv2jXly1OBSqSQ6ygMq5auU2j/H1B6hFH8bedGxXpxXDpAE+huonuNijXYoG
         9R456Ke16NC1yQ/c1txGZf8i7s+SqCpiE/+QxDsl6CjvP5Or1Xphoc2qgZ40xI9zCFMC
         nuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708322; x=1728313122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq6kqoFKN3iUQrNTZUafncGjrGuFhq23v+UUWt2olZk=;
        b=BJjigGv0V2xDvmgZeOkXqCgFaq+f67C4BKIIWE+TAjb+ys8MkMAgzJ8yAPS5N02qQr
         +A1Whf2DuqLCrQE0M9krb8XMSmH3pr+RX04/QHmO92FR+dgVfBVdcldY0UtzAcFymrnl
         HZocdfhqErn9oSrPwMpakmBANoTtP24rARiqp12WeMFIwsMWFO6Csbmx7hklHKTW1/DV
         iGSvyvbIOr3Hy47SB0o3dVQXgJ02xStHCAqnRR4HWT7THxJvvzSoAEoXBet6GJcmZwoU
         ToKzWIDlELXaYgeaZtNnvCoY//JZAtXh4F5hMJVKNNrz2h7SKtlZly9IZ636oOCgzooC
         hDFA==
X-Forwarded-Encrypted: i=1; AJvYcCVY9S2hnfRcMziSFvlpPzIAM0HevkIOaGBPUq4ogo5n5rM4XQl69YtgjGy8gIv6+MtzPZ8SeT30mriV+UYC@vger.kernel.org, AJvYcCVjmHqtvwn5pZYJ2R9bP37Wo+Vj2eZQtTwWTp+/ClNFSZGuaZJoHlumN2AvbNXSBITVnml7jMFcy2VfzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCLEWMDXb6mxBnLERnoVq40EkHVINCtXiL/TfmzoQTN+cOuGxk
	/98AhvxUDl3r8oxRM4nh8lOIv/n+7blKF8RQ9BSn/5pwVdPjIEXK
X-Google-Smtp-Source: AGHT+IFyJOOjU1KJ81Si3MHB0VgW8MUJv70DoRQShJ2l2z2+eyBm7ib27FpM+fTfozEjJyGEGLwkFw==
X-Received: by 2002:a05:6a21:1583:b0:1d4:e418:c2b6 with SMTP id adf61e73a8af0-1d4fa64d8c6mr19293735637.10.1727708322414;
        Mon, 30 Sep 2024 07:58:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:671d:78af:f80f:975b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652b50fsm6538735b3a.141.2024.09.30.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:58:42 -0700 (PDT)
Date: Mon, 30 Sep 2024 07:58:38 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] input: Fix typos in comments across various files
Message-ID: <Zvq8nn-uygJFZVHU@google.com>
References: <20240926031457.3479350-1-yujiaoliang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926031457.3479350-1-yujiaoliang@vivo.com>

On Thu, Sep 26, 2024 at 11:14:43AM +0800, Yu Jiaoliang wrote:
> This commit fixes several typographical errors in comments within
> the driver/input directory. No functional changes are made.
> 
> Detected using codespell.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>

Applied, thank you.

-- 
Dmitry

