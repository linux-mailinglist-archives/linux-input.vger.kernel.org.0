Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB5AC73653
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2019 20:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfGXSI4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jul 2019 14:08:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35021 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbfGXSI4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jul 2019 14:08:56 -0400
Received: by mail-wm1-f66.google.com with SMTP id l2so42432335wmg.0;
        Wed, 24 Jul 2019 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i14fTTw+f051XXIemGb6vJgII9ThG5ePThWv/SW1yYo=;
        b=BEg2hD7xskXA1YcgoyZRzjhZYnxldpcKnMJBA06U3kXlEBL0f3ZbQSQXUEid5NM2Io
         Cz5eNJBQ/QYesAtZpqQle4B8tK3MZnx4bw3+Ry/cp1BqzP2ZUwDzoyTe25CdFMuGlZAQ
         bpRRYe9+5d0STpBUnTSCejFz6wzD4dZ/ir3YKNeM4UsXy+fyQ2aVJBKcg/uRZDN5skXM
         7OGqB0jRu/5dfHNNRBoj/CTdkbH//ESkBVw9BtMjX4g7YYGJExtUC8Daoy7ryhHeoSDz
         EhjIpJXii898vtfqcjT7F9R97kldwWFDiRg+L6i5Hw+Zz//eQ7TRPZ9u7Ut059yVuqCO
         rERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=i14fTTw+f051XXIemGb6vJgII9ThG5ePThWv/SW1yYo=;
        b=RgA/JrMDrU97q44VLbfmDFXjciPkiXGSUu6EqO1Zn5zfy7LXwVj0Gwg9WVqaj3BU6H
         JwBI5JJYDA1cxkqYmoZdViSAt8Q57+bBDHtW/GVFkpcrNSx6gL+ITVStw25A2Dk3rbWF
         h4ro4xMDt+cf5Bg/erkPANojFwjAU6KMeu3DBuzd2/VVcxWoQ/vNl+sGCt+vkYnWP7iS
         7cu1TvUNA4U1ukCl082jR58lJ5Is9fUORBhtCFusZFT6Agl9fwR3nl9CkRkIAX+PaPEn
         vDub65afucS9a4sE9B4qLAFHUZh1AftGL6wfI78sMs+J154upk8PPLfEigj98vX7w97Y
         aCEQ==
X-Gm-Message-State: APjAAAVLeh3IFeVlAixWRclbNGUjz7kPt8RUCedDe05yrgpL7KFmLUbO
        ZxVS40Zvj11sTFCfaH6gdGQ=
X-Google-Smtp-Source: APXvYqzrdgTgsfgCbbtuX3rU+McvJPj89EX4iVm8NzeO/mjgNSvTNp+bCAmp30fdxTne30D952HDkA==
X-Received: by 2002:a1c:c188:: with SMTP id r130mr71431610wmf.73.1563991734119;
        Wed, 24 Jul 2019 11:08:54 -0700 (PDT)
Received: from localhost.localdomain (2a01-036d-0114-26a3-859c-fac3-f08a-f3a6.pool6.digikabel.hu. [2a01:36d:114:26a3:859c:fac3:f08a:f3a6])
        by smtp.gmail.com with ESMTPSA id f70sm56183732wme.22.2019.07.24.11.08.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 24 Jul 2019 11:08:53 -0700 (PDT)
From:   =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>
Cc:     =?UTF-8?q?Istv=C3=A1n=20V=C3=A1radi?= <ivaradi@varadiistvan.hu>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: Add Saitek X52 to the HID IDs
Date:   Wed, 24 Jul 2019 20:08:06 +0200
Message-Id: <20190724180806.5745-1-ivaradi@varadiistvan.hu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The USB device ID of the Saitek X52 joystick is added as a
define to hid-ids.h.

Signed-off-by: István Váradi <ivaradi@varadiistvan.hu>
---
 drivers/hid/hid-ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0d695f8e1b2c..3a90962614ef 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -989,6 +989,7 @@
 #define USB_DEVICE_ID_SAITEK_RAT7	0x0cd7
 #define USB_DEVICE_ID_SAITEK_RAT9	0x0cfa
 #define USB_DEVICE_ID_SAITEK_MMO7	0x0cd0
+#define USB_DEVICE_ID_SAITEK_X52	0x075c
 
 #define USB_VENDOR_ID_SAMSUNG		0x0419
 #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
-- 
2.20.1

