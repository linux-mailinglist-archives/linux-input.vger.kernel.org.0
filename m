Return-Path: <linux-input+bounces-9083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A90A069E0
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 01:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC26E3A6B7E
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 00:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C57517D2;
	Thu,  9 Jan 2025 00:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bts0J3o6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9736D;
	Thu,  9 Jan 2025 00:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736382393; cv=none; b=HT6/DT1uX5cqsiPgTLZNNAuhvN6q//3rjtwiSDMXeWuj6AhMGNAmwdHvtDrK3I/boiaX8xUeAj3FRWwvenMwTI6IvGHwVUOFMR1SJjox6dzPTZ+2SCeBVBusI+t092VX9usLp5Re7H4LfNPlNBgDqXTrq1BJ5t8sz/fq9wBqW5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736382393; c=relaxed/simple;
	bh=LBF6TkranJlJcESrnhVBNWMobGr3PJYv7XqE0Tab0s4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=scELngbsU0ERo1TDaGrkYHu18UxKq5GD2VOR1ShgKUeeDj6KfaTcI6sDjkGIX31lVca0Zeda7ALq/Bpz++NWi0IRLRIAhbLs0U8vjEX2W57HimM0o1/rNQVdOIGjEMOBkBO6VCDmNFiUDSjxXctnK5jx9AzOVcUTBGAKEaZAzQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bts0J3o6; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216395e151bso4514415ad.0;
        Wed, 08 Jan 2025 16:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736382390; x=1736987190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AO3soVr9XeZIH5pXIRja1M9WT+SGZCTLZzJASS8mqEs=;
        b=Bts0J3o6pmF1LO7GuBB8o4fPv4Ti4RPGpEK2Ktt9aIYtkFDz0Qs1FD+5gd2gU18nxT
         sMJHKjPFU++t6i6mTtkPF1fyAu9iof/dP1gwlZXZA6dyhIcIX1fZLQjnzVoO7i+JBxru
         e488de9inAzXYVaf6pnS3ObTOIA0xrYf+doeR2Zt+gp0pYS0JmGfwmg04REwZykApDur
         T9NvQpj0x3Rz+OS+worGHBS2C7IPtIgxJCNhXkQjpInmSRAAV0XJDSbSvgTIehR0oX7c
         X7ftFcKaGS5WlucCe2QMVrTRjD8OvMQXKoctO3gW24ByUjwMV+naXWEh2X9lQ5nombXX
         DE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736382390; x=1736987190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AO3soVr9XeZIH5pXIRja1M9WT+SGZCTLZzJASS8mqEs=;
        b=v/y6CW7ny7qT0Qzn25TuQ+jDmSzCQtK5e6tbfiEXUpMBfwhq1y4DIsIKljQ/u5EtB3
         5GZgeEEOrFgVrHAcXkXIn7YbbZQmLYYWjQv/QjJZbt9Eg6oNeI8gGQi/2rqOUizoqfsV
         TH77zhLz7eKRJPnvwvyd2/v6tdllWk6J8XIhBLyU04Jl6pryFIwenyqKU5gXPiNiD36G
         Nf2uYZByYs7rrdYPvZoleBnLqW9PSe4ZRD1aT7YA1DBQQ7fB899Iim7Fb/+bxu/4FRjZ
         66Hz3BeNTa8x411QzCcLokyw+cbMJliHaWTXVosJG3C3YsmUTsO9NKj76O9kHrj8sJQD
         eHSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY2d0tawGqUgLR+3RbrTgTw0tMU1hESh4Vd08AP8aRvFH9dm0tpgROq498qbe5/YOsNFHPzLgAuK8j@vger.kernel.org, AJvYcCXk5vfH1gf/wmezCpnUGWRigKETFS9lDOpCOTtG8qrdafT/4ppmARVL9ZTBrguyeF6xjIIKjAz1YYSiNEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTvPGfViEyre6Xyd+EudxgFMAQHsR+arkNYx0SL2n0/0btDvxT
	qT3QC1e3X5LXt0qMxgauRsnJCdU21oK4Zi97ZtdW7Ue7bOoIy45BqOqHnYG6
X-Gm-Gg: ASbGncv0qZ1hd0me1ckbhlXWa2uUpfgwLY/luojNwI4o8HmrStiQSNSkjOYh/jF+4l4
	R0b02/8KKKLjDqB2q6dBtsvsGMV7DA5UeUDKEwAfh8jlh+DHqoPHDC6sB5k34GC0rM69DPuW/KB
	HJGz7PaJ/HH4NzyfKCLlJ/iZ0oVw78I9tSPxMz1gK8t5Wmjttzp0UXfoxRhjxKl0OS5fisx4UL6
	ravuEFHfW2ldUNzIvIb/WX5Fi/Z1zGnQJkvaMBIMF4KX9tWyOrdSnXt1tScDRpZeoXtPI7ANMli
	fpGw1kcJej4XZpDohuM2Og00Npg5D0XSugL0neSzIw==
X-Google-Smtp-Source: AGHT+IGZ19XFod5H279cQEJQxq+N9mtr7cuGpxjJ//cedm5qqwrbk5U+JAChJTS472ukQNG6oHnvyA==
X-Received: by 2002:a17:903:22c7:b0:215:3998:189f with SMTP id d9443c01a7336-21a8d64ebe1mr22385795ad.6.1736382389772;
        Wed, 08 Jan 2025 16:26:29 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca01989sm333481435ad.239.2025.01.08.16.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 16:26:29 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v6 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Thu,  9 Jan 2025 00:26:20 +0000
Message-Id: <20250109002622.771-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming-jen Chen <mjchen0829@gmail.com>

v6:
  - Update nuvoton,ma35d1-keypad.yaml
    - Modify 'compatible' to make filename matching compatible.
  - Update ma35d1_keypad.c
    - Modify 'compatible' to match the name in the .yaml file.

v5:
  - Update nuvoton,ma35d1-keypad.yaml
    - Reorders the items in the properties and required blocks to ensure 
      their order and items are consistent.
v4:
  - Update nuvoton,ma35d1-keypad.yaml
    - Kept the same order of properties as in the required block.
    - Changed register addresses to lowercase.
v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

Ming-jen Chen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  82 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 387 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


