Return-Path: <linux-input+bounces-17054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5C4D19C37
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 16:12:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27E8B3009D4A
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 15:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE26313E30;
	Tue, 13 Jan 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="k0CvSRyo";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="k0CvSRyo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF65368291
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317116; cv=none; b=tcbQBFOwI7GP2FXe3VhFDEhlxDe+JrkCcE2eVuzBS4MfQEWjz+Wnh/yNoBuLp1uHiadoUTbiH6bNOUROvW8nZoedLKdFTHYpBy5wUD1XeTfURuIhp9GbRDQGRut2krS7lhNu7aOjXPEmEDMf/00FQVXyTmmGZgVEguvm38O8HKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317116; c=relaxed/simple;
	bh=Ea1DQhKjplIRq25LUCcw/CPO3vo7O/KrF02wPqVfQxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vf5I+raKKVRTYngKJDg9sf0TqPuPgXxwMq0hd8/E+pYxxswtbZ435EULm2Gidu2ScGd7uazzMtA7kY7sXxTQM+wep1hsSjsUgfWPIcxhi5XXRY9ztwJZMQCtu0+xMTV78D71Xmf+IYy+699KxtzZCNGJhwkoeaE8INL35KpHQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=k0CvSRyo; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=k0CvSRyo; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768317107; bh=Ea1DQhKjplIRq25LUCcw/CPO3vo7O/KrF02wPqVfQxM=;
	h=From:To:Cc:Subject:Date:From;
	b=k0CvSRyor6yioUWZTV25JP5HcJQ34uyez/nETUgg+mn/uhpi/QqhVobMqXqWw9X1M
	 ELXzXuh4rtrtv4HsONlJyOTbRWXrtxFEvdF8iaTzIL95eOyn1U9pfO8feU35vsYssF
	 f49PTmRZkUkNwzs+wdSuW8/ytlC0aSj4KcUOSm0R4vSrKFYVnZshIK5PHYmluV8MDz
	 YfhKG5Yculld6HzdiCuJ8FfmkLJ6rAfryNwwOJNIe5ysIltMEVPir+3DOFYgH79B3T
	 WNIA/qoWCeBJ5Xfw05uCf47a8tLYIc5T9iii9Ao6+HSoTj9LOmPMsawOz66iWsjGiM
	 YKejC5EcecMAA==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 686423EC3B5;
	Tue, 13 Jan 2026 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1768317107; bh=Ea1DQhKjplIRq25LUCcw/CPO3vo7O/KrF02wPqVfQxM=;
	h=From:To:Cc:Subject:Date:From;
	b=k0CvSRyor6yioUWZTV25JP5HcJQ34uyez/nETUgg+mn/uhpi/QqhVobMqXqWw9X1M
	 ELXzXuh4rtrtv4HsONlJyOTbRWXrtxFEvdF8iaTzIL95eOyn1U9pfO8feU35vsYssF
	 f49PTmRZkUkNwzs+wdSuW8/ytlC0aSj4KcUOSm0R4vSrKFYVnZshIK5PHYmluV8MDz
	 YfhKG5Yculld6HzdiCuJ8FfmkLJ6rAfryNwwOJNIe5ysIltMEVPir+3DOFYgH79B3T
	 WNIA/qoWCeBJ5Xfw05uCf47a8tLYIc5T9iii9Ao6+HSoTj9LOmPMsawOz66iWsjGiM
	 YKejC5EcecMAA==
Received: from mail.mleia.com (91-159-24-186.elisa-laajakaista.fi [91.159.24.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mleia.com (Postfix) with ESMTPSA id F04853EC348;
	Tue, 13 Jan 2026 15:11:46 +0000 (UTC)
From: Vladimir Zapolskiy <vz@mleia.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Signed-off-by : Lee Jones" <lee@kernel.org>,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: adp5589: remove a leftover header file
Date: Tue, 13 Jan 2026 17:11:40 +0200
Message-ID: <20260113151140.3843753-1-vz@mleia.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260113_151147_441891_A5076B8E 
X-CRM114-Status: GOOD (  12.19  )

In commit 3bdbd0858df6 ("Input: adp5589: remove the driver") the last user
of include/linux/input/adp5589.h was removed along with the whole driver,
thus the header file can be also removed.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 include/linux/input/adp5589.h | 180 ----------------------------------
 1 file changed, 180 deletions(-)
 delete mode 100644 include/linux/input/adp5589.h

diff --git a/include/linux/input/adp5589.h b/include/linux/input/adp5589.h
deleted file mode 100644
index 0e4742c8c81e..000000000000
--- a/include/linux/input/adp5589.h
+++ /dev/null
@@ -1,180 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Analog Devices ADP5589/ADP5585 I/O Expander and QWERTY Keypad Controller
- *
- * Copyright 2010-2011 Analog Devices Inc.
- */
-
-#ifndef _ADP5589_H
-#define _ADP5589_H
-
-/*
- * ADP5589 specific GPI and Keymap defines
- */
-
-#define ADP5589_KEYMAPSIZE	88
-
-#define ADP5589_GPI_PIN_ROW0 97
-#define ADP5589_GPI_PIN_ROW1 98
-#define ADP5589_GPI_PIN_ROW2 99
-#define ADP5589_GPI_PIN_ROW3 100
-#define ADP5589_GPI_PIN_ROW4 101
-#define ADP5589_GPI_PIN_ROW5 102
-#define ADP5589_GPI_PIN_ROW6 103
-#define ADP5589_GPI_PIN_ROW7 104
-#define ADP5589_GPI_PIN_COL0 105
-#define ADP5589_GPI_PIN_COL1 106
-#define ADP5589_GPI_PIN_COL2 107
-#define ADP5589_GPI_PIN_COL3 108
-#define ADP5589_GPI_PIN_COL4 109
-#define ADP5589_GPI_PIN_COL5 110
-#define ADP5589_GPI_PIN_COL6 111
-#define ADP5589_GPI_PIN_COL7 112
-#define ADP5589_GPI_PIN_COL8 113
-#define ADP5589_GPI_PIN_COL9 114
-#define ADP5589_GPI_PIN_COL10 115
-#define GPI_LOGIC1 116
-#define GPI_LOGIC2 117
-
-#define ADP5589_GPI_PIN_ROW_BASE ADP5589_GPI_PIN_ROW0
-#define ADP5589_GPI_PIN_ROW_END ADP5589_GPI_PIN_ROW7
-#define ADP5589_GPI_PIN_COL_BASE ADP5589_GPI_PIN_COL0
-#define ADP5589_GPI_PIN_COL_END ADP5589_GPI_PIN_COL10
-
-#define ADP5589_GPI_PIN_BASE ADP5589_GPI_PIN_ROW_BASE
-#define ADP5589_GPI_PIN_END ADP5589_GPI_PIN_COL_END
-
-#define ADP5589_GPIMAPSIZE_MAX (ADP5589_GPI_PIN_END - ADP5589_GPI_PIN_BASE + 1)
-
-/*
- * ADP5585 specific GPI and Keymap defines
- */
-
-#define ADP5585_KEYMAPSIZE	30
-
-#define ADP5585_GPI_PIN_ROW0 37
-#define ADP5585_GPI_PIN_ROW1 38
-#define ADP5585_GPI_PIN_ROW2 39
-#define ADP5585_GPI_PIN_ROW3 40
-#define ADP5585_GPI_PIN_ROW4 41
-#define ADP5585_GPI_PIN_ROW5 42
-#define ADP5585_GPI_PIN_COL0 43
-#define ADP5585_GPI_PIN_COL1 44
-#define ADP5585_GPI_PIN_COL2 45
-#define ADP5585_GPI_PIN_COL3 46
-#define ADP5585_GPI_PIN_COL4 47
-#define GPI_LOGIC 48
-
-#define ADP5585_GPI_PIN_ROW_BASE ADP5585_GPI_PIN_ROW0
-#define ADP5585_GPI_PIN_ROW_END ADP5585_GPI_PIN_ROW5
-#define ADP5585_GPI_PIN_COL_BASE ADP5585_GPI_PIN_COL0
-#define ADP5585_GPI_PIN_COL_END ADP5585_GPI_PIN_COL4
-
-#define ADP5585_GPI_PIN_BASE ADP5585_GPI_PIN_ROW_BASE
-#define ADP5585_GPI_PIN_END ADP5585_GPI_PIN_COL_END
-
-#define ADP5585_GPIMAPSIZE_MAX (ADP5585_GPI_PIN_END - ADP5585_GPI_PIN_BASE + 1)
-
-struct adp5589_gpi_map {
-	unsigned short pin;
-	unsigned short sw_evt;
-};
-
-/* scan_cycle_time */
-#define ADP5589_SCAN_CYCLE_10ms		0
-#define ADP5589_SCAN_CYCLE_20ms		1
-#define ADP5589_SCAN_CYCLE_30ms		2
-#define ADP5589_SCAN_CYCLE_40ms		3
-
-/* RESET_CFG */
-#define RESET_PULSE_WIDTH_500us		0
-#define RESET_PULSE_WIDTH_1ms		1
-#define RESET_PULSE_WIDTH_2ms		2
-#define RESET_PULSE_WIDTH_10ms		3
-
-#define RESET_TRIG_TIME_0ms		(0 << 2)
-#define RESET_TRIG_TIME_1000ms		(1 << 2)
-#define RESET_TRIG_TIME_1500ms		(2 << 2)
-#define RESET_TRIG_TIME_2000ms		(3 << 2)
-#define RESET_TRIG_TIME_2500ms		(4 << 2)
-#define RESET_TRIG_TIME_3000ms		(5 << 2)
-#define RESET_TRIG_TIME_3500ms		(6 << 2)
-#define RESET_TRIG_TIME_4000ms		(7 << 2)
-
-#define RESET_PASSTHRU_EN		(1 << 5)
-#define RESET1_POL_HIGH			(1 << 6)
-#define RESET1_POL_LOW			(0 << 6)
-#define RESET2_POL_HIGH			(1 << 7)
-#define RESET2_POL_LOW			(0 << 7)
-
-/* ADP5589 Mask Bits:
- * C C C C C C C C C C C | R R R R R R R R
- * 1 9 8 7 6 5 4 3 2 1 0 | 7 6 5 4 3 2 1 0
- * 0
- * ---------------- BIT ------------------
- * 1 1 1 1 1 1 1 1 1 0 0 | 0 0 0 0 0 0 0 0
- * 8 7 6 5 4 3 2 1 0 9 8 | 7 6 5 4 3 2 1 0
- */
-
-#define ADP_ROW(x)	(1 << (x))
-#define ADP_COL(x)	(1 << (x + 8))
-#define ADP5589_ROW_MASK		0xFF
-#define ADP5589_COL_MASK		0xFF
-#define ADP5589_COL_SHIFT		8
-#define ADP5589_MAX_ROW_NUM		7
-#define ADP5589_MAX_COL_NUM		10
-
-/* ADP5585 Mask Bits:
- * C C C C C | R R R R R R
- * 4 3 2 1 0 | 5 4 3 2 1 0
- *
- * ---- BIT -- -----------
- * 1 0 0 0 0 | 0 0 0 0 0 0
- * 0 9 8 7 6 | 5 4 3 2 1 0
- */
-
-#define ADP5585_ROW_MASK		0x3F
-#define ADP5585_COL_MASK		0x1F
-#define ADP5585_ROW_SHIFT		0
-#define ADP5585_COL_SHIFT		6
-#define ADP5585_MAX_ROW_NUM		5
-#define ADP5585_MAX_COL_NUM		4
-
-#define ADP5585_ROW(x)	(1 << ((x) & ADP5585_ROW_MASK))
-#define ADP5585_COL(x)	(1 << (((x) & ADP5585_COL_MASK) + ADP5585_COL_SHIFT))
-
-/* Put one of these structures in i2c_board_info platform_data */
-
-struct adp5589_kpad_platform_data {
-	unsigned keypad_en_mask;	/* Keypad (Rows/Columns) enable mask */
-	const unsigned short *keymap;	/* Pointer to keymap */
-	unsigned short keymapsize;	/* Keymap size */
-	bool repeat;			/* Enable key repeat */
-	bool en_keylock;		/* Enable key lock feature (ADP5589 only)*/
-	unsigned char unlock_key1;	/* Unlock Key 1 (ADP5589 only) */
-	unsigned char unlock_key2;	/* Unlock Key 2 (ADP5589 only) */
-	unsigned char unlock_timer;	/* Time in seconds [0..7] between the two unlock keys 0=disable (ADP5589 only) */
-	unsigned char scan_cycle_time;	/* Time between consecutive scan cycles */
-	unsigned char reset_cfg;	/* Reset config */
-	unsigned short reset1_key_1;	/* Reset Key 1 */
-	unsigned short reset1_key_2;	/* Reset Key 2 */
-	unsigned short reset1_key_3;	/* Reset Key 3 */
-	unsigned short reset2_key_1;	/* Reset Key 1 */
-	unsigned short reset2_key_2;	/* Reset Key 2 */
-	unsigned debounce_dis_mask;	/* Disable debounce mask */
-	unsigned pull_dis_mask;		/* Disable all pull resistors mask */
-	unsigned pullup_en_100k;	/* Pull-Up 100k Enable Mask */
-	unsigned pullup_en_300k;	/* Pull-Up 300k Enable Mask */
-	unsigned pulldown_en_300k;	/* Pull-Down 300k Enable Mask */
-	const struct adp5589_gpi_map *gpimap;
-	unsigned short gpimapsize;
-	const struct adp5589_gpio_platform_data *gpio_data;
-};
-
-struct i2c_client; /* forward declaration */
-
-struct adp5589_gpio_platform_data {
-	int	gpio_start;	/* GPIO Chip base # */
-};
-
-#endif
-- 
2.51.0


