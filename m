Return-Path: <linux-input+bounces-16627-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE24CCDC6C
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 23:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1DD302104E
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 22:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942EC2C0F9A;
	Thu, 18 Dec 2025 22:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPksnFyL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6AB2BE630
	for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766096401; cv=none; b=M9OAkf2rsvrMiQhgapPTKwBkruRsEn/2auQfcE0acgu7V289bKO7mvwnHZTgRLU0Zgyb6d6p8c7FdXbuz68YplLOfdjQJWxW6lFQvi6xqTp9bL+B1H8kiB7I96xYM6yt4meOMEWqKL5y4j/tF5nfXMdXzO0uv/9MEaHtAaDcA+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766096401; c=relaxed/simple;
	bh=9i7cze2zXw3sphfypXDmh432a+tbDocZK89YgxAxEHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnPNWOdCPns3SIkMQxLo8rQ73CnfK2Sz936ygO9nYT6cHIsscvj2ZJ3kPwpBy5LQ6S+7/8yLZp0GPW64+GYHUUFhe/JUsd9nRG1sFkzjj894VxowZuwQQxT5zxHjTtjWc29MFvumMX788xYxysqbqYvjJliVpC/Sz8xKqC530MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPksnFyL; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1041734b3a.3
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 14:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766096399; x=1766701199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=PPksnFyLJiG/T73wpwlgeVFlgpQGAUvujlkJFg5T+ubAsNAb1cQ7v5s5pX+ennPr9y
         F9a1CbdCeOkWBUpLXG727eqr1pYpkyVPk6wErsLf99ErDlLp86oV5ZTwYHgvRvCohPBn
         AyHRFTs7P9mR40+rVB0ECMCxfbtIKULDjTYAmvxuSxDCeFwUD7K5w+To3GkpWoDDZw60
         SyZp9+VDLuRPyTwmP4rbWt8NLuprky34UUhzcYeeTdVP85/rFYJBI9QATfA/VJWhK6ei
         7WOTtSVAvHyn1c+KnJ35eJsH0aykLSfHOR86Wndm2GXttsX6la6v8qgWdihecOaC0eMQ
         fZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766096399; x=1766701199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHi2VHdVHFCMJr3d7N3lZkt4cAkpVU0QksLG1hGqfO8=;
        b=p1I6w4tKNtvQrjna5/v7hQtztd2r0hyWcoEb3/JXJXankQb9v8sJw2usbK/r3Go2QA
         2AzWyB+Yi4+O93Rn7sj6tyAcq0LynPjj0XvOjoVUwhvNly2wMd0A4lzwG99zvpvxMPjG
         lVEZb4Q5lY1t6djx1IaObgtF78DdyOYhGl40GuYQwmv+MfTj4aVMny+K0OjBEz2w1ZQu
         Trbmo8qFac3HXJBHCGnL7b0rAZMoEswpfyBgRrJa5pqr7X5wsC0XzRE9uHV007lwvL9y
         1xOBFYS5lGAbNEoUtWlTZB/PNPlSx8XGfpUlAjVowtjieXtZAFmOUnNnzb0MlX4UV3HQ
         yGjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvO/qhsOuWZiVgvJ7U+5ikBurJDHSkOMCwJh2m4AbWI3WWOntArHASnWUQ7OpFWMajw90Zt+uTrT2pow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxK38mepYnBT22VQoxv5FyPbLwm9RyAjIfAJNdR/oMv3csEdqKO
	PpQXow7HaEJHsIgT9N6x23UZ0mA4Ozs84OZXdYmggF5i/apAjALb6XjG
X-Gm-Gg: AY/fxX6ctVAQB0kIEcrHX0+7dbz/nPRkSga1w2hna6ELvF5DTrjO/+UfU4pIaDpg2fO
	oV/dZpR8TQFtPApiFTTe01sfYaFLkq5wb67/TzOZwmqc3cVPIdLOh6ksKKBM4frEbr7XWSYCklt
	JktQ9vIu8wjLMxfnCa3YVyY1/S6KKObcUn0EzNUySzkyhF6hTE3UAuqwriqqHE5wHcNAGnQqJkI
	Fn7n8q/xLUwO+pEEGVbDXOIbU3j22TKsb++9OzKjajnK6fBgLEgC9gVR2oqiyLr/eE/KeWO0D5G
	tSR1lzz2KrW+pn+aH/pH8j10zDpyoubhjTDjOrsO7Tn+gZabGWp6P/9nx/kvwSiwfri+u+iFWqH
	Bo0mNBAts0C2qkXeY5cdrtkLv4g6uioKsVy0+gZczGmChuB7K1qARLr0bPRKlo+6/Uh4dBwkWmT
	psmEfNXszVbtibWKiFDvU2PsbD58OnjIll4YqxilFzMLqtFGVBFAo=
X-Google-Smtp-Source: AGHT+IEJ6Dza5e+TAlnoSNxkhL516y4Cp3K+eoLm8K4vH3URG1EJpjMsZlCqp1ChQbxfdNHgZFOu0g==
X-Received: by 2002:a05:7022:4190:b0:119:e56b:98b8 with SMTP id a92af1059eb24-121722ebb6cmr841995c88.31.1766096399117;
        Thu, 18 Dec 2025 14:19:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c00:cda0:e722:e1ee])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm1678256c88.13.2025.12.18.14.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 14:19:58 -0800 (PST)
Date: Thu, 18 Dec 2025 14:19:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, pitust <piotr@stelmaszek.com>
Subject: Re: [PATCH] Input: apple_z2: Fix reading incorrect reports after
 exiting sleep
Message-ID: <snwkpf4esyxxhyo2yzq5xepgoh6nkvvqldbiqpj6zm3bbc43zn@gdsxdsza564a>
References: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-z2-init-fix-v1-1-48e3aa239caf@gmail.com>

On Thu, Dec 18, 2025 at 09:11:26AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Under certain conditions (more prevalent after a suspend/resume cycle),
> the touchscreen controller can send the "boot complete" interrupt before
> it actually finished booting. In those cases, attempting to read touch
> data resuls in a stream of "not ready" messages being read and
> interpreted as a touch report. Check that the response is in fact a
> touch report and discard it otherwise.
> 
> Reported-by: pitust <piotr@stelmaszek.com>
> Closes: https://oftc.catirclogs.org/asahi/2025-12-17#34878715;
> Fixes: 471a92f8a21a ("Input: apple_z2 - add a driver for Apple Z2 touchscreens")
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

