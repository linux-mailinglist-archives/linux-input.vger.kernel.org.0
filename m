Return-Path: <linux-input+bounces-4890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF5E929CE7
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:16:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66D4AB20B13
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 07:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81D218643;
	Mon,  8 Jul 2024 07:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imAgXlae"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186B57470;
	Mon,  8 Jul 2024 07:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422965; cv=none; b=itQwy3mATP5KCs57C2ofWGLinPmd5cBLGZ0NHwNdUO1TfBMm6rRuMWKu5cC/qAziNtA7NQbITfq40zuqdulKbOYq+QtecnLFmjn7rs4P1bbZlp5susnzkZBa+zKHrdB0Af0gYfIH4gAaRn95rZ4biYyi2v2gI60sXpPMcMQap1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422965; c=relaxed/simple;
	bh=AwHnMW8n34m/TGgQTuXSWfLhrC5v8szDWzgXJFrLOOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pH9lvX96lyN/YnFCH+muZK+6/T6nXXMp7q5NaCjLvN/jUYdBSkJwRAA89mkDGTzix65jfcIOfUwmJlub2eN7CQq9A168bd8PHiong789S6MNhr/BrZQioF2xOZMnnH1lYZ4xVUnJS/YZNu7rK+pXBvcWeT1pTCsgTjJuTU1TQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=imAgXlae; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-367a183df54so2120407f8f.2;
        Mon, 08 Jul 2024 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422962; x=1721027762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQGw9DkmWwdPFAMx1H/PonmyPrG2FWoQ4nV2EvrT1q0=;
        b=imAgXlaecyLidSe50OjSjsghvelSvBM634esfaJ9q6cBuZx0FOk0BvP1tdx63GQo9h
         MxAsDo+swBzArO91HybUDE8y4/zAo6elJG8PbAwt2mJq+cFcn3c3y2ZPyroZx9EV/5/R
         cU2iDTAHTpKBrVORAy0GkykXgdHkn8o8HQ82/5rG1ekL8O5iQGvADDYBoif1KBiD3Rpk
         5f3tI90X83EBEYWoMdyRAugLd13uYzpiqyE5UjKsjRc2rZylKR3WMdYM3SbDzTXuizdW
         qT9aA+wCPk37Kj9hX5rVophSLRCydzrmc71T2f0g/i3EwQFFvO4IepqcV8Ld9Vyt2FAv
         dTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422962; x=1721027762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQGw9DkmWwdPFAMx1H/PonmyPrG2FWoQ4nV2EvrT1q0=;
        b=ltBS2j1uUSjqBrB+6Hu77kPiYnQDd1aGk/PJGuJbyO1SUeDG2SzF2HV2b/PHTTFQH8
         azjLkAEtKmqXaQN4jT/6uD541Rzlhinq1saTTKS01guEsyTow3T5RBGoqUxIVArCSXa8
         TEy2Ey2BXrX/JIfLuqP+1lq0/H4EkTDmIKtps/dFAG8U8NoiFaCYgwjREXszQzIO84Uw
         B7JMUWHssQQfTMlcLyeZGf10viSpEbw7GeyPA6kDX3o6PPSzzytUNk/h0qxxr/h1gw3B
         82zxFr+m7si93wFkZ+9EifYuoJLXDbHD9icA4X0FxsEUqtnJ+gyRTXYKSuQYnYgFetHV
         5+6w==
X-Forwarded-Encrypted: i=1; AJvYcCV9uhKzd9YQa8pVOqAmF8JKRSbhH8jPmGlySSFdOGEN+KauTLIUqwgdOZ4VtCfZsCuvi1YwPDz2fCCf8cSVr3qXpzlz/vDqOIHvB6Yh3ZtRG4zR8pe4vcdAaAyxN/KrdFcgG6hJllhEJA==
X-Gm-Message-State: AOJu0YyvUMKA+xzENxieGQqb8dg9vvGudF4AMFG2JYD5ETCRsXWEBuSn
	wLx0kjhilvwpPcit6sLAGT5gP/r0hVSl1B3n1e7r0SyuJr7+Kvn6
X-Google-Smtp-Source: AGHT+IEBsQoXiPndbDDXXZLyk3MQ6ndPcMKilUfLRL3rlKi+NQPpkKVzrKjylB+wycsQYYtbadkqlg==
X-Received: by 2002:a5d:55c5:0:b0:366:f994:33c with SMTP id ffacd0b85a97d-3679dd66b69mr6822031f8f.56.1720422962294;
        Mon, 08 Jul 2024 00:16:02 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a786:d603:1c55:ced1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dd5ea09sm9994564f8f.65.2024.07.08.00.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:16:01 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] Add a property to turn off the max touch controller if not used
Date: Mon,  8 Jul 2024 09:15:47 +0200
Message-ID: <20240708071601.7571-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our hardware has a shared regulator that powers various peripherals such
as the display, touch, USB hub, etc. Since the Maxtouch controller
doesn't currently allow it to be turned off, this regulator has to stay
on when not used. This increases the overall power consumption. In order
to turn off the controller when the system does not use it, this series
adds a device tree property to the maxtouch driver that allows the
controller to be turned off completely and ensures that it can resume
from the power off state.

Changes since v4:
- Load configuration firmware during probe and not after resume (Dmitry)
- Do some improvements on error handling (Dmitry)
- Add Reviewed-by tag from Joao

Changes since v3:
- Move the power on part to mxt_start and the power off part to
  mxt_stop. This allows to turn the touch controller off even when not
  in use and not only when being suspended (Dmitry)

Changes since v2:
- Add Reviewed-by tags from Linus and Krzysztof to the dt-bindings patch

Changes since v1:
- Rename the property and change the description (Krzysztof, Linus,
  Dmitry, Conor)

Stefan Eichenberger (4):
  Input: atmel_mxt_ts - add power off and power on functions
  Input: atmel_mxt_ts - move calls to register the input device to
    separate function
  dt-bindings: input: atmel,maxtouch: add poweroff-sleep property
  Input: atmel_mxt_ts - add support for poweroff-sleep

 .../bindings/input/atmel,maxtouch.yaml        |   6 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 148 ++++++++++++++----
 2 files changed, 121 insertions(+), 33 deletions(-)

-- 
2.43.0


