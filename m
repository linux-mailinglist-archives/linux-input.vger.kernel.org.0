Return-Path: <linux-input+bounces-16596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73411CC112C
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 07:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EB2930274D8
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 06:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE8E335560;
	Tue, 16 Dec 2025 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZdViBYG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276633468C
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765865497; cv=none; b=duwBjYtZf/roLMgJkk9W7eHZpd3faIdiHJ1U112Mhh9X0P+rDv5IR4zq3czRZOw/6MmlYHbm/nVcE2yomEz/C7E75zDlRnHSJ0g0Il31UecYQ/IxTmuEgoi5ukGzRLgnFEyTBCpw3JaHO0AvGm+B9pzMTRrG/bj/450BXcQIZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765865497; c=relaxed/simple;
	bh=7UlA77zhUIn5ahCpqXHki3OAy+zNF7+A+QwUBa6p2lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVdf9qIfuJEC5ru3Z6lUGzvJa2aOl/e5sZJEu9pDeKAASy19Z3v7qFdgwfC8TajaJBhtfS+hmylMhI4SzF/x801WiwDw8EK6Lqj6P/+kdupYnFLoh2t/n4X4LxzIfSxxig1cxBkDwEPEdbKZZKk9KtnTeb5J7xUa8HpGDGyVxmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZdViBYG; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34c213f7690so2716965a91.2
        for <linux-input@vger.kernel.org>; Mon, 15 Dec 2025 22:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765865485; x=1766470285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
        b=ZZdViBYGly4W4EdM6IW631TvnsKN2Fked/I92aF0aXBGNw7aanokKX9UazSqoV47V7
         7DRqgf56fYdBfDyE5MgiEge9C2DEtEj+whMf8YfmhYgp8in7dz5Hc9x7y8HLY1I/Vw99
         UMbf6ZN+xWqljZ9vJDSgSXoK0y1AzCcrZ+MZdxTPa7TJ1kLNOYo+depXZUK/ag60o3S2
         L2Fd1mUCzDYWciuCkKRSdIZZIOTHTSKw95uRca6BIqQT+DWNyaQKI7eRNsOkEKh7+KLS
         Ga7nQXEYEGasbBxzgx9wmwTn0WiT/z3YxhFT0WC/gDPvwkb69IiZe0ZiqPi6Ydm+51rf
         rzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765865485; x=1766470285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6h0HpTE4JvNO401sC9YC1zjzbkEMY4YQbWy6fAX6+G0=;
        b=WWxyeiG86QSV7cgXqtzTe0AetVSZDurOz+WfkTuIT2gr9IG+KAWizwMB1Lsw3usSms
         KCL2DaSGr0GDWi+RuA6wxEHFwRFNPrxloWHHs3lsubMtHGfSn7b/OvAppJtr0Gihxeha
         MG+PRSDNfuqgU5TAjDlS1c20VrlYQW8k6oCFTb9bdW1CaTWVf/NcHmMNxw5C5UOySx0z
         ycmv9rS8UChZHTlfpt99s3NCAsObAo+yXpgtj8+oogfTeuV8fg8APkuASMNW8J7WuH/S
         fnMi2UY+JnOCxzSa9lB+VwrGe3iLcXdo2pDm1b/jhwDjRFIJ/2ZOqb+knckxJ3p2bWsQ
         dLlA==
X-Forwarded-Encrypted: i=1; AJvYcCXhbANah2f0sh97ihQ7m5oZ0+BWS3DMqpwPMzLhp/lqGKFazp/VlMH3LL05EVG1/SQI5LjN9D5vGqsjsw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YEJ254kNnTLirx1jG17hrIEJ4nmRzc+Z5sLS1YNXwsd5WBT8
	GYtRijPAEsR1N/7KtfxjaHBB6ARREW/fJuK9W++pLeUBKuLwEoaeuB+3
X-Gm-Gg: AY/fxX7u36XBVga3BDeSQ3i75Hq2dmRMsQWW0Rp8MnZFo1A0gQBiKzS8wPibkTzjjQR
	hYuoTd1DQCc93+DbafqkqmZjMgfwUr4CjHD4w//h7NEYNP1vpjLeg4EF2tyg6Lr8WY0ai0yHrKm
	2RXinbuSMy/CvlLfuXBn3T1hEU789KpowcaiQqTrxTWAeXvA983AxnViTAWcP5ZYdUPZLLDKVG1
	d4/jScqCA+0UkClMKH5n9EAUto2FedcPTDcGXYe1jJRwTmFNo5x8gRwFsCoAZKcw5A/RtKTWHzp
	Sk8kJfLAKxY33+gG8f57eRiLyYSsgvVMd9ZbE77C8HCapY4liTKG9zZ81X0sJ8ygmnZJIthWT2K
	U7EPhpPrw0MutnfLhU3LIm9fmqddWZr/1/qJDlG+gm0UGctxySTtNNfwPo3TX+cfqhYSsXSfD1H
	LDBNi8pSIVE2XUdTu6aS9xyUEcbiMFVS3rKOyszgn2S8/5LeFeBms=
X-Google-Smtp-Source: AGHT+IFJAmO+3G7br6lpUjw9es7pGYzNlpGk5tFUMnsEsBNlQ1wUjlSd5k+lWHPv3a/dqdPQEiCn/w==
X-Received: by 2002:a05:7022:ea43:b0:11b:b622:cad9 with SMTP id a92af1059eb24-11f34c02663mr7682270c88.21.1765865485165;
        Mon, 15 Dec 2025 22:11:25 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b46f5sm49975086c88.5.2025.12.15.22.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:11:12 -0800 (PST)
Date: Mon, 15 Dec 2025 22:11:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] Input: stmfts - Make comments correct
Message-ID: <yc65vlbqkok72lnidezzrivfvz6sdserm7jazmu4uwivbqufpa@we6qlhaufwlt>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-2-8c1e3a63ebf1@ixit.cz>

On Mon, Dec 15, 2025 at 03:30:02PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> No functional change.
> 
> Fixes: 78bcac7b2ae1 ("Input: add support for the STMicroelectronics FingerTip touchscreen")
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry

