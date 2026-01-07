Return-Path: <linux-input+bounces-16817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EDCFD61B
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 12:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0CAF130611B9
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 11:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D8E3090E0;
	Wed,  7 Jan 2026 11:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7XxdatI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493530AABC
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 11:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784845; cv=none; b=CtxVsnAPNLEl/WIc5jH3ezg6+BgNIR9J+AuMi8JCjrbetaglM2vJnIL1OGlTz709Jh+kQqSM5COiEeRgFROGFCgsPVMneqLbd6O4b3IuHdV/3U6vqyYgMpqlcwC3AFaPk+scVjQvT39cNGTYU0BIz7vEZdsJdPzI++vfSHtxEtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784845; c=relaxed/simple;
	bh=75OT4VBTXhb4+iZyrygf3VNRp5IxOj3TrpfZYW0VvUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR10ck3blVoPJG99lQ2HbCndeoSvTCGyUQmRcpMks29AKLLezZZYyKqFyxuJM4j1ob5ASeTSdCB9H/LB2dp87o45j3P2y/dAbB8sZaUWHWj/E/CcZjg1UN7bYlpdxpQ7C8vwI1hu3bK+icyGPQKz8mhY7s8O+mSk/2N7Z7lDhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7XxdatI; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so857632f8f.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 03:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767784842; x=1768389642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AiH+3Np39EevPYd1cmAw7r/LCFkel4dQzhGFB22cXo=;
        b=C7XxdatIDOuV6pa2O6sDkxj+GU+UWHLjz81vRifU6jD8u+bHFPYjx/VO4d5W7OKepq
         pMb80RuqZfVz6lahegH+SCsAJFOeacwXDBFieVz6WKpi+TcmYnPmDrs4TJaW+lw21snX
         PQT9xgneTlI0r8ogO6iZbtvUVeLFtkKjFX/c/hgFEXL3y+wZN+nKRV0Cjf5kUm151Xc5
         hTGjJrDV4JrBDubYxo/DTwgez/IvuPGHGKaTlRWEvmfdPDS6vhf0YuVcMQ1UMqDUeZ2b
         fNtxd8Z6jMo3iQPb8MKnWLXVcoVGwcBPn/dvsLqIQ20fsBAkaLqqm9xIASjgcCAxVTvB
         f4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784842; x=1768389642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4AiH+3Np39EevPYd1cmAw7r/LCFkel4dQzhGFB22cXo=;
        b=LEqZKQjiOCI6Cja1/qOUfZakDi5freHKv+pnGaQOQ+uRzFhM9ojZqgPL4LvflBO7/f
         KYtRIvLZqzZ1swOgiV6d59B+0iPCmyrW7fcM6NJI9KilQ8eNRx4MNaS2VAfVn/K3QFIx
         6Ng/A6ksGg+YHm2LbQst+3v8uvIAXV7fm+tVHeqkFNVtzgmmAk74rO9NK/QLSc4qgl08
         sDhnZJ3Cd6Ow4ECTRqZybh9JNHYogP1SJtKkFA+ewn7zCimmYlLBUUSyMy+li4r3AHsL
         glgFHbH4iiLvpMUlOGzzs+EmA9r+Q0jW6OoRWkYlaBxtxxS7FvNox6P/4naGc5S6OaX7
         M2ug==
X-Forwarded-Encrypted: i=1; AJvYcCWm0BtouRTDraev66jRZQC3p2N2Pbom0HYI7wyzla6LwRRo/fe1QR4ZmWjREQtLuO85HEykJJQlWjj+EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw83YYU1fRNdzDfF2FGkL/41MoespTD5ZBpplo4xLTIgxDyIIcT
	7pS8OqAKDRi1qhp7E4BrxxyxytldytplVawwa6Zt4cV45WwmvYxVPfux
X-Gm-Gg: AY/fxX6xaVXbmRIBHQ9V3sqDpib2dzSvV3QuZY2gKqIo+woz2Sldqi2ZrpLqVRhsXaS
	V4x9DHmvnpE9P/0Z1MzvqayKzsrl22Vrd+g2Z2qz6PxzMck8hZ7D3uUBDVnC7RajSKF/qmRHIWR
	hW0ivWQr1EXXs9UEFl0pJBTMBDyGSK1xAqBVR6knuiBe6UvcwjEfhUcsnzXV4KIWUkgTWt7lCDo
	HpsUzNn3/Nhz4yj9M8fPwagWJgLTd1w141xCoZt4O0Rmf/Pi1ajvDTKKFGNzGwOlly4KhVlDWBA
	O5hG9fA3iQW8asP3EGVxTbFHRZXtbnix/aYzf63k5g1+gxOoscjDvEZIeWy3cAXzOIUBPyYo96o
	WRzoriezRGzGOyReSVN7ZAhfABvncXJiw5N+VhT2vA8pVfiV0iPyLUteyHvAljEfzTDXtow7eWV
	Jrj+KjD+zmgowfe7s+hJh5QZTQzvXuez9i/SK5eyI=
X-Google-Smtp-Source: AGHT+IHStTre6RcNVG2fgEwYMM9+sR9sGgPpfvxCsnoCn60JW7GI+cQYpyrknTEVIKGw6Or+Txim1w==
X-Received: by 2002:a05:6000:310b:b0:431:7a0:dbbb with SMTP id ffacd0b85a97d-432c374ff56mr2883888f8f.33.1767784842231;
        Wed, 07 Jan 2026 03:20:42 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm9733210f8f.32.2026.01.07.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:20:41 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: superm1@kernel.org,
	benato.denis96@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ionut_n2001@yahoo.com,
	sunlightlinux@gmail.com
Subject: [PATCH 4/4] HID: asus: Implement Fn+F5 fan control key handler
Date: Wed,  7 Jan 2026 13:19:50 +0200
Message-ID: <20260107111945.48018-10-sunlightlinux@gmail.com>
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

On Asus ROG laptops, the Fn+F5 key (HID code 0xae) is used to cycle
through fan modes. This key press needs to be forwarded to the asus-wmi
driver to actually change the fan mode.

Add ASUS_FAN_CTRL_KEY_CODE define and implement the handler in
asus_raw_event() to send WMI events when this key is pressed.

Tested on Asus ROG G14/G15 series laptops.

Change-Id: Ic03df877b71e34c421e992a06e5e706d954e7dbf
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 05fa35489258d..d93c8f030b239 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -65,6 +65,9 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define ASUS_SPURIOUS_CODE_0X8A 0x8a
 #define ASUS_SPURIOUS_CODE_0X9E 0x9e
 
+/* Special key codes */
+#define ASUS_FAN_CTRL_KEY_CODE 0xae
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -379,12 +382,21 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		/*
-		 * G14 and G15 send these codes on some keypresses with no
-		 * discernable reason for doing so. Filter them out to avoid
-		 * unmapped warning messages.
-		 */
 		if (report->id == FEATURE_KBD_REPORT_ID) {
+			/* Fn+F5 fan control key, send WMI event to toggle fan mode */
+			if (data[1] == ASUS_FAN_CTRL_KEY_CODE) {
+				int ret = asus_wmi_send_event(drvdata, ASUS_FAN_CTRL_KEY_CODE);
+
+				if (ret < 0)
+					hid_warn(hdev, "Failed to trigger fan control event\n");
+				return -1;
+			}
+
+			/*
+			 * G14 and G15 send these codes on some keypresses with no
+			 * discernable reason for doing so. Filter them out to avoid
+			 * unmapped warning messages.
+			 */
 			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
 			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
 			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
-- 
2.52.0


