Return-Path: <linux-input+bounces-15587-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49286BEC7B9
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 06:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5E994E2FEC
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 04:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1552D248F7F;
	Sat, 18 Oct 2025 04:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRjtxvm1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9793C23C513
	for <linux-input@vger.kernel.org>; Sat, 18 Oct 2025 04:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760762668; cv=none; b=MVfSC+xYo/+tTnFTsKprqEDo8a8ybGED2Zn78ndoZUGghgi+2/OLPYkB6jZPq3tr8ltdub0quGUeu99WKJfFWzU3dSmclfDlzTvA+y+bBq3UTWYDQEF5dYERC2yoQsINJDWM3+RMH0LpQMbmyacC5sEQh9E18tVGsBYckHrT+SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760762668; c=relaxed/simple;
	bh=zgIRzuUwDzGeV5kGKxjvmikUrn9RTJaSbDu/EBvWMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfiTAPWOihpo8YuKuUZIIRRtD/c3lyppd/J5/BvoEwZe2iSNDaiEERORrgJZ6goa78rAnvX1RyWfNfsbtRTq1UN/+/8w0XNiqFDwKYTrCjZ1w0IUYtB4VYKLVYDmt8jC/zKvDYDU6nKszAtR//mzoxH5MN2doabermw5nsRN4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRjtxvm1; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b6a73db16efso692841a12.3
        for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 21:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760762666; x=1761367466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SuILH4c7j8uvSEqVjgWyUNFQrtvem938kCvyRi5rc+c=;
        b=bRjtxvm16Qgcx6DyKv4JBN28U9QXYvWXM+iTNSdog4oaqNb6DWaY0cqXxT88gp+wMJ
         hCmkfCnJqC31U7J++XStfpYWrMIfeEUvcAgUODaoJkvJSqA+otrozqfb6sBZ1I1HhoJa
         gT0SF+O7VM3aP8f31C5wVoxkeGxaLy54i8WtR9MQi9lGqFL7LRmO2IIsP+WxaHkt/4mH
         QizGfDEpqaMuUd84ZB0Em21AxdXYJtvT5GxkOeqntcE2LQJdrMhoGwhxtGXV8f5u9RYi
         PAhJmZuqic7PetCjbv76N6CJguVpAG8APMO3UMR+03A8DMYGYq+jY8ARPFUxtMFQJKf8
         0ixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760762666; x=1761367466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuILH4c7j8uvSEqVjgWyUNFQrtvem938kCvyRi5rc+c=;
        b=NOt21C4wDMpBd0x8i6yIkJ1A75Ymn2EALYU8jVfhkCDpsCdQcvYTqmihUAA5tF1+TY
         7DAdz9MwZQlQVvYUWvXZh/hAfARM3Ry4anbH6+xbwwHoj79cxe1MgxzhM5Ip7PQm7Frq
         uJYiznvuSeAhRfQ0ZwIRRBNRmyJs0nrC4tM0qztIUkPLaPQRRsU/bXDht6wG9TeDDqiC
         Bg3NeVDkspEPwKBQaF/aeRMBRWJ4bGhzYlX1UxO2dEysrnWhNA9k2IbZKwxJFM/HZF55
         cmAxjbVWw6z+ALEmhX301CC0vmfXNP9GA1modOSUER/FW3r1oglzsiS+Pr+SRv2Ynags
         /qgg==
X-Forwarded-Encrypted: i=1; AJvYcCWPvMGJRlem+Qsk+xMDMrwjI5w/CZ7UgnY+kbNG82aP/4iAsFcM/Ao/msvP8u0qbEfHjj5w75dqFLwCtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLMXejjAI2rWZnGqHaFLHTWF9tR+2UojbR+Afiv6d+3JqjlEDk
	E4M9qSAd755X6t1PqNa7yhO7FRybCiDj5Z0MJU/xRY3ui4neFUxNmT5L
X-Gm-Gg: ASbGncvNXe61exLu2X5gROFnBWUl5lR2gyO+RnHWJjMM8W+bAhcv/p/00y9PMbx9Ku+
	gSlO2QUPHECr79nekgWTai5Op3MGgJRlt2AhEwrZZ4OBRgSpTa0CTnFDe7AfZqhX/FNK5rQqvG1
	hDMTWzfi8S1GvjdbTumU8MNhIAeFfGxVccH877DnnDUffqO4YbT9ufMQgfu3eRfLyrKrZC/QHPo
	sNWu3OiePSTQZ4afTO42EmGvWMyLQc4ImuCUtAYKnFmXpW8jt9RLeLEChb7NsJOn+5ADsoEXnar
	eCxscyG36k3NGlsLl5ELz19YC4NJ+sYF+73zNtQcxUQ8SDeymvE0/7XU8SByHp5GGPICLvOxLF5
	HsJh5awRgDcvqFRjFf82ygIdUieY0P6sEcmv6ybEXk7zvWZUeyJ7YhCE/fyG9kBV8nkPWqtDQi2
	yCk7XAWGcbv3losgbp+dh38zg5MULjhASSKkcH1ntL3aXIWZjEbsA=
X-Google-Smtp-Source: AGHT+IEsreobuN+rTRpyEDgvOSmHbZIJ9FhttENFg1rytWVj5SG3+BeLHeuRVjMn2qy9jnjk61l2gA==
X-Received: by 2002:a17:903:b4f:b0:25b:a5fc:8664 with SMTP id d9443c01a7336-290cbe2c382mr51666355ad.51.1760762665736;
        Fri, 17 Oct 2025 21:44:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5e2d:c6df:afce:809b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcf06sm12742835ad.24.2025.10.17.21.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 21:44:25 -0700 (PDT)
Date: Fri, 17 Oct 2025 21:44:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Input: Remove dev_err_probe() if error is -ENOMEM
Message-ID: <aqm2v3527whfx4mttsrebm36wuexux2ufssignjdt5wkhwocrk@ynzhqww4aul3>
References: <20250822034751.244248-1-zhao.xichao@vivo.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822034751.244248-1-zhao.xichao@vivo.com>

On Fri, Aug 22, 2025 at 11:47:47AM +0800, Xichao Zhao wrote:
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.

Adjusted the subjects and applied the lot, thank you.

Thanks.

-- 
Dmitry

