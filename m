Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E36CE3F20A8
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbhHSTd2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 15:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhHSTd1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 15:33:27 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37705C061575;
        Thu, 19 Aug 2021 12:32:51 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id l3so5511078qtk.10;
        Thu, 19 Aug 2021 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY+D/Sy1TqJnSBxAjQVuX4InrTchjpCmDJzfReV7g6Y=;
        b=Rp1CK4zxfNBRaarTDu97u4mWJ+rExbEsmfnFBD4gjsTdxMzzHJr3B7ZiCP5sfyyIvn
         fWfkkaxDhCnXCJtsnlXQnPffWq3cYD/qglHTWUAmsUPlx4I9Zy+pI357V+d6GEw2r6EE
         la/v2/XS0o+h5roYhpw48INJ1FLfk3s195QYdIawHqNzQfOn3+H+3RbrThSuN5zMEJet
         q0eXiYPhX9g4SnFtwjTsB0TvHDK3Sp1Kdune8Mw7YNs1niVKMa7LI3ExPBOhPsyLQE1e
         R0BjQ8N2bHxuXvqakT5SgMewO4/VvoEWaVoIszCn4sRbdsEcCQ8DIL3qb3b7YQpvqlWO
         jgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY+D/Sy1TqJnSBxAjQVuX4InrTchjpCmDJzfReV7g6Y=;
        b=mZqc+s4XFtmO7ZoGvZ1dZK5QLDAPiWZIPShEkXuFZClCDCpYgejwHnfwTyxbihQVDO
         +If0f0iR3WcaO8DXPAVn/tgfLOjf/QSY/DgPf7wFo+E/UaB3ZcBCfnVCSvH8VL1vjVjJ
         HPFDI8DDMRykBg1jsE5+a3s1rYHgMHyr5JgvP5HkJxxmv1aarua2zGVG7DuiXhw7PDpF
         hpfrGifwYvrOkl6dAK4x++7cXsCpjj9lv1x5JB9c9kzSpkYCTXfCSGh/LifqAbyUtYYx
         YaW7dCSOpREiWA0D8SzCdTZPsPL5TemrBWDMqvBGWXRNvqEOBfhVjEbQdWpPRk8bLHpF
         pP1A==
X-Gm-Message-State: AOAM533VyKCM6oQDC1FmkmziwB/LpwbmfA5WVMcoE+Sg5CTTN7m26L5m
        +WCw4ynwhQ+nsr+BZP0g6A8=
X-Google-Smtp-Source: ABdhPJzLkEUY6t24MeJ98/6lkXRCvKOBiOxcc62nLvoVuCD2EuYYCxgu4Z5y9H18tI161ddTNGUbhQ==
X-Received: by 2002:ac8:5b04:: with SMTP id m4mr14208845qtw.344.1629401570398;
        Thu, 19 Aug 2021 12:32:50 -0700 (PDT)
Received: from localhost.localdomain ([138.229.29.116])
        by smtp.googlemail.com with ESMTPSA id g20sm2004493qki.73.2021.08.19.12.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:32:50 -0700 (PDT)
From:   Stephan Losa <stephan.losa@gmail.com>
Cc:     stephan.losa@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: apple: Add support for Keychron K8, K2 in bluetooth mode
Date:   Thu, 19 Aug 2021 15:32:21 -0400
Message-Id: <20210819193221.558454-1-stephan.losa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use hid-apple in bluetooth mode like in wired mode for Keychron K8, K2
(and others). Those keyboards use vendor/product ids 05AC:024F (APPLE_ALU_REVB_ANSI).

Signed-off-by: Stephan Losa <stephan.losa@gmail.com>
---
 drivers/hid/hid-apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6b8f0d004d34..dc6bd4299c54 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -501,6 +501,8 @@ static const struct hid_device_id apple_devices[] = {
 			APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
 		.driver_data = APPLE_HAS_FN },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
+		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
-- 
2.25.1

