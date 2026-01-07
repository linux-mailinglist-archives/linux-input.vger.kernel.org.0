Return-Path: <linux-input+bounces-16845-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83896CFEA91
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A62E3065F71
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0034938B9BA;
	Wed,  7 Jan 2026 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnPclQV+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C4138B9B6
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800594; cv=none; b=KU91o9AVf4W0JYbz1ZLN4dMTxc1TzZV9ImqS7ee6kSH0XYhV2UMV6iKtB+qgaEPEiE4oratW+9XRZL+RPe6OBU5v5DBtvLTs8MPPsRQ67YyON/I1wvgkqR0TureSvNyL5WM4jjx/fezs6DRcdP9caI6Ad+G3RUvVlsqp1RMlrig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800594; c=relaxed/simple;
	bh=Ufj9J+ZlCwFGFrNBtdLhRA4Pm49DeqcyMm4VMAOYlm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M2rZviU02Dtr7cKpWRytg7n2M2swoZAiWdptOmAINCSxfxjezqzSLtosrEbS7UL3okZ8VLRbEVysOTrALsGqaBIY5098nkei7H1jgMoQMtphhCx22NAVF7+obPHywJwAXslnzcBXQcvFHopRV/NRgFYHfBYm5G9Xono2e9qvXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnPclQV+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-432777da980so1207726f8f.0
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800589; x=1768405389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWcjT0u5z34/kb7Qe+H5E0kwqGCVYd2l01+VUnZbj/8=;
        b=RnPclQV+q9GbTwR26TJyKkssnz52u5hEgZN7hqPkUYJKkJ3LKjZOVZcg0EV+FijjOY
         CcAEHrthtU+GgWWs/pjH9zTWxMnljv3gI5L2NdrNBox93p0g3NYkNsThC5zaJuyyir5+
         Pl6AnUdPPLgh48r6KBqlNry4Bd8Dj7REODbNn62SJcIGhPSpa14KCJYGMt80UsvGaRRy
         ctN212puQxsnr+Xg/casU1OAHxXIH/vxr5PAuotFCI0jZa2BIoT/5cIbsuc0Gwxfj38Q
         27OL6OAnweYekrioBOugJSC+HhuRYF7IrTQE1Mj5O+zzm5F72LfbcQsGQiPqMZ5BBmyW
         p32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800589; x=1768405389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LWcjT0u5z34/kb7Qe+H5E0kwqGCVYd2l01+VUnZbj/8=;
        b=hiMfuR/otHTrC+Wvsjg3M/XiskSQ0T+tNmUwCLjNdE7qVEKeuMw5AGrNufYP/Oc0Yu
         hiChmAqnCQgLKWOvfFV/yCFBh0EdIH4+VDcRdaYl3HwSaqER6F2otPVEzhWOo9uFbaXB
         pPdmMfjAWOCHTJdWH8zw4X0sJ0Gl8L0SHxM1ECvyrG8wGhZAJpXFJ0aHXyHbqp5c5GwY
         DdAPMluB5Z3Zk/d/ywkXJNI7YP+1Saofdh1C1Wz3gAZOlAxGa/nlfe656PLyWUhxrvRj
         KDrgBw/i085BLVQRNaUe95BaakpU44x5HOWRYKaE6ah4AYWsnuM6AfzofekAGHwgA3OD
         e4mg==
X-Forwarded-Encrypted: i=1; AJvYcCW6K69cnSmywj6Ad7g+YGFZ0A8Lv4VBgnDcdQuyuuo9XgE15nJgF4hl+IztgwHhBSOqgh6J5Y2lWKNhyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/EsxrwOoBX8OQAEXSlCtj81G4o4oPDEgkI7hAhB4NLakEBQy
	wzSjpNJF6sHV6dc4DSG2dTJUs2BQJ1YDVRJAvKepRhy0BaDVe8mVzoCc
X-Gm-Gg: AY/fxX4wipp6ALE9VO1SbbZxxsytfszeHI0K6UQth2t3We6svffA9TdisnrOnc79wge
	32bBppOuve+9TxYS75Ho8QlRyUgg6RHEe9X3UlWnOPYLyJ5QXBxexfU/8upFVVXrFUuovUZjn3I
	TJW3FTeq0m5Qb2PETwzjDfBDSmABCK7zURsnwwZ40AX5pGk65DECi2F75hYHdKnlAC0vItq1UWf
	do2VTWt23kYjPo+OSziZRDgrYYvE8s3cnv5g/M7m0/GX9U8F/M2GEYBJTuZyDOEwFfZfeikgI6H
	NzPUTC2pCVG4A5hpp/24yxnH93hAPVWUnvYeGmewzNXSBHb4UIvs6fdaQDCkfmEfbLJdZh3q4fS
	Di5CqTjie0ZkuA+cWNG1gGRvsoiox/P8p/ZQjIJxCv9MAzMs7vFAPTJhH+N8JgUWSgb6q4dWLhl
	rg88xRN6TR437DEdZGzoL2jdx7LBA46/pT+3CczxI=
X-Google-Smtp-Source: AGHT+IFpf2LzcsxARVLcwohJ3nsYKzlej0OLE5M0q63SVWJgq05KEyIXF6Z5wAEIb8+uglN38BG8iA==
X-Received: by 2002:a5d:5f54:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-432c36282admr3814141f8f.13.1767800589326;
        Wed, 07 Jan 2026 07:43:09 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm10897704f8f.31.2026.01.07.07.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:43:08 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v5 4/4] HID: asus: Implement Fn+F5 fan control key handler
Date: Wed,  7 Jan 2026 17:42:24 +0200
Message-ID: <20260107154219.164514-10-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107154219.164514-2-sunlightlinux@gmail.com>
References: <20260107154219.164514-2-sunlightlinux@gmail.com>
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

When asus-wmi successfully handles the event, it is blocked from reaching
userspace. If asus-wmi is unavailable or fails, the event is passed to
userspace via evdev, allowing userspace implementations of fan control.

Tested on Asus ROG G14/G15 series laptops.

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 6fcd3213857cf..06f32a39c0cf7 100644
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
@@ -379,12 +382,34 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		/*
-		 * ASUS ROG laptops send these codes during normal operation
-		 * with no discernable reason. Filter them out to avoid
-		 * unmapped warning messages.
-		 */
 		if (report->id == FEATURE_KBD_REPORT_ID) {
+			/*
+			 * Fn+F5 fan control key - try to send WMI event to toggle fan mode.
+			 * If successful, block the event from reaching userspace.
+			 * If asus-wmi is unavailable or the call fails, let the event
+			 * pass to userspace so it can implement its own fan control.
+			 */
+			if (data[1] == ASUS_FAN_CTRL_KEY_CODE) {
+				int ret = asus_wmi_send_event(drvdata, ASUS_FAN_CTRL_KEY_CODE);
+
+				if (ret == 0) {
+					/* Successfully handled by asus-wmi, block event */
+					return -1;
+				}
+
+				/*
+				 * Warn if asus-wmi failed (but not if it's unavailable).
+				 * Let the event reach userspace in all failure cases.
+				 */
+				if (ret != -ENODEV)
+					hid_warn(hdev, "Failed to notify asus-wmi: %d\n", ret);
+			}
+
+			/*
+			 * ASUS ROG laptops send these codes during normal operation
+			 * with no discernable reason. Filter them out to avoid
+			 * unmapped warning messages.
+			 */
 			if (data[1] == ASUS_SPURIOUS_CODE_0XEA ||
 			    data[1] == ASUS_SPURIOUS_CODE_0XEC ||
 			    data[1] == ASUS_SPURIOUS_CODE_0X02 ||
-- 
2.52.0


