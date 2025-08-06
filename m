Return-Path: <linux-input+bounces-13846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1A4B1CA02
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 18:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F03418C37B0
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 16:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20237247280;
	Wed,  6 Aug 2025 16:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esYAIY1z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61EBA34;
	Wed,  6 Aug 2025 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754498998; cv=none; b=HwrWKwgCEYLwIXGuAYsHZ3zjVIY6el0uznBxJoPbrThd3X07EdQo4amV9WCmJIK0GnwZKI64aBaQ8iaK52veO/VM+DNdyT4lsj/VivxnVtDc+PmiNjHifig3Swggvsp1NxTr4+SmBleiii4dUBz3SIpML6++TJeEu5W32c2jRdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754498998; c=relaxed/simple;
	bh=9fXIfvecTSaOv7VPj33ymGSXSz01PDOaFPOL7TXwfng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0th7cc0xACLlEchqzj8jlS21C1bsm8M4XoLQEtDduBE3QoIE1CjkbKKYHVVGUmG4bH77VRpumm/yCm2PQMtPAPJtJAvQmP6vfhFDwJfLUy3QbLLbpRJ47oXw6gI47jV1XNejtWmXopgp7yniEOoefMKUPl5nQHCAmNZ0UOURT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esYAIY1z; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bc5e68d96so137527b3a.3;
        Wed, 06 Aug 2025 09:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754498996; x=1755103796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2hxPoNGqnrfhBrfHS1iu6MjT/Y0C5RkQPJequbXhIKE=;
        b=esYAIY1zDXWRjVrlgY5oMjWC8tfGWWtWlp6B20fmNt6tL30RwGPp68Viot2zZotIDn
         ivBkh6hT2FI0qtGsC+kthpiygL76YNrbAMGEClFgMoEeCZMRcBm+vazg4eqo8Shhst18
         fz6qBXQxPVuRgdWzVctbQ2GEWRn3C0le25vJl096tcJKV/n4st5mbmmHBCp/3yrYrf7c
         1nY71vyzKui1img1JOWgov6FxFaPY+ONwVvG13+mtEs9c662j2axnBrcxB2tqfIsLwiQ
         D7Mk4FOTJRSejuPkmw9wvVX4PSJacj0TvinWgTKG6VtQLd0Nmt1WLSDrZ5Kc+bEiL39C
         If1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754498996; x=1755103796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hxPoNGqnrfhBrfHS1iu6MjT/Y0C5RkQPJequbXhIKE=;
        b=Dn0drnYLGco+D+FuNASABgH93q+SqFmo672DXgQy2ZDl6hj2DLm4/pd40fOIEKClsV
         QfUuTuwiH8jN7P2gwnHaAsqwEXOi/GKjrJgHwlF+eI1RTt0x6ZVbjBWZrGbq74Mn+WsH
         WhPWADtdhkZOFLrbQMGEOmKlY2QlvwMSEqG7mWBumDDz4kMTQ6II65greuZfs9BJ8MAm
         A8jIW9rl188d+srCeYy8T7mtNmpYqa7vjHJB/PcfRSUT2hPfCif5I8Nd/+VgHxAGJ3Pq
         FCoNwmBpRIB6DbsLc59UR65hpe9aOW0ABTs6A6LXk5L5lOh0CPlXRO0G1zsQKuDVPPJA
         Anxg==
X-Forwarded-Encrypted: i=1; AJvYcCUodIPDiCZKI8dVRhqHmngIrLk+ye/0eD63y0ufmr0Q3kOU58/OjWaC8xX6Lz2UOnVg9uhQ8OQKa6Sr0jkK@vger.kernel.org, AJvYcCVdb8+ptC4wGAVdkGqrBX5uWeOwGPbnCM+2KY2B7F381zmSIBG/CCl6byxNMSGZm8LniMprMztcd0bXZjQ=@vger.kernel.org, AJvYcCXk/k3dfUWiQepEbR4U60HGHtO4LPO+eVxQsKSP1Y/y2tQU6fsORSytLuXp8sJklAHV55eUBrkTUDDa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3m0Xf229EYmAEJX1tUEQKA0n5/Isr2mn9s04gOs+3v3sCNJji
	stgiBCTdbAH9DDzZlo/npSq/eKKr1p//4QVRIrQf12y1XeXx9dicxZfb
X-Gm-Gg: ASbGncvDWoCeRxkewOUgU6xf4LfesMCLRjStpG3KTpxfItGvCHuZd0SIb1Wmu8n+Z3g
	PJveS+6r4Je/dSgR56nvelZQ40ROe+AlOyx8NcCMWyaq02IpvJmj+4zpJgAQMW7zXela1g0bcHA
	1SFsCEll4hphQCuCIQ602qeIrO474pDQTanfbadMGbfYchHOsnpe8saQa4TRvuqrwrtxqd5HKga
	+aJjjFjxHCYQDV8hSRLgWnX+8JSPOa+NboywKLg6SM+IjE6/jWbvyr9qiIqn6Qjw8qJKAOLpmx4
	QfJ7Qsu4wCke/jWcfvEpv47pfnVqA1PctoTQqzRlIj+oBWo4+W2TXve+RKcYF0zH8LU3PCp5nhr
	RvPnpgbaPHGdYa6GBtz2I+3M=
X-Google-Smtp-Source: AGHT+IFsccJl+8grrtfEeQECM+TOHiPBar5NCMMdqnb5GEn/iiF9QyTE/qR0isk8lV8PjxYY9tqQWg==
X-Received: by 2002:a05:6a20:7484:b0:240:750:58f with SMTP id adf61e73a8af0-240314f5ef5mr5388018637.30.1754498995688;
        Wed, 06 Aug 2025 09:49:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f30b:816f:bb8c:fe9f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f30bsm15918359b3a.16.2025.08.06.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 09:49:55 -0700 (PDT)
Date: Wed, 6 Aug 2025 09:49:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
Message-ID: <akavphbw2wh5vga3eoe6abqdawdssko4cy2sz7oedef4jvzunn@37whg62gmfoh>
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
 <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>

On Mon, Aug 04, 2025 at 10:05:21AM +0200, AngeloGioacchino Del Regno wrote:
> Il 01/08/25 15:16, Julien Massot ha scritto:
> > A recent commit in linux-next added support for key events.
> > However, the key release event is not properly handled: only key press events
> > are generated, leaving key states stuck in "pressed".
> > 
> > This patch ensures that both key press and key release events are properly
> > emitted by handling the release logic correctly.
> > 
> > Note: the code was introduced in linux-next by commit
> > bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> > and is not yet present in mainline.
> > 
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> 
> Well, you are effectively fixing the commit that you pointed out, so this needs
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> 
> and
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I am really interested in how exactly this was developed, tested, and
reviewed...

Thanks.

-- 
Dmitry

