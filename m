Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C137949E
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 18:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhEJQyo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 12:54:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56109 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231953AbhEJQyn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 12:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620665617;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KhvWaxNul7zu4EnuoMFRJR12b+F35ScbSngpii8z+GA=;
        b=Lne8LqCKaU3sMkYm7r5NkGu6O2c8QbAydw9hcYeAQzdNC/xvUkWSLGF6T534rZGUO+65qO
        tuXX/hdWY/Sq/WD0dm0Ocw9qJgNa/KQZSHeLbHyYLAIC4ZXMd35a3TcSJVmPPlrI8PYJiY
        8uO3Nh/5dTA7/ykTvVmkK/v2fiTkyC0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-f8sWSIgJPeqV3e0ozGSQPw-1; Mon, 10 May 2021 12:53:35 -0400
X-MC-Unique: f8sWSIgJPeqV3e0ozGSQPw-1
Received: by mail-qv1-f69.google.com with SMTP id y24-20020a0ca9180000b02901d367101f9dso13164034qva.1
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 09:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KhvWaxNul7zu4EnuoMFRJR12b+F35ScbSngpii8z+GA=;
        b=cFxgerVymwInG64g2MzWAWXYxk0r3gLJLhxmhYP58GIZtW/rbCWczUoYvMElAiZVhC
         R8h9mErMg4lMuQpNpQ50bvDgHgwfU+E6af3TUMcynPKyQe9pBoSuZnm1iRQWPx/TKpVf
         mJ4zN0RnaKmzsN6nPNXOrOBl2hfYMN/8BFJPJ7l9kdEXv+O8QpIaI026KcEFsZKHuaxG
         RmKC3GOBHXZ4Z1o6nIG8pjmapvyBrDO0xFBzWTnO9wfka7s9323to1upvBZm4fkIUbmr
         jeUPGEltF+XVTA/yBadhqgnLp5kqTuMCZ84ek50ojXnutl9t0O0dLNc6jfOCqz87rAmn
         DPIA==
X-Gm-Message-State: AOAM531fBduKCi77BXIjkUrTNrdT4+7787HyNwq/h/0waEM3lWiTYcqP
        +qxRezz/wn9GsFs+fc7jvMySpGmE5vU/bSy8b1ypg+OGe/LyFCJ1WF/yXmSxI7/ZdS8X1vFpODt
        2D1rD+6d6iJFnsyiTJClLAnE=
X-Received: by 2002:a37:5dc5:: with SMTP id r188mr24280987qkb.303.1620665614867;
        Mon, 10 May 2021 09:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyy/aNGwBNNYJA7jYo55sda7QCqZpfEGujpq5EF8HL1Nlg1L8bDXLDyKNBNmhfJKd2+O/OS0A==
X-Received: by 2002:a37:5dc5:: with SMTP id r188mr24280976qkb.303.1620665614691;
        Mon, 10 May 2021 09:53:34 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d19sm11624587qtd.29.2021.05.10.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:53:34 -0700 (PDT)
From:   trix@redhat.com
To:     michael.zaidman@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] HID: ft260: improve error handling of ft260_hid_feature_report_get()
Date:   Mon, 10 May 2021 09:53:29 -0700
Message-Id: <20210510165329.664909-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Static analysis reports this representative problem

hid-ft260.c:787:9: warning: 4th function call argument is an
  uninitialized value
        return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Uses of ft260_hid_feature_report_get() check if the return size matches
the requested size.  But the function can also fail with at least -ENOMEM.
Add the < 0 checks.

In ft260_hid_feature_report_get(), do not do the memcpy to the caller's
buffer if there is an error.

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
v2:  add unlikely()'s for error conditions
---
 drivers/hid/hid-ft260.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 7a9ba984a75a..7e881799d074 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -249,7 +249,8 @@ static int ft260_hid_feature_report_get(struct hid_device *hdev,
 
 	ret = hid_hw_raw_request(hdev, report_id, buf, len, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
-	memcpy(data, buf, len);
+	if (likely(ret == len))
+		memcpy(data, buf, len);
 	kfree(buf);
 	return ret;
 }
@@ -295,12 +296,16 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_get_i2c_status_report report;
 	int ret;
+	int len = sizeof(report);
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
-					   (u8 *)&report, sizeof(report));
-	if (ret < 0) {
+					   (u8 *)&report, len);
+	if (unlikely(ret != len)) {
 		hid_err(hdev, "failed to retrieve status: %d\n", ret);
-		return ret;
+		if (ret >= 0)
+			return -EIO;
+		else
+			return ret;
 	}
 
 	dev->clock = le16_to_cpu(report.clock);
@@ -724,10 +729,12 @@ static int ft260_get_system_config(struct hid_device *hdev,
 
 	ret = ft260_hid_feature_report_get(hdev, FT260_SYSTEM_SETTINGS,
 					   (u8 *)cfg, len);
-	if (ret != len) {
+	if (unlikely(ret != len)) {
 		hid_err(hdev, "failed to retrieve system status\n");
 		if (ret >= 0)
 			return -EIO;
+		else
+			return ret;
 	}
 	return 0;
 }
@@ -780,8 +787,12 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	int ret;
 
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
-	if (ret != len && ret >= 0)
-		return -EIO;
+	if (unlikely(ret != len)) {
+		if (ret >= 0)
+			return -EIO;
+		else
+			return  ret;
+	}
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
 }
@@ -792,8 +803,12 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	int ret;
 
 	ret = ft260_hid_feature_report_get(hdev, id, cfg, len);
-	if (ret != len && ret >= 0)
-		return -EIO;
+	if (unlikely(ret != len)) {
+		if (ret >= 0)
+			return -EIO;
+		else
+			return ret;
+	}
 
 	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
 }
@@ -919,6 +934,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	struct ft260_device *dev;
 	struct ft260_get_chip_version_report version;
 	int ret;
+	int len;
 
 	dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
@@ -942,9 +958,10 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_hid_stop;
 	}
 
+	len = sizeof(version);
 	ret = ft260_hid_feature_report_get(hdev, FT260_CHIP_VERSION,
-					   (u8 *)&version, sizeof(version));
-	if (ret != sizeof(version)) {
+					   (u8 *)&version, len);
+	if (unlikely(ret != len)) {
 		hid_err(hdev, "failed to retrieve chip version\n");
 		if (ret >= 0)
 			ret = -EIO;
-- 
2.26.3

