Return-Path: <linux-input+bounces-16816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABA2CFD608
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 12:20:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 97EBB30021E5
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 11:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0BA306B12;
	Wed,  7 Jan 2026 11:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huaroCwj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AE3304BBC
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767784829; cv=none; b=Kxk3mu/tiLopxp8sxIKrSFtBoMUj3SX3s5xwH2SLK9+ReXVqFKWn4cKxIwiM0b/sKDf7K3JkH4Du0LDERAuBrBcHHcY4LDNnkaQv90+Shr7Lo8tgPzWKFiR4tddLUCamjV/rBiomh60S59PDwzUMo31KuAGlU6P0CmdtHS/CWpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767784829; c=relaxed/simple;
	bh=bhXL/qlVaZjV6U7YXLUhezHX6YWbXxyg7ca561Xl6C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R9ZsTt9PUS637DR2ZSvFEK31pid9qmKy7RcexVYLgVgxckRDWXB+L6CSM17ybyLyqVV9nBfEoHal18by8CKVBa/Qb2rRQiEzB/1bRh4wnw/jbru+knNkFF0Cy1VXBJde6FhmiPIr5dz49q6gGhhVvGl0hSZlCD+sqbS2u/CMUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huaroCwj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso18552495e9.3
        for <linux-input@vger.kernel.org>; Wed, 07 Jan 2026 03:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767784826; x=1768389626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwyToufcall8PMuGttvxAFGI24D+w7zA2Duyq4+CB8g=;
        b=huaroCwjexR61nlSikRPeCSX8n4NxPbcfwRGluREiVZ0iRBgZdg2NwQG1B32tIBHEM
         vL7/VANIUgc44/UvjNLXr05SWM8HqWq5Y7+sYsa4yR+XluW1WPF4yEIDxB4fNNGh/75s
         lPhMCn8CQ35uXQnucw+R1xwFSx9lcZrK2QihT1win7XcjcHBCyR0z5qYn8v4lJ0GcpSW
         /SdTUfWGPPQZvMhLkHPj78iLjeM/bukH52LHswQuaYnElO9McWlBEeC4/ml4pXP/vdvQ
         IypsQjY3aslqZGESY5jLLMo6VEeM9pIVziz+u2DKF/l87f2UQ9A6IPFv+JSX5HpEgKAp
         AcPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767784826; x=1768389626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IwyToufcall8PMuGttvxAFGI24D+w7zA2Duyq4+CB8g=;
        b=NZ0A/quwi+x62XdTjW0t7mZkIzzsJLJkqtP4LWrz9KyvpD8pfGFhEBVeOctuxQefzo
         i/oMFKFBXBboFBEBCr+QFAgXrr1dZ7SrxITnSX0PQnqKawiNKuzT+gQu/abTN/dI7zTz
         O5Vkyev4UzWntrQtD6WHrIJJF3KKRwbhUz2lhbxFNRLuK9Bp2ic488keNY/sKp/yg+Rk
         kNlWamxQ944hsN7HZMSWwOX3Kml8TnqDCcG0ECAhrReAVNWBfUdzVQ2hejM4hMMNcf2z
         nuVi8WjJvfn1PXaDSNOAYkwgIasNtApC75ZoOYYxiAx5i1rQ5zwUXHUukbTfXS1mJf+4
         BBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX320ws26DI4NNAG2CaI4VDLj9MwNaguKSoPeGA4rG3bCxDGdZorBKa9rApZvW5VBJfCRn2dYcOrTaLaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxniZTZ1Gmfb/QDPh3QqfhBikn3KmHqHnS7Vsn1psCV944Fbasx
	U2JIlxPHYmuPFYDCmggl5UDVJrFfP8hVYb5DAbeLGX2tlUyWSuGIG3Ia
X-Gm-Gg: AY/fxX4wQ6qHGEOCaV3BJB3mgfnL3Zwa/wIiy6DKKC+9YSPjEfGdE9jZnyOtWOEpCzv
	m2teCuWLJlqIgemJEPfjwUnOUvkNtiMsetWornMj07t82UEKvRX71CFKN4Mw7LHaRwt54IH2k3I
	pyAkV/NbYX4P6B7LKWyPamD8EaY4ypfRbGYBZgUZLanNvaK9k6wEIRoCfn9HkwQNQF1IqmPSlgt
	UEH1nCFxfvvrNQ7dQPEDUy++MxSq0N7+eQzY19xBjltSvZqabeS1BDiuL5ikDlueshg0b+Qhi8/
	l9ZWROAse2NNE4E05ztQFgZ1lvUxIsqjm3qGwuFi5O9mGrUWPUVpNiyU6oHw0UmzORaACobnzft
	T0iYzQFj+MDVoLthr+TLxb8sXwF/nexOnKmYpFpSYbtcry1nG0SbPkEsOaT4DnvGX58R1NphKJw
	s7s40daTI3ilbsiA2mnWLQe1rtseVJPPHeEFTTtpQ=
X-Google-Smtp-Source: AGHT+IEw4zMO2eVkiMUB64U3zeUyxLPKAlLXswDPB5Ecg4K3mY3LtUSZzDU0OLKBOw5QXAMn+ZKT1Q==
X-Received: by 2002:a05:600c:3110:b0:479:3a86:dc1a with SMTP id 5b1f17b1804b1-47d84b41176mr22561975e9.36.1767784825629;
        Wed, 07 Jan 2026 03:20:25 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ede7esm9733210f8f.32.2026.01.07.03.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:20:24 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: superm1@kernel.org,
	benato.denis96@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ionut_n2001@yahoo.com,
	sunlightlinux@gmail.com
Subject: [PATCH 3/4] HID: asus: Add WMI communication infrastructure
Date: Wed,  7 Jan 2026 13:19:48 +0200
Message-ID: <20260107111945.48018-8-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107111945.48018-2-sunlightlinux@gmail.com>
References: <10abfaa7-9f5b-494c-8bb5-5da53c087fc4@kernel.org>
 <20260107111945.48018-2-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

Add the infrastructure needed for the HID driver to communicate with
the asus-wmi driver:

- Add linux/acpi.h include (in alphabetical order)
- Define ASUS_WMI_METHODID_NOTIF method ID in asus-wmi.h
- Implement asus_wmi_send_event() function to send events to asus-wmi

This infrastructure will be used to handle special keys that require
WMI communication.

Change-Id: Ic4d9b35f8b1f2b48c7c26e7259b4d05951021b58
Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c                     | 24 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 06cd3d3b74af7..05fa35489258d 100644
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


