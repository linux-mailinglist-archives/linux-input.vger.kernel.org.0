Return-Path: <linux-input+bounces-8812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6D9FDC77
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2024 23:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DE23A1667
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2024 22:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34920195962;
	Sat, 28 Dec 2024 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQJx0q36"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0D517C219
	for <linux-input@vger.kernel.org>; Sat, 28 Dec 2024 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426560; cv=none; b=pieLrOUTmkrD6b8RYrXc8LfLowhp8IfG+4zBpdMwQx2hzanHRUUwa+v/tLcKndry9jZGuA7/0SB+wnKP5ZG3Wa7LPHn7XAArby4YCQP7pSLYWQfKhU31g1mfpxOtfh7TLuKMTT1H7xevm234j2t4/fQiXNUftK20CA1hYdDRRJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426560; c=relaxed/simple;
	bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vAaj7ITGKYFsvnAphTLaLGDGvlDslm1doaUpD7lBmevTn2kpjcic1S6C967kvW1PdbDVMzUIL1nUr11Ffzc6d5G3efFWx/g5rmhKVxJS0/UyUjcYKHPafCTzsp3kmNWQqcahdFtqHZwbKANPkSbvFppdGcExUcO4JPv7YZtJIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rQJx0q36; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3a227b82so7822889e87.0
        for <linux-input@vger.kernel.org>; Sat, 28 Dec 2024 14:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426556; x=1736031356; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=rQJx0q368x3w9zAL1TOJsbAVl/tJqWQthYrQHZ3dPmiw1tNxMbEAkaaw9Q2nOwcLFl
         +rNajV3RXS7Zw6K74cyOCL4XymdNlYbhBNIBjwFSxO2JmEcR6bfPwOB+Wkmy3bVgpmIf
         l+f7I0t0rIWU0irJFAMJWdGAYhbNvhIaKK0a8TAIYAcgPPW7uLwUFNavtto4r8H/Ykjs
         5YjKfAIPIwe3ZT+4CmWJlGttLYGDdT3jY8QNZNfDoI+xobA7wathITRBzbwl4YUt+Lpp
         0jI+mIPy4kPNIL7GKFItZyHm/8z/1KCxbWFMk73T/7KiwSRXsx+mEmbTL8Qw0DhuqbuX
         5Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426556; x=1736031356;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og/Ya+X+3++Et3/7WcbZEScyD/vU8dvbGouUjKmS+Yg=;
        b=dgtcSbnX9Y89gY4bAg/y0Ka95Kmg0OwSWDbOtIS7S5q/o0M5mdSOAkVdBl2CMO0ri8
         yM+t2DetPc9Rg97H8lWa8Swvf1RG0McvLlXs57m9C1xCSbX0kS7J+JcrQkgvgiF6L/D7
         pxPHx0agASRs4XFdbIZqgDuOdKcr7tIKpa0VSGBF2O8+GCclSbhemHqLNXYLeakF/wdd
         2FSG6Z5Bw0MnGjl7kCKpVNCL0vZspU6HmndZVXQx5RtzR1ZE0LgYKou9CE9g3s0Ceuf5
         0vGuKukLtjS4d0I3LPlWU9Pp56BqOGeEvXSuR5T1Pgx+iSy3pvne8gaKrU0xD0I2Ua8f
         QWpg==
X-Forwarded-Encrypted: i=1; AJvYcCVS9A1fsdcB0iea8dbsSlQhbYnyTxRd5FcVg6NU1+/B+VNZBg7Iv+bCTAIBurZ9xiwkdxq70cVjUEpCXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrd95M5FlEDBqwcdtWsv9rgBL00CtIQ/RN2ABrRP0Y6Z07cQMZ
	2r1ikeNStwlh0VF8Zbh+AMCH+4ceCQfM21DDh32PLbAdDqbJJfFxtjEuH/6Ev4btgBbMcOxqNHq
	xO34H51BXDrquZZAGNmpnL45qJ8pZgmhdxK8XDA==
X-Gm-Gg: ASbGnctNxqUdw2fDzsCzp7DGphSVMAucWiqbvL5y+RAypQRo7oKlB9vImswAtYjNGcG
	0R6Dj8qxjiOGno8TGlpVLre41p6vnEj04NfIU
X-Google-Smtp-Source: AGHT+IEOcI/QKkD3AUBydUx80A/BH8Zb+xNHEVzuo3JP6PjvydFsYRRsKbYFCgVkNWvtDpuRPklRSeHgUyviYhKsrpU=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr6848917e87.42.1735426556517; Sat, 28 Dec 2024
 14:55:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-12-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:45 +0100
Message-ID: <CACRpkdaTBSpk7wToj2TLS1Tgj2cshuSrYgEm4bj-WmFSVohYoQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] rtc: pl031: Use resource managed API to simplify code
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 2:16=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
> error handling code and 'driver.remove()' hook.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

