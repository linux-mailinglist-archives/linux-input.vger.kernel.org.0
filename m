Return-Path: <linux-input+bounces-7090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9673D990A19
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 19:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05F4CB22934
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 17:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F11F157492;
	Fri,  4 Oct 2024 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kqi93/3c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A1E1C877E
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728062680; cv=none; b=HnpCMwyJRitKY+LAwpX+dPkZepZfEM/ZZ156ckaQbLOgXSVzOOimo30fyV5Erd5yi3Leic3KBhVJJc7zbbqodYdGyUfABdtf8DhP9aIwbr6lCYmLioD8RWSNZ4PgySq+vtiycu/XcrXCBLo09x/iB6xggfsGO7x7ZWUKZfaiNnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728062680; c=relaxed/simple;
	bh=WBUEm231XggB4DjsI1kKzX6lb6Qv2wdaTxUXmNFPvqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FEzMaIFpxglyLopk347gl63t+KM/+U3J23gEmwQ+x40GUMLtmaYLNT20P3CRTKxA5SMDs6Jcz6o/IZ4ShfD0ieEcLfH2BKOXgXxtUExjMYCPsIrbybhZEPtb+kxOGDa3J9Ug7Pt6BerfT28HZV4aqQ4x4qxQvOXGGtT4O1R15Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kqi93/3c; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20aff65aa37so20989395ad.1
        for <linux-input@vger.kernel.org>; Fri, 04 Oct 2024 10:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728062678; x=1728667478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfPDqk3U8PSTNFTg3vYc/v2JFHCSEwqe3iTNavlxTFQ=;
        b=kqi93/3c4IIXzIMP0rp3o6hQ4KBr0OlZJKuOsduKyvZkRuZvKqRVh5P3i+BQNlM65s
         Vn0vfjyf9h4mBtwRep/5ioRJ+ZupZaOfk0z5a4Phj2f6wkEnIsdYrr8uLi6Js/HxdTGY
         tizCRqapjXYIcgl/sJvgQKkiYYuv1ospNZ8HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728062678; x=1728667478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfPDqk3U8PSTNFTg3vYc/v2JFHCSEwqe3iTNavlxTFQ=;
        b=N13/B0djYy5N3xFY2nGRiVi2UPkqO/nIxPVOadNj8TVLRnjecTBbKf4WhKazhMc73P
         JNjaypbRP2AFwM6m9DZtQJKDl5eOV9UliPlNIbrUFmr05YjspvEMuKAxbriugrtv0UHo
         SLZ9oZ12/Zmn8B0wStSnZgm31OKLSedoqy3c0tYAcft0VCo2NJ0M84/cDguAWOqeVcVK
         88ib9prhsKLJJfBGi16St+7bs/JocTGVoyVCjBnNX8klJJpqNQuUR7hYdUbI7wx5D22V
         iSGf24AoXF0lYusoFcbja8tFwcO6mpAL5vtqlQS7TJsv/zhoSLICfJEM5CTCOBe9SrJK
         rqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXOHbDR3XDhbwCLbthZLoQWqbE5KldgcWfd5UwpSXVwAVUiHwkTt+HQFlg+I5iqJCy04mmEVokFijXPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6rJxKYeWu3b39J1Y+W0qvzUIy/XlyGK1+GUzfguzGZiSAKDQO
	J5PwO8bhL08husc/+5HZzRRrqBflFKAhBCvDuCiA2VbSoKqYoN1s4w2VrbnurQ==
X-Google-Smtp-Source: AGHT+IFObaZACplJiv5YkoEQsCoFpl7ig2wihQyzVdhraEPOdDKHeKEPUCKLTtF4FtiqLiFmW4JozA==
X-Received: by 2002:a17:903:18a:b0:20b:7d09:8c86 with SMTP id d9443c01a7336-20bfe49666fmr56055665ad.38.1728062678433;
        Fri, 04 Oct 2024 10:24:38 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:df8:441c:aa40:f4b0])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20c139a408csm899515ad.307.2024.10.04.10.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 10:24:37 -0700 (PDT)
From: Kenneth Albanowski <kenalba@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Sean O'Brien" <seobrien@chromium.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kenneth Albanowski <kenalba@chromium.org>
Subject: [PATCH] HID: Add quirk for Logitech Bolt receiver w/ Casa touchpad
Date: Fri,  4 Oct 2024 10:24:29 -0700
Message-ID: <20241004172434.854601-1-kenalba@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Logitech Casa Touchpad does not reliably send touch release signals
when communicating through the Logitech Bolt wireless-to-USB receiver.

Adjusting the device class to add MT_QUIRK_NOT_SEEN_MEANS_UP to make
sure that no touches become stuck, MT_QUIRK_FORCE_MULTI_INPUT is not
needed, but harmless.

Linux does not have information on which devices are connected to the
Bolt receiver, so we have to enable this for the entire device.

Signed-off-by: Kenneth Albanowski <kenalba@chromium.org>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 86820a3d9766..ff3c17f76aa2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -868,6 +868,7 @@
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1	0xc539
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1	0xc53f
 #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY	0xc53a
+#define USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER	0xc548
 #define USB_DEVICE_ID_SPACETRAVELLER	0xc623
 #define USB_DEVICE_ID_SPACENAVIGATOR	0xc626
 #define USB_DEVICE_ID_DINOVO_DESKTOP	0xc704
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 638e36c6d0f1..481d2b798633 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2137,6 +2137,10 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
 			USB_VENDOR_ID_LOGITECH,
 			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_BOLT_RECEIVER) },
 
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
-- 
2.46.1.824.gd892dcdcdd-goog


