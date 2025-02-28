Return-Path: <linux-input+bounces-10434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E27A49802
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 12:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EED4D169C3D
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 11:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6464421884A;
	Fri, 28 Feb 2025 11:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="DlHh5Eaw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFF276D08
	for <linux-input@vger.kernel.org>; Fri, 28 Feb 2025 11:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740740456; cv=none; b=CdVr097iQKIWgvKAWQfmG3h7q6EaUBeDejUx6aBcWhznH/GNszJx0R8f7ewObIwF21JBUOj8Mt8NLMLZZeNeZoxe2Ik53hKJwzaIQqJ33mDQZZnq8PI1LvohvLjADNTd+WnAstCtpab45MBjESVLGhLyvkeSZGqTtVjjKUQtGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740740456; c=relaxed/simple;
	bh=UhBM4pXTlWVL12L7lqL0+yBZvc2QuVzc9NuuMd1x+bU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b0mLgqbfAarwsRN3e7gTGnZAp7CdDfmxngs341yg5YcSlgfFmxUWJrI2LlbUmqXAPN+C4w/V9do7MpBwfskiduf+j7Z9uVpJbegapOneLVmekcUmSufpPCUKfWlyAr5cgNm4VeI/wpzEeKxiNO+9F6hmZIPWKv/FMUp3JH0teB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=DlHh5Eaw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22104c4de96so32405605ad.3
        for <linux-input@vger.kernel.org>; Fri, 28 Feb 2025 03:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1740740454; x=1741345254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0KszbQGYSFCwVUgrvxHeEGEUnJnSO7Z/8njq0GzUlMo=;
        b=DlHh5EaweKBG6Pngs87/pxiDVLBYpN7YIFyVkd3gLTLnBRdhS3wHojwZjXwNu9lb9I
         bmqRyYDkly+5PSBIJa+ZSCnUyJ5lXT2WFkJ3no1gCDnG4H7zbbdd4R56E5tvtxus5FLx
         ZzrC0Z420tpRLDnqc42NTDZ0Q5Lw6cxKgcPYhAAD1/W9IwP/BYdyny0i7GNZToQWaDcs
         SuybzBtFJTWrCsEEQmBoD4Fs6CGL4wGvUPGjtZUANbI5dC4JPx5BswjFZalO1HE2fEk1
         lLRueVMXnvqs5+vjoWwngDIL3rfaFcrYvtZTB6NwXbJegXnkU7x3CMlbrtg7uHfXElWm
         DkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740740454; x=1741345254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0KszbQGYSFCwVUgrvxHeEGEUnJnSO7Z/8njq0GzUlMo=;
        b=OvU/jWXHjnbvfFbO9yn4XcEwqCIN4Ay0mZ0Cs/kaT9JhsVkukOLF/sEVqTEM/XMDhP
         NfhiDsWCCInDBgrQM7chh5Fbhc2VpVHGS+UUhiRzdAJwRZfA9abxpL4Kq1uJsgJQcDWT
         XFSWoJgkGYsV9pyhIkTaSVrNhxhS2A9IbSCRKz6PKPzkVGaZ/tUBexPSrDj+YDdhsDLo
         U1vYMuxWUgB6XvoAeokF9hds7dcTxk2SpaHxid9zfUZIDvtzQnUr6k1+q+f7npOkAC6r
         8tC3XfmQ1jU8qhjXNkauWPR80oK4LopQWM5/d6g4de0Civ+Op2FKirXoe3EPMX5Dx2pX
         qIdw==
X-Gm-Message-State: AOJu0YyNMBQjFFBOIE/Z9H4/+X5qu9avEa5TmN1fAKm+KpX5Ry0lcUeo
	UOamXvhvn9YQc8UaG7ay5YmhVGGiXT8/spJF5dw2PO5AP3rvP6R64hG4vYz+2hk=
X-Gm-Gg: ASbGncsnjLCh+fp72ZFEpToY6Qgn9fqu700WpRRw3+CEfqbgdKIKKPCBrKPIY/8z+12
	7lfMuYH/VaVhadHF0fjnuyi7MGgNc2VUuZzDEr1eCm/AG++pN1V+KLJ01uxbhLIpT2RDpPAolnF
	vPW9ZaODbGrhf1zqL6RI1mJg6h2xXALMzbSy1SOQxZ7ALx7lBAqJk4uiqX5Cfm8h7baSeRkO1cC
	FlwkuEDjazl0LAzyWsvz/3spqHtiaTlAU01Hq7PJZtmuDSmpouhEx2VtdZOey9DSLTM5zfhAL2A
	huDNlLRLuhJ4lxd+W/9o5/d19l62TmKoIoF+vFyKpwA8skNHMljRRFyzd8SgJdGl9rFoCwr7Woi
	kKA==
X-Google-Smtp-Source: AGHT+IGiNEKQ0hAv0QlwIe3kcb6D5XxbsrgsVK1Yg9x+25gA2VR/duPA41XRC7r0WWo95VFUdp+oOQ==
X-Received: by 2002:a17:90b:2b46:b0:2f9:9ddd:689b with SMTP id 98e67ed59e1d1-2febabcf44emr4043400a91.22.1740740454127;
        Fri, 28 Feb 2025 03:00:54 -0800 (PST)
Received: from zhk-CBG100025892.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea67a7183sm3772244a91.25.2025.02.28.03.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 03:00:53 -0800 (PST)
From: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	lschyi@chromium.org
Cc: linux-input@vger.kernel.org,
	Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
Subject: [PATCH] HID: google: add whitebeard USB id
Date: Fri, 28 Feb 2025 19:00:32 +0800
Message-Id: <20250228110032.223325-1-zhouhaikun5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 1 additional hammer-like device.

Signed-off-by: Haikun Zhou <zhouhaikun5@huaqin.corp-partner.google.com>
---
 drivers/hid/hid-google-hammer.c | 2 ++
 drivers/hid/hid-ids.h           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0f292b5d3e26..c3bd9448ef56 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -576,6 +576,8 @@ static const struct hid_device_id hammer_devices[] = {
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WAND) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WHISKERS) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_WHITEBEARD) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, hammer_devices);
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 7e400624908e..981908a9e1dc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -527,6 +527,7 @@
 #define USB_DEVICE_ID_GOOGLE_DON	0x5050
 #define USB_DEVICE_ID_GOOGLE_EEL	0x5057
 #define USB_DEVICE_ID_GOOGLE_JEWEL	0x5061
+#define USB_DEVICE_ID_GOOGLE_WHITEBEARD	0x5074
 #define USB_DEVICE_ID_GOOGLE_STADIA	0x9400
 
 #define USB_VENDOR_ID_GOTOP		0x08f2
-- 
2.34.1


