Return-Path: <linux-input+bounces-16861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 320D5D013FB
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 07:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC11130184F4
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 06:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F433161BB;
	Thu,  8 Jan 2026 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="nDhbd1YK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F79145B3F
	for <linux-input@vger.kernel.org>; Thu,  8 Jan 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854133; cv=none; b=JoTHrtFD1fJCTEr1yWDJOLyIiXh/tXB9tfCALa4yHTQUucMn7Tn0D9Om4ur31GP3wCnf6+z674jyHk6div9EPL9ipi2KuMCD1P5H0McLTTW3ywKiSIY/7CIp57OWPp2OWczyfFl2dkkShtWv+BiKYxefmAdX9JVYhU44WwHvpWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854133; c=relaxed/simple;
	bh=1j6DmnkKG2KNczfpdUirPndvV+/QJe0itlIlr9g43qw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iCwTFAZzKYQqnfavRWVJmZI/4vT/F9MdUkF5fx2APxUeEia+0zx0FGPp+YSAc9HOuoMaIHKy2BO8+Q9R+Dm3cLtwI56GJqVZVviUYQ66WQPm0DRDK6DfeFHn3poEm1EH4yB54HmN99yZEkKYTaxmFWpoVEglvwm/MZJ5dqt+cqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=nDhbd1YK; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso1183163a12.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 22:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1767854131; x=1768458931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FfWymTP8L0jdt/cVVblGynBtPL0Xhi5kpRh/WSBflBo=;
        b=nDhbd1YKVGpw208UkILZEptsMTI3JUVJZ6ne6SC6diOJDMS28GgEk0XDvPFxPdx9+k
         /9VqOEPPo+kVTN+GxHEvSvBanXXxFIcFsbaYysLWUHtGIJPGSuUVMMTznP4zv0sx4VtP
         EAX3CHmHn4XT5q/lp6CCh+wB54e9j6H5SDj63FbAFzA8VGidk1/unqn69iLaMUSLWLBy
         PNHxIVTe4jQWyWqhuyBOiS2NKwhOo8wPeA4hsE5/+gZu9Z9+0CniCV3e4eRhIh/EbN+7
         73kZs1ITLKJrnM4Q42H43FjrLcOpNDC33wPa9mm6OvS3IW0HWndwVwyby4mHRaA+uPfH
         De0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854131; x=1768458931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfWymTP8L0jdt/cVVblGynBtPL0Xhi5kpRh/WSBflBo=;
        b=QFgdAQhNfDQiA5/gVpkoCefE7Q2lq4T7tSLaJWA8npOO4VigPiWLAAINPDnrQXsn+o
         83WiaA6iyUPpr4bFrHcPV18qoRxsR5pgZcsWyaFrd4dw4Fv2mScrhgtGlmtbkNjdYLYN
         3y9JVSuu7SUyejXYE65whKVenH2PEU+rNgIw4jb8frKPqQ5kxo4bXEucyQioWSavzpdE
         tRsnsmybe92mDnDE5BqssuJp14WwPOHsYL0pGyqa5Lrcv9WwCyiF5wfgevVlrlCm6Bh1
         hsZbVmb1RodxGxDHxMfJjRr7BTNwEqK1UZjn2bHcnwFC0+TazQFzzpZINDWtXjepwtib
         H7wA==
X-Forwarded-Encrypted: i=1; AJvYcCVmci2/Rde0EQnh91EmuNpqjQ8BRIBVmrKyruc8PWwDiX2nUZrCat5QuNd0mp7FFdmdFzShZjyzi0pPrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3nAkP3pyVJS5tjf0R2Bcuo7TQjOHIXCDDt80je3EQNB6CwQR
	8KsaKw07H22bpv/LBBQpgmzI3A3yi9cZE6wg94MGen//08t+6E7Unx+PcSKcIOkvih4=
X-Gm-Gg: AY/fxX5PwqeQSiBK4CqehKIFMmJ+eWZ2TGdK1K6hfPpmc5hLDb3jZzZbnFOeFEkgnJr
	fXj3GdV6K4gbu7v3Lv3ocL3VQNc36LXTFNhL/+ffbfUZYWY+7M8AnAtbREHBP4pm1Ki9/mNzmJb
	Kzyb5hJIsMRXLnn++C9cqNCfFC0BbLfLaeekS+5ji44g+Tc2+jnEV7VLRUdLoIc1ixmBteKIWMB
	mqbhl6JBO3G1bgdUUkxi8fY6HoUrtdTjUxBvpBsqpJo/AxMJ4JdhmMaqBJbKQ1HEj40nhhbTOL6
	cyM0texJSEipZJt6N9n4ErrLzYEuq1Eee51mh/NshqFErNoAz0yhJUP1lap2SJhYuUAXpZq5t3h
	gyY4I15HsYoRB1rf7EtR0XcJrt26G+UTM91UxjKGPL2f/PVLfH5efGdk6nJSUUERXAzSaRXjtIg
	nq9hYjGYloKy4us+Fryx8bgctCJf9mMNaBHV3Reb0PX9+pHXImUDuthR8K+w==
X-Google-Smtp-Source: AGHT+IHV5U0OA+y1lK29uKoEUr0JsrvW3Xvk6wizATInwg9WfJxSC+5P4jf3qL+bG6pHiGjaXH80QA==
X-Received: by 2002:a05:6a20:430e:b0:35d:b963:f877 with SMTP id adf61e73a8af0-3898f896e65mr4684725637.25.1767854130842;
        Wed, 07 Jan 2026 22:35:30 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa93ee7sm6712750a91.7.2026.01.07.22.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 22:35:30 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dianders@chromium.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH V3 RESEND 0/2] Add tc3408 bindings and timing
Date: Thu,  8 Jan 2026 14:35:22 +0800
Message-Id: <20260108063524.742464-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tc3408 touch screen chip same as Elan eKTH6915 controller
has a reset gpio. The difference is that they have different
post_power_delay_ms.

According to the Parade TC3408 datasheet, the reset pin requires a
pull-down duration longer than 10 ms, therefore post_power_delay_ms
is set to 10. In addition, the chipset requires an initialization
time greater than 300 ms after reset, so post_gpio_reset_on_delay_ms
is configured as 300.

Changes in v3:
- PATCH 2/2: Corrected post_gpio_reset_on_delay_ms: 100 -> 300
- Link to v2: https://lore.kernel.org/all/20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/2: Drop redundant "bindings for" from subject
- PATCH 1/2: Improve description (describe hardware instead of bindings)
- PATCH 1/2: Drop "panel: true" property
- PATCH 1/2: Drop redundant description for reset-gpios
- PATCH 1/2: Use unevaluatedProperties: false instead of additionalProperties
- Link to v1: https://lore.kernel.org/all/20250819034852.1230264-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (2):
  dt-bindings: input: Add Parade TC3408 touchscreen controller
  HID: i2c-hid: elan: Add parade-tc3408 timing

 .../bindings/input/parade,tc3408.yaml         | 68 +++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid-of-elan.c         |  8 +++
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/parade,tc3408.yaml

-- 
2.34.1


