Return-Path: <linux-input+bounces-16838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DAFCFE974
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8261D3007DB7
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB3835A925;
	Wed,  7 Jan 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dugbNg6h"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5201B359FB7
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799375; cv=none; b=QeasPlIwo166nsbKr/Ba/nEPmPfkUTTIZ2aH9MPS3HJJuVhx7Qb3SGsZOn1GmtnOcT/zpGVFxs9z8GIcyb/Y6gRZ/oK9qjQPoUynoG2ThvzosK0y9LSOSfePnu9BD8TarGmVcS78FkaLNn4siuGSWbyPfZ/F3KE1XiA5WwmZKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799375; c=relaxed/simple;
	bh=Pv8jQooqQwwRgS+1ky5fPJuF8aqFpOZErR83Pk1FNqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZpcBjXfyW8/taoGFlbmU6UqrpyeKt3vRXupvpfA8BRuw2W5GMVRa2PaIE/2yQg4d7XM20VbyYP65AqVBwrG9rQ47O1/lxrLYma/o7EEnIZji+IaK1G+c5hS35AbzFy0w59zE/X7M9QADk8yZuHRVhuHxU2dejyIarb27aIRQ9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dugbNg6h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso13904335e9.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767799373; x=1768404173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iUIt/sO1RSwjy4XN+S75T2hUS/mf6dX+wbl35RhyNjc=;
        b=dugbNg6hJ6gBoYIb/0XH4Miwz8DxjUhw3rMkSACk2kRrhdebJadMhaDPgKpqXzpFHA
         nhPC7O4kCXjxpXRmNRl2j6vXhBR5GSYylz6/YBeJ1cCO+Uv8hD10mCoBGxn0yteI2vrE
         OLYmfUciN5LQwY02fZmI7tcCPp2pxlzB/F9zk1gua3w35U1eLwto6y/tn/GWZ6lwggKt
         YjUvn4RKGl8rkwVS/k5yl7kLfLB20WySawwfCfv/8yLiQ4qQ6Gwj+8k9UOyRa/5EwclT
         /b5wZJdEkfjvOcw8EWuU3qN59zK9Ig0CMwobtZFTknKzMnBkRptIfGuKYwwK/iCjGYpr
         vCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799373; x=1768404173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iUIt/sO1RSwjy4XN+S75T2hUS/mf6dX+wbl35RhyNjc=;
        b=pVb0IRhRR0RffnIJpmanNbJrIyiarQ2Vwq1CjrMu0+0a0eqjZ03l8wTGQR+gWiVnZL
         cYSAxi8nqqms4x4M1CCx6ZNoOX9DugyncR+KITu06vEcI9bm5maxSHS7JS3svv9dFdM7
         Ume1ER9FtYT+6Zc0eIkQfYQ5vicJzFCN0W5WyGM85bfFgJAkX6Sb9me/PndtL+j1VrS+
         u/NZq2OMN0G3vsqIxjCLrWIwUzZi7e8APeNBHdmkFWGx4Pra5WvBv/K43G/xM08820VL
         rIbaM2hmLriR7iCFXjwMcvy0KIwCcbff3CppGZ68M1xYTb9qpHuOLtFC1+T8C96P++XJ
         Usbg==
X-Forwarded-Encrypted: i=1; AJvYcCXTrMf5EoxvpRWBih6L07L3Q91mZD9OzA47Qjo/fgRoPxKETn8woBzG3Qqrkw1Rh4WdB1NKCqKUSAvToA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeqQlLQQJJCutTtM+oyaML920eI9j4xo9BD/b1IHwVhhegMeNF
	uhOuUu3VO9FbsmIZKcuzqHPzxWOrC1raDX5CTDmsGtVOAo6sRp9pPeGS
X-Gm-Gg: AY/fxX7+0+WEh+qSIBpCEV7HTiKYqrJ4inNb9VfgDNPZb3O7JX1DpF2TLftl7UdxEyZ
	t04wSAHo9lObByiKwx9wOcHPtGrH7DzJyHQo/GAkGeBvW69GMAmLnnXJw1qNq55wFkT9kFL15Vi
	h2v3ED4GyVT7SgqBjIfijRIPrj1M3xecDaH2v+LRB5y9Sqi0yrAKdhVwtAgfuYVT8O+HZIDQIHM
	+Hzp5Fd7I28G3Sns3Aochxcwo/HKLJvN5v2tH0FB7gq6T+3e67UE4kawTksukmvPBRMvN9bEzbS
	Bb8d+Wqs/E1Oe0/4CDvqjjTKya9xoXTgy3ViSuIPCrf6+RJQXQ7R/CiqYjNyctaYtHne8CDpgLw
	Gjoto+crtI9teT5QMZ8JC8j/rkj84x8KqrrbzhrasZDDdLoG6EVTPBY5nlT54s3OmWkN4hvBb0D
	aVGUnLIJVgMNEryYdH2sQOJ2fazdK7phdgy2YyupI=
X-Google-Smtp-Source: AGHT+IGnY4XEo2RrD0Uidn/yzsdFKlhJKKAiclW+Dx0qagvb6rcfQW+8MYTWVKNSs6RXnfjDSJEccA==
X-Received: by 2002:a05:600c:c117:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-47d84b2125cmr28649915e9.13.1767799372581;
        Wed, 07 Jan 2026 07:22:52 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f410c6csm112064125e9.1.2026.01.07.07.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:22:52 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v3 3/4] HID: asus: Add WMI communication infrastructure
Date: Wed,  7 Jan 2026 17:22:16 +0200
Message-ID: <20260107152213.143247-8-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107152213.143247-2-sunlightlinux@gmail.com>
References: <20260107152213.143247-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

Add infrastructure for the HID driver to communicate with the asus-wmi
driver for handling special keys that require WMI communication.

This includes:
- Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
- Implement asus_wmi_send_event() function with proper conditional
  compilation guards for when asus-wmi is not available

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c                     | 31 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 15c24d5812763..8828a3b3054fa 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -23,6 +23,7 @@
 /*
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
@@ -321,6 +322,36 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 	return 0;
 }
 
+/*
+ * Send events to asus-wmi driver for handling special keys
+ */
+#if IS_REACHABLE(CONFIG_ASUS_WMI)
+static int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
+{
+	int err;
+	u32 retval;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
+				       ASUS_WMI_METHODID_NOTIF, code, &retval);
+	if (err) {
+		pr_warn("Failed to notify asus-wmi: %d\n", err);
+		return err;
+	}
+
+	if (retval != 0) {
+		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
+		return -EIO;
+	}
+
+	return 0;
+}
+#else
+static inline int asus_wmi_send_event(struct asus_drvdata *drvdata, u8 code)
+{
+	return -ENODEV;
+}
+#endif
+
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 419491d4abca1..516538b5a527e 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -29,6 +29,7 @@
 #define ASUS_WMI_METHODID_KBFT		0x5446424B /* KeyBoard FilTer */
 #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
 #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
+#define ASUS_WMI_METHODID_NOTIF		0x00100021 /* Notify method */
 
 #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
 
-- 
2.52.0


