Return-Path: <linux-input+bounces-14173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9261BB2DC54
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 14:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01BD72530F
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6737262A;
	Wed, 20 Aug 2025 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="SQkN8BFF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A7A235BEE
	for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755692731; cv=none; b=NVNfPPbFlnusBsi78J5ulSnuOmSmyYoUq412/6Z0juCG7hoDrDdNzc58REr+TU4q5uQTWJKQ8E64+QLf8p8x+ukZWa6bZQnFgrfwmv7nvpaT/JnkP9hSsCSr8ziLT1OrU/+0WwdiuM9lwMsV37sefU1rMK93LpgTZzPkgf2kGAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755692731; c=relaxed/simple;
	bh=xUgpi/yU5v2YDFQpPE4JwiRi2DdyTbCUF82XELIQqVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ntr4keiKDIZvnMWOuW4ovYvtJeZPrO63OAq0hLUgkl5PnGnwAtCI+bkaiLtU8ST0MPnVo49C+KyuOebHdzK/ervg5msR6VaDGr7uLc2tqQXe1NRCfNJ7dUWNalGaz1SKu44qEHk2NCSVF7EHkobnh23cZC+nPJ3F3V37YdW/c4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=SQkN8BFF; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b47175d02dcso5301105a12.3
        for <linux-input@vger.kernel.org>; Wed, 20 Aug 2025 05:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1755692729; x=1756297529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hx11J/6XEjmmJ7LOB55tZi1n3uqABTD9Wv6DRY/RJN4=;
        b=SQkN8BFFwJfC0QDIPBqhvebOsJJ+Pf1m+8XC1AJXqzVOZKkZWJxvVkghRE0asWsmi6
         1eWLOxC0RR14o7O/BjOqYAvht8smDLO5aRWiEpITza8bMaVRoFtO7CBh+EtKbtOIQuAw
         2Zs79ttXEsIyLG5BYuf4DRYK7FC7ovxRKU52g+FZFCHRpc8IDACgm6L6HgC6xT9bRehU
         W7G8JjZldQFJ7XN450BZ2BE3T9kcUDn19U0xQXbIUWTh50/6m7XuBH1VYjoB6A0PVR3m
         +OJxJz/kdbIW4CPXZFpcEbbE192nA82ExojesVKoV2kk3yP1JuMUDQMooabpE7N8byER
         CLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755692729; x=1756297529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hx11J/6XEjmmJ7LOB55tZi1n3uqABTD9Wv6DRY/RJN4=;
        b=Z1KeSmH5uCXiMiujPlr4J+GTRhy1JcabUejHo4wmJeCDaodl6d7zv1KPL2EiooVvhw
         FPnk1zOEAxq+TQlSlCXxk/okt4WgnP6jQqTUlNEe8bPxbsSy/O6r2rvBZA/AysZ5sdPF
         M+tGBbAedd26CEW4bmNOD+SPpDV158NYPAbDnhsc9fF8CBsywvESHY75yHEUTc5Y0e2l
         KQM+O9qUKFGU7hycowLK13P0SU/W36HU3ACmmN3PGvfrbqXTBHdy8WTrHbbSuTYHkxcU
         eBn/P58e9Mjwr7IKumGaBodeV7Kqgj56ASD8GEoDPczI2D29AqrBBEh6U7h74uf9wteO
         IaPg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Mh/UQWpG/TNetWCwOc7xUIfbABGhiS1lATzFQCsjd9T3gW1qKaKqi3o7XviO0URj86Kv7R5tFNwmtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTuZ97wdKag9p+hHlH57GnaQ60bTq5zd6cqi14JtgDDUuqyEXH
	kqncNVcI1h8DHewJluD6P2YH/BKrAtfu5pVE3ML68iKMC2hIN/cRFGq3hLmvVF64nCY=
X-Gm-Gg: ASbGncu2O5Y1e5NSgKr3e4tI9fZkX8EGqDcYMvr5EBhya1Y7dNZUxSxQcz7cE+97DIt
	2eMN4eGrZKEnoChBrsjOsBu1wavFevrx1Db2bKxgLmNroixCONgibYs6Rfs+brizXErGHvwjv2t
	SYxC/vkUtBlsIzLdq20TdeT678SMwT3CYmVnKD3IAF566X37niYI2hkquLiLVxVijBddCudhCeA
	yyqwtV1BgRtd7nooUnZDg2tuTip7ECwZvfLYvX43eHuUWmcYIdiHve9GHJfieE8HsypHsKVBax4
	nVlUqFlEBIFJZhT7T8OUcOhlgB1mKpyFft/HxVUMcFS+zspr99LYt0Wy9oVWiCBnyYYgvgcwGu8
	azqsCQXo4lLxN27OtcRA2smy8EN6SYQWeaGRXjJriimnuRzLdPdHPIIPfchdzepduqj1iYg==
X-Google-Smtp-Source: AGHT+IFS0/CNO8sJaiTLh+MwmPnTL5fkEo454inx3uj8dauJbbVA8ZR4IH2KqSHuflT3Voa/ZdsIbA==
X-Received: by 2002:a17:902:fc8e:b0:240:14f9:cf13 with SMTP id d9443c01a7336-245ef278ba4mr32765695ad.51.1755692729040;
        Wed, 20 Aug 2025 05:25:29 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c745dsm25450135ad.73.2025.08.20.05.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 05:25:28 -0700 (PDT)
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
Date: Wed, 20 Aug 2025 20:25:18 +0800
Message-Id: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
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


