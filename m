Return-Path: <linux-input+bounces-14218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6BB2EBC5
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 05:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7623C5C7197
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 03:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3625F23370F;
	Thu, 21 Aug 2025 03:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="zDe4jXS2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB40D3596B
	for <linux-input@vger.kernel.org>; Thu, 21 Aug 2025 03:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755746126; cv=none; b=Xjmc+BV+kWRIiC5VQKaqT6QZoJxFGoyvF5h/1oH21nfF9iSrKBi6CgcEdD7/qYBFL94vVnuyHW3IVZSXKCWXc3hbSDoT9+InwBi8t7mwEtgxaEPNKJBc5os2bVq0TukjyUB+X+coEpmIoOdghvD3Bt3mmYPc59ZxKBcCHjjTJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755746126; c=relaxed/simple;
	bh=vg1GOk0MUyhUYTWNWXxSXx/yMJDlP+wEjm+cU6WTJ9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q074xwDxV7cd/0eC/rQFMD4lzoNtfeYTHcP7OnQrtWnrR3mD2+93fX3RaJ2kckV9XpVg9TPSHYyuzrX1iFBHYu4Fs7oviz5wl4T0s4D01OHEyPtqWKEjrtXtLAfsIxgMFkr6QTpLB2OXNRSH/1XxFRpuKyT2xEvXwl1GEMHkEXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=zDe4jXS2; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b471aaa085aso812955a12.0
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 20:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755746123; x=1756350923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fM9jqXVt0YyM2f04tCncYCm9RoZvYA/H+kQtbuzkBRw=;
        b=zDe4jXS2XvJmeVoGsN/phc9oRmMc8GHSNxCn0hj0CWorGwEJdRMXuzPp+Kw2Z3ZvFv
         vny/WiAP1g0qRllP4/mo6uBnt8jzwYmcl93JkqKazKybZoCvyJnBsIfOzmx2dPQSm3NP
         rkMYIYXvYgMtCf7ppIbQomRhalc4gTf7ipx+0tKpDd7Tyj3hWTRBreqe+MLz/y7Y3l7j
         mDSu4c2Ercm31uS7qyfplAClbiWSkmbDhARp2O2C81E3L2tUanD8zv+P2+o8Si56xQC4
         Zjf9Mz5XmPZbLPAokeNKYMGdLVahVbPqHiPb74yMO9UEcVTE3iM7nG66A9Y0I+XSdGDw
         ntpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755746123; x=1756350923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fM9jqXVt0YyM2f04tCncYCm9RoZvYA/H+kQtbuzkBRw=;
        b=dZnCvSXeQdzEADx3UL+lSTHwx5sfVI9cicUH+BzbXj2QcQPvZFibAE7A67SHZX+z+Q
         mHstnCu9iUEDRko/uKTBypshiLT2gb6wrryJ9PxJ65HuoLa9QtrLdhRP1nacvnCHc8GS
         23X1JtM0Fzg6VhiS5i26Qt6q2xz0rO6IKaXqmjPPpoPfPptM885OXOGZBIhK864BoNbn
         JRpqHm13OO66YJqS0gTFwg0uF2MjdxYGTK04gNa17vakZNE79ZflKjVaGywxOHXxF+G5
         iwwJisf5ScL0kBON9adoIfA09OD2lalplqIr9zxw75hNslzew7cqBBpk77ENdYqgXos4
         of5A==
X-Forwarded-Encrypted: i=1; AJvYcCX40hRopoX8yGtfyldFdnO2D2WWSBHExPC3h48zgdwCELV4rRei2SzZY+ht2ZgGuxh8AejiQcjSVLLV7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOO2kRsbEpOmzKklfCZuerQVqcc2Fjolo5Zwx7MtZhzT13oHH5
	vG4fY7zKokztqfLAnMTkjR3oeSdhroH7bDKXfhpR7iNHchNn7vLOgG45jL1uUXHsaOU=
X-Gm-Gg: ASbGncsqFabOJ/EquVylfp60r6lKlkV8PAm/1h/7vTUDxU2kpTYKnrP9mnQb5r4YzKS
	ZQoUP79d5ggdXYJ0SKxBWWc6QO1Tn0JpUJcI204/v+o+U7YngYYT4J5p2JZNp4zsB3cdw5WCua2
	iRaBuemOEXRy2Vgo8pN7ODWYe67B/fQ+NpK2ezdIexi57meL6Oi7I06+M4HQufDU2Pu9KQklUpv
	f4SGzqzthhGmrmW3S+qwL8yqc9SVLp7sKraekXGUw6uj57tVVo0EGr0EA8NTWTbTgYxWqGN7v74
	24LK1n6gMgkmSLCJ4FPSSHkWRDwnCiHIEylzsN5pGgoJr0OhqjkLEsbGSmvutiBVzg6nzUWTz9w
	0Jt4XM8LvM8Ls9yTbm4m2LYrAUDqS+GMznV3xn7RSZhifK9MgC8m0t34ydpXvLZzXtHwDUQ==
X-Google-Smtp-Source: AGHT+IGE4HVZWfohQCAFtw4L9SUGaGz24S3ewHYjLJieNJ9qHAVoWPYrUsOmf5tjq0RXHgkSWcVwOA==
X-Received: by 2002:a17:902:cece:b0:244:9912:8353 with SMTP id d9443c01a7336-24606158c4emr9353775ad.6.1755746122965;
        Wed, 20 Aug 2025 20:15:22 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3d3sm40285415ad.147.2025.08.20.20.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 20:15:22 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add tc3408 bindings and timing
Date: Thu, 21 Aug 2025 11:15:12 +0800
Message-Id: <20250821031514.49497-1-yelangyan@huaqin.corp-partner.google.com>
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
- PATCH 2/2: Dropped Reviewed-by tag from Douglas Anderson since code changed
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


