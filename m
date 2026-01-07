Return-Path: <linux-input+bounces-16844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA2CFEAD9
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 16:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09472307BE62
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7AF238B99E;
	Wed,  7 Jan 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSe9CH09"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62938B997
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 15:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800578; cv=none; b=Naa/sE1xD3QoGD+8gNP2jqJKbxcF2hV+a1lpn9eTRJ/ITRv36wwv4Mqp7EBpVd0E08I6yd3lUULZDHuApPgcw4sJVrDUXFvMNSaay7MyE098KnUpLFpwvds7lOZuMnoTZHshmZUEJZA1rQwDZTolyiirSaG+BeBNWk/aXSSnuSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800578; c=relaxed/simple;
	bh=m2LVWd9zY2sr7dLTXt464SmzH9m5DeaA++ZT17Hi3XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VujpK0ak/LbquANT3GfBR7plvXhW154N3GzI7ei7OnYAregcBIyaSJgsDcIcD05d+mshJtOWXE+ByknsDMML5o2SCJjt4rJwaHsr/6DmY/fnuIIRm0Mbm+5gvYx3M2G4vpGBnJ6e+ArRoGxUzwyAWGx9fmELtVTcNCJEBVpEo/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSe9CH09; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4327555464cso1264524f8f.1
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 07:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800575; x=1768405375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9oErkAI0lNt2KxcklIPRCVSSCk5fQX4NqQ5cL9hG/s=;
        b=QSe9CH09HdO9XYvC/2A68XV1CMvo1IQCKjRzguZ6Ildt2mwxIBZOkVZmqNpKfzIMh/
         eT5Fl6JZ4PAi7yZIBVOSKr69GvLi+nU9bzedphil94csk9uFS8n7r3tktNHMqo/MxfhV
         p8AGTM1m+qw+WrK2GOyWypAZIrUesOGQ5kqKbhVxeY4ZIF0VB55Tb/KRTs9TgO0nv11T
         70UA0z0RKnhaHKE48dlB2xFzKy4lQHFetwutcMOc6upmh7KdcRh2N2qfxA1wcTMLJ251
         a/4EMyZrOgG2rjUkzlCrmF462COHuP5Ph9tKB2LQqNd3Ev4ylJ4kJp9Pn0qjv+ypRjyG
         Lweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800575; x=1768405375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B9oErkAI0lNt2KxcklIPRCVSSCk5fQX4NqQ5cL9hG/s=;
        b=d6+MKCnxSWlVqXYy7JRKqdPObJHAH0PdN/ERexnl6iEzSFnVKfhEey5Au8/i06FPlD
         ooIlWfxTVsjXBca+EvUAETpJcrQKAxAUj/hTPQx5rv/NL6VIIsTMe0VRvkYbM784xt7i
         LkUWWOXLlrLr3Ak27IT5uDYVwjUnhWkB2EBBZCkmiCPlCu4amDoKy5NODU8sIPxjm54o
         HMrF5TJyC6j3N5w/bl73pZbhXdD63gmgW9ga8Y5/C2Ptm4kjzB3QHE43aZ3+hXvM5JO3
         RhYgzzHp3IjuBui39aQ7YUiH+1Mrha6o/uW+VIEgf/hkkxoI/DrIAdkEvV9eVLqwEuYh
         CJfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmqTZi2QG80T1zHCUZnKRutSqLSnoGGXLkaYw9NDNqOCW6dAwv+AHG+NJ4qZrzd/prPtgVu9rqGfPdaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKzgQdLUSt6/C2ynaJwHYO3lp9xPNV0IVfmRcos1T7KwWG+4L/
	Ycy47crd7seKshdFInA9ttmKddZNitaeFJixBfOhcvVYJdUbXrZwPhpvWVKNEQ==
X-Gm-Gg: AY/fxX4lVKqQyQOBpgwWkSo5rFxp281vIVcE9YnQULYInhXCkSZ8G4jr0WsfmWmqlfJ
	n8hadC/1lKYfuxD9kDwuddmkrcW0d9HXw82s1iFHvojKR9pXYKvF3FtVSqvhhtpikdz8mXYTHUE
	AdRBMYzfhYl9UjnYTlpbqDhadIwHvDmjJs4wSsYb8HzQZMH+ftivdyysiesBnS2CSG81s5a7Rhh
	KxwBMOfUGEjRTSujqosKPsDf/mxfKwU1N6Y+99OuqbhZa1iWPj9ajeDMd/FRhz2Tk49qOjuboyh
	J2fGQ5dLkjpi5ZP0VLQUa37hCSzYHHeSQ1aKazlVT04uABSICxbUCndnXfY5mtecqLzAwOfRxD/
	njvQEkxawfGvfw7A2wDbHrB+qMyrQ1aGwbGut3SmHWHFjL0EeJk0DxgTF1WvniqyAjudLMlNPG+
	AIa2i/xLtTTte1wb2TIIXnKKAVYJI1c633CX1z9w3P3tZVDOXNmQ==
X-Google-Smtp-Source: AGHT+IEk4YurJaQSGJH4R73CW4Txmfc19dzFpNkcy5aJloEEHwBnUBh9/Km94tklRW1e4lrcvR1y7Q==
X-Received: by 2002:a05:6000:4287:b0:432:5c34:fb22 with SMTP id ffacd0b85a97d-432c377c54dmr3691324f8f.22.1767800575390;
        Wed, 07 Jan 2026 07:42:55 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm10897704f8f.31.2026.01.07.07.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:42:54 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: benato.denis96@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: ionut_n2001@yahoo.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sunlightlinux@gmail.com,
	superm1@kernel.org
Subject: [PATCH v5 3/4] HID: asus: Add WMI communication infrastructure
Date: Wed,  7 Jan 2026 17:42:22 +0200
Message-ID: <20260107154219.164514-8-sunlightlinux@gmail.com>
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

Add infrastructure for the HID driver to communicate with the asus-wmi
driver for handling special keys that require WMI communication.

This includes:
- Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
- Implement asus_wmi_send_event() function to send events to asus-wmi

Reviewed-by: Denis Benato <benato.denis96@gmail.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c                     | 24 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 15c24d5812763..6fcd3213857cf 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -23,6 +23,7 @@
 /*
  */
 
+#include <linux/acpi.h>
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
@@ -321,6 +322,29 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 	return 0;
 }
 
+/*
+ * Send events to asus-wmi driver for handling special keys
+ */
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


