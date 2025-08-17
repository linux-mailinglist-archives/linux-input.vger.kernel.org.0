Return-Path: <linux-input+bounces-14070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B02B29535
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 23:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B1B420344C
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 21:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 120E52F1FD5;
	Sun, 17 Aug 2025 21:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE6OHXBn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B7D2877FB;
	Sun, 17 Aug 2025 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755467614; cv=none; b=tmWk1mJP4sGrEMRYpx9tSMrw94syD2vuD7A6uSIEZF23jgCq4urNaTteaminiRTFcsNSbOI8CztldZOuljcVyqtqnOCxFz/PMQYADENCyyhsDknFZIKoRQiQ8/ipNyi9NgbsQUF/L4Z4mRG4sV2qnoyH2syrAmNxVZYvvLWER6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755467614; c=relaxed/simple;
	bh=3sJC7Cqcwt1exbwsN6yah75/MHXkhApncsCSqgkGN60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxOXbxoQ6EJXoqPoYs1/IkK4K69EbjEEa4oWcbQ8XR8ohypDe0l4pEBrtLZuXACAie+WB55e6/dSSu20UvslMnVUIuZCHJEkjEq431ZfSCnyd7XRov6I14u5Dry7bp0O39cdPyr/4WGoLbVRTUXbVtFs2WZMp0J3S15xbpzdtxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE6OHXBn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2430c5b1b32so27439975ad.1;
        Sun, 17 Aug 2025 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755467610; x=1756072410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JEiyKhbK4SP+GnCDnwQYbuVgvKJatwAb17LNcmS18WM=;
        b=gE6OHXBnNWiyna7H9zETE3YRakCTRHCZL/LaitMCKwdSUCXqx3kxt9Fj8vvVZzoCBv
         5dth8NzBbrniVMT0z5s1k9dea4K01xb1luhXzrd7tzyPx/csRJgXWfoYXu9n1uampggk
         DphNgfp58enH0/Dk48eAQrjI2yYVXNnt7DgJlLKHl4sVA43mSrZ8drI9R2fw4MlbP6gw
         sUjDgzLSSyxXx3QrXLam9LBO2IIqNuwnm1To/0wvhTe3cM6HhZoprodOO0dmLDgOicn5
         WK/46VkKDnbIjdCtZDsKhhRK48dSYW72jgjlk2mgZcQkxB4N53cEFyh8ZQXyj3zysP2g
         iZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755467610; x=1756072410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JEiyKhbK4SP+GnCDnwQYbuVgvKJatwAb17LNcmS18WM=;
        b=crdouwOnsS7x0YZBhSFi7I30TnlbDyfXoq2t0BjVtFiQt1gzWuRBAE6isUij+EyyNX
         iNEWZoau1vVvLJdiXzYA2bb73Gex4IsVGIrXUZYZJHTBrGKJs7GhLniTm8B0jbRJSJmB
         OgI89r3KsREvpjUIsiY2giYnCqE/RIuBACQ+BG/TEqESq6SOlfHywDEAdw/3rz620Ihg
         liN1i9v5cqENGxqR3THo8GQvz5ldav00L18l0u+wi2s8qtLpfhMxwUqr57DTpyBueptR
         2eLQa3X+SEHas80dDKnZloyVdut8T8FUZLRVyeJWNftGjtAUqMdiIw8mwKom6UzaHCQ6
         G1AQ==
X-Gm-Message-State: AOJu0YyDk1D2RWkJ1ennFtcPKW7gIVYvnT9SVsHlxzdsjvl1jRK8Kqia
	tsi3ZgvZSEC737i804GqFMXmjfivPsvs+WEsjhklnnJcbwrzLDo8g9abTSvQhQ==
X-Gm-Gg: ASbGnctwVnSENq7batUGkLexEw/c6oj8LWIOyJlPqpBhbTXkRq0VvQclcX1Bgcrv28y
	F9O7zCcsbCBLACUcS7+4dCt84FNeoYa4trOZRmrCHGP0YXQ9kauFBCgCcSagMtPiU3+AmwtJ0Wt
	K16HwvGHlUOuCsCSdIVW4T4sNb65E9PtwxOlF8Al4Vj+LZVyPQ+QAeCRQBHSmmbOf4nRvtSdLFI
	p0aD/JPNAGy4+/Wvxb25k6DB3BFen/qGWOOKZWsVHPTy/KRvi8c2DoYV/DerCiIfNh5vV3divos
	Bq3z5UNFEC2di2mCB5bfsLG6qNBTyrE+xOpQAdEAJk79mjhAbUx/i3mF2pAtuh+uvm8RLYg4/RK
	CdsfPr2TwRF6a1Gn012E0N20IzGt5th7fFPravJXAmixC
X-Google-Smtp-Source: AGHT+IGu6ou2edofw0SlT/fy/atu/tifWCjoHWjHWyiBtZ0+3WNcXRNM+GylYh9nGL5C8k3YTiJ6/w==
X-Received: by 2002:a17:902:d4d0:b0:240:417d:8166 with SMTP id d9443c01a7336-2446bdd64f3mr138750385ad.19.1755467610245;
        Sun, 17 Aug 2025 14:53:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-244903222fcsm3832995ad.84.2025.08.17.14.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 14:53:29 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Miao <eric.y.miao@gmail.com>
Subject: [PATCH 2/3] Input: pxa27x-keypad - use BIT, GENMASK, FIELD_GET, etc
Date: Sun, 17 Aug 2025 14:53:14 -0700
Message-ID: <20250817215316.1872689-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250817215316.1872689-1-dmitry.torokhov@gmail.com>
References: <20250817215316.1872689-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using explicit binary values for masks and shifts to do bit
operations use appropriate macros.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/pxa27x_keypad.c | 128 +++++++++++++------------
 1 file changed, 69 insertions(+), 59 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 995e4e227581..376e943dc3dd 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -12,7 +12,8 @@
  * on some suggestions by Nicolas Pitre <nico@fluxnic.net>.
  */
 
-
+#include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -30,62 +31,71 @@
 /*
  * Keypad Controller registers
  */
-#define KPC             0x0000 /* Keypad Control register */
-#define KPDK            0x0008 /* Keypad Direct Key register */
-#define KPREC           0x0010 /* Keypad Rotary Encoder register */
-#define KPMK            0x0018 /* Keypad Matrix Key register */
-#define KPAS            0x0020 /* Keypad Automatic Scan register */
+#define KPC		0x0000 /* Keypad Control register */
+#define KPDK		0x0008 /* Keypad Direct Key register */
+#define KPREC		0x0010 /* Keypad Rotary Encoder register */
+#define KPMK		0x0018 /* Keypad Matrix Key register */
+#define KPAS		0x0020 /* Keypad Automatic Scan register */
 
 /* Keypad Automatic Scan Multiple Key Presser register 0-3 */
-#define KPASMKP0        0x0028
-#define KPASMKP1        0x0030
-#define KPASMKP2        0x0038
-#define KPASMKP3        0x0040
-#define KPKDI           0x0048
+#define KPASMKP0	0x0028
+#define KPASMKP1	0x0030
+#define KPASMKP2	0x0038
+#define KPASMKP3	0x0040
+#define KPKDI		0x0048
 
 /* bit definitions */
-#define KPC_MKRN(n)	((((n) - 1) & 0x7) << 26) /* matrix key row number */
-#define KPC_MKCN(n)	((((n) - 1) & 0x7) << 23) /* matrix key column number */
-#define KPC_DKN(n)	((((n) - 1) & 0x7) << 6)  /* direct key number */
-
-#define KPC_AS          (0x1 << 30)  /* Automatic Scan bit */
-#define KPC_ASACT       (0x1 << 29)  /* Automatic Scan on Activity */
-#define KPC_MI          (0x1 << 22)  /* Matrix interrupt bit */
-#define KPC_IMKP        (0x1 << 21)  /* Ignore Multiple Key Press */
-
-#define KPC_MS(n)	(0x1 << (13 + (n)))	/* Matrix scan line 'n' */
-#define KPC_MS_ALL      (0xff << 13)
-
-#define KPC_ME          (0x1 << 12)  /* Matrix Keypad Enable */
-#define KPC_MIE         (0x1 << 11)  /* Matrix Interrupt Enable */
-#define KPC_DK_DEB_SEL	(0x1 <<  9)  /* Direct Keypad Debounce Select */
-#define KPC_DI          (0x1 <<  5)  /* Direct key interrupt bit */
-#define KPC_RE_ZERO_DEB (0x1 <<  4)  /* Rotary Encoder Zero Debounce */
-#define KPC_REE1        (0x1 <<  3)  /* Rotary Encoder1 Enable */
-#define KPC_REE0        (0x1 <<  2)  /* Rotary Encoder0 Enable */
-#define KPC_DE          (0x1 <<  1)  /* Direct Keypad Enable */
-#define KPC_DIE         (0x1 <<  0)  /* Direct Keypad interrupt Enable */
-
-#define KPDK_DKP        (0x1 << 31)
-#define KPDK_DK(n)	((n) & 0xff)
-
-#define KPREC_OF1       (0x1 << 31)
-#define kPREC_UF1       (0x1 << 30)
-#define KPREC_OF0       (0x1 << 15)
-#define KPREC_UF0       (0x1 << 14)
-
-#define KPREC_RECOUNT0(n)	((n) & 0xff)
-#define KPREC_RECOUNT1(n)	(((n) >> 16) & 0xff)
-
-#define KPMK_MKP        (0x1 << 31)
-#define KPAS_SO         (0x1 << 31)
-#define KPASMKPx_SO     (0x1 << 31)
-
-#define KPAS_MUKP(n)	(((n) >> 26) & 0x1f)
-#define KPAS_RP(n)	(((n) >> 4) & 0xf)
-#define KPAS_CP(n)	((n) & 0xf)
-
-#define KPASMKP_MKC_MASK	(0xff)
+#define KPC_MKRN_MASK	GENMASK(28, 26)
+#define KPC_MKCN_MASK	GENMASK(25, 23)
+#define KPC_DKN_MASK	GENMASK(8, 6)
+#define KPC_MKRN(n)	FIELD_PREP(KPC_MKRN_MASK, (n) - 1)
+#define KPC_MKCN(n)	FIELD_PREP(KPC_MKCN_MASK, (n) - 1)
+#define KPC_DKN(n)	FIELD_PREP(KPC_DKN_MASK, (n) - 1)
+
+#define KPC_AS		BIT(30)  /* Automatic Scan bit */
+#define KPC_ASACT	BIT(29)  /* Automatic Scan on Activity */
+#define KPC_MI		BIT(22)  /* Matrix interrupt bit */
+#define KPC_IMKP	BIT(21)  /* Ignore Multiple Key Press */
+
+#define KPC_MS(n)	BIT(13 + (n))	/* Matrix scan line 'n' */
+#define KPC_MS_ALL	GENMASK(20, 13)
+
+#define KPC_ME		BIT(12)  /* Matrix Keypad Enable */
+#define KPC_MIE		BIT(11)  /* Matrix Interrupt Enable */
+#define KPC_DK_DEB_SEL	BIT(9)   /* Direct Keypad Debounce Select */
+#define KPC_DI		BIT(5)   /* Direct key interrupt bit */
+#define KPC_RE_ZERO_DEB	BIT(4)   /* Rotary Encoder Zero Debounce */
+#define KPC_REE1	BIT(3)   /* Rotary Encoder1 Enable */
+#define KPC_REE0	BIT(2)   /* Rotary Encoder0 Enable */
+#define KPC_DE		BIT(1)   /* Direct Keypad Enable */
+#define KPC_DIE		BIT(0)   /* Direct Keypad interrupt Enable */
+
+#define KPDK_DKP	BIT(31)
+#define KPDK_DK_MASK	GENMASK(7, 0)
+#define KPDK_DK(n)	FIELD_GET(KPDK_DK_MASK, n)
+
+#define KPREC_OF1	BIT(31)
+#define KPREC_UF1	BIT(30)
+#define KPREC_OF0	BIT(15)
+#define KPREC_UF0	BIT(14)
+
+#define KPREC_RECOUNT0_MASK	GENMASK(7, 0)
+#define KPREC_RECOUNT1_MASK	GENMASK(23, 16)
+#define KPREC_RECOUNT0(n)	FIELD_GET(KPREC_RECOUNT0_MASK, n)
+#define KPREC_RECOUNT1(n)	FIELD_GET(KPREC_RECOUNT1_MASK, n)
+
+#define KPMK_MKP	BIT(31)
+#define KPAS_SO		BIT(31)
+#define KPASMKPx_SO	BIT(31)
+
+#define KPAS_MUKP_MASK	GENMASK(30, 26)
+#define KPAS_RP_MASK	GENMASK(7, 4)
+#define KPAS_CP_MASK	GENMASK(3, 0)
+#define KPAS_MUKP(n)	FIELD_GET(KPAS_MUKP_MASK, n)
+#define KPAS_RP(n)	FIELD_GET(KPAS_RP_MASK, n)
+#define KPAS_CP(n)	FIELD_GET(KPAS_CP_MASK, n)
+
+#define KPASMKP_MKC_MASK	GENMASK(7, 0)
 
 #define keypad_readl(off)	__raw_readl(keypad->mmio_base + (off))
 #define keypad_writel(off, v)	__raw_writel((v), keypad->mmio_base + (off))
@@ -429,7 +439,7 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 		    row >= pdata->matrix_key_rows)
 			goto scan;
 
-		new_state[col] = (1 << row);
+		new_state[col] = BIT(row);
 		goto scan;
 	}
 
@@ -458,14 +468,14 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 			continue;
 
 		for (row = 0; row < pdata->matrix_key_rows; row++) {
-			if ((bits_changed & (1 << row)) == 0)
+			if ((bits_changed & BIT(row)) == 0)
 				continue;
 
 			code = MATRIX_SCAN_CODE(row, col, keypad->row_shift);
 
 			input_event(input_dev, EV_MSC, MSC_SCAN, code);
 			input_report_key(input_dev, keypad->keycodes[code],
-					 new_state[col] & (1 << row));
+					 new_state[col] & BIT(row));
 		}
 	}
 	input_sync(input_dev);
@@ -552,12 +562,12 @@ static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 		return;
 
 	for (i = 0; i < pdata->direct_key_num; i++) {
-		if (bits_changed & (1 << i)) {
+		if (bits_changed & BIT(i)) {
 			int code = MAX_MATRIX_KEY_NUM + i;
 
 			input_event(input_dev, EV_MSC, MSC_SCAN, code);
 			input_report_key(input_dev, keypad->keycodes[code],
-					 new_state & (1 << i));
+					 new_state & BIT(i));
 		}
 	}
 	input_sync(input_dev);
@@ -627,7 +637,7 @@ static void pxa27x_keypad_config(struct pxa27x_keypad *keypad)
 	if (pdata->direct_key_mask)
 		keypad->direct_key_mask = pdata->direct_key_mask;
 	else
-		keypad->direct_key_mask = ((1 << direct_key_num) - 1) & ~mask;
+		keypad->direct_key_mask = GENMASK(direct_key_num - 1, 0) & ~mask;
 
 	/* enable direct key */
 	if (direct_key_num)
-- 
2.51.0.rc1.163.g2494970778-goog


