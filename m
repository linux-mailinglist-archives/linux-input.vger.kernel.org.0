Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04F52AD05A
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 08:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730883AbgKJHWi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 02:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJHWh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 02:22:37 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F78C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 23:22:36 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id k7so6044381plk.3
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 23:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YnHa/F/HaGv4VR0sa6+1zv7CJdR4JYv3dYH/evzFgeA=;
        b=lrEVIlQSybTMZqqqf0stJtBOhnMev9nPe6OWeGJUOLEVUkRigL/qJn4/82Jn2XZowR
         x7wevF4OyK3jv7Wby1r684nZ+UExXhve848e0Jy8ruXA51n32j1L8cXkAc/BSNG+VErH
         h2vWLurpSzWxU+NAo7Db91NETch+PM9lV5kqzPe1n1ZUoysGP6LKEMld6fW6YDvl3uFE
         NnuS7hJ/MOPefVlSzLWcrxEGUMXtmV/jAHLsMA4sj0JZ+4LYQvl36wS8dVEu1GRKxBJc
         knPzmwmQu0R8NJ+r8jQCd5iCAtXdGTm/jSGOmZGkU9iiNkCr7sfT2hYf32ofdOBzDXn4
         BEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YnHa/F/HaGv4VR0sa6+1zv7CJdR4JYv3dYH/evzFgeA=;
        b=PzZKThEZHSthhdoIaNaJzLyBPiW0dmZxvkfTnUWh+yVWS7ZhEgeK39wg2dDbCgbNPC
         /EEFqdUQMO0AE1NaD+7Qg2vEldhLKzLyDHXVL3EVzY0la8/sBOjS/M+ZCzaz+0SEErAg
         fhZn0kK4DN4LvwaaPd38zu5NuY+/KRzFse2p95ryuSzN2Lq1GpLTSGvKPAKDeWfYsWmQ
         2kAdqLObDea2CtEyzYWFbzaBAB9EfK6wAPhpBJEF6YyioLOl7wlyG4XhgN3gD0NLUixw
         L4rCjQDFw2wi1tdS9B+Pb1j6bKUfDedL6pZPfB7GxkCX6HwoEKAIkrNgAZGWjt3a07tF
         lnqQ==
X-Gm-Message-State: AOAM530qX8iCgzyPhpR0z64QUpJSxuFQviIxjtk+RKLkHF8vg1Qg9NVV
        8QZDQIxxI7LzyamBQWVLS2rIjg==
X-Google-Smtp-Source: ABdhPJzKqYFx+M3yTNw8rMgDtwc++h/c3rGnTHP9JyEk82PTX9ABBjlq8Dzfz/rVjCx9wuWXTMcrmQ==
X-Received: by 2002:a17:902:bccb:b029:d6:fa5c:b481 with SMTP id o11-20020a170902bccbb02900d6fa5cb481mr15697400pls.17.1604992956087;
        Mon, 09 Nov 2020 23:22:36 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id j11sm12908189pfh.143.2020.11.09.23.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:22:35 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 3/3] HID: sony: Don't use fw_version/hw_version for sysfs cleanup.
Date:   Mon,  9 Nov 2020 23:22:29 -0800
Message-Id: <20201110072229.9112-4-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110072229.9112-1-roderick@gaikai.com>
References: <20201110072229.9112-1-roderick@gaikai.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The DS4 dongle reports fw_version and hw_version as 0 when no actual
DS4 is connected to it. This prevents cleaning up sysfs nodes upon
device remove.

This patch decouples sysfs cleanup from the fw_version and hw_version
values by introducing boolean values.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-sony.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 83a94ddbfa4e..124ed4806c78 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -550,7 +550,9 @@ struct sony_sc {
 	struct power_supply_desc battery_desc;
 	int device_id;
 	unsigned fw_version;
+	bool fw_version_created;
 	unsigned hw_version;
+	bool hw_version_created;
 	u8 *output_report_dmabuf;
 
 #ifdef CONFIG_SONY_FF
@@ -2760,19 +2762,17 @@ static int sony_input_configured(struct hid_device *hdev,
 
 		ret = device_create_file(&sc->hdev->dev, &dev_attr_firmware_version);
 		if (ret) {
-			/* Make zero for cleanup reasons of sysfs entries. */
-			sc->fw_version = 0;
-			sc->hw_version = 0;
 			hid_err(sc->hdev, "can't create sysfs firmware_version attribute err: %d\n", ret);
 			goto err_stop;
 		}
+		sc->fw_version_created = true;
 
 		ret = device_create_file(&sc->hdev->dev, &dev_attr_hardware_version);
 		if (ret) {
-			sc->hw_version = 0;
 			hid_err(sc->hdev, "can't create sysfs hardware_version attribute err: %d\n", ret);
 			goto err_stop;
 		}
+		sc->hw_version_created = true;
 
 		/*
 		 * The Dualshock 4 touchpad supports 2 touches and has a
@@ -2864,9 +2864,9 @@ static int sony_input_configured(struct hid_device *hdev,
 	 */
 	if (sc->ds4_bt_poll_interval)
 		device_remove_file(&sc->hdev->dev, &dev_attr_bt_poll_interval);
-	if (sc->fw_version)
+	if (sc->fw_version_created)
 		device_remove_file(&sc->hdev->dev, &dev_attr_firmware_version);
-	if (sc->hw_version)
+	if (sc->hw_version_created)
 		device_remove_file(&sc->hdev->dev, &dev_attr_hardware_version);
 	sony_cancel_work_sync(sc);
 	sony_remove_dev_list(sc);
@@ -2951,10 +2951,10 @@ static void sony_remove(struct hid_device *hdev)
 	if (sc->quirks & DUALSHOCK4_CONTROLLER_BT)
 		device_remove_file(&sc->hdev->dev, &dev_attr_bt_poll_interval);
 
-	if (sc->fw_version)
+	if (sc->fw_version_created)
 		device_remove_file(&sc->hdev->dev, &dev_attr_firmware_version);
 
-	if (sc->hw_version)
+	if (sc->hw_version_created)
 		device_remove_file(&sc->hdev->dev, &dev_attr_hardware_version);
 
 	sony_cancel_work_sync(sc);
-- 
2.26.2

