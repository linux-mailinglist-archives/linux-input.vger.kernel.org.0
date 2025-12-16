Return-Path: <linux-input+bounces-16597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2C6CC1130
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 07:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1EE306C149
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 06:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D909D3358CA;
	Tue, 16 Dec 2025 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhtFa47x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C102C3090C6
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865508; cv=none; b=EKfk7y6lm0rfRGTLOzxDofLiebqSozIKW8D5AVkL79ChEEOes+fMeXNApkDUAAapDrEb3z/LKseVYJaAc+kdhwUNqs66Ke6UAMcOzK0byP/5a4rD6RE4GeFRTfw+9UsIb1YQ4VaEtoKUeBlOsEiKEB51FZqEN6LGpDHhTJZcPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865508; c=relaxed/simple;
	bh=tyswV0/OagyR9qpE9BYxFqG6ZnsH7PqdOTEEYduxcXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gq4B91A/kQzZJHXJCR16js5/raERbLNWhgE1lJvU6Xj2F2vSbnPI8+Ahm867Mma0XCvV1d+htKnTogLeEa+EKlSP4Lup/jOmYa9sAo9qomgTRgxmLLX9oNjLg1Dm03WB4EQqF+uq/GTAJZ/4RH3J5fXeKevaLmkM15ltgxCutPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhtFa47x; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso4030443a12.3
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 22:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865500; x=1766470300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
        b=GhtFa47xLKOB//SLz159qFOOraf/vHrZUyvD1qZi2ahuvhkZ5Wj+8QlBNks+ArY5T0
         Mz8vZayWZ8OQXwrqhIBWt/TaGlMo7+qJyWn2U5EPa8cl35agUW7c7PA7AGi/bh2NPYxW
         oI93ZsrYQi38v1nyFptLrGj4jsttgmsjdxv0+pTFXpX9Y14vskWtmlvp5T+AlcU4R0AS
         qRiYzDWIcQJLhEP7Vq7RyRiRLJxdHdFBypepRy6dD7UXeC+i0S4FpYERFgZMscIeSg1Z
         QRTHTFu4VV4+f++wuLs/KMsdXG/XN/RAo8svTHptsX8dmy6uhiPSMjsDa/rP3h5YCOfz
         ToNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865500; x=1766470300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91/sEp6nL7Uz62wNdS3TngXU6hAiNIHZp0YMqKGfo9A=;
        b=L6mMQeosB+oAHrjacnZuWcmI+A+SmFbVwmai3nPwjHNAfJ0MArQbw93xYp3DfRw5Lh
         Bdu2APpJHqNctmuB9m0lYG8kw/q69L+FW52xdKV48P5uYoKkfY/vGSNGAJqrVHBlA/Yo
         g/v6uYZnIe8mGBHuFylYabxcbRjariHSa4Dag2zXeiWC115kcU3cbj7M+DprzyjO394j
         xyw971tc82XY1hiHR8rZLtYluOxooHmpLLNx5hH4KpQfup6ZZljC8hpYnh++efZdwehg
         GeCrakblvC614ahSmGE1P05FOahzGe44jpN2swcHuYrBJKcmIOPqauUtyYv1cD4pX27e
         IQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCVoOGZEd8Gxe713EaRWL2V7APrkQy3DWbCQ3V2Qo6WCy15WVi+59RInPJarDp5Zp4LvP/VpKpGXAntpbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgGG7uo545QtKyxS3FFYUQ3pIoqHYRQgCSFIyeAN5mqhu9dVA/
	e+ddRc5jIJQH/XKyL4U1BFqXZAF1OfoRIXviyereTmI6VLbTfs79eQZGSrsVgw==
X-Gm-Gg: AY/fxX5Bt9EioTGvkR3/TC/kJR0TW0FjodcSnFaTVw3RlBFjmIyK4dQjA7mUJS0Sua1
	UnIiCHwmeXy3znD8uNT5beltdz+r5wegVjVAX+SKXkXSUfYY6ZaZc6w1/BnqqN7REgnH4Qnes0U
	ZH5VAG3gAvyE30HBBU5jBZ0f3r9ixncg0VGqm0JU4qvRCcJFxaVaa7gOBHpCH9+K3Jfl4sSF7CG
	V6L2L5vhFp78eal3tOCGGxW3i8UgxmI8JHrkjyI29CeT4C2qdsesnR99AFoiMB6YygTHK06lEuG
	x5o9KoXqPVjToVnc9GwnK6Wnpw1Bo1x+GxMibtWcUJgoE6wjTRFRkCttflvH5p/VHfX5n4jlPnM
	klaD57aEoIh8sAP++GFKEkDtXr00Hf2ViSqtPlnEAG9yQRq37FK44N+t5SMAEF8Ctm3dD1C4SWo
	KnFF6iSexKs0G7Ic9WiyDOvWSKm61O4bs1ZZ0V/l8WrjapKSREY7I=
X-Google-Smtp-Source: AGHT+IGrfQdHLxRSdxWY8bxHyCEpt6bqyxrt6EqKW0CWWGAPI8Y3i9jlvILhbFtYKANvT+tUPM/qAA==
X-Received: by 2002:a05:7300:f78e:b0:2ac:1bb1:68d4 with SMTP id 5a478bee46e88-2ac2f85ee02mr8946330eec.7.1765865500306;
        Mon, 15 Dec 2025 22:11:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ae4f0546b8sm502879eec.31.2025.12.15.22.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:39 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: stmfts - use sysfs_emit() instead of sprintf()
Message-ID: <gjnxidvenisbv4lib4jhngybjqcux2umn2iunnaqvjct764njg@qf2k7mcvebml>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>

On Mon, Dec 15, 2025 at 03:30:03PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Follow the advice in Documentation/filesystems/sysfs.rst:
> show() should only use sysfs_emit() or sysfs_emit_at() when formatting
> the value to be returned to user space.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

