Return-Path: <linux-input+bounces-16595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE282CC1120
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 07:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687B8306129B
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 06:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA383358C2;
	Tue, 16 Dec 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z5v+2qHw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B253358BE
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865467; cv=none; b=dliB4UlUSIUpXq9Madx6wj6GYhtG+A6xaFcdBYnpbw1/TMLqpmIk2DSr6W9DyhWUPlPhiNc4clY7dpAw0WOvO/RTF9cvBsAy8IRWC5UM+sqgpNoKFMY5GXBleoioGxtxthxuZPvwChr9ZeH0WHHh8E4Q3sLvsl95RdKrlOWhnBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865467; c=relaxed/simple;
	bh=PtHqkXZGbkk0GxiHmJ9redz9PAYRor6v2NmkO6ePcAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSHCOFSyDqrqgPSm+tM2VebYJAS2CuUl+wdj4NdwDWSZucPl5rPjf2z1LPW9aDv9UceX6mTSUKDnSHdjI7ZxuhrGWsys+O/3NNE0k6MQUDStZ8Lcjic+VSCyvWj11zHYGAja8LYIV+dtEdDr1F/g7C4euVPhjFta7+f31sQXHiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z5v+2qHw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-bfe88eeaa65so2847576a12.1
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 22:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865458; x=1766470258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
        b=Z5v+2qHwoja5Qh7PEB1fd2RZcv9XXSBBuZLQbXzxy1TVQDz0bh4duNeibqnCKFd87C
         kbgUpnKunDjjajpfGeoCJNCw4/iTlfVhA+3QPAlbPgT4YVd55B1s1WDR0bF3eYhf9XEb
         Yfo0uD4eBDfcSojXa61pMKhS4zMDO/ffHtMxCTDlbXeKWHH7mgXVKaLNoZ8Bpta+QA7s
         JFZeV/UOdO3DjAEmqkdd6DWjr8e8gT1E3UkGmOzK4pJwqTy2ppKTUKTw4pqTM3cJg411
         yFudZYL92QziLHrK+Mib5rWOA2UPGZ0p1D7haddOD37dYZC4XwfQcvK4Y8jqYxBRXhtv
         BVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865458; x=1766470258;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sW7m48+VKPhwN9Rm9Ugqxu1eLioZD54jqqMNJ7yTAA=;
        b=M8Kn2dwjy9Gx5wz+XoJNjqJSGhYhZBAAEyrYySE+43ljUjw8WCET4SM0EwEtTgbVHc
         Bsn38+flPp8maq1aKgqazOe7xqbhZE/PHX/t4p5dD9YUommGtVWCHS5GLGm0TFR9a1e2
         kbVUF1UZf8sMrdgNfGinZHF3YMgphiwvWb8M7KI3Hn3sXd83rwYfr08w7PDg8L0O1BG9
         vifHB2JKaA/DXbPsOoeF3Hf56nSOzaQD8KnPw7Hg8OB+YP6QMhALa4Ah1CisvpAPJBje
         N9zAnYdt+p7IqOfF3D51bKda5wDjrW5TxEvSNpe0mEdD3CsiecZyehUus9qSj/uZnSwb
         m3Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUJy3eAc0/7pRXcaQpnR4b7LPQhTS8CWLGfipJHBX4C0qZ7BAdXwIsTcGNEqvEMWiXEGsU7VO71v9x4Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynPo2/RrVoGOWnx6kMVQcIkk7KehSuYf9r6qgeHshDhueaCA57
	kom3tqS/YaMI5u03mz8p+jh1i4k+zD7d4zj6uHE0xWGjI4hki1dwqgrW
X-Gm-Gg: AY/fxX6fq2kfQ/XKW44xArsXHGehx+oRQWzLci9EAkgGcqjis1P4MwWFByWV7ZtA248
	74dGn8/1tn/1Ex/huqTGhDXBpPZf7m53sdRXtOmZmNEoS2ST/+hPHhLWXFqK6abqY9mkrYv5I+O
	5Wcb1UcLkrkK+JjkEkrUFM4z/OKTV3QRx+BdcIgviTzN8ajHsNooflTPoa1x4mYTZPTdM24g0OY
	v6C4BlMaxfOMA4zmUkC0C/b9cTi40W4g7hjVYDEs/aPX/JRKu/MWiQbWALm9zOo73x/haHAsj5Q
	qYYQf6bgslRAtP+tnp466eiLV8JnB/QBt1dTSxRStFlKsvAhKQ7HkWQkoTAQYPMGQaffp4r623l
	i9/1fb55stBcYdy7LCq9MyqsjaYIpa2JSUYzNFxao23AgKc+HJBHznDl+dw11NsrqwnerVyNumw
	XUU1y2rgsxKqFeaVrXPLNpbYMMue5jsQKUIr0noweH3iU67LHk/OsDkL4XJO3SZw==
X-Google-Smtp-Source: AGHT+IGZ0mxzWOtRI3rd3KcueGeAebVyU0dbceyTolyf30W623KDAD9U5TSvvfvmt1qC+AO1AImubQ==
X-Received: by 2002:a05:701b:251b:b0:11b:9386:a381 with SMTP id a92af1059eb24-11f34c4acc2mr7533177c88.48.1765865457908;
        Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30497fsm51603301c88.15.2025.12.15.22.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:10:57 -0800 (PST)
Date: Mon, 15 Dec 2025 22:10:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] Input: stmfts - correct wording for the warning
 message
Message-ID: <n2fcsz4gl7lyniy2qxdddvrisguc4ssln4buky4g37rjnwxxo6@4lyarw5ngtqs>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-1-8c1e3a63ebf1@ixit.cz>

On Mon, Dec 15, 2025 at 03:30:01PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We're trying to enable regulator, not disable it.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Suggested-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

