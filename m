Return-Path: <linux-input+bounces-14069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABE5B29533
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 23:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63AE47A18C1
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 21:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A7521B9FD;
	Sun, 17 Aug 2025 21:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ/49QcH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E2149E17;
	Sun, 17 Aug 2025 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755467611; cv=none; b=gDrM6i0MWg/qwz+iMGHtD1gYNATgLTOEyf7PYULHa2/UcCaaOOoIgF5Ur5OsKu+0+Ls5pCG5EW3by4ZsrjjY9plOZMDXFwGg5Dao3yvTSDwTfIFeLKmL3WAfDl0rBeC47/Iz/kO6nKh8X6rhr27yA0Z50WRa9cQoAmTIy7Rm3Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755467611; c=relaxed/simple;
	bh=YXCWOViuEUExG1sERbqTpLIfxjyR073h8gnVrwDbKis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mXxiEgTZprFARFvBGM4MOVXFdQPjBJlfBoO+7TfpAqKfBFCGZ9FEYqOeqYgaIvG0RtRlFCOGeJvUEXAcJO5wuFMw8SAmQc9fJPjRCyF309wvrZ9MOnwTop/+1gHFVonitI30P6rfJR2VWR50EpNFgV2NE9X5UheQ80tr64qaTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ/49QcH; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so3165162b3a.0;
        Sun, 17 Aug 2025 14:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755467609; x=1756072409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMFOYD7dTng51TwDNUgsmlrPl36b8E0TwBZ9PftmkPU=;
        b=cJ/49QcHlfRhFpvSFsyDpGtb6Ka2MnJDBOJGma4T/0iXzxAfhV6jRQaXu8QurvcH5T
         wcbFQAAM9jX8NTtaemFEL7elA2DXZ9mw321G2B9UOwlkz1brCKQrrdKubTxho8zmnH6F
         P3Iz/TTEOxALoHEo/SYDbkFs1lxDXS70qUsvIcrruuxn5SQK5GvogJMuwEg+7Ju4vuv+
         eG0ycXciC0Uj9jgbN6z2zaeb4efCGV3JAT+HH/WDVatu/Q4fDjeth3R+8OrBsLIalhEj
         7wC30e9AGEF/rnPWTtcL8xRUEGcinkTLIeFSPlI64QleCqXXxJ5iSXzN+0HEDmRKuP0o
         U8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755467609; x=1756072409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMFOYD7dTng51TwDNUgsmlrPl36b8E0TwBZ9PftmkPU=;
        b=wiTdqCRQhnTz/awwwmoEGVx10Zm7/buhGO25/1auYV756GUNFnAG7ISNbuUl8kzN3l
         tq9gKbXmOxn23IyEb0EUCfvwhJgj1T3JRAFaIvN1NHsBtGJyGkEeSLqAtsXk9MzGRrnM
         BTI9gotzPUc4WwK/I385GW5iB89V3N1/NBkIkAiNsAbz/rugUJVCgMGk44zHVmvlCIcD
         CW9DtyT5rJP+5iT+FKim5HstfHBylY1xUyPtYuZM5yfYomQmtDPLXbuUbsTyDwk2/RFh
         cXroj/IT1zh6dq+0uuMECMCQHkAiYT86PyST5iL430On/xFu+D3jAjuxF+l8+eP9MOh4
         dqVQ==
X-Gm-Message-State: AOJu0YyFhaUJ2vSP1veMY/XPpF/FIUaQNMZKwB1uhBaV0PhxQMKQyHVi
	OWlbuq7W3Tigv6cK+m2mJaTyGcHuLwFfavDyFtu4tWTH1ApllTAYFRafpD/mdQ==
X-Gm-Gg: ASbGncvAnNf+6ZxmBLMTYidyUdsGfv9F4QNC+N1uASZ41W3Djs4vIPJi1TY3vDy0Gh0
	ebVDsUljs7LCmPzWaaS3qZJvFPb1hKjyrE+jIQAeoJ9DLV+sxWX9Xo8s/uqYKM8z0iavVIS1TMP
	3F+gg7uf8lVWTus6zWW+RIj1cnl5xaRhAGLjk1Ny9nScfuMyz0S5uww/Tvnh0tW5XNJnLnmsV2d
	Jen+4wFDTojzt1bWVrdQfirZbpojwtYBhnqgEeOketsqjU/078Z8LLCgUagYroCzv2qh6paOelS
	vBrRYG5z98BzEx5+/cdgPnVuVCeQY97cv6FfadltyPNdw0W/SVLprz/5swPq9IFCMFPRoDn2Y2O
	ncNdk3H2mG5qBGMec+goLuigaBmGUXZ/kjlaPuqVfEbrV
X-Google-Smtp-Source: AGHT+IEodPl5+1A1HBCn8jZAoq2asWPuBXactM79Xq02VLDkl9zif4o68L0R168921SXaq7TnHWTqA==
X-Received: by 2002:a17:903:19f0:b0:240:20a8:cc22 with SMTP id d9443c01a7336-2446bce46c0mr135081285ad.4.1755467609166;
        Sun, 17 Aug 2025 14:53:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-244903222fcsm3832995ad.84.2025.08.17.14.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 14:53:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Miao <eric.y.miao@gmail.com>
Subject: [PATCH 1/3] Input: pxa27x-keypad - replace uint32_t with u32
Date: Sun, 17 Aug 2025 14:53:13 -0700
Message-ID: <20250817215316.1872689-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

u32 is preferred way to refer to unsigned 32 bit values in the kernel,
use it instead of uint32_t.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/pxa27x_keypad.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index d4eb839ffbf5..995e4e227581 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -108,8 +108,8 @@ struct pxa27x_keypad {
 	unsigned int row_shift;
 
 	/* state row bits of each column scan */
-	uint32_t matrix_key_state[MAX_MATRIX_KEY_COLS];
-	uint32_t direct_key_state;
+	u32 matrix_key_state[MAX_MATRIX_KEY_COLS];
+	u32 direct_key_state;
 
 	unsigned int direct_key_mask;
 };
@@ -410,8 +410,8 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	struct input_dev *input_dev = keypad->input_dev;
 	int row, col, num_keys_pressed = 0;
-	uint32_t new_state[MAX_MATRIX_KEY_COLS];
-	uint32_t kpas = keypad_readl(KPAS);
+	u32 new_state[MAX_MATRIX_KEY_COLS];
+	u32 kpas = keypad_readl(KPAS);
 
 	num_keys_pressed = KPAS_MUKP(kpas);
 
@@ -434,10 +434,10 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 	}
 
 	if (num_keys_pressed > 1) {
-		uint32_t kpasmkp0 = keypad_readl(KPASMKP0);
-		uint32_t kpasmkp1 = keypad_readl(KPASMKP1);
-		uint32_t kpasmkp2 = keypad_readl(KPASMKP2);
-		uint32_t kpasmkp3 = keypad_readl(KPASMKP3);
+		u32 kpasmkp0 = keypad_readl(KPASMKP0);
+		u32 kpasmkp1 = keypad_readl(KPASMKP1);
+		u32 kpasmkp2 = keypad_readl(KPASMKP2);
+		u32 kpasmkp3 = keypad_readl(KPASMKP3);
 
 		new_state[0] = kpasmkp0 & KPASMKP_MKC_MASK;
 		new_state[1] = (kpasmkp0 >> 16) & KPASMKP_MKC_MASK;
@@ -450,7 +450,7 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 	}
 scan:
 	for (col = 0; col < pdata->matrix_key_cols; col++) {
-		uint32_t bits_changed;
+		u32 bits_changed;
 		int code;
 
 		bits_changed = keypad->matrix_key_state[col] ^ new_state[col];
@@ -474,7 +474,7 @@ static void pxa27x_keypad_scan_matrix(struct pxa27x_keypad *keypad)
 
 #define DEFAULT_KPREC	(0x007f007f)
 
-static inline int rotary_delta(uint32_t kprec)
+static inline int rotary_delta(u32 kprec)
 {
 	if (kprec & KPREC_OF0)
 		return (kprec & 0xff) + 0x7f;
@@ -511,7 +511,7 @@ static void report_rotary_event(struct pxa27x_keypad *keypad, int r, int delta)
 static void pxa27x_keypad_scan_rotary(struct pxa27x_keypad *keypad)
 {
 	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
-	uint32_t kprec;
+	u32 kprec;
 
 	/* read and reset to default count value */
 	kprec = keypad_readl(KPREC);
@@ -529,7 +529,7 @@ static void pxa27x_keypad_scan_direct(struct pxa27x_keypad *keypad)
 	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
 	struct input_dev *input_dev = keypad->input_dev;
 	unsigned int new_state;
-	uint32_t kpdk, bits_changed;
+	u32 kpdk, bits_changed;
 	int i;
 
 	kpdk = keypad_readl(KPDK);
-- 
2.51.0.rc1.163.g2494970778-goog


