Return-Path: <linux-input+bounces-1604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F35845065
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 05:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1A8928E336
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 04:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311273A8C5;
	Thu,  1 Feb 2024 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgzeE03y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BF538DE1
	for <linux-input@vger.kernel.org>; Thu,  1 Feb 2024 04:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706762634; cv=none; b=uUcCNeFCle9QQXHBbtQEHN9mA2aqlpvzE3NqrxiCCvFYpn4hOAiYXaboP6A566uDikMF7je4PN+85DS4/HYn6NwSPQZdf8htvSBNKolzDbjXtbWKrSdQoPbQGDwAUT/4AmjQ0+7yJx93Vv/ZhLFiGo31/Eie2afHZ8zSnJVpDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706762634; c=relaxed/simple;
	bh=uNjxcqd70WMLg8YmHI9N4JLyqHI5HySKMj4F0MhTSOA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a4jQLbvxJHLhPKAyUSayfyDWbKO+4mnqf0hkAoz6zJACbDjOT47yBkyuKBelh6Gh9JJxDtOZTk6no3Pl3R+Pu0pd0pLKjJqQsv8fm6Nm8VhdswdZI0ce8JYabY5bbstbM3asIpwOxMdOzhv/lbCTXfIWezY7KV/OVqPa+ZQUXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgzeE03y; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-58962bf3f89so101034a12.0
        for <linux-input@vger.kernel.org>; Wed, 31 Jan 2024 20:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706762631; x=1707367431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPBx0u+e/iIMpnGcKEeuIMPG6EbvxnsWSqyT+5DphoQ=;
        b=mgzeE03yl4fbZqHiF+7xlCPzRUygMO84sDHH7fkVmKcS3a7s4cYMxlxgT09NXqhPnJ
         mEwvFwL1aQnF639gCe893UQB3sxoEwL/w4YIfR1SPG4+S+YCP3iLCoy7G2eQt0sNZoSG
         a4/L99BoXSfiptD8509j4T+wgBJ1IN0b3zl+E0lDO95JZ2RsDRY2rz0+2jUtS6CJaXnl
         tApUYxLogi8nVkm+8ewfJJPOk4CvP8oodfWy8+9bho+N4KLJX6h8xmLLmKvHSBzcwin6
         LkMa/zTZpGq3+XUqeXWMNow2H9UuzS4bZBzOCKAoTAz/03WL0cv29Gui8wOeYk1lTDNB
         aLkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706762631; x=1707367431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPBx0u+e/iIMpnGcKEeuIMPG6EbvxnsWSqyT+5DphoQ=;
        b=oMEq9iBuaMEz4dkLmL/gpftCLTz6vhlPWk2kborhS6MxyhYGip/GzBB0TQb7SgGkWP
         yTZpuh7AUz6RGwnTQniCzUwHT8Y6zbmAl3ej8/z2cFFG75Yuvc5P8W3nF2bp2gZm80dm
         2ax/XPy6PUz+4lGPyInXPxCydBoQJOvstaf5MI2E8mZyBMWXcWzSkVzIzNWnp5U5TkXr
         wKX1qk+1DCr3l3FK23KCRZHI+fW/TMNv3wkuwVDkz5t2uirlJQxT7U1nXoSi0zQGdAA2
         X2ctNs+RH7CF1XQamNul+J6KlIUFvlgGM/ayMJ5C1FrvjKam3fSxLKcP5Y/SeMMHCu2F
         cbSA==
X-Gm-Message-State: AOJu0YzXTNpKHIvSA9YwgaaB3h1VXUz6wFgH7dbtEOXdmR7sLG1P7q6c
	mfuTVeCdWcEUxhF9fNHsP85ZrDclYTzSdNFUbF+fuIR8HNKRfItyPlO/otCR
X-Google-Smtp-Source: AGHT+IGqRQl7vFaZiJW58Mhte0xM5OVn4bgZJ3bZQ5CUydPtbJwyLnJQiglOv2qOYKTcqd30ToSrZw==
X-Received: by 2002:a05:6a21:33a5:b0:19c:9c10:f90a with SMTP id yy37-20020a056a2133a500b0019c9c10f90amr1660014pzb.4.1706762631586;
        Wed, 31 Jan 2024 20:43:51 -0800 (PST)
Received: from Holt.corp.onewacom.com ([153.246.18.34])
        by smtp.gmail.com with ESMTPSA id c185-20020a6335c2000000b005d8b6e5ce00sm9941503pga.27.2024.01.31.20.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 20:43:51 -0800 (PST)
From: "Tobita, Tatsunosuke" <tatsunosuke.wacom@gmail.com>
To: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Jason Gerecke <killertofu@gmail.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
Subject: [PATCH 2/2] HID: wacom: Clean up use of struct->wacom_wac
Date: Thu,  1 Feb 2024 13:43:46 +0900
Message-Id: <20240201044346.23476-1-tatsunosuke.wacom@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>

Replace the indirect accesses to struct->wacom_wac from struct->wacom
to the direct access in order for better code reading.

Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
---
 drivers/hid/wacom_wac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index fbe10fbc5769..a44367aef621 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2990,11 +2990,11 @@ void wacom_wac_report(struct hid_device *hdev, struct hid_report *report)
 
 	wacom_wac_battery_pre_report(hdev, report);
 
-	if (pad_in_hid_field && wacom->wacom_wac.pad_input)
+	if (pad_in_hid_field && wacom_wac->pad_input)
 		wacom_wac_pad_pre_report(hdev, report);
-	if (pen_in_hid_field && wacom->wacom_wac.pen_input)
+	if (pen_in_hid_field && wacom_wac->pen_input)
 		wacom_wac_pen_pre_report(hdev, report);
-	if (finger_in_hid_field && wacom->wacom_wac.touch_input)
+	if (finger_in_hid_field && wacom_wac->touch_input)
 		wacom_wac_finger_pre_report(hdev, report);
 
 	for (r = 0; r < report->maxfield; r++) {
@@ -3010,7 +3010,7 @@ void wacom_wac_report(struct hid_device *hdev, struct hid_report *report)
 
 	wacom_wac_battery_report(hdev, report);
 
-	if (true_pad && wacom->wacom_wac.pad_input)
+	if (true_pad && wacom_wac->pad_input)
 		wacom_wac_pad_report(hdev, report, field);
 }
 
-- 
2.34.1


