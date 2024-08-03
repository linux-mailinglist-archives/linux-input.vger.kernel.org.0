Return-Path: <linux-input+bounces-5293-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0AD946782
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 07:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A50C1C20B76
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 05:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A8E13BC38;
	Sat,  3 Aug 2024 05:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFLp3uT0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DD613B7BC;
	Sat,  3 Aug 2024 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722662784; cv=none; b=SJYn8TgSrPD9U8zxOqvhfkRGXG+0xSfswWBccp0ydTt7/qj3xKBT0+e6AHFIiBZQ2mr7TksPV+BGTLu8o96oeD7vzwSJfaYiMWdjE/MooCOR87p2FQu2Y9GKOWj1YiJFhW0YLaR72rLjouOciQ5l2TUenNoLzKwQqON72U6omac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722662784; c=relaxed/simple;
	bh=oWyRAm63uA9X7v13N3QIJUgnU1UH+ekPUw8NU3hEoP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWOmHLXIkh+xmCKm8zrqnyR5Wn0xwfdQYoeLyz0oukzJ89OjYO4BgOERXSHvZeh3JPgOWV6SxuvfbuizIwKxcKkQzYmRASfpOvV26pMoSmr3LoWrtOsSsb8FQ8lI7VjN8gk6FRLdbVr+qM3yc0cxwAecqgBJMymXEizpjYgYlvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFLp3uT0; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-25e3d8d9f70so5285825fac.2;
        Fri, 02 Aug 2024 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722662782; x=1723267582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw93++57utP9jDgCwiMGqKOTDkT86N63wDHgTh02H1Q=;
        b=lFLp3uT0ZBFUqwBu3Ku2gfZ0h2U0frosMOkw6QPTwvMnBRW/TqkyntfQN6NcojVVlG
         IfXGKWpxAGFQKPRddWqM3/GIho79Xfrki7ov7f6yp1u5oHA3jDHM3zT+WjPwcG+wSovy
         6zKo1d7riIx4N1tgF4XBhZXZtIrLRM3KCPFYaqBpir3aYCSaBMcE5eczowdq2ZP+VsKg
         kCOve3T7xt+Y7ZE0uJ0CuRojVt82Y+2QTwvWVFTcr3Sjn3+kCWN3bo7XLXGblUZ31uK+
         jaN7BkiEawu74gaplGbMPrPC6tjGaSFTWa/dYV+2AU5bbSa51mMG++hYy7lPiUOzVJI9
         kOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722662782; x=1723267582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gw93++57utP9jDgCwiMGqKOTDkT86N63wDHgTh02H1Q=;
        b=jHp/jUMx6VtFO3jnVNbdsnd69zj8jsdVLct0WNrsnbHO/m9cIsiPzWpXzFMbSZqkWr
         Nu7uXi10F31K0192CiI3N/BmfNjPgU1NNksVdPFb3l616oMjyzxyG71E6wJXscuj/lA7
         5E1fDEab0qkifK8TQcwlO/DZ1HT5pbezIRxDrnZzhzYBfekkZqAmzExpE5D6Bnct14V1
         zWV9nSOXxVyZFgQiSDscpf2xRfCDYbLALLn1xGUc3fCSaLrb7osaqzMp1yuAJ3wpDDVN
         9rjSmsAn2Y14lqfdi2AYAckdURDumXliHNHuejOyJ7gchYcIm+4DaA+VO8Dgmlvat609
         6m7A==
X-Forwarded-Encrypted: i=1; AJvYcCU6qsC0HCRJSe1+JZqaM2vYN6Z5tWH7o0geOoOrhOhW3ZNC+ZA7Piz95t0g2SfNcZ03R6HlaXlGr18YIHFi+vL3gRTBQDqJl13PvlbAFvkmHk7jCbgbUr74QRLa1ZWyydhHlFRBCyClo7fDveEyvi/h5vqXHSGKAKSgzJe15ysXY4BDuAjpE1T3Fku8Eg39BVUWCWCk06l5ppeYFRXwy5odxFYPIB2CLPCw0qyFI9xDl/bSQXjU96vkm87Rm0F9
X-Gm-Message-State: AOJu0Yy001VSbmh2ro9r4Bn7Ar0ZcnMGGCvI9K3yrKFb34+a6CtmfyeT
	w1OzDNKOk+GlavomoZnCV8+OG/6ri+oLnO0LVWkQnRJ2T76nuvNr
X-Google-Smtp-Source: AGHT+IEdvd40BBz1Z2/L360nmGpmg6LUmBpGm6IQu5JigqoSX0oej7Q4AZZeh3KSK/mxyU7gWtO6Fg==
X-Received: by 2002:a05:6870:9690:b0:261:9c7:a0bb with SMTP id 586e51a60fabf-26891ee2919mr7265705fac.48.1722662781679;
        Fri, 02 Aug 2024 22:26:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec41cb2sm2117690b3a.68.2024.08.02.22.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 22:26:21 -0700 (PDT)
Date: Fri, 2 Aug 2024 22:26:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: lee@kernel.org, jdelvare@suse.com, linux@roeck-us.net, pavel@ucw.cz,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ukleinek@debian.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/7] Input: add driver for the input part of qnap-mcu
 devices
Message-ID: <Zq2_evktLN3MZaGF@google.com>
References: <20240731212430.2677900-1-heiko@sntech.de>
 <20240731212430.2677900-5-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731212430.2677900-5-heiko@sntech.de>

On Wed, Jul 31, 2024 at 11:24:27PM +0200, Heiko Stuebner wrote:
> The MCU controls the power-button and beeper, so expose them as input
> device. There is of course no interrupt line, so the status of the
> power-button needs to be polled. To generate an event the power-button
> also needs to be held for 1-2 seconds, so the polling interval does
> not need to be overly fast.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Feel free to merge with the rest of the patches.

Thanks.

-- 
Dmitry

