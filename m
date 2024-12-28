Return-Path: <linux-input+bounces-8811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A8B9FDC6D
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2024 23:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1604F1882AB6
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2024 22:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EACD17C219;
	Sat, 28 Dec 2024 22:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jmdnptxK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E60378F32
	for <linux-input@vger.kernel.org>; Sat, 28 Dec 2024 22:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735426525; cv=none; b=i+oWJBWRU8w9/LWhx3bPa8kyILLSy6cc5IMKik3ha2Itwmcsn9s4IlM/+TTDrPZYSVgGNWYZzFYqyMqA5O3mkScEc2J5Q9tTSRU/dNtvvHYEDGNE1c95iF9RXap5oGTDtOIViafsBpX45WNbJ8zhiWMU2L5qASYy4cc5tEi7Mms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735426525; c=relaxed/simple;
	bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPxy2fjMmjFsNs4Pbmn9/W/f1O6xQVJQ51ABvLTnhO9YC5MQVcNwokPkmso/+VX9HWBn66PIDptMOFtbyivtkcpwLKlMGSaXFRhalp6BqgWyd6lJRc1DGEy6Pvr8o0LEoSHj+VVdxRz0zLgVNjqYypGq9NB6V9sxLosuqRp8948=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmdnptxK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401c52000dso9482038e87.3
        for <linux-input@vger.kernel.org>; Sat, 28 Dec 2024 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735426521; x=1736031321; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=jmdnptxKkl79Plu61bNDKEEMlk/nTlELUMqzvaFPUB8R/4+9oxKPERsZQmGTYsGuT8
         1vUu739fLVz7Mr/w8UkBvMy0f6o/X08kUqwMTJ2t2AyZslb5tcNIPUwkLFx7uKw24CA+
         WfXOzAVZlxupAqc8I+rKVfrWg7/3IxDXfWVOHmHf/X+2vKcghnbVKheTWRVcfPn2RwgQ
         UV8E97tFta2OMrFHtfJbfGjHCLVD4nTyEpAX9yI267YsgOZedWcXAofISxUU8WTmujpX
         E4c2RARwbv2YrTIAdz2UnOdo4lRe0b3PLXtj0lOpqlN965JrDzs40otT42Za+OR6nx/a
         tQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735426521; x=1736031321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ma5+6x4L6RmgRS3yZ8s305V7iJUxY/Vzh6XEkM9c4sU=;
        b=Ex4H1P7zpix+At17uqppiV20FgXT7o5PRuvOhLWODjAqhaVRBcacfSluZrtTdcTs28
         4hIK7n+K5LbGB2PpKO6yzd+oykZf0/rORaSlJISiOx1VD9a8gmwrM0DmZOQ8gZARNg+m
         /HUmtJqdbNPa/kXeyK485FmVUQz5XlWIBljIjqEAS2nTgy0rr+onlJeoal7AZF0Oia++
         34y+/3MHkHEJLwSPNN6S9Bq0ebqfO40y9p++FTz1odemXkC4qTj51npBI51nK/8cf/Ro
         eOgWi+uRGOJCrCeG+bVUiB3sx6vFKtf1wijp765Yxuq1M8cLDirMBXyXa4KCre6GNWSd
         cm2g==
X-Forwarded-Encrypted: i=1; AJvYcCUtu+FpAdE84IiDOiOoAIqkNrxlFoGUnB4xtcuVZdFOJmBlxud4tlsw8WKmIZ9qDvU9QCumU9v1HjiQFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLYmtHgoqwSdUD/sQJR6iISK4sKd9es8ZTr4s4ZFIknEF6zSg
	aPoZCrWNFjbc3G2EHv63HKdaptbldSc+SsgZc0YYvX2jT1NEza4ROWNggS7EvbHAx2/8o+SPgvC
	rZUEDROzSksbQ6iauqNGtUzx0RenpUC7kfkm8xg==
X-Gm-Gg: ASbGncvax6fbiCBmp5G4NeVTst6now40cW2tVv4tg76rE8R4Ttjrn7/FaIz6SfgZ6h9
	2fLXLjf46trdEGv2FkV/zHQYoYccLl/7Y7gT+
X-Google-Smtp-Source: AGHT+IEeHS7qBCOkGJkLci2K1l4MO3cQjjPsp4mJA4mp2Fct0kochwX6HgM8ASkaZLPLeUe5QHN30KZL6jeoExuit3I=
X-Received: by 2002:a05:6512:ba6:b0:540:2160:ade3 with SMTP id
 2adb3069b0e04-5422953c19cmr7875781e87.25.1735426521162; Sat, 28 Dec 2024
 14:55:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241228-wake_irq-v1-0-09cfca77cd47@nxp.com> <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
In-Reply-To: <20241228-wake_irq-v1-10-09cfca77cd47@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 28 Dec 2024 23:55:10 +0100
Message-ID: <CACRpkdYaWTdOoLXcpWG92+OyRwsPMxMbhQ6djdzO07x0sPz4oQ@mail.gmail.com>
Subject: Re: [PATCH 10/12] rtc: ab8500: Use resource managed API to simplify code
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

This looks very nice provided the core code is merged.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

