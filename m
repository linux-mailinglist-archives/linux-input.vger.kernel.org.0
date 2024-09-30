Return-Path: <linux-input+bounces-6885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E033989920
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 04:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE171C21527
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86F4179BD;
	Mon, 30 Sep 2024 02:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ng3i+Pbp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DC711CA9;
	Mon, 30 Sep 2024 02:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727662481; cv=none; b=m15z9nudLwdTIjUYrlAohLmQ3Frl0Kl9EfJmDgBw4IYPQ0Ey04OBy21hXqUxCLSc0BR0Ewi5Y7m4vtff5Y8PC0a2wcILBgbwKEjG0sEhzZzzr04zWsZ+hWf5Z3nH9yvsQFxMOheJeQbByVr0dqabJRF3gnKP1Lu6hCTDn1Cui60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727662481; c=relaxed/simple;
	bh=gK1BBoZgChkfSZ7WANKhWWuEckpRI8D41X1S01uHoJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNQaeJiqguHRo2Mul18wN67jseXpTUyJLJM/ZKGGfI91zNFxIXrpnVR10uPBt+dMAab78ehpeaMaCuAMeM7BDT4XMHNfeDLlH5s+uT4s1a/x6GicskxiGvhD98uUnPBv7lYUwEl5ZWNV4YVULE8F+Diwf4Il9klmD42advI4cKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ng3i+Pbp; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71afb729f24so2906304b3a.0;
        Sun, 29 Sep 2024 19:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727662479; x=1728267279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ChLyKdnx+gSb/hCqQlfdYD8OWuUHcIg2ZmiHod0R/4w=;
        b=ng3i+PbpemAJUj8egxoFY+amotFEHpDw+L/C21CCEBuu6rRZvjsdhXJ2A+brdRIBsi
         gdvCzm8wz32xzK7RfD+o0yU6w5CJ11u00XKUH5ApBJeABSoxvj+PhbqS8VP6kNrAcTk9
         fhzjrLIPYw6LkvmWJMH1XqqetNEEJ2/OxZ2n9gNAI6kKIBIeSCU1j0ZFEmBE/TBqEPcW
         wD0gkPvj1kQHDT2kaKKAmQrK+jG/3myKiKWiqSmP1yGlcjKTG2HXIRQOxFeujqrscVs6
         Dyv8w3a73gZ7jVNy6uS5pP2sNHSKtWrYwvOl12y+h/7hQeauxMM/rYO3Hew7TJVIWc3M
         lHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727662479; x=1728267279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChLyKdnx+gSb/hCqQlfdYD8OWuUHcIg2ZmiHod0R/4w=;
        b=ImbrmZPng4o+2fNWnYZbaQY2Z5PpMe5BjxIG43gWmR10jNxcnvp/V9bb8qM8ekTk1X
         FWu2NiQEOsaOx5eRLXXIer6OIetmU8PnORf+EIylTrM4eGZVf8Lmu9DQy3p4HL0O2Ksa
         T2DCIpSeWosfGDM1P/jWxPFB4XiW0ZKwgs9ebzCnrACHgHEvIj5pVoa6czbdOM07W40q
         SgyZjXxzpAl1DRLwGssE1cQ0hUhIb4PUHl74jyoOzlkLNWoB3Py1vce85CFQv0FrS5HK
         wZ5WGsX0JeeN5utzKvqiLae+mS6kAW1BrpXvsLJYY0s/VINBCAur3KbTnFQZRrBnwKXA
         4mwg==
X-Forwarded-Encrypted: i=1; AJvYcCUxlqXelPLk8XxgUPN6GwoRb4VWLtF1M9RoP9PMRSjTFBbd8J+L4t+0BA9q8FiWV9vO6nMLsdAWJdzHrVM=@vger.kernel.org, AJvYcCVb/cw3INCxFDbc0EAe/HlvmuMZmtnYtXZcqfzjFkEH05RJ79ptZac4vLszw0p7NptItzN9mVqTAHXI@vger.kernel.org, AJvYcCXCh2uPGaz4X/H55Oaz3KuLV8Llf00kiMmA/sLqzZbnZUFWsQBLm8s1+1o2mqb54TMOSnFOLDMJfXZY0+1a@vger.kernel.org, AJvYcCXdGkRy0XWqzXQFhA3Fc2T1WESdraWEIf3VhzxPBq2Gigrfv2XZNv/mLpd+GTWL2EzKIjiYmxdQt5H427zRM/Guh1mU7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoN3hWA2IELrPp8Joedj42EaMi8sYd0wCO7ufRNMpXfvl25Xbv
	J2oPkl6yyrliEtbOAnGyG+4rN9JCF0q5SIz4WxoCnF86tBkS7/qGUWgEZQ==
X-Google-Smtp-Source: AGHT+IGY+kaxk2R1ggPIcsAArEa6JtfWGotzUKErAP7X1L04ZVOHFs2rgvWf5e5YFRsSaQbdPc3ctA==
X-Received: by 2002:a05:6a00:99e:b0:705:9a28:aa04 with SMTP id d2e1a72fcca58-71b260815d9mr15698970b3a.23.1727662479327;
        Sun, 29 Sep 2024 19:14:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:671d:78af:f80f:975b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b263553c2sm5179734b3a.0.2024.09.29.19.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 19:14:39 -0700 (PDT)
Date: Sun, 29 Sep 2024 19:14:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: joelselvaraj.oss@gmail.com
Cc: Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
Message-ID: <ZvoJjCY5kXfenXgE@google.com>
References: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601-nvt-ts-devicetree-regulator-support-v5-0-aa9bf986347d@gmail.com>

On Sat, Jun 01, 2024 at 03:44:42PM -0500, Joel Selvaraj via B4 Relay wrote:
> Extend the novatek touchscreen driver to support NT36672A chip which
> is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
> Added devicetree support for the driver and used i2c chip data to handle
> the variation in chip id and wake type. Also added vcc and iovcc
> regulators which are used to power the touchscreen hardware.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Applied the series, it will go in the next merge window. Sorry for the
delay.

Thanks.

-- 
Dmitry

