Return-Path: <linux-input+bounces-4282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D572E9018D0
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB5371C209F4
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84CB55889;
	Sun,  9 Jun 2024 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlJMHbjl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583701F932;
	Sun,  9 Jun 2024 23:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717977101; cv=none; b=o2DtobznLNVjjhxeQPkPzmFHLCWYyBbnWBhsD0bjVMiW+aI4EYri0wL+2mpQBf9Uze2krupB+JxwPyhlRs0UBX2dS3lhGaYXKfhvHGEYZGhba1HWrWLf0R35VeNA/ev+J6F0R2tdryTj5HLFikLhdCrs6hccaHN8SmHP7j2ljjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717977101; c=relaxed/simple;
	bh=IdNAFIg/Cxi3s4opGkIjs/mr3l+mlhCuw9VS9AZo6pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swBGbw3SNV3Puji8KZ6zh7VMBNiVsXDKEagH9ZeEn+/vE/V1Qodfwx4W2ILsqWp/zs9qS2bti5s/3JmJPyAzCWiMYw8MNDlLT6DRvabwxu+xsXKz6JMlLy9GmL8ICWf3ZDjAExJlqyXz233XJl5t/2OJPbMMSwkxwzoyiekCcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlJMHbjl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7041a7d4beeso1691758b3a.2;
        Sun, 09 Jun 2024 16:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717977099; x=1718581899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69ZRYoeJIjb5lPtozp0DKNWI1DepqEmMRNyk8JYLpHw=;
        b=ZlJMHbjlsm8HpSMcSz64gMoWyucI7KPr5LAVdPQ6VBeNZd4iBiPEc439tAcq77/2Qk
         Sk/dba9EIT1ZJ6l1zV51FMDb6P6YUSwtWliN+Q8A6zclMKp9AnyvTsVnfq+ebRX4fjoG
         XRAXOLLcpuC5IuD6FK3FFhM+7SZVwm/MgauqYycQHK+9jor0VFw7Ry6sh3KU3YlfLCKJ
         1mpiX2cPiLMCEzwlu79dzbX1xB7+YkN/UsOHfZDhKdfsgjUtxmYIGErhuzghAbrws9/b
         bJHJrKdk3Asod+h65GEOeE5F0Fcg0s3NECycb0qnhYStpJ4j+9Z7oSPHlREcADG2GUfr
         il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717977099; x=1718581899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=69ZRYoeJIjb5lPtozp0DKNWI1DepqEmMRNyk8JYLpHw=;
        b=FRwIEfQCAiq7yV/5F3HdmHu6ARYPRjxfQ9qTcbXsklAQnN2YDZlEUNAbhX80qnDYSH
         A+OMRhDckiyWwzcvfNWlb5iKaFN4TKStQLBeQG6q9KRtFmsMcFqJQr/b+SUt+gGyTqJx
         a1SsWpptHp0uxVZn7eIT9rGnucuWE1OOd5NosZ81xn+UX5bJNHTnjLWD3ZqfzYglL0ew
         N5M8uDalTUSUyxdDlt8WiC1Co/Rg+oQUf6fs7r5FUdlGEu+276OoOpF3mcuoc8Lv4eH6
         N3bs4j+dosGcv/rutwDdHCDdFQoJzkSsahZEOtHXrz7ZeDgbuofh5mp2L71X3fMfWvuV
         3qpA==
X-Gm-Message-State: AOJu0YxOkGkjVA5eRl05a1CbUjvfRRfzeDpI1ogJ81Hp4B7tDWvXKVTc
	mtwNUW2CpkmQDMdmiRLfQyLXbctlGcUTCbvuIKWEtaMNYejTeKDYuKH3YA==
X-Google-Smtp-Source: AGHT+IF7eoB2J8mctyoEsInWXQPHUz4HtgXN+9OrYtXifK4moqzyc3RsQ0gEGUP4SmHlDURPiTeqxw==
X-Received: by 2002:a05:6a00:14c2:b0:705:9748:7ba9 with SMTP id d2e1a72fcca58-70597487fcemr1303582b3a.0.1717977099272;
        Sun, 09 Jun 2024 16:51:39 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7042f37f33asm2090356b3a.3.2024.06.09.16.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:51:38 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: rohm_bu21023 - switch to using sysfs_emit()
Date: Sun,  9 Jun 2024 16:51:31 -0700
Message-ID: <20240609235134.614592-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609235134.614592-1-dmitry.torokhov@gmail.com>
References: <20240609235134.614592-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysfs_emit() is preferred over snprintf() for sysfs attribute handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/rohm_bu21023.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/rohm_bu21023.c b/drivers/input/touchscreen/rohm_bu21023.c
index c432ed682d31..7be2549fde85 100644
--- a/drivers/input/touchscreen/rohm_bu21023.c
+++ b/drivers/input/touchscreen/rohm_bu21023.c
@@ -756,7 +756,7 @@ static ssize_t swap_xy_show(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rohm_ts_data *ts = i2c_get_clientdata(client);
 
-	return sprintf(buf, "%d\n", !!(ts->setup2 & SWAP_XY));
+	return sysfs_emit(buf, "%d\n", !!(ts->setup2 & SWAP_XY));
 }
 
 static ssize_t swap_xy_store(struct device *dev, struct device_attribute *attr,
@@ -781,7 +781,7 @@ static ssize_t inv_x_show(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rohm_ts_data *ts = i2c_get_clientdata(client);
 
-	return sprintf(buf, "%d\n", !!(ts->setup2 & INV_X));
+	return sysfs_emit(buf, "%d\n", !!(ts->setup2 & INV_X));
 }
 
 static ssize_t inv_x_store(struct device *dev, struct device_attribute *attr,
@@ -806,7 +806,7 @@ static ssize_t inv_y_show(struct device *dev, struct device_attribute *attr,
 	struct i2c_client *client = to_i2c_client(dev);
 	struct rohm_ts_data *ts = i2c_get_clientdata(client);
 
-	return sprintf(buf, "%d\n", !!(ts->setup2 & INV_Y));
+	return sysfs_emit(buf, "%d\n", !!(ts->setup2 & INV_Y));
 }
 
 static ssize_t inv_y_store(struct device *dev, struct device_attribute *attr,
-- 
2.45.2.505.gda0bf45e8d-goog


