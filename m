Return-Path: <linux-input+bounces-11172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86970A6EF02
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F12B170182
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A02255E47;
	Tue, 25 Mar 2025 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9Mke/9j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396D3254AE7;
	Tue, 25 Mar 2025 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900897; cv=none; b=eoJ/7iMpWRGPktQ+3bK+hqEVc+nfsvCQ58wjjxLM5gXehEZen8RFd7QPy1HJYt8RaM5zloxp75eWo9eLk2GDv/39Vj0b6wU+E9MaL3cNVTP+0Dnjvihpvj0nJAC91lxrruLU+OTM3sHstQCOAyZXpMHlGybCEcKUzNGZp6hYjBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900897; c=relaxed/simple;
	bh=QiGGPiPaTAQyJwY2YB+Zw35QB/Tg6BLtCKMSV6b1nXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tEd8T1/HrjnraYRVv8/6TjW5yHUUOoBstIRbV2g/F/wTFOKtvYpNWdIG4ieuvG3yCfXW8B59LIPqq+sSM12x9mLVwBuHgxaq/cZt0GcTIQApQLadi2gGtVEl9ruXf4GYLS7OT+EVySjzJV4UzmMbHq1OM9h5nN7URZfXE1s5HBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9Mke/9j; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-227b828de00so39642455ad.1;
        Tue, 25 Mar 2025 04:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900894; x=1743505694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuKJw1yYL8TZJjvYWc7MuadUYy3/+c5wxi74JAGlK2A=;
        b=D9Mke/9jKMy/0QJ24JPQqArhMwjYCfpVgB1X6DAwvw66thpBpVGo9Lo0VT/qX1OUr3
         XRc8tR4CuXTMRKGIW+JqPmnWon9G1gVoQ4bR+dNmuvZKImuLRowIpe+9GWjcL5B1dIC9
         vlF1MYA6DdCxFCPSJc/pCxgNQeCM8IzddQ0W/fhSnJILbg1pCYF5Sf7hhutYZPSdZRDo
         0b84c4Fv2eh0M1lugJ/sqeJDR491hKXtg8x7vPdf0uEoFjZ2nFumRzTwWfFaLCyL6M0Y
         OINijORK0/fekYgT3UQjkyrkSWBXQVYoI9lRdFjE0ARzr9IblYfIp31B3c4iBzVjg/uV
         o3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900894; x=1743505694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OuKJw1yYL8TZJjvYWc7MuadUYy3/+c5wxi74JAGlK2A=;
        b=bdqh0kEVUs+LQbiva9a3BQZ2uO3kds+hkfNMhd/SOcG/u9X8dzuTDH4t11QEBllp8l
         5h8yRlNl7cXx2pUFBEXzYkRA3oeva21BFjt3exaUDlyVziXSK5hsTlk/kbzNvzHjWdLg
         5MPSFLcbVq6XnOTCxSZcE1f2ejIKX9c9OeGytC2UuHNPoCnvFmqN1sESzxmo1oX1KHiZ
         0YWvksdf1jAb2EFQkzhtdP+tof1GuuXYnNNj+LE2lGFAN5CpgLH2s66/RKEocCkSEQRX
         DZEGORY88bGBB+tlH/EU43qJo/NnRAKYLP/4y1dhLstG18tOoF5qTCkzMTuD+a6gjpf6
         CZhg==
X-Forwarded-Encrypted: i=1; AJvYcCVI4LcdGS7LtwmUv3KLjwUQMLX06nq/MOIin+7xSovsuraklkMsmz7rHqNAGYgfEXbTKaUMkzl3o5Qb6g==@vger.kernel.org, AJvYcCWOeKpxL5HMcmCJOjzAv6loXjzjz3nCGBMbAy6Y/6fVGp3lbnLkWCAWEkNxTeHFQI1HUeg01auHg1nFrvJV@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5b7Xpik+IYa5gpuguKo82JjeIJSJUqhcP+yOKCCuKho1d4ED
	xm4BzXWrh57TLtndJjDQUVsGXtToHvI+OOOEwVq8DIT56XQt7f76
X-Gm-Gg: ASbGncvmQhPF6H8sLtpQjsflUvp7JtejsvziUDJC6A18ErJkrNZ3xeR7sgNr1vu4eFV
	WaHCdEOLYK9CRFo/vgXYjb24ZUtofWhDZ4wr43vDhVRu4QRFQe+1/OXpNgpt8jWevqGcWwbVkuH
	2Mi+cE9+DdQbE/YK1lMk+w+nnGD9kDzg8k3yT4rt4BjFwL8ivv8nwoq3Fv+/NWD5wvvuLGWIoy3
	x2fvM7J6CX4pnVIc0arN5yCMEaEYbc5sj8SxkmU1+NmeR3X4E9mzkPE210vZrhEavQt8nzSJvvT
	x4y5jso2wrNqjLN5/LUYLxmZOHAQJmU/7hDOyXZywgS97oRwssAZKBrvZ+eIC2GVSldHMd5RQLv
	FvDFkbJX6yNlI8A1Fu1dy52qKRaTnTJb9z97gXkHXHOZipA==
X-Google-Smtp-Source: AGHT+IH8QLL6ukz41/+7f/CsS32egThAdpUlenpQF9DP6HzoSL7VDoZMcHeDfRjgeEWew2QF2mHThg==
X-Received: by 2002:a05:6a20:2587:b0:1ee:e46d:58a2 with SMTP id adf61e73a8af0-1fe42f25e5bmr25079430637.3.1742900894196;
        Tue, 25 Mar 2025 04:08:14 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:13 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 2/5] HID: apple: use switch case to set fn translation table
Date: Tue, 25 Mar 2025 11:05:24 +0000
Message-ID: <20250325110754.28359-3-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325110754.28359-1-gargaditya08@live.com>
References: <20250325110754.28359-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		asc->fn_on = !!value;
 
 	if (real_fnmode) {
-		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table = magic_keyboard_alu_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table = magic_keyboard_2015_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table = apple2021_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table = macbookpro_no_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table = macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table = apple_fn_keys;
-		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table = macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >= 0x300)
-			table = powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table = macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table = macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table = apple_fn_keys;
+			break;
+		default:
+			if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table = macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >= 0x300)
+				table = powerbook_fn_keys;
+			else
+				table = apple_fn_keys;
+		}
 
 		trans = apple_find_translation(table, code);
 
-- 
2.49.0


