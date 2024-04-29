Return-Path: <linux-input+bounces-3298-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EDE8B6101
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 20:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A79284694
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 18:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42222128801;
	Mon, 29 Apr 2024 18:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kuu472My"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FB83CBA
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714414875; cv=none; b=fjRCycGzLj2z/NuSMJrU1z2GnTdOCN5GDOaeRMTX9d9/uFG4k1VsxURm3f/IIYg/SOKOiPBEkuwh8qLXxkRka5E+vVGleGmORGBm4YzO8kHXaL/SAxsYiBYvKemUTyrzP8CiEqBa7ROm321d5ScW8yutebkoiBw41Cm8E91NYzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714414875; c=relaxed/simple;
	bh=uz91hq17CnQ8Sh5zJn2MbtAhwZLCaoUgLNJ2BANazg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hhsw8An4hG4GaPoh6v5t7wf+76izqkDDXKFOeN8E5tMSVCo8+M+JxShqrQyJ5Fzo9Kiq+6S7O7vVZDny0QbF53X/CxPbhGL19Cz2QYXiqS9wQPY1fJd9kCSy7enRPEDny6gl1UVFU5+aJKXHTli9ur3n/K/y65A1+/o1Koc0C9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kuu472My; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5aa27dba8a1so2960822eaf.0
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714414873; x=1715019673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UBVxCic88av72rysgf6bYhkMGfNNdbGnMRLbJ+ADBuk=;
        b=kuu472My1bvUXd76YNoHXd1+CIKzivEkuNBRzsT647zVTN8EmJgdi22cTcRfg24fQH
         FnOnELVEDv89AgVDW7vucSSDtqTUI7+oeKpEbf4dhio85MeEcp/AsO5HhcAW9vci39X6
         0npu+sia4RpU6spWIgAgdC4GQ3UP88W7SLFPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714414873; x=1715019673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBVxCic88av72rysgf6bYhkMGfNNdbGnMRLbJ+ADBuk=;
        b=Lgqc44QSvwbm3ptvtDQSiZ7HMwk4SZgcFJulKDf+WBN+Tray5oJz3yQLJ0W93McPok
         66XWQ+m0A8KY/9cV4YxGB/NbiiL5TDChUN7DjJF9LeKJBRaugqMXQeXQGO/xTRXVy2r/
         Y1JhvLFC66mKqYQYhJrymcqaQ3vPli7QQmA39YVVzgrUrdIw9MBKkTculUR5LqpEYrHa
         GskC9Tou6H5Hv/nQe21h8lkf0OlEHzhcrDiyKDdWiVwmkAuFnk2PpjCugj8LWO+iJNTm
         exbETHNmS9dMQELAe9MmE2KeKnmd7Eb0vCm7yVYuLPhngU7U5jFUG8ApZaJIPWw3+G0C
         sDaw==
X-Forwarded-Encrypted: i=1; AJvYcCXA/HlYdfKLbHm60W0u3YV10qEYsTE7A1T10oC6aZ3dtAZKyoJWg9CUHnNZYyS0ybKtdcK/kLyh6/jKG5pwszSglu9leYmD4yFlwCw=
X-Gm-Message-State: AOJu0YyxfdWRGVLnsBZyqFCE2vyK/XMDZInAggPl0UyBMuD0d9SZV/ic
	yvmY3P2P2UA6rPI1UWw2DSBKTQQZcd6sBFvvnEreoz+06sJIO8nr08vdhJATpQ==
X-Google-Smtp-Source: AGHT+IGW1AClZt7yrZUX7DvN75b1Hy5u+Q/VGfw3SwSFCG6ZNRcO0lB67xbIFtPI1JNDURyCCGkxEA==
X-Received: by 2002:a05:6358:102:b0:18e:b6a9:6412 with SMTP id f2-20020a056358010200b0018eb6a96412mr5292990rwa.18.1714414872815;
        Mon, 29 Apr 2024 11:21:12 -0700 (PDT)
Received: from seobrien.c.googlers.com.com (114.66.194.35.bc.googleusercontent.com. [35.194.66.114])
        by smtp.gmail.com with ESMTPSA id y12-20020a0ceacc000000b006a0d04827e9sm1021160qvp.57.2024.04.29.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:21:12 -0700 (PDT)
From: Sean O'Brien <seobrien@chromium.org>
To: Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Sean O'Brien <seobrien@chromium.org>,
	Jiri Kosina <jikos@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: Add quirk for Logitech Casa touchpad
Date: Mon, 29 Apr 2024 18:20:36 +0000
Message-ID: <20240429182036.1.Ie7e8d0ba595f9e39f71cbe4ab3468f79c00b4581@changeid>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device sometimes doesn't send touch release signals when moving
from >=4 fingers to <4 fingers. Using MT_QUIRK_NOT_SEEN_MEANS_UP instead
of MT_QUIRK_ALWAYS_VALID makes sure that no touches become stuck.

MT_QUIRK_FORCE_MULTI_INPUT is not necessary for this device, but does no
harm.

Signed-off-by: Sean O'Brien <seobrien@chromium.org>
---

 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8376fb5e2d0b4..68b0f39deaa9a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -823,6 +823,7 @@
 #define USB_DEVICE_ID_LOGITECH_AUDIOHUB 0x0a0e
 #define USB_DEVICE_ID_LOGITECH_T651	0xb00c
 #define USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD	0xb309
+#define USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD	0xbb00
 #define USB_DEVICE_ID_LOGITECH_C007	0xc007
 #define USB_DEVICE_ID_LOGITECH_C077	0xc077
 #define USB_DEVICE_ID_LOGITECH_RECEIVER	0xc101
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 04a014cd2a2f6..3df9e90693e3a 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2081,6 +2081,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Logitech devices */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
+			USB_VENDOR_ID_LOGITECH,
+			USB_DEVICE_ID_LOGITECH_CASA_TOUCHPAD) },
+
 	/* MosArt panels */
 	{ .driver_data = MT_CLS_CONFIDENCE_MINUS_ONE,
 		MT_USB_DEVICE(USB_VENDOR_ID_ASUS,
-- 
2.45.0.rc0.197.gbae5840b3b-goog


