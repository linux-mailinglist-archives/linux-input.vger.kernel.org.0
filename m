Return-Path: <linux-input+bounces-9598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD55A215F2
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 02:09:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2636E1675CB
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 01:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E1E1552F5;
	Wed, 29 Jan 2025 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhJHo5YU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3146426;
	Wed, 29 Jan 2025 01:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738112970; cv=none; b=mWZst49WTg5jbj7vWEM34QLtWshIiqlBjTJvhVgJmN1bmwM0+w9zbbnBZSasJjWdNfYOkeAJywJraGqA9UNWQ+8CN/jbgUpgBtywDtRvq9qehZKjATeNngWVaLnP33xgWVbcWFWGhRu9M+nMrArhRwUEe+WQai8XmDdo6hOEhrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738112970; c=relaxed/simple;
	bh=64+YZZy2wqP86WNP1ldYDWeM+MQV35qnc3vztJ8OGMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UoPykdopfHFDNSGA6kRVjG3S0V50T27MNnacI6ab0x6CDkrtA6d1KYO0h9CmdzZsFUefAfMx32UmzDhQsXytdqXaWvABGpnUF8de8R07M9hNna+ZSVScR6YcvXBcTMBZtKuMKxAn5Yzux8hzmtRLz8GsBf7fbsWlKKa3x72GzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhJHo5YU; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6eeff1fdfso586421385a.2;
        Tue, 28 Jan 2025 17:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738112968; x=1738717768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRqvcQe2SJgRI5K+NpnM9PLlUbu+56iPX6fyxEXi+JI=;
        b=MhJHo5YUdQzDjxh+BHaSFMT29/x69LzSGdDK1GvRh41qrnSnRsCDGGHNE0ul7GB4U/
         93tWLfm/IAglCwZGzuEBOEQVFOm6VmN5x18TlTQM+ui46DVKz40JiOKpnh5HFHtnUEAG
         94LX7b/KJOoq0GkYYEPJw2iHVgzAsbrvNQlcCTgDVWSfTIIw2mDTT1j4BULDfIxajlCu
         plI1JIbDsFFt8yYdDrfIKmCufQbwjdWM5QWDujCghd6RFXFCKmzg2NOxT43xF61U3f1N
         cjVCX+jqWV3+OfCj2ZRtKltd0TJxFbMhQrzT3Hr6lloTf0NOn+nRae3KeQJYlm90xKjI
         Ue1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738112968; x=1738717768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRqvcQe2SJgRI5K+NpnM9PLlUbu+56iPX6fyxEXi+JI=;
        b=cYKlfqFEE0mC4vWMgE21hw6cRksw7OlbpT38d18zfngO53X7im5wcEsIxXspn+DMp5
         Kv63EYRYN7ftFwwZ2w7nXROLNTm00e2qEyXw+S4J44fHx57aVNBQZmlyV9ApEvnXKorv
         JgDwa7SY8KTj8PH1JN3iw8p/nTOfuDsGWoQ2uiR3/h2J81Rvbxn0z8slzSuzZMB5OFnm
         znGR7gqnN5gaFbBdT1WW1habDhy+oGRD8Ka+nOqwjLkAxGfDYLm3BvSUgmpfPdRwNAw4
         NdwCTgrdHaylgdaMPS5IDJgw1SDj8VmQQDVk0mydL8lY3M9126MHzBN5hVMZR5jifOoL
         233g==
X-Forwarded-Encrypted: i=1; AJvYcCUoo6UyK9Ltw1iBVSGhbvS5H9fRX4ZvI5DhlnY/qF95IQlmeJqbSXbHHRW0PO00pVveLHCMbZIjvlrFAQ==@vger.kernel.org, AJvYcCV85IpD9RGbmaXMna1KV15PJWWR/YLP/S6u/BVH8ALNewh6kLhY9MMeQoqv8exPUo7uTXwi6sx3iYN8wTuZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3YoIBf/h2Ccn9KMw6LYFRAu5FBif7F/TKSSOQlnaDcXk65/5d
	/pqweAmu4fmMAAbZnSpkooCPPZ3ODLlqwdPd1jgeGBeXqBCGZcvWm0tueroa
X-Gm-Gg: ASbGnctMGxYTGES1Kt4LZzEknhQ5OdbpeKjYeF50C+8AiZ69yvpMiTulDY0+vTmwwKn
	pHEHY8wEev/GoMglJ2aM1nEuGQXzFDaGt6jVJtKX4nRJlx/s6L0P1yDis8G0A7vBY05UUg3rinG
	ryA16FJVU+2hPOeofjzo4bzcB9jBCy6pxG0Slrbvmp+x4hikGzIopYV9g2jMddelHzanmopffAx
	276RJk+tcYNh3JOPkA/vSWEzhmdAu4fdcgCnkzqzz+Dylt3E8OQ1arVynK4yByLxp3Sfx63U9DK
	duAka0HbAsZB3plEmJStlovo7rrgYxsLSDCTrQp7P9xXRsmnLc/ySsCcR1tUmb48rg==
X-Google-Smtp-Source: AGHT+IH22xlQo6uy4gTPmJupt8TnmwRB2oleLEkxyvMSnGIpkOXef//pEUfa1PYNOwtlbiUtCShTnQ==
X-Received: by 2002:a05:620a:2b43:b0:7b6:6e7c:8eee with SMTP id af79cd13be357-7bffcd735bamr225760985a.45.1738112967728;
        Tue, 28 Jan 2025 17:09:27 -0800 (PST)
Received: from nvmedora.brackwan.xyz (135-23-106-23.cpe.pppoe.ca. [135.23.106.23])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae994b5sm573649885a.64.2025.01.28.17.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 17:09:26 -0800 (PST)
From: Daniel Brackenbury <daniel.brackenbury@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Brackenbury <daniel.brackenbury@gmail.com>
Subject: [PATCH] hid: topre: Fix n-key rollover on Realforce R3S TKL boards
Date: Tue, 28 Jan 2025 20:08:49 -0500
Message-ID: <20250129010849.722271-1-daniel.brackenbury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Newer model R3* Topre Realforce keyboards share an issue with their older
R2 cousins where a report descriptor fixup is needed in order for n-key
rollover to work correctly, otherwise only 6-key rollover is available.
This patch adds some new hardware IDs for the R3S 87-key keyboard and
makes amendments to the existing hid-topre driver in order to change the
correct byte in the new model.

Signed-off-by: Daniel Brackenbury <daniel.brackenbury@gmail.com>
---
 drivers/hid/Kconfig     | 3 ++-
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-topre.c | 7 +++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index b53eb569bd49..8280b5c1e48e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1167,7 +1167,8 @@ config HID_TOPRE
 	tristate "Topre REALFORCE keyboards"
 	depends on HID
 	help
-	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key keyboards.
+	  Say Y for N-key rollover support on Topre REALFORCE R2 108/87 key and
+          Topre REALFORCE R3S 87 key keyboards.
 
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c448de53bf91..a0fc6fa27004 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1301,6 +1301,7 @@
 #define USB_VENDOR_ID_TOPRE			0x0853
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_108			0x0148
 #define USB_DEVICE_ID_TOPRE_REALFORCE_R2_87			0x0146
+#define USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87			0x0313
 
 #define USB_VENDOR_ID_TOPSEED		0x0766
 #define USB_DEVICE_ID_TOPSEED_CYBERLINK	0x0204
diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
index 848361f6225d..ccedf8721722 100644
--- a/drivers/hid/hid-topre.c
+++ b/drivers/hid/hid-topre.c
@@ -29,6 +29,11 @@ static const __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		hid_info(hdev,
 			"fixing up Topre REALFORCE keyboard report descriptor\n");
 		rdesc[72] = 0x02;
+	} else if (*rsize >= 106 && rdesc[28] == 0x29 && rdesc[29] == 0xe7 &&
+				    rdesc[30] == 0x81 && rdesc[31] == 0x00) {
+		hid_info(hdev,
+			"fixing up Topre REALFORCE keyboard report descriptor\n");
+		rdesc[31] = 0x02;
 	}
 	return rdesc;
 }
@@ -38,6 +43,8 @@ static const struct hid_device_id topre_id_table[] = {
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_108) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
 			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_87) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
+			 USB_DEVICE_ID_TOPRE_REALFORCE_R3S_87) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, topre_id_table);
-- 
2.48.1


