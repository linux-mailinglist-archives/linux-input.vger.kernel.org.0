Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7384808DB
	for <lists+linux-input@lfdr.de>; Tue, 28 Dec 2021 12:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhL1LrB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Dec 2021 06:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhL1LrA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Dec 2021 06:47:00 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D25C061574
        for <linux-input@vger.kernel.org>; Tue, 28 Dec 2021 03:47:00 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id t123so15945676pfc.13
        for <linux-input@vger.kernel.org>; Tue, 28 Dec 2021 03:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=VG7KyxTaUf/eyRSLoJnf587wVcr4KonBHcygE9AihEs=;
        b=ygiXfKHADaYagc4gRoF4K9GtsMwpXFC0AcLV2REVS39Fn9jgPyuZvq4YQ5FtjTlDLv
         n6hhIAXTjCZWQtM72JQrdCQZ8X9fJ0DgLCoN5NrIxqy9qBhPJXppTtEHytEveSYw2M6z
         dV8TIUS/MRKKgP1NyJRZ1dVtV6H2tH5VN5cZWhFdhCBRBJvPasty7QdmlA6gHjg8CcZm
         Hn++TMEx2hqz1yvWed3W9ro3wBhBTkD67otji/uBL4AE//KKiWvIcPC9J/+2gP9WoDQ8
         dQ0UpVMKGcj8QDG+EVFCYxEj9b2hz0+kwUEP2M7zRDczPYRT61fmGGsCors1yjWh3M5M
         aepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VG7KyxTaUf/eyRSLoJnf587wVcr4KonBHcygE9AihEs=;
        b=rWh8CssckQgelrnI8VfIULh+8v7/naLQeeBsxkU7CILK9xmlqpwAepOKXNmpLVZMzC
         JwMVcNMvEx1wbpGbf2wuuLlV3NF/AIo4K03/6Yn+lCYo11kW6SzCra5tefPGfecDXQF7
         nL7xOpxVo4CJMqdCO8namEA9mEb9LDqlM93bm9BgxApwDVHaBV8Yz83xX8y9WpJVyWJ6
         uQiZJ4M7ZOMC0zjQvWISHtQLit6RsBhjmPzT3hYd0o5EmB+jtIuOJHqhNjR6XUiJtlda
         kqiruTqdfz7GMQsNm0okPRNci3vBUQZa41lPcOPP8NdSVpkTRgmi6pV2O9WeEEID+zqt
         Hqjg==
X-Gm-Message-State: AOAM531F3ylXRnX98vCJV9Ys/4yCNzKa4jpaS4sQO2tAjwOM3sHmEyml
        dd8yWROha/JV6Z9j3Hm5uSLajQ==
X-Google-Smtp-Source: ABdhPJxxuAuozQsGJwZ4VQJyuFw+kEYr05hzrhB2Uku7icwKgov0nfDSoHDclcKVQDNmhqNP3gYVBw==
X-Received: by 2002:a05:6a00:acc:b0:44b:ff29:621b with SMTP id c12-20020a056a000acc00b0044bff29621bmr21749712pfl.32.1640692020201;
        Tue, 28 Dec 2021 03:47:00 -0800 (PST)
Received: from ubuntu.huaqin.com ([101.78.151.213])
        by smtp.gmail.com with ESMTPSA id k9sm12026296pgr.47.2021.12.28.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 03:46:59 -0800 (PST)
From:   xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     phoenixshen@chromium.org,
        xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH] HID: google: modify HID device groups of eel
Date:   Tue, 28 Dec 2021 19:46:50 +0800
Message-Id: <20211228114650.31981-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

EEL keyboard belongs to VIVALDI	device.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0403beb3104b..e5acd15f4a55 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -585,7 +585,7 @@ static void hammer_remove(struct hid_device *hdev)
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
-	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+	{ HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
-- 
2.17.1

