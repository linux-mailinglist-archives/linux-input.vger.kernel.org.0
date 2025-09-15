Return-Path: <linux-input+bounces-14732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4E1B57EC1
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 16:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05613A7306
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 14:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3EC31D740;
	Mon, 15 Sep 2025 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9cpByho"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175231B130
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946013; cv=none; b=C+XpgRd8OmhxEZjvkY4JGvb+/tCsX8UJyobEsFoQrqOlZUpD0wZhnTacI6J1d/f8OlzOMuPMyBRxnqwno/NXqhQdpMOXVmhOzpmOKqukkHoD22f5L3QuUs0ysUYbjT0DKppegdrzVcCuVscUIdFTTSoJEqIg7bROpTcO4S/YU+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946013; c=relaxed/simple;
	bh=5uF2i1fMfFFk57weo06ZCL9ZwMoWY3wP4AjoMRcCSok=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o4zQXAyzN6YLqb0G9Yn1hio/ZQDHNrdWIgCaLSjtzk3oI23TL1E3H8DP3Gc2fwTYPA4zQHbFtBnw/LB34UxG9Q2JJrel3ONtj5JhWs7tSkiHQdZnPWK1ofH0luoTyOFCjV5LsHycshad9tkfiPe9EMSNkOP5lKbqG7Jpcc6CcY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9cpByho; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so1687059f8f.3
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757946010; x=1758550810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zz7W2fHAKP9RNn810rrDm+4wFWDgNdWgturEviUI9n4=;
        b=m9cpByhopjrv4OHjUI0MPSN0QxEhocyBYnzGVX/k6n3wbL1jw8RFFrPZ2ScHzEXIi9
         2fQQPZKaRNqU/Yh6ZEL8M+IrYQSQHt1WYOCzIqZCBBEqp2ezgTt0+TJ1mCkgp2cUO9TF
         0jkn1nxsKqC5Yq9iOPLxc9fQXOLsCC2IYAPoefCqYFQzurG6jFOQ3z4tXYsuwoDjGTU7
         VZrRsZ7O/Rsb/w5Gxy2P6l+h8FPbwpKZjnWMFP5+Hx0Xw0eYzMXPAfXvM+8VqNERGXz2
         Gn4NlSuiYoa5TAGWcbYL4NrBqZWpDb7syN9iDm503/v9EYMlz64DSyKEt5+cexe+y0pU
         6uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946010; x=1758550810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zz7W2fHAKP9RNn810rrDm+4wFWDgNdWgturEviUI9n4=;
        b=VV0RqVFIAJLXyXv7kuP8gikl1tngzwHdzlNT6GFBz1CnZhXnj/l2vqLcTjrhq3wGhA
         iWnaivNp5269ZQWp94gCUgUV9ERXhhxus3KzW9XPoOBRd3KgpH+tcgPSN+wfN6Dmn99+
         rAxEn8Sd7BZy9/mBFGsByddCJjPDL+g1lygPQnDsJbpbfifICIPR7PtAp8Zk2UhbO2nu
         kj004NA6dAOOHKns8SdPpVZtnL2gJTgn1HS+h3yU/58K9EgJ5pnkpWL2DiU7k89Nq07u
         8WC1SD45vRQ9BpFPl0CIA9fKWRpVATjyuyKTZ+x+sKtxW8XpjjkuSHVBPQhCVezwHVK+
         cJ3w==
X-Forwarded-Encrypted: i=1; AJvYcCWrTrS+AR0nvBhVaxSDJAlOkJ5ydtqdvPRFrHBCkTZPnALum27R7BpjroFnXUUq0G3f8eezPT13EtlQpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz00D9rp4hpNRB30Tz8SWF+DQP5Qsm2dDdCLYLlZD6e3dDaGZx
	6EesryFZh+Sp7xHJJws/BXDOBoCadbdelYOObCCr1YP6odgdE0VreGlYemOphDj+MLg=
X-Gm-Gg: ASbGnctFFS/B+t5wrRQ5Pd5QyFYvZTseaIs7WTENvCXMUSeFwz5vYmT9SkN0RimXWLq
	mZG/YrRTSxTjOD0QlJS5sjq1M0P4OByJJDQtjES0+sZ5cRcv+NX12xz7uWr3pNDwhaNEfk9LZ2Z
	puTmi1tSdqdF5OhOxzVSqLbSG8Z3qrr8Crxby44YnTD2TjqTX+HbFx11l/9cn6/bSf6xuy6GFm6
	vZAa0rzX1vt6FgifCyBAHRPnhr+Yj+t7PVdmVPaHEG4Uo27eLKXqIdkaYtL0rnZhrfhzkpgmDrh
	yfYQjR53H5hvK3eRikZrxRinTUzizvFx36/M3Yu+7VrO14K7/Ja+EE/i5aAlFh0HT+DCKxJRZ5o
	71MXqE7mqSgVLchUPWiIFbxgf7ab4Natt7Dk=
X-Google-Smtp-Source: AGHT+IFSmQbTHF0YuHd9ONdZ3tdtKlFavLsHSPy1D//fCR+da9/Whp3rM1z+WJgImZ6na8pnBA1Zvw==
X-Received: by 2002:a05:6000:4006:b0:3eb:bbd9:9c08 with SMTP id ffacd0b85a97d-3ebbbd9a3bbmr1863216f8f.46.1757946010074;
        Mon, 15 Sep 2025 07:20:10 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7ff9f77c4sm11801928f8f.27.2025.09.15.07.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:20:09 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH v5 0/2] Input: add Himax HX852x(ES) touchscreen driver
Date: Mon, 15 Sep 2025 16:19:55 +0200
Message-Id: <20250915-hx852x-v5-0-b938182f1056@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIwgyGgC/2XOTQ7CIBCG4asY1mKYGSjgynsYF/2ZWhLTGmqaG
 tO7S2usGpcf4XnhIXqOgXux3zxE5CH0oWvTMNuNKJu8PbMMVdoCFZJykMlmdAZHSdqrCq0lQhT
 p8jVyHcYldDyl3YT+1sX70h1gPn0lPNA7MYBU0pfARV0byrg4nDk23aXatXwTc2TAL0hqhZhga
 RyC17ZANP+QVggK9QopwRxc+jrlDtj/Q/2GGhR8XtQJWs5yVGCtJ/cLp2l6AkC8BUVJAQAA
X-Change-ID: 20230816-hx852x-3490d2773322
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Jeff LaBundy <jeff@labundy.com>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add DT schema and driver for the Himax HX852x(ES) touch panel
controller, with support for multi-touch and capacitive touch keys.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v5:
- Annual resend, any feedback would be much appreciated!
- There were no replies last year and the initial submission was 2 years ago.
- No changes, just rebased to latest input/next.
- Link to v4: https://lore.kernel.org/r/20241010-hx852x-v4-0-7e6a20177938@gerhold.net

Changes in v4:
- Fix asm/unaligned.h -> linux/unaligned.h include renamed in
  commit 5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")
- Slightly increase delay after reset to fix init issues on some devices
- Link to v3: https://lore.kernel.org/r/20231024-hx852x-v3-0-a1890d3a81e9@gerhold.net

Changes in v3:
- Fix device_property_count_u32() error handling (Jeff)
- Properly handle errors in hx852x_suspend (Jeff)
- Simplify error handling in hx852x_read_config() (Jeff)
- Close i2c_msg array with trailing comma (Jeff)
- Clean up error handling in hx852x_power_off()
- Link to v2: https://lore.kernel.org/r/20230930-hx852x-v2-0-c5821947b225@gerhold.net

Changes in v2:
- dt-bindings: Swap required:/additionalProperties: (Krzysztof)
- Use dev_err_ratelimited() for error in IRQ thread (Christophe)
- Use dev_err_probe() consistently (Christophe)
- Improve error handling of hx852x_power_off()/hx852x_stop() (Jeff)
- Add linux/of.h and linux/mod_devicetable.h include (Jeff)
- Fix %d -> %u in some format strings (Jeff)
- Fix other small comments from Jeff
- Link to v1: https://lore.kernel.org/r/20230913-hx852x-v1-0-9c1ebff536eb@gerhold.net

---
Stephan Gerhold (2):
      dt-bindings: input: touchscreen: document Himax HX852x(ES)
      Input: add Himax HX852x(ES) touchscreen driver

 .../bindings/input/touchscreen/himax,hx852es.yaml  |  81 ++++
 MAINTAINERS                                        |   7 +
 drivers/input/touchscreen/Kconfig                  |  10 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/himax_hx852x.c           | 500 +++++++++++++++++++++
 5 files changed, 599 insertions(+)
---
base-commit: d5ad57fc428c1e44335d25c822eb89645f425f32
change-id: 20230816-hx852x-3490d2773322

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


