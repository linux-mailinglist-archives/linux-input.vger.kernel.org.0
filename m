Return-Path: <linux-input+bounces-13990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870DB25459
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8083D1C855E7
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04F662FD7AC;
	Wed, 13 Aug 2025 20:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5iG8C6T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D235F2FD7C8
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115821; cv=none; b=OdXzb9nc/x73F2Q3ii/SioNKHMrRIfyyoY+zrEzjMf2QCos0aOMUEGBK1h1X+uYwHDSmLbccXjAeoP8x3r7AbkfolT1+XG8+DT93rRRhEeiIwrlI9dQU3USLUOejvYGwjSHSYyM6rIw54BKjfavzFLnwwnkgc5oi0vgvRfY/TrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115821; c=relaxed/simple;
	bh=u6xhrPZq4e6pyBVA7t/jlIxK5Hnm18fptJHtRpS8x6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IB/VWokakfukXIb0pAapnJhhYpmAx1syKlczU0r+X20Cv8zjqiJr+ovNMPSs0bCnQA0FGQwb69GW7KlQmbEFp6kf7GFw0JH73QnJERdKyZuYL48sxBKNldx2Z6m4FjDCDbgaegSm4gjJoYaV7bR38POhzvskI46JE6TNHeDGsik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5iG8C6T; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78d1695so3440966b.1
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115817; x=1755720617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2vVIAzZ4dAg+21sRBLYMSNKm9HT703Ug1VaYJSoKUw=;
        b=L5iG8C6TYiXyEezOWXzv3lYzBd6GT2CuyLHGdSQn8HfqSMdHxpOxyLyM+Jpmvh322z
         UQkiYz1LY5ZsnJrncYK6Nk0YoQqVTMmOpg8MaoUPMe4/wxrM9YlquVj+eZ/lWsQF2HBR
         B4RaFNpGKvAg/SI6gtTqrxWBTWSLfufnE1U0nl1zxIcLaDxo/sGSNfC8RXwpY4Pf/AEm
         rBgQ1wSON3dPQRyFTu+Vu68WQBQn+V8gaBhaI546GXvCLt5eljXbgxdq5LCHh4PYXafM
         ubn3VsbnUdwTZ1jgdEE4HAHDMBMQHiTTAKkOHE8jVyYrwZdJ4S3BhJzYXHvp74Y0S0wu
         UEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115817; x=1755720617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2vVIAzZ4dAg+21sRBLYMSNKm9HT703Ug1VaYJSoKUw=;
        b=UIHIUZHxM2u4RS+zyey0eZKFrE5Fs3ojnTyEBUdF/2nj3PuV9I2gI4Tom1LKtSvKcB
         pWNLN7dEVmnSRRjRwBN0Z4UnufONZPWh5hsxQpyLWeBYcVRG5cyIz5f1rJ4ilAGsbsit
         rwvY/+gfROqsNJ79qsXHYJsaWexVZKqiz3zQQFxrSrAxktpB/WodzKuQidyYpKyZ8HkO
         iO6sVCwTAnU0rZdsDc4cduVB5/ZHRPSZm5BABTJbXd4LN8BTTEQjFYHuwmNwVYUK+Svy
         NENOfQO1oFLm6JcRvpHZhIIC/MvsFcAec9hCIm3OGoxtwCxiCIPpoSzbfYJu8ffw8u4+
         RowA==
X-Forwarded-Encrypted: i=1; AJvYcCUPUNMUBtVIP2TXwPpaExsTUaonAibNS7jIIkUZNL2PSIAW+6QUgV4TOto6b2hxGv7pj+5wBodJQ8OGLg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qJXyMpW5yXYcPYXvQ4pZBdejkDLXyafzc6MYYuH/OyFZA+jI
	xqpYd5XFuFBCMCWdA2+5W0YkHewsP6x3CBJLMHy/4immOUUhcwJ4Y8Ai
X-Gm-Gg: ASbGncu+O2Da2CdXMiQBsjJ7jhVLVc/uycshjxfZALYXdh/CTwlccX8QEcWMNj3zooO
	oSrbBcHeIFh4Tl4Qbrre07V1iLN3nY0n3xtFS03iFaecZRkBVaR4L3lhPQ52Njx4NMrA5+p6qOF
	GmXk3O1OH+hw+fQw47A6rC6avPUh9/mfJ+xgeXphrSVj8OY1HpxEYvvFNRYACOk2y+cujzpCfvv
	40bZYYCIN73AiNkZs1cH7sahmkuyoCaIQpcyl/T9R1QzJfhw86YdmP7VmSft3dDTe/9Er4mQqP5
	gKYf1/4b54xFcNuzVbrLEFlz6CD+AmAoXtsoZfW/VZDh09+fDAcb9470aoKtcP7kMOeXLSAVkU2
	K9Alinu4TiKcSaPHnE516m4LV1x3PSrio9fWtxutI727q2QuCqMVIBHXcDHdgASKeHHbPjOIHgb
	A=
X-Google-Smtp-Source: AGHT+IFIk2ZHOQiCQqsjycSP9PWreMorn0BgUMiBxkGQeZrU7HDhrZDRRVUCURcvFPsnqAAb3OAJUg==
X-Received: by 2002:a17:907:7eaa:b0:af9:7e88:e174 with SMTP id a640c23a62f3a-afcb99286e8mr18702166b.12.1755115817173;
        Wed, 13 Aug 2025 13:10:17 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:16 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 12/17] HID: pidff: PERMISSIVE_CONTROL quirk autodetection
Date: Wed, 13 Aug 2025 22:10:00 +0200
Message-ID: <20250813201005.17819-13-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes force feedback for devices built with MMOS firmware and many more
not yet detected devices.

Update quirks mask debug message to always contain all 32 bits of data.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 534fb28f6e55..3fd51ad5cf56 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1210,8 +1210,16 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 					 PID_DIRECTION, 0);
 	pidff->device_control =
 		pidff_find_special_field(pidff->reports[PID_DEVICE_CONTROL],
-			PID_DEVICE_CONTROL_ARRAY,
-			!(pidff->quirks & HID_PIDFF_QUIRK_PERMISSIVE_CONTROL));
+			PID_DEVICE_CONTROL_ARRAY, 1);
+
+	/* Detect and set permissive control quirk */
+	if (!pidff->device_control) {
+		pr_debug("Setting PERMISSIVE_CONTROL quirk\n");
+		pidff->quirks |= HID_PIDFF_QUIRK_PERMISSIVE_CONTROL;
+		pidff->device_control = pidff_find_special_field(
+			pidff->reports[PID_DEVICE_CONTROL],
+			PID_DEVICE_CONTROL_ARRAY, 0);
+	}
 
 	pidff->block_load_status =
 		pidff_find_special_field(pidff->reports[PID_BLOCK_LOAD],
@@ -1552,7 +1560,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, u32 initial_quirks)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
-	hid_dbg(dev, "Active quirks mask: 0x%x\n", pidff->quirks);
+	hid_dbg(dev, "Active quirks mask: 0x%08x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
-- 
2.50.1


