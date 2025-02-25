Return-Path: <linux-input+bounces-10358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0FA44B55
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 20:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7F987A460C
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 19:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B381C860F;
	Tue, 25 Feb 2025 19:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nn1U3tN+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD24414;
	Tue, 25 Feb 2025 19:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740511657; cv=none; b=n0RkUVO+Hz2xoUETYYOtGUmNiWIUmokre7nt6IrDittuJ3zFHWmiJoXTZL+sgeyxM5zzd1VTfhfdSi7uZs19z/xdQQhrcGpQ+TmGXYkMMxX4oplOUdFjF8k827J4u6LPw54TduXwVu+uTBebE42x66/i+41ylRNy1HYM13tMI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740511657; c=relaxed/simple;
	bh=zdaV+3Ywbo5HbnXPfU6splKF+KIBRUUTFf17H3ea9dE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8BECXANt6OXPF+8gAk6bc7yTKnhA9InBKfoSEBEakGjDCH3f3AlnKAi7VBPFxtmH+hcDR0K/Ek1TnlXU+WS2pDK/rK7ZcT0QWQ22UgS2Bb92bGei23A/5xZLEazAfKlm4Zj5TwLLTAnEixwegNzJVcDdgqVrlyf+Hf8C1hskXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nn1U3tN+; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22113560c57so36736195ad.2;
        Tue, 25 Feb 2025 11:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740511655; x=1741116455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C5SO+7/ep0j/owc8WrmnlAPtfqqgd25aSeIIb1w7NrA=;
        b=nn1U3tN+K3yzvRLAb8ryWFurttPpVBOuTZVIaGscGvTML8Ou9YGJCin1SJhqKU7YsF
         OUxSadkl3P3+tuXYet3n4zYu5cxPwsG4wMXZZtRSfiT2lwIC43BtF9OHqkl2HzvsqYs3
         d88ysFcA04nXSN3IHEYOFoYDHS/ktZ9bQuBSiRncu0YLFH5PxJiiBw2Pss+i5GDzNA47
         gfAmaIEwabkpdhp9bveDU9UAiZCoi/HzkQVnH30MjuJJcPnteVi5tGaY6M049SezAADO
         JrIBBqsuGFd1N74Ml3i7hyyyW9ACSd+vTbPbYtA764Fc2QarL0fSI+Wkom/jbVFLNDin
         DGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740511655; x=1741116455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5SO+7/ep0j/owc8WrmnlAPtfqqgd25aSeIIb1w7NrA=;
        b=U8UjCax1ejgEy3KsVgqPSbYwrEg2R+yR17Z0f/Ntac4QQUIL6kUqssfmw/PIuZBvos
         jOEBb1GnZBmnJn6OO/+rmK+q3dvAKhtFU3mvTuG4z4/eqhTeLXDHsSOL8r4Mvoa8NzTz
         MMZUlQTdTRq97u2Hl3eoSyyJSfN8hR/Qcz7nbM3iuDuKdEO8lTop1pKw6JWkDMtJ81jB
         6g+hd+fmgmox5ZtL3d3btd9/j+06ht5vZKwv/j5ZBrE3GhxqY+f1BTLdeWnWoSadDVul
         +SwmT9vD/GYL75Ui+6367Se2oQbLzsy78IqkQF3SQripaL1IkL+rJbbKzX9E1B/Py9kw
         L2Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVaIXDb0UDyd5EMfxOFTJ9Pxk/N6ljDcCZGrnw/e9sccwzPHSKuBKTQWfEG4fgpw0EfeU0SjJr4+cWHz2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vmiD0SVaitg1cCZVJlGn9llSj1HTMZdh3LKtlm9oWYypjINE
	ZtUtY4JLDwLG6kNqk5y5iF9EtMzyKvMt+ZnPdVt6wfGs2+qt8Iid
X-Gm-Gg: ASbGnctEoRGZzmS48eLU6Hezo/1t97AP+0tPNx5UKJ+33WVq9fd1SwyeoMf9lItuEJ+
	zTUhiMWGbJ3Qy4fsZ0DI0sK/kvF1jRHFEqLowxnfZUYC3mmf1dbGyi86QsPgdER4DWW6HmcmAqy
	IQkTMt3u/OlPY3VI8aXZ9C3meTX+A9lWS84f98r7fBvOu1kTjFMzvs3SzoMuSovWomVtV8srnzI
	lO4z6BqQj/U1X+N5cRCA9aBH2meWPwEv8agFESDKDmekDuwCEPm2RyozTHlUuEwZIz4wl3Mfec4
	cqirrSNi+dkBubhT4VcXFhF01LI=
X-Google-Smtp-Source: AGHT+IEqSuUqr9dv8f0RwH2FZL2RwCXspaXOEwGIZTwj3CQdWQj6g02qdmxYcGheJFG6nbU/pscZwA==
X-Received: by 2002:a17:902:daca:b0:220:c164:6ee1 with SMTP id d9443c01a7336-221a1148bdcmr297622065ad.32.1740511654831;
        Tue, 25 Feb 2025 11:27:34 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:987e:29fc:176a:2ed5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0965cfsm17946225ad.155.2025.02.25.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 11:27:34 -0800 (PST)
Date: Tue, 25 Feb 2025 11:27:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: fnkl.kernel@gmail.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH] input: apple_z2: Fix potential confusion in KConfig
Message-ID: <Z74ZoyMCHSkKQK6j@google.com>
References: <20250225-z2-kconfig-v1-1-a67d9b778a6c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-z2-kconfig-v1-1-a67d9b778a6c@gmail.com>

On Tue, Feb 25, 2025 at 08:48:24AM +0100, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
> 
> Add a dependency on ARCH_APPLE and clarify the description to make it more
> obvious that this is for ARM machines, not x86 ones
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>

Applied, thank you.

-- 
Dmitry

