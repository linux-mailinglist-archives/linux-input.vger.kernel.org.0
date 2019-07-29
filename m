Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71A0C791F8
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 19:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727659AbfG2RWG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 13:22:06 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52739 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG2RWG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 13:22:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id s3so54564367wms.2
        for <linux-input@vger.kernel.org>; Mon, 29 Jul 2019 10:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logitech-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=00R+UNEvHVWuE/PLYxfw3WxqDTqPWr1w1NkpAiXaPVA=;
        b=CASTErkyLwD12/VODfFrZtJILahcWNBv0N/sb1lCjC7fLjBl335gny0TAS605ASTjw
         q7skUrkClMFxaowvJuVuTbotRFVT1iNUrRl2sH1UCuyAGP+himO/toi787KXAEHlWSxH
         nJ3jdNtATDAAIaYa3q52GqKOoNW+DpFTSmk4qkcZgAh8+Cxoz6rSkQ8qDTxfk/HnuVvV
         mYdwwz2tjhulNFHqGomWKFky0aXM3+s1/TL5l9yQbx/ltOl0NOj41Y5nXoUfZpHcf1Q+
         qtAtiRF0rdkb6JbAZWjwLLe/TdCRseyjWP/rmKZhOn3vBXXC7+opHr2rt249MVwWLvEW
         4oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=00R+UNEvHVWuE/PLYxfw3WxqDTqPWr1w1NkpAiXaPVA=;
        b=T5BM2aDLjzfND4iKtNH5jbSra2RBoshtSQLYG6Z5m2xOZsYa+HivZP7bvo1Crgk0jV
         03MEG/Z2+9P2FXB7b7IQAW2Gslp5lo9hZ/IuoOHFY/XNQsfeUzOGxf9b0gJOqHFM8aPz
         xte5482xNi1U97k2YbMQ6W5bRFLVIpWTCz/c9+VSHl0EUDgDq+O+AdTD3q58chkUOOqM
         5NnHDfkW/6jED5uZ2KlS5rml0IDet3yPN5fGAMGdCZdoyrwXjO3jimAr8E+4P+ezdoOZ
         4dui2rQ1GTvH1ehpq8gsCA7UGNLT7K3quRG3Ci2ISSn/fBl9eM5j9rWtdoRnIX8JwYjp
         i+JA==
X-Gm-Message-State: APjAAAUR1wT8oDJZ/VJ740MSUv3aV3S93cG7ORhM1XeZ2EbeSDnNUDSn
        xiMIVzIrZdtKRkLZyFJfg12+41i1+J/Lx6N5hLdXuZmV/DlyDokZqh+H0I6UmgINeNOq3QNTCGC
        ppwGTCPpMTHvrgNKb4Ys1VKJAKKaODmXFHhr9pOvy5l5opVOwpWRapVLKiWxOySzJpHwYAuFk
X-Google-Smtp-Source: APXvYqxWg2n+64J36cmHvAW9X2k/vPkbw9g2NCZQiXf3HySnm+OTegvxIpokdhFPkMQfE+92DsiKtA==
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr92923019wmd.87.1564420923552;
        Mon, 29 Jul 2019 10:22:03 -0700 (PDT)
Received: from localhost.localdomain ([154.53.1.40])
        by smtp.googlemail.com with ESMTPSA id j189sm70549097wmb.48.2019.07.29.10.22.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 10:22:02 -0700 (PDT)
From:   Olivier Gay <ogay@logitech.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Nestor Lopez <nlopezcasad@logitech.com>,
        Olivier Gay <ogay@logitech.com>
Subject: [PATCH] HID: logitech-dj: extend consumer usages range
Date:   Mon, 29 Jul 2019 19:21:52 +0200
Message-Id: <20190729172152.4874-1-ogay@logitech.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extend the range of usage codes in the consumer page descriptor of
the driver. Some Logitech HID devices send usages in that upper range.

Signed-off-by: Olivier Gay <ogay@logitech.com>
---
 drivers/hid/hid-logitech-dj.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 6196217a7d93..0e058ddb8e1c 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -380,9 +380,9 @@ static const char consumer_descriptor[] = {
 	0x75, 0x10,		/* REPORT_SIZE (16)                    */
 	0x95, 0x02,		/* REPORT_COUNT (2)                    */
 	0x15, 0x01,		/* LOGICAL_MIN (1)                     */
-	0x26, 0x8C, 0x02,	/* LOGICAL_MAX (652)                   */
+	0x26, 0xFF, 0x02,	/* LOGICAL_MAX (767)                   */
 	0x19, 0x01,		/* USAGE_MIN (1)                       */
-	0x2A, 0x8C, 0x02,	/* USAGE_MAX (652)                     */
+	0x2A, 0xFF, 0x02,	/* USAGE_MAX (767)                     */
 	0x81, 0x00,		/* INPUT (Data Ary Abs)                */
 	0xC0,			/* END_COLLECTION                      */
 };				/*                                     */
-- 
2.17.1

