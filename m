Return-Path: <linux-input+bounces-9376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FA9A160E9
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 09:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 023D87A3115
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 08:43:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F223199E88;
	Sun, 19 Jan 2025 08:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Weu3tTbc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EC618CBEC;
	Sun, 19 Jan 2025 08:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737276202; cv=none; b=NImSlnEf4H1Ejaf2VWvN82OSSZLYzwEKZk8NaAG/nIlyJBFfXaBs/itiGwQG+05C0TgY203BiRO5Lw0880em1Evdqb9CL4g5DTIqds12B8Y7HrRrNECr954IdvjtjnD2+LioUlCEH3gyk2nW8wX8llbZOLoDwqrcqxpwkAf8D18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737276202; c=relaxed/simple;
	bh=aJMyLQAEiv9y2RuZeAsSLohYMa4uqiX+NNAZPsJclcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KhjC2QZQIKYNTAxuIBqjYIwQ1Pp9nLlv+DPyFq/SwjgX8iPB5aJ6mKbgNlrke6lGx3DV+PS0hIbuetVZcpFPLFMBS+aUr62T8s8B8vGIgwBW7cIsrGNY5Il6DuEr9XFKP4vY6rv2b7J4B3x82CNdQ5qL2B5vIOt6YuJbk8wzkQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Weu3tTbc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21631789fcdso56605595ad.1;
        Sun, 19 Jan 2025 00:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737276199; x=1737880999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSZuzrIG8AynYgqfjkKTimwvRX3WlbLjgL9vAjzatKM=;
        b=Weu3tTbckOh/oSuRsTpecGA/4t8XWeAFdQzAbhcbA/AIq/UWKCbAYva3ViExERXPgo
         4E7vFzOmvOiiDBLrX9NcOZYyAMAzmqMP4OuGJdp1FVI1NY266qbEE8knvYAwTaitSdDC
         sMs+hahyFP34+IrvWxQD91HWxX0udeGRhyH1t4dnBXt08ILILsI9+GLKJ9kokTjub5Np
         4BVpzMUPl3Pcp8wXsFXnihBQ62510xG+lXeb7Qf9gBox+EFUZfkAOs0CA5XWCkrx3lGQ
         /bHrsgDQvAzREieQwXngIG9kWts0BjPJt9u7ehv8cAsyPU3sw7/ZvFJ0pxlUizex+pXo
         cWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737276199; x=1737880999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSZuzrIG8AynYgqfjkKTimwvRX3WlbLjgL9vAjzatKM=;
        b=dl/h8oJgfE653lhm1u9liy8Y4yTvnulapRf+BBiqEDTprzywk84RotrO391L2Dxgnp
         4nU7eopdB+0e1RbA/0fWZrr9j8oNNIb36SzANT8vb9hxxZTzOYMp0LjwMDvH+uJoAS+8
         wRciWfe5Q3rOh+zxhDllB/H+ACXbqLD5J0o42Qx+KK5wb6JhGSnwAsuSR/8NbUaYiqdJ
         F1McNX94QGLntU/g1UWQfkxRU7lRKTa8BRBnNPsNoXBZDdPvqjA7U7AKOdr7+jSPN99E
         QPXeelXQCEa6qBeWcrlcoigdYsf0LvnsLXHyQOrIivUusbHVySZiFP93eVA7f3zWZORf
         2eLA==
X-Forwarded-Encrypted: i=1; AJvYcCXew5SF2Ghm4yswQr/BrxUuk/Z5v13/NMhvGwK4yzGYrChXFCmS4mNhw/ATQ/cONyJFKTnKrnHcsLVXMpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AIcyjk1wcXNcQuPsAOYSRmdi6oeRVF7eUl5hffHnDA6Wmknw
	Y/1PTI/CTVfshTcdcZTH6gVPb0bcjPxVGT4zVzT8j362PuT7yed16F7Lwbv5
X-Gm-Gg: ASbGncuV58BuG761lm3iGoHHbRV3oOy+gKjtZ3/e9rblyCc5JkUmLQHJchpdCg+5iT3
	ADDl/4bbyOePjO9GLefpQV5xp37739Y40rATnfyo/8h8vqUu9s0h+GWfR+jkb/QTM4vYk4CoS5G
	J+Mq64TsDa+OUUyJfTU+EwQKzCvImCYRfWiIWaix3FNFC+elyxUREuiTaQKOFouwOfJIncbeDQC
	iN/bPbxqzeetpv2fwbtjDbkOJw0egeF6I8CFpbBwp9Z0kuKwmIv3xK8UdoO6aPaeFBkY6elRHA=
X-Google-Smtp-Source: AGHT+IGw0KvkD9dHQFRkMOBiEl5y5B2X4r5RUA54bE/TNXFaA9MyMYG/ChGNh80Q44gpB1hEBd302A==
X-Received: by 2002:a05:6a21:6d9c:b0:1d9:d5e:8297 with SMTP id adf61e73a8af0-1eb216034b9mr14304283637.6.1737276199051;
        Sun, 19 Jan 2025 00:43:19 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc322169sm4660074a12.22.2025.01.19.00.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 00:43:18 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	visitorckw@gmail.com,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] Input: wdt87xx_i2c - fix compiler warning
Date: Sun, 19 Jan 2025 16:43:12 +0800
Message-ID: <20250119084312.1851486-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by the kernel test robot, the following warning occur:

>> drivers/input/touchscreen/wdt87xx_i2c.c:1166:36: warning: 'wdt87xx_acpi_id' defined but not used [-Wunused-const-variable=]
    1166 | static const struct acpi_device_id wdt87xx_acpi_id[] = {
         |                                    ^~~~~~~~~~~~~~~

The 'wdt87xx_acpi_id' array is only used when CONFIG_ACPI is enabled.
Wrapping its definition and 'MODULE_DEVICE_TABLE' in '#ifdef CONFIG_ACPI'
prevents a compiler warning when ACPI is disabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501181549.uzdlBwuN-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/input/touchscreen/wdt87xx_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/wdt87xx_i2c.c b/drivers/input/touchscreen/wdt87xx_i2c.c
index 27941245e962..88d376090e6e 100644
--- a/drivers/input/touchscreen/wdt87xx_i2c.c
+++ b/drivers/input/touchscreen/wdt87xx_i2c.c
@@ -1153,11 +1153,13 @@ static const struct i2c_device_id wdt87xx_dev_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, wdt87xx_dev_id);
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id wdt87xx_acpi_id[] = {
 	{ "WDHT0001", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, wdt87xx_acpi_id);
+#endif
 
 static struct i2c_driver wdt87xx_driver = {
 	.probe		= wdt87xx_ts_probe,
-- 
2.43.0


