Return-Path: <linux-input+bounces-4085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E1A8FBA02
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 19:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85AA61C2163D
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E2F149C54;
	Tue,  4 Jun 2024 17:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gY0BzahK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162BD149018
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520982; cv=none; b=JlvufbUKTCPj8twzEuW5UYS3mAMkAfSHyrqqQKK3TMj0F+swDUAiksgYb1Bp9u2KAI+m7CgsfL1C8B8T/wltoF500FrLHG9S+ENY91SP4xvycwRSQd1ATf8SptMcLMgW4EH0WPFW1hY0qr8ztXYoQtwpynu6/RNSZFFI4t3ZEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520982; c=relaxed/simple;
	bh=o72VHC36VXAXqahL3bNFNFeuj1qmWPkvDEckyWe9QaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QLuPAz/wwa9q14Zp7V0GvzfUIXK8G4uJtd/S5dAYEGPoHtmnrz+eo407HhHrGUPlZi7sTBKrgQeWuknX2m08rVQC8Fuoppsf0Dk9/tFDDvE/C4z7v5mJ1d0JFcu4BP+qiRrn1D0ez3MRSNXnS8iAIjreVrs98p9BzGDFc+FY518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gY0BzahK; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-681953ad4f2so4379715a12.2
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2024 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717520980; x=1718125780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j59MRW4AaCLc7+qyPpgnSFBskkC64o2U0cQrDH3ZUdw=;
        b=gY0BzahKvyZ0MTjzyCFKkAWcj8eDri9zyM6YkrnKvF0LPUOx3OCkhDV755/QzP+Ni8
         B3mSM5UelE513ZM3Z/pB9yTtEiMhubdbxO6efnRxJcAMU/smPFcSwVSou8YgxykpmTE8
         wJkj/KX89dd885qTeo6+YdtgBOkzDUrRUd3JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520980; x=1718125780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j59MRW4AaCLc7+qyPpgnSFBskkC64o2U0cQrDH3ZUdw=;
        b=d1jNst6KMJpJ7kl1vIGFpVzC3Ep9i91Blrm6yEyvw92KtXngvLe8Mr6oN6E8OU6ExW
         zUJysmN4853RyMBwQYSBAJqiiGhnwmKnhFPQxuKH0A7iDGHxLysjfAdoXRgNureAz2H8
         IQsG7bJhw8n9ynBjRcgacRVHfdpUo7WdfkzQX6/PlLB8FEIpTImpHg35jKHNUTN5uYFV
         eUr+sqotfOiuNvcDY8eQnry7gxvX+4oRpDVfRgTjUFVzSrxLuWQ+VXv/zK9f04Ip5Jy1
         snYhlFyiJgQr0n4Q84u4gcOMLZ5B6mb/Qxb0pinpve8vPnK16APB8XolLwHuIqKed2UT
         oBMg==
X-Forwarded-Encrypted: i=1; AJvYcCVkicNHe7Hos6XBUBM0gDRqdTDudW/ZyFhdSJGe2dWRPVqB3dSo5BN0fwEO/Q1XzxaSNF+sHULTNWm4OnNNAHG/wbRMb4GUT9/TIb0=
X-Gm-Message-State: AOJu0YyqQ2Wbkvm51hPMwHOrB+5LIG43qaFcQq8wu23W7WSq71DSlyaH
	eaYvS/lz7o5GkezVMKn0YE4N00MkU1Pk3NzloVgSFnhlpwE2CuSpzYe7ONZ7og==
X-Google-Smtp-Source: AGHT+IHQToIHKeRdbF7ReYTDKWs4YXC65IdOWhuRt4bWMYdFuwfFfVpRVzadclbj0nLghWQUhad8JA==
X-Received: by 2002:a17:90a:e289:b0:2c2:3f34:e4eb with SMTP id 98e67ed59e1d1-2c27db5a583mr59664a91.36.1717520980396;
        Tue, 04 Jun 2024 10:09:40 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:6203:d1ca:c560:52f1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c28316d0sm8354482a91.40.2024.06.04.10.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:09:40 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Daisuke Nojiri <dnojiri@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: cros-ec-keyboard: Add keyboard matrix v3.0
Date: Tue,  4 Jun 2024 10:09:33 -0700
Message-ID: <20240604170935.2518856-1-dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240604005354.2294468-1-dnojiri@chromium.org>
References: <20240604005354.2294468-1-dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for keyboard matrix version 3.0. To enable it, define
CONFIG_CROS_KBD_V30.

Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
---
 arch/arm/boot/dts/cros-ec-keyboard.dtsi      |  16 ++-
 drivers/platform/chrome/Kconfig              |   6 ++
 include/dt-bindings/input/cros-ec-keyboard.h | 104 +++++++++++++++++++
 3 files changed, 123 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/cros-ec-keyboard.dtsi b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
index 55c4744fa7e7..0499e254596a 100644
--- a/arch/arm/boot/dts/cros-ec-keyboard.dtsi
+++ b/arch/arm/boot/dts/cros-ec-keyboard.dtsi
@@ -8,16 +8,26 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/cros-ec-keyboard.h>
 
+#ifdef CONFIG_CROS_KBD_V30
+#define CROS_EC_KEYBOARD_COLUMN_SIZE 18
+#define CROS_TOP_ROW_KEYMAP CROS_TOP_ROW_KEYMAP_V30
+#define CROS_MAIN_KEYMAP CROS_MAIN_KEYMAP_V30
+#else
+#define CROS_EC_KEYBOARD_COLUMN_SIZE 13
+#define CROS_TOP_ROW_KEYMAP CROS_STD_TOP_ROW_KEYMAP
+#define CROS_MAIN_KEYMAP CROS_STD_MAIN_KEYMAP
+#endif
+
 &cros_ec {
 	keyboard_controller: keyboard-controller {
 		compatible = "google,cros-ec-keyb";
 		keypad,num-rows = <8>;
-		keypad,num-columns = <13>;
+		keypad,num-columns = <CROS_EC_KEYBOARD_COLUMN_SIZE>;
 		google,needs-ghost-filter;
 
 		linux,keymap = <
-			CROS_STD_TOP_ROW_KEYMAP
-			CROS_STD_MAIN_KEYMAP
+			CROS_TOP_ROW_KEYMAP
+			CROS_MAIN_KEYMAP
 		>;
 	};
 };
diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index d48f7f43f9e5..8f66beaa48ec 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -157,6 +157,12 @@ config CROS_KBD_LED_BACKLIGHT
 	  To compile this driver as a module, choose M here: the
 	  module will be called cros_kbd_led_backlight.
 
+config CROS_KBD_V30
+	bool "ChromeOS built-in keyboard version 3.0"
+	default n
+	help
+	  If you say Y here, you get support for built-in keyboard ver 3.0.
+
 config CROS_EC_CHARDEV
 	tristate "ChromeOS EC miscdevice"
 	depends on MFD_CROS_EC_DEV
diff --git a/include/dt-bindings/input/cros-ec-keyboard.h b/include/dt-bindings/input/cros-ec-keyboard.h
index f0ae03634a96..afc12f6aa642 100644
--- a/include/dt-bindings/input/cros-ec-keyboard.h
+++ b/include/dt-bindings/input/cros-ec-keyboard.h
@@ -100,4 +100,108 @@
 	MATRIX_KEY(0x07, 0x0b, KEY_UP)		\
 	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)
 
+/* No numpad */
+#define CROS_TOP_ROW_KEYMAP_V30 \
+	MATRIX_KEY(0x00, 0x01, KEY_F11)		/* T11 */	\
+	MATRIX_KEY(0x00, 0x02, KEY_F1)		/* T1 */	\
+	MATRIX_KEY(0x00, 0x04, KEY_F10)		/* T10 */	\
+	MATRIX_KEY(0x00, 0x0b, KEY_F14)		/* T14 */	\
+	MATRIX_KEY(0x00, 0x0c, KEY_F15)		/* T15 */	\
+	MATRIX_KEY(0x01, 0x02, KEY_F4)		/* T4 */	\
+	MATRIX_KEY(0x01, 0x04, KEY_F7)		/* T7 */	\
+	MATRIX_KEY(0x01, 0x05, KEY_F12)		/* T12 */	\
+	MATRIX_KEY(0x01, 0x09, KEY_F9)		/* T9 */	\
+	MATRIX_KEY(0x02, 0x02, KEY_F3)		/* T3 */	\
+	MATRIX_KEY(0x02, 0x04, KEY_F6)		/* T6 */	\
+	MATRIX_KEY(0x02, 0x0b, KEY_F8)		/* T8 */	\
+	MATRIX_KEY(0x03, 0x02, KEY_F2)		/* T2 */	\
+	MATRIX_KEY(0x03, 0x05, KEY_F13)		/* T13 */	\
+	MATRIX_KEY(0x04, 0x04, KEY_F5)		/* T5 */
+
+#define CROS_MAIN_KEYMAP_V30			/* Keycode */	\
+	MATRIX_KEY(0x00, 0x03, KEY_B)		/* 50 */	\
+	MATRIX_KEY(0x00, 0x05, KEY_N)		/* 51 */	\
+	MATRIX_KEY(0x00, 0x06, KEY_RO)		/* 56 (JIS) */	\
+	MATRIX_KEY(0x00, 0x08, KEY_EQUAL)	/* 13 */	\
+	MATRIX_KEY(0x00, 0x09, KEY_HOME)	/* 80 (Numpad) */	\
+	MATRIX_KEY(0x00, 0x0a, KEY_RIGHTALT)	/* 62 */	\
+	MATRIX_KEY(0x00, 0x10, KEY_FN)		/* 127 */	\
+								\
+	MATRIX_KEY(0x01, 0x01, KEY_ESC)		/* 110 */	\
+	MATRIX_KEY(0x01, 0x03, KEY_G)		/* 35 */	\
+	MATRIX_KEY(0x01, 0x06, KEY_H)		/* 36 */	\
+	MATRIX_KEY(0x01, 0x08, KEY_APOSTROPHE)	/* 41 */	\
+	MATRIX_KEY(0x01, 0x0b, KEY_BACKSPACE)	/* 15 */	\
+	MATRIX_KEY(0x01, 0x0c, KEY_HENKAN)	/* 65 (JIS) */	\
+	MATRIX_KEY(0x01, 0x0e, KEY_LEFTCTRL)	/* 58 */	\
+								\
+	MATRIX_KEY(0x02, 0x01, KEY_TAB)		/* 16 */	\
+	MATRIX_KEY(0x02, 0x03, KEY_T)		/* 21 */	\
+	MATRIX_KEY(0x02, 0x05, KEY_RIGHTBRACE)	/* 28 */	\
+	MATRIX_KEY(0x02, 0x06, KEY_Y)		/* 22 */	\
+	MATRIX_KEY(0x02, 0x08, KEY_LEFTBRACE)	/* 27 */	\
+	MATRIX_KEY(0x02, 0x09, KEY_DELETE)	/* 76 (Numpad) */	\
+	MATRIX_KEY(0x02, 0x0c, KEY_PAGEUP)	/* 85 (Numpad) */	\
+	MATRIX_KEY(0x02, 0x011, KEY_YEN)	/* 14 (JIS) */	\
+								\
+	MATRIX_KEY(0x03, 0x00, KEY_LEFTMETA)	/* Launcher */	\
+	MATRIX_KEY(0x03, 0x01, KEY_GRAVE)	/* 1 */	\
+	MATRIX_KEY(0x03, 0x03, KEY_5)		/* 6 */	\
+	MATRIX_KEY(0x03, 0x04, KEY_S)		/* 32 */	\
+	MATRIX_KEY(0x03, 0x06, KEY_MINUS)	/* 12 */	\
+	MATRIX_KEY(0x03, 0x08, KEY_6)		/* 7 */		\
+	MATRIX_KEY(0x03, 0x09, KEY_SLEEP)	/* Lock */	\
+	MATRIX_KEY(0x03, 0x0b, KEY_BACKSLASH)	/* 29 */	\
+	MATRIX_KEY(0x03, 0x0c, KEY_MUHENKAN)	/* 63 (JIS) */	\
+	MATRIX_KEY(0x03, 0x0e, KEY_RIGHTCTRL)	/* 64 */	\
+								\
+	MATRIX_KEY(0x04, 0x01, KEY_A)		/* 31 */	\
+	MATRIX_KEY(0x04, 0x02, KEY_D)		/* 33 */	\
+	MATRIX_KEY(0x04, 0x03, KEY_F)		/* 34 */	\
+	MATRIX_KEY(0x04, 0x05, KEY_K)		/* 38 */	\
+	MATRIX_KEY(0x04, 0x06, KEY_J)		/* 37 */	\
+	MATRIX_KEY(0x04, 0x08, KEY_SEMICOLON)	/* 40 */	\
+	MATRIX_KEY(0x04, 0x09, KEY_L)		/* 39 */	\
+	MATRIX_KEY(0x04, 0x0b, KEY_ENTER)	/* 43 */	\
+	MATRIX_KEY(0x04, 0x0c, KEY_END)		/* 81 (Numpad) */	\
+								\
+	MATRIX_KEY(0x05, 0x01, KEY_1)		/* 2 */	\
+	MATRIX_KEY(0x05, 0x02, KEY_COMMA)	/* 53 */	\
+	MATRIX_KEY(0x05, 0x03, KEY_DOT)		/* 54 */	\
+	MATRIX_KEY(0x05, 0x04, KEY_SLASH)	/* 55 */	\
+	MATRIX_KEY(0x05, 0x05, KEY_C)		/* 48 */	\
+	MATRIX_KEY(0x05, 0x06, KEY_SPACE)	/* 61 */	\
+	MATRIX_KEY(0x05, 0x07, KEY_LEFTSHIFT)	/* 44 */	\
+	MATRIX_KEY(0x05, 0x08, KEY_X)		/* 47 */	\
+	MATRIX_KEY(0x05, 0x09, KEY_V)		/* 49 */	\
+	MATRIX_KEY(0x05, 0x0b, KEY_M)		/* 52 */	\
+	MATRIX_KEY(0x05, 0x0c, KEY_PAGEDOWN)	/* 86 (Numpad) */	\
+								\
+	MATRIX_KEY(0x06, 0x01, KEY_Z)		/* 46 */	\
+	MATRIX_KEY(0x06, 0x02, KEY_3)		/* 4 */		\
+	MATRIX_KEY(0x06, 0x03, KEY_4)		/* 5 */		\
+	MATRIX_KEY(0x06, 0x04, KEY_2)		/* 3 */		\
+	MATRIX_KEY(0x06, 0x05, KEY_8)		/* 9 */		\
+	MATRIX_KEY(0x06, 0x06, KEY_0)		/* 11 */	\
+	MATRIX_KEY(0x06, 0x08, KEY_7)		/* 8 */		\
+	MATRIX_KEY(0x06, 0x09, KEY_9)		/* 10 */	\
+	MATRIX_KEY(0x06, 0x0b, KEY_DOWN)	/* 84 */	\
+	MATRIX_KEY(0x06, 0x0c, KEY_RIGHT)	/* 89 */	\
+	MATRIX_KEY(0x06, 0x0d, KEY_LEFTALT)	/* 60 */	\
+	MATRIX_KEY(0x06, 0x0f, KEY_ASSISTANT)	/* 128 */	\
+	MATRIX_KEY(0x06, 0x11, KEY_BACKSLASH)	/* 42 (JIS, ISO) */	\
+								\
+	MATRIX_KEY(0x07, 0x01, KEY_U)		/* 23 */	\
+	MATRIX_KEY(0x07, 0x02, KEY_I)		/* 24 */	\
+	MATRIX_KEY(0x07, 0x03, KEY_O)		/* 25 */	\
+	MATRIX_KEY(0x07, 0x04, KEY_P)		/* 26 */	\
+	MATRIX_KEY(0x07, 0x05, KEY_Q)		/* 17 */	\
+	MATRIX_KEY(0x07, 0x06, KEY_W)		/* 18 */	\
+	MATRIX_KEY(0x07, 0x07, KEY_RIGHTSHIFT)	/* 57 */	\
+	MATRIX_KEY(0x07, 0x08, KEY_E)		/* 19 */	\
+	MATRIX_KEY(0x07, 0x09, KEY_R)		/* 20 */	\
+	MATRIX_KEY(0x07, 0x0b, KEY_UP)		/* 83 */	\
+	MATRIX_KEY(0x07, 0x0c, KEY_LEFT)	/* 79 */	\
+	MATRIX_KEY(0x07, 0x11, KEY_102ND)	/* 45 (ISO) */
+
 #endif /* _CROS_EC_KEYBOARD_H */
-- 
2.45.1.288.g0e0cd299f1-goog


