Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA11F32A581
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350792AbhCBMti (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575905AbhCBD6q (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Mar 2021 22:58:46 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D46C061756
        for <linux-input@vger.kernel.org>; Mon,  1 Mar 2021 19:58:06 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id e3so8973532pfj.6
        for <linux-input@vger.kernel.org>; Mon, 01 Mar 2021 19:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEBNLUtxKA8ya2Gvj6QGMO1TEibsL1fFQkRtuOEtVxs=;
        b=lgfEzkfvoFtNIJS2kDP9NSuPHG87MV/agcvMXjh9N3SeGARgUfdL+MZeE9WPoCL48S
         V3tF4ehSrcMGsaleolhKyE/wdOszCwByDVTsJRoWg+uS8I8qJnjCRqijBIEfTuveqD4d
         w5eIcsL5AFveMopMJc81SpNt2hjKYBo4xnhkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEBNLUtxKA8ya2Gvj6QGMO1TEibsL1fFQkRtuOEtVxs=;
        b=t/9+jjIDjYg6SoEJ7FBoGcrZdtN3ILbaWGBdfAq4Wy9GWpQche2Wlh6xnRCebEuzj5
         v4L8I6KVtEP9F2/r4uI22XSByzaxNGApxxbRD6zb6aNwk9MWN5HxrlMC+dYCYvSWvzhy
         UbbHOFlVhfPO1EEOB5ki3yzjb4pjbC/FdJrY5z6Kq43paFHdL4ox2hDt6GEUL+ZE2dPP
         1eNbaURhhB/iH7ZwSAl12y86SM1kiES4E8NZZbSCXEdMyaTeigq6mFA4Iqixk1EwyCZJ
         dF/sgPDDuDwYUvlKBir0Zrgzc9C7b5hyc7aJhVIj5PwuESk8mX0SEqDQMVkRyY0ev4O1
         Y5IA==
X-Gm-Message-State: AOAM531UhbFgPuLDvS6gHmeqnaa+eIl66jB8HvNjNRe7R5bSagm7xqXR
        esqaV+NPSTIvPLt9F4O6ZnLWmA==
X-Google-Smtp-Source: ABdhPJxdXM2ij3m5GCPWrO/7eCPNZKw79Dz8gKYmQ2leC9a5dQU6uZDrvujF5Yu0ucMZWjgU4R1i4g==
X-Received: by 2002:a62:3503:0:b029:1aa:6f15:b9fe with SMTP id c3-20020a6235030000b02901aa6f15b9femr1529407pfa.65.1614657486170;
        Mon, 01 Mar 2021 19:58:06 -0800 (PST)
Received: from shouchieh-p920.tpe.corp.google.com ([2401:fa00:1:10:d84c:9eb0:426e:99e4])
        by smtp.gmail.com with ESMTPSA id g17sm15145267pfb.214.2021.03.01.19.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 19:58:05 -0800 (PST)
From:   Shou-Chieh Hsu <shouchieh@chromium.org>
X-Google-Original-From: Shou-Chieh Hsu <shouchieh@google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Shou-Chieh Hsu <shouchieh@google.com>,
        Shou-Chieh Hsu <shouchieh@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org
Subject: [PATCH] HID: google: add don USB id
Date:   Tue,  2 Mar 2021 11:58:01 +0800
Message-Id: <20210302115754.1.Ieb3e07a8f6c1d8b912c12d5801f1af20735c3430@changeid>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add 1 additional hammer-like device.

Signed-off-by: Shou-Chieh Hsu <shouchieh@chromium.org>
---

 drivers/hid/hid-google-hammer.c | 2 ++
 drivers/hid/hid-ids.h           | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index d9319622da44..e60c31dd05ff 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -573,6 +573,8 @@ static void hammer_remove(struct hid_device *hdev)
 }
 
 static const struct hid_device_id hammer_devices[] = {
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index e42aaae3138f..0b4929258478 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -493,6 +493,7 @@
 #define USB_DEVICE_ID_GOOGLE_MASTERBALL	0x503c
 #define USB_DEVICE_ID_GOOGLE_MAGNEMITE	0x503d
 #define USB_DEVICE_ID_GOOGLE_MOONBALL	0x5044
+#define USB_DEVICE_ID_GOOGLE_DON	0x5050
 
 #define USB_VENDOR_ID_GOTOP		0x08f2
 #define USB_DEVICE_ID_SUPER_Q2		0x007f
-- 
2.30.1.766.gb4fecdf3b7-goog

