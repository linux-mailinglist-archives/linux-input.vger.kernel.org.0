Return-Path: <linux-input+bounces-16815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1ECFD5FC
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 12:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 49F5F300C143
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 11:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDC2240604;
	Wed,  7 Jan 2026 11:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elV/LS1v"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B872DEA86
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784813; cv=none; b=ozgdJUtCXdWzgHB1Vj9epMTZsgafattyEhPq9Eglmtq3gSEqzFTT3Vdn2mXNy4Rv/xn4b/mzSHnwyuWj4EAFFMhVxx08wEoO3r6yb2Fzsd/P//7l8W/o7U6A69FnSD98SvPhZQjFgFrbcj6UxZpMDpFMowzSKcM8ATARij3IWBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784813; c=relaxed/simple;
	bh=MdSkU08owBo+a95hnnnKrbOzVo7xNbKsMBkF4gz8lqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkG1ZPr3JyReWXreH0I45TldsPwXAHUD1O+tLP91mo2KXGt2Kvrp0nbts3b+IzbGJBnG3WcDOD5hvawajCRZB2jHGS5bTeO/5sdEui6OwBNZSSA1W2OloDmHJ8WO6FUpVjkTtz0k+GLymYYuuVK5WeTd4lzbCp42FeagLcoOgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elV/LS1v; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1141033f8f.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767784810; x=1768389610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIY9LcZC/3MW3IhoKNUi0t3qNOcnbLHxODIY1fPzFxo=;
        b=elV/LS1vEa4mmd3lbYqyIM+XXYumwF3w5Cgx6n+D4XIeGgHd8gq8pTC3VyDkTdB8AE
         2Fm4qm+QQdKwPLO/wi41uCRz4W0nb6VjDiE6gqmrazOlnHtl2UQyCxnvc5hv59GERL2u
         zEU4YE9jLfEbKN40bHJhWcDeX20xcQL3W9woTF0KYu6h1RJw7vy7QMGMcZyLvfu2Pmjt
         5ke52etnvllsZW168hdgMAe6ovjRkYgElKFI/VXGZsQOsvWSkeDRmBggU/CRDw/fZH7g
         jCDyP9KFCIRnQ7pfoecT0jytRUYWbozInYQiZCWbNf00nojDN7YdTcP3TvPuds6hG6Bj
         nUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784810; x=1768389610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IIY9LcZC/3MW3IhoKNUi0t3qNOcnbLHxODIY1fPzFxo=;
        b=S13/SwTUf1lF5U/Z//1h8Ko6UtdSybjQrpmwQWfgvlzziETgTU8lMexxDVavBNY37i
         kO5lYIbVoFbjAq5jbYSbadbrEsddB8maJPuEzYHSrTGl6Z1yZ5O/oAu35fNVYc3NOvvT
         BvVcypdZT8YcckM3kHLJE9pGT1St3zZwrhI/O5zqlwK7snIaC5v8Mmauz9+Cq459mczb
         4ubNjxZzgvXRfcBJowH+2FTkLwW6HP5AlT89R8NDFqjaySRekhtljKEorPFMqAiRIxf4
         hg845S+eZY8+CWSJRZ+wOyX+ZB+27uJNRHKzE/oOtaYkwbg2eEYP0qc53yUgC67RoMfe
         TaPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMz3y+EQfMyXkQOVqfd+kaxZsvWqXWmJ7Sv/causidRSx91BkakbxppG3nXb3ShtEa9LumC3l/MM9UXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwirKx0uPXjKO0KXEH13FgA9A5nPEKZKwxkOGkGmXKdNjILpsi/
	zSVO0mX812mOFhWqV8Q3as1W/2mvQKHzOQm6V5xz6MR4d8r3kxXM9QVJ
X-Gm-Gg: AY/fxX5j65ADHXVMNAgrEkkMG9wrj32cxiSBqEs5bpuBWGkvL7WDWAD2cMsxa6qeCvy
	MC50zqaz4EKHdSm42mlPwim3HZCvl7MuvW57hC7i6CZsOsHnKvohQXRe2/lW/Cq9l7bGUu1+GpS
	Z4qDW3slWUznylXN7V9bPK8jHeQMtBP0wrx1tgBzJxk4gN+k5/dPEHkUSl6ujEPjGdQpdCa7zAH
	TIHYNDtqK8hfizTV0BEmqXSlGXOeEk7Oyk1SbxMNykmLjp3gcRl25siHj4As6SE18YqStRzp7bF
	bScW29DoFnsu1qAZCszY+o5Y6k+g9IvU27uQnmNyyjQYcAfqRnkMpXFtwTZ3206/j3uNk9BvSpz
	WqtGin+qIq4qqT7Ernjp6DUzLazAEmSX3eqpX5JW5pa9hTGWknMduC6btFuhVeZ5f/ChvOUMcYe
	kxLJKe7KhxubYuw/hhBJPUHAP3mk3IJhcYMxDLXXM=
X-Google-Smtp-Source: AGHT+IG8c5/9U26VVN69DFrjFV6YFAVD6G2plU+f2nvraUccKVULl5b0Zg0Gs/iWMJrxyuSFTIoboA==
X-Received: by 2002:a05:6000:2584:b0:432:5bf9:cf22 with SMTP id ffacd0b85a97d-432c3760f0amr2438901f8f.3.1767784810410;
        Wed, 07 Jan 2026 03:20:10 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm9733210f8f.32.2026.01.07.03.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:20:10 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: superm1@kernel.org,
	benato.denis96@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ionut_n2001@yahoo.com,
	sunlightlinux@gmail.com
Subject: [PATCH 2/4] HID: asus: Filter spurious HID vendor codes on ROG laptops
Date: Wed,  7 Jan 2026 13:19:46 +0200
Message-ID: <20260107111945.48018-6-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107111945.48018-2-sunlightlinux@gmail.com>
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

On Asus ROG G14 and G15 laptops, several HID vendor usage codes (0xea,
0xec, 0x02, 0x8a, 0x9e) are sent during normal operation without a clear
purpose, generating unwanted "Unmapped Asus vendor usagepage code"
warnings in dmesg.

Add definitions for these codes and filter them out in asus_raw_event()
to prevent kernel log spam.

Tested on Asus ROG G14/G15 series laptops.

Change-Id: I3f3b3a1e1698c8689e4c57582635435bfeda5990
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index eb14b9d13823b..06cd3d3b74af7 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -57,6 +57,13 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define ROG_ALLY_X_MIN_MCU 313
 #define ROG_ALLY_MIN_MCU 319
 
+/* Spurious HID codes sent by QUIRK_ROG_NKEY_KEYBOARD devices */
+#define ASUS_SPURIOUS_CODE_0XEA 0xea
+#define ASUS_SPURIOUS_CODE_0XEC 0xec
+#define ASUS_SPURIOUS_CODE_0X02 0x02
+#define ASUS_SPURIOUS_CODE_0X8A 0x8a
+#define ASUS_SPURIOUS_CODE_0X9E 0x9e
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -348,6 +355,21 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/*
+		 * G14 and G15 send these codes on some keypresses with no
+		 * discernable reason for doing so. Filter them out to avoid
+		 * unmapped warning messages.
+		 */
+		if (report->id == FEATURE_KBD_REPORT_ID) {
+			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
+			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X8A ||
+			    data[1] == ASUS_SPURIOUS_CODE_0X9E) {
+				return -1;
+			}
+		}
+
 		/*
 		 * G713 and G733 send these codes on some keypresses, depending on
 		 * the key pressed it can trigger a shutdown event if not caught.
-- 
2.52.0


