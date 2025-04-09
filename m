Return-Path: <linux-input+bounces-11573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E225A81C91
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 08:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC13C7B51AE
	for <lists+linux-input@lfdr.de>; Wed,  9 Apr 2025 06:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DCD1AA786;
	Wed,  9 Apr 2025 06:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kajvnHrf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251BE3FFD;
	Wed,  9 Apr 2025 06:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178689; cv=none; b=fRJwPm/U61dP295x5zWCsSfTJDjnoF7Vj5F7AZ0819MWd/kYT1yzLWpNrtwmEkisZAyLGG+nV6ND1wacOoj23QurrPDdDKqfayQCFCuDnNI+yoQXp0o+ALezwP1gBsmLfD5nk8xpsZWD/6eZ84hclh6X4kkgjBghi/VZMZESKis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178689; c=relaxed/simple;
	bh=m4/mW/yD1FOsUz2/Xtq3pAZUmygrqnr24wXblD4T+o8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m/hWK+q+ke0T/hwHNWO6wk+b/ARbLiH29BweE3mcvjfy6p18JDoTmkkFkeqv1m9YHJrT7ZOvLQp3a8hFnKQCELBFwkwnQXD+UVo0D4a4+jt9heL3l2RbwIe7+lHSBNZkAf/VkqqzRcNRBEu8GvKzZViABJPC1NIkl4pJjloTzeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kajvnHrf; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-524038ba657so482608e0c.0;
        Tue, 08 Apr 2025 23:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744178687; x=1744783487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V4ALGdx0ZvhM0ESKguXWcucuSIXI2xNRiiSByOwwaE=;
        b=kajvnHrfBOf6hsCRMD7+niF75pqba5nEqDzqiYP1jmsoEtljlrHi+n9hw/oNIdT8UR
         F4O9B6TB+61uuvrocp6EmAI8xvZ+WT6awSOOzT6XSy/oBH+LXYEiCmctdnrvDtlNny3r
         fH9p5lD0YZx5XMz62NOVZWNe17X/5RWw+drNw1QUcYuK7SDDE9D9Lu6HA7jwiB3L+SJc
         ZTqkC++nrEJdteXUFazO50cUqpHsQinssq/f2MxEViVH08dEN5OiZJdqEv7c79HV9pUR
         RVFPBjHNDbxKepw41Rlqy33LfX+a/C3x4PX3LorfUYgiKYAATHTYzCes/E539DESxP3k
         wdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178687; x=1744783487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V4ALGdx0ZvhM0ESKguXWcucuSIXI2xNRiiSByOwwaE=;
        b=akb/pBvhooTUVp78HXcUokFmvRW/gck+dqzQmF9C/aB6c3kpdaIjPycwdKE0DWM8tl
         vWkSEFwI2T+/UDV+PxZiB3VniF/rKGETOOBq/1zkqCvMEhvqZRXA0g4ZJ7hWOH9GNI/R
         4w4eSicubCFayefw7kEXmifGT/mZEhRbgLf4yG0BQyO4IQBGUDByLyi8+cSysd4L+wYs
         nViBboSKD/GaQDPJ4knyv8K2idf33GVQeqXMwg9N2BXOlRFsSG1eQ+Dp+B6OUDbK11pA
         nfxe1yg8cgcWWUm5Dr4+p7g3CVw26rcpAVnHei1PitwDbkCsAAiHXtJYDXkA1hDPlp0M
         6lhw==
X-Forwarded-Encrypted: i=1; AJvYcCV0XkbGEWcYJqSGHau2usA5knZ+n0KSpLUu1oIATtGvELlmwNt0q9PjQD3UMhS1MiciTTHKQQhxqQv6KA==@vger.kernel.org, AJvYcCXaDXIhOapqNBdKg9p2JEacn7zpwV1cf3oH9TZ7W9uv/Mdine/A6yk8KEGqEtxBnQ4nXPVJKeX8pLCv5zdU@vger.kernel.org
X-Gm-Message-State: AOJu0YztpL2gyoEsP4OsA6A5hQ8vAwduXJcXeprZFjrtMLboeohk3vUD
	cLzJbmnEUipL3ABDR8QfJXQNDlHX+/aGMJEqOWm0q34WmCHdTdQm
X-Gm-Gg: ASbGnctVkDgnK5fNJLPGvAdkCo0PUWc1A7dSrW9AqmfvsvqitU4Rx56JWR6iHG+HaUi
	gGcoVW0AwXw9kHS9QcIwsjVdoBrOTRfM24Ifa6hm3pD+EAlOFsmK2Ad8P4XAj/VDQusj/Yj8Aym
	ik9KKULkKhW3jPmJxKl60ALdXPrdmaU7HCZGYACYltqWNTxjlFN5hhTEtWKt6KLYXrq3FeTRHQy
	UwaagIBqE4/2ziW9XbEPDPoNUcl57uXcVFOesBxeWX4VXSttfmer3qXE7VT6aObG93e27GohApc
	KBdyeCzTffvmPAeZi7vY9D5arC/UOo2kKouluI3Oh6cPeMtNrhz3HA5TL6Vq4QgepsIDwj+yZPB
	a
X-Google-Smtp-Source: AGHT+IHwv4W8fgLGzlrXAXf4jygzq2dLL2QYjoAC/5xm7B4+8GUF26c/3eTljqp4QP/9LBBlmzf9oQ==
X-Received: by 2002:a05:6122:410:b0:524:2fe0:3898 with SMTP id 71dfb90a1353d-5279ac99ae9mr4306442e0c.5.1744178686881;
        Tue, 08 Apr 2025 23:04:46 -0700 (PDT)
Received: from localhost.localdomain ([200.189.18.171])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd4cb9esm99510e0c.6.2025.04.08.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:04:45 -0700 (PDT)
From: miltonials <miltonjosue2001@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Milton Barrera <miltonjosue2001@gmail.com>
Subject: [PATCH] HID: quirks: Add ADATA XPG alpha wireless mouse support
Date: Wed,  9 Apr 2025 00:04:28 -0600
Message-ID: <20250409060428.1188-1-miltonjosue2001@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Milton Barrera <miltonjosue2001@gmail.com>

This patch adds HID_QUIRK_ALWAYS_POLL for the ADATA XPG wireless gaming mouse (USB ID 125f:7505) and its USB dongle (USB ID 125f:7506). Without this quirk, the device does not generate input events properly.

Signed-off-by: Milton Barrera <miltonjosue2001@gmail.com>
---
 drivers/hid/hid-ids.h    | 4 ++++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..106273131 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -41,6 +41,10 @@
 #define USB_VENDOR_ID_ACTIONSTAR	0x2101
 #define USB_DEVICE_ID_ACTIONSTAR_1011	0x1011
 
+#define USB_VENDOR_ID_ADATA_XPG 0x125f
+#define USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE 0x7505
+#define USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE_DONGLE 0x7506
+
 #define USB_VENDOR_ID_ADS_TECH		0x06e1
 #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X	0xa155
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 646171598..0731473cc 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -27,6 +27,8 @@
 static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AASHIMA, USB_DEVICE_ID_AASHIMA_GAMEPAD), HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AASHIMA, USB_DEVICE_ID_AASHIMA_PREDATOR), HID_QUIRK_BADPAD },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ADATA_XPG, USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ADATA_XPG, USB_VENDOR_ID_ADATA_XPG_WL_GAMING_MOUSE_DONGLE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AFATECH, USB_DEVICE_ID_AFATECH_AF9016), HID_QUIRK_FULLSPEED_INTERVAL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AIREN, USB_DEVICE_ID_AIREN_SLIMPLUS), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AKAI_09E8, USB_DEVICE_ID_AKAI_09E8_MIDIMIX), HID_QUIRK_NO_INIT_REPORTS },
-- 
2.43.0


