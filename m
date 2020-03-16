Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA5D186593
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 08:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgCPHYd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 03:24:33 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40168 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729638AbgCPHYc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 03:24:32 -0400
Received: by mail-pl1-f195.google.com with SMTP id h11so7588702plk.7
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 00:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cLUgCPvVOCvF8ic/BSG/ZxXsTtJMwTgOpQVJ7e+heWY=;
        b=kMuQxiqU57kWg/ztLMlBenWljwjmhZQDTdo8lF6ZnktWO9hAQoLEW0vmC+GR6Fr2XF
         SUNvaEk/hiVoLdT6jvusYNa1z8OKm2OOMAvzHfu+VPGtzzhBQkHfmB1cAKM78SPAo0iC
         KrPQCq+o6VcV5YiWZbz0/HW3XGpXKg6KhZU1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cLUgCPvVOCvF8ic/BSG/ZxXsTtJMwTgOpQVJ7e+heWY=;
        b=ZmWpIzRRvxy4+kskVRdTiJthymK2jBp279Q9igdrcxE+HTlRdjkEOrZ/H/LSrphJKL
         a/7ZOGoT0jyBE+nbeREOmCJnDAVA0y0j92rH8ipqBOi7bJw+IFILeDUqFxLf7KlzCGMO
         t034X4gzaI9ip7B4JLpPJuHmVdHW0RFCxMEhKmF+6s7piAw1g+wnSbqizsdP05zGeh8b
         bgigtRARp57YCpUu7Brk6Pmpq+wBIs5F3UpUzZvBG7jsoshj/7fZmOIvwoh0xN7i10kb
         cGbY1g+X+cyolnYZhF8piJ1bFGk7YNJcXVT9yzY4f+LwIABIOpLdtqn9+41TzgQFYTRL
         Y3Eg==
X-Gm-Message-State: ANhLgQ3EmrLMN56Ozr4EgDWQRxNA9VgC9FTCC7dXrZXspCym5aPHBztk
        upqQSLI9bhSj+33I3+qO5JtkLA==
X-Google-Smtp-Source: ADFU+vucMcjPp3LwOXrUtWLkuAbmJ2uc05Q9aXkxqUCrIKWthUBIo5SspQ+RNFdUy6ZVmfbPnj/q0w==
X-Received: by 2002:a17:902:8215:: with SMTP id x21mr26540359pln.59.1584343471978;
        Mon, 16 Mar 2020 00:24:31 -0700 (PDT)
Received: from chentsungp920.tpe.corp.google.com ([2401:fa00:1:10:6780:e5ae:c662:3d59])
        by smtp.gmail.com with ESMTPSA id kb18sm1204543pjb.14.2020.03.16.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 00:24:31 -0700 (PDT)
From:   Chen-Tsung Hsieh <chentsung@chromium.org>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, drinkcat@chromium.org
Subject: [PATCH] HID: google: add moonball USB id
Date:   Mon, 16 Mar 2020 15:24:19 +0800
Message-Id: <20200316072419.65274-1-chentsung@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add 1 additional hammer-like device.

Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 2 ++
 drivers/hid/hid-ids.h           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 2aa4ed157aec..85a054f1ce38 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -532,6 +532,8 @@ static const struct hid_device_id hammer_devices[] = {
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MAGNEMITE) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MASTERBALL) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MOONBALL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STAFF) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce603c4..33fddab41722 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -478,6 +478,7 @@
 #define USB_DEVICE_ID_GOOGLE_WHISKERS	0x5030
 #define USB_DEVICE_ID_GOOGLE_MASTERBALL	0x503c
 #define USB_DEVICE_ID_GOOGLE_MAGNEMITE	0x503d
+#define USB_DEVICE_ID_GOOGLE_MOONBALL	0x5044
 
 #define USB_VENDOR_ID_GOTOP		0x08f2
 #define USB_DEVICE_ID_SUPER_Q2		0x007f
-- 
2.25.1.481.gfbce0eb801-goog

