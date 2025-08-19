Return-Path: <linux-input+bounces-14151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E139B2C2E8
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 14:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE631B60A94
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 12:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1069033A012;
	Tue, 19 Aug 2025 12:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qEBOwid6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B8C322A3D
	for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605802; cv=none; b=fd+aGiAzWKwm5Nb3o8nwhBBY+HNNqdj5vAg2rUD7/MrWPF1i3z9Z6atAuS0QPIw0KELPR2j5yk23ljPe5GnLEiiar75I/B8Pj4UjQuazJwMojiSFrMB8U34FuTSDMhxTpc3o1OLXr2R0+uhz/8sidNyTmlxuFXCNSrvF63zaRxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605802; c=relaxed/simple;
	bh=AZ7o1pFXuy79shNbYRISLiW+dg67/yXKYIew3DntoxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NewAcsPi31qz7QzneUVcWRWQB2CF/9d9rNOtREIhRLYwT2FzNb+o8bSu1X1YSWhZwF9xkkQK2VnPplAv6LZiyWYVG/DsBnNaCXZWATP34IodwZye2PCdhjSLAjRViKOVF2quUIt4ErNatB/tbV7h52fVTfuSHCKK6BfpoQJhS+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qEBOwid6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55ce521f77bso5275460e87.1
        for <linux-input@vger.kernel.org>; Tue, 19 Aug 2025 05:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605799; x=1756210599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mch0lPw3yHrhu7n4ZdwY7/Px5OZohbQnsGNaNJBBPW4=;
        b=qEBOwid60nPDCNFZzmN7fKGDe0pNupuDkmcYgvLrgoWJnrqD6eg+CHg4GVXxdB6gfM
         K/09Kjpb9TKUg7M4DFecmpcA3ywNZm4XCuW3u66nzi7G6QuDT36eHUBDOaNj98BsMz9w
         /W/cWZ2t0OBlTjtjLoKqMJvUWPTUTH3shvpd4jGe7tcpVmti7i7vKbp1PK3uO9WASHgL
         RSGAAE8njAEc2jXwj/0TxTO5q4Dt2qKCZdKzzDyr1JRLiT3Z4NoTFNUHLu328Ii5c7/i
         gL8rnOrbWQil/7lUB0uhuGMUgOHIc319Dhc6Fq51nDQnyS1c2TMNKrSD4vU2MR3PJ46m
         8j4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605799; x=1756210599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mch0lPw3yHrhu7n4ZdwY7/Px5OZohbQnsGNaNJBBPW4=;
        b=WrT8ZbC6Zp06/rhAOYXwxgrAo6C2QGgqcpNy8IoieO/MrP+7nkh6hnm03a+lMHlStC
         u88dre4BTDek2kHA4o3d6ygHq1LIKcY+MCSulsm6rjN8le8wbuozV0HUn2xNRw8DyHVz
         GRM2G5qM261bsMAl8nIIj+yHI+i0kp/93FiqjKESUcbL3SpW2jRtxU6pR9SKuvuUEqHl
         DerNmCV2Zb3cHAaCPmmqVacjw3ixoS3nfvm9w1vJBEjjYyOIqt7hEjXCbbbac9v7KZBx
         vv1rGW3o9WV+gzxefO6WeXCXoAn6NklNqdbSQIiRdzwLlDF3R1ZQriJqsRN3mgWu00om
         QRKw==
X-Forwarded-Encrypted: i=1; AJvYcCU3Tx+y1IY5K5szmM/gTkvb84zYYb3ti6T0GdClvQsNiUl9HGmLiQRBVJCXos5wH3b8udcHI86pfpzEWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDdcqrDAGHMsZWeNW4+rlNeuNKozOUAsJmKi8cskdluHogOP+
	OmTYY14VTK3KficWWERCsRknHXL6JXa5fv3J66dyuR+Pl0CbHIr8s1soe/mYIyaAKNemfPSsgVv
	GlML+tyJzMzLjYWUUWrzxeWZ5fTiewZZLjP1A+ROI0Q==
X-Gm-Gg: ASbGnctD2BGWBmlCb8ugFR1SLqOKE4wSoab6iy3ETFCa7OmT8xSQmzXKot14+5VddZm
	682G8DwHzBKUyLI9UuBww8h4gkENbLkpL02GlEy9FagohwLq2A0G+sYDUtgFYNa0yORXjTTrnbs
	x5CGPIFo/+BA7I2RHmIqjDbOISEDOfpISVevFOZXAvsB3PA1HquJXmAdJxQzly5bxgDastmP8I3
	j/723bxwzxr
X-Google-Smtp-Source: AGHT+IHlQkTdSypEYCk5jHMFsG5gMHOSPP8bqRunKFnkCNT6Avg3FbiQixBffVyonHcFrK3FhreXz91XErM75OILoyc=
X-Received: by 2002:a05:6512:6318:b0:55b:81c4:5f22 with SMTP id
 2adb3069b0e04-55e00852edamr615410e87.47.1755605799241; Tue, 19 Aug 2025
 05:16:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250814183430.3887973-1-superm1@kernel.org>
In-Reply-To: <20250814183430.3887973-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:16:28 +0200
X-Gm-Features: Ac12FXwnxcG8BcLpMnqVg15St2VyjeE-JDolWogpEgsUqurEowSU0zWbTKxm_ls
Message-ID: <CACRpkdba9c9FdJoAufRVEKxXRP-kk5QZusiqxmWoY6D-gK9tYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpiolib: acpi: Add quirk for ASUS ProArt PX13
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Mika Westerberg <westeri@kernel.org>, 
	"open list:GPIO ACPI SUPPORT" <linux-gpio@vger.kernel.org>, 
	"open list:GPIO ACPI SUPPORT" <linux-acpi@vger.kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, Amit Chaudhari <amitchaudhari@mac.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 8:34=E2=80=AFPM Mario Limonciello (AMD)
<superm1@kernel.org> wrote:

> The ASUS ProArt PX13 has a spurious wakeup event from the touchpad
> a few moments after entering hardware sleep.  This can be avoided
> by preventing the touchpad from being a wake source.
>
> Add to the wakeup ignore list.
>
> Reported-by: Amit Chaudhari <amitchaudhari@mac.com>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4482
> Tested-by: Amit Chaudhari <amitchaudhari@mac.com>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Bartosz is on vacation and this patch series is half-pinctrl so I applied t=
his
and patch 2/2 for pin control fixes.

Yours,
Linus Walleij

