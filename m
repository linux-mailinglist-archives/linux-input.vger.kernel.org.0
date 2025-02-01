Return-Path: <linux-input+bounces-9664-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67BA248BD
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0324018871F7
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585841B6CFB;
	Sat,  1 Feb 2025 11:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vz0jhgay"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846FC13A87C;
	Sat,  1 Feb 2025 11:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409979; cv=none; b=SjFNUU4fAxL5uiuSRS00w9GMrBjDbdY0fI/9YjLjWLTDiIJpuM9EkTYviTzIGGbuM+/vscMMT5wEsxITyjMcazJV7+1ILBuClMQ1XH31xCE07kdkRuw1Y5cmQrKqymG6QSILCcOuGGHiHOGJNwpwLnYQS3YUbdXTaUzobgDY+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409979; c=relaxed/simple;
	bh=td+0A+DcVY8QOuKUAZNmzTEWuEvPeNx4/j1/UsdcYlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcwUqju3Xag9DQfnklklND58ovC43wKC6BjchtAxXtA7d83R12nhnX4x95oAPpljFDxzqRlaN8he26BRGEm85+EcbugYD2jooRyonYl3x+D6y6u02lnVc2YI9dWfeYLGzbUYVYZxLIQIGyMER76ofnzgtbEYa0c3p5+uwWUyxwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vz0jhgay; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dc5a32c313so515211a12.3;
        Sat, 01 Feb 2025 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409976; x=1739014776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdkJPeGy8cB+I0O1JiaewcgKSq34WPStqqYd7P6r+NY=;
        b=Vz0jhgayFFKNjdFZ0aiSnditGdrgLzhWAaQnZLYQznFudHTX3Lf5K1TvO4fpNzqOLd
         YgOfUNw1P1GK4DwxFT5puD8Zvtp0CXL+OVfaQDryP8kpo6tv5gP/BNNqyjhtMtX1B2mf
         gNKd6oF7IFQUAXLYV/iQwvlbzOA/s2OxtQmPKcJMjBLsHvR+rfO+2TJ+irCT7rgnewlN
         bcmUfcO9esrbBxspEupgv/FeS4dXo805w2Q2fpxShVthY5nw0MGnDBAcAufkcAuair6U
         I/IuJCtztl0mTfUbrpxEiqdkywiJ8TYT5IRvh3aykEYy5brj5Wu3EA9FbhsyS1W/Ah7G
         ZwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409976; x=1739014776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XdkJPeGy8cB+I0O1JiaewcgKSq34WPStqqYd7P6r+NY=;
        b=YfYSaVjTGANLeVgOSRTHYqZXVeUIJay19mlZ6CWmUZ0X/hVBHZMkQ4DekeOUwMHE1r
         HlbgOXhNfwOM4TEyAm9A5CvLUX+iYxafHVOcl3f7Blu24nYKuVvDqooIab+NIATQ3X9S
         OBe4XPoFnQocrr8d0TqisRlX2p7YXRAAbWm36NlR0kWnt62OznSO+H4/5j9wP4hFt6fD
         PKpTQpEoqAP26pHFQg9p5/dP8fs84/VrDTA9gyjpKgEwz2Dxsywz+m7rQk4FcMlTRKmr
         weBu1ZW89CMyMy6ipP3hbiJgF1mBX1B3XPmhGaZG9Cw/sLUwb0Gc5/XHrvw0kAi9xVQk
         JFNw==
X-Forwarded-Encrypted: i=1; AJvYcCWMpqjsZRECCY7MHZwAiFWyaV+MYmmvmsREQMrzonj+g0/yyWY/zGTe9NdXcjdZZkb00ulyNRrexDi8@vger.kernel.org, AJvYcCXVfFuv+kWwpctoua0YuCGKfGiIxSRaJe2rI3JVK/+sP7pR1lQjuCNmPlte29M6cPFPJ/dpDQdBmn/10g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdjntZ3WiFIg+14z42J55TgDZgQtLeiUjWLnOGMZ3a63KIy7l
	xUVTxaMXNxIaRfn48yiG+ruohlL5jsp9VnV3ePLM2orZqXm9ECqY
X-Gm-Gg: ASbGncsAq9cpCVIZBUSS2vRckJvPo2KEHXB6B3rl+e4P8hNrwxon+J+NlH3/ekXN3rG
	ZBdfA3PC0KV3SiY+UeLvBd2OR1vsdE+nes/mgZwitIZ/E7Xzu+/zUyL8f7/exUV9BsB6vIAUQ6C
	4Ed62qG1HwmSLLvIgOfZCgu1KVrYV4NzWr4JFA5tmU9YH1WtM9JHX9Bd4f+qrDDnQatVpn1B9We
	9+gwXGKHmHyx+hJdv7PjxxGuBNj7vmfhAaGZXKGYBLs3PXrzXGU+QrDDs8mcjTP2NIwTsPPTdXz
	u+lJboFBu78GEQIhCIPVtdyOXFZiMuqLuVs/3nY3JL6lOU6S5vhOVjlatNQBoA==
X-Google-Smtp-Source: AGHT+IEPzH/ttXX37QHtUNtg+JoBfcaE1cRc6V2PVMRuE7p08TedRj6MLRtN1jZ4HH/mrSEwFXzDkg==
X-Received: by 2002:a05:6402:2420:b0:5dc:1294:2dda with SMTP id 4fb4d7f45d1cf-5dc6e450206mr4396439a12.0.1738409975665;
        Sat, 01 Feb 2025 03:39:35 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:35 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 22/22] HID: pidff: Factor out pool report fetch and remove excess declaration
Date: Sat,  1 Feb 2025 12:39:06 +0100
Message-ID: <20250201113906.769162-23-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We only want to refetch the pool report during device init. Reset
function is now called when uploading effects to an empty device so
extract pool fetch to separate function and call it from init before
autocenter check (autocenter check triggered reset during init).

Remove a superfluous pointer declaration and assigment as well.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 45 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index b21e844f5f3a..f23381b6e344 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -591,12 +591,9 @@ static void pidff_modify_actuators_state(struct pidff_device *pidff, bool enable
 
 /*
  * Reset the device, stop all effects, enable actuators
- * Refetch pool report
  */
 static void pidff_reset(struct pidff_device *pidff)
 {
-	int i = 0;
-
 	/* We reset twice as sometimes hid_wait_io isn't waiting long enough */
 	pidff_send_device_control(pidff, PID_RESET);
 	pidff_send_device_control(pidff, PID_RESET);
@@ -604,23 +601,29 @@ static void pidff_reset(struct pidff_device *pidff)
 
 	pidff_send_device_control(pidff, PID_STOP_ALL_EFFECTS);
 	pidff_modify_actuators_state(pidff, 1);
+}
 
-	/* pool report is sometimes messed up, refetch it */
-	hid_hw_request(pidff->hid, pidff->reports[PID_POOL], HID_REQ_GET_REPORT);
-	hid_hw_wait(pidff->hid);
+/*
+ * Refetch pool report
+ */
+static void pidff_fetch_pool(struct pidff_device *pidff)
+{
+	if (!pidff->pool[PID_SIMULTANEOUS_MAX].value)
+		return;
 
-	if (pidff->pool[PID_SIMULTANEOUS_MAX].value) {
-		while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
-			if (i++ > 20) {
-				hid_warn(pidff->hid,
-					 "device reports %d simultaneous effects\n",
-					 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
-				break;
-			}
-			hid_dbg(pidff->hid, "pid_pool requested again\n");
-			hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
-					  HID_REQ_GET_REPORT);
-			hid_hw_wait(pidff->hid);
+	int i = 0;
+	while (pidff->pool[PID_SIMULTANEOUS_MAX].value[0] < 2) {
+		hid_dbg(pidff->hid, "pid_pool requested again\n");
+		hid_hw_request(pidff->hid, pidff->reports[PID_POOL],
+				HID_REQ_GET_REPORT);
+		hid_hw_wait(pidff->hid);
+
+		/* break after 20 tries with SIMULTANEOUS_MAX < 2 */
+		if (i++ > 20) {
+			hid_warn(pidff->hid,
+				 "device reports %d simultaneous effects\n",
+				 pidff->pool[PID_SIMULTANEOUS_MAX].value[0]);
+			break;
 		}
 	}
 }
@@ -916,9 +919,7 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
  */
 static void pidff_set_autocenter(struct input_dev *dev, u16 magnitude)
 {
-	struct pidff_device *pidff = dev->ff->private;
-
-	pidff_autocenter(pidff, magnitude);
+	pidff_autocenter(dev->ff->private, magnitude);
 }
 
 /*
@@ -1424,6 +1425,8 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	if (error)
 		goto fail;
 
+	/* pool report is sometimes messed up, refetch it */
+	pidff_fetch_pool(pidff);
 	pidff_set_gain_report(pidff, U16_MAX);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
-- 
2.48.1


