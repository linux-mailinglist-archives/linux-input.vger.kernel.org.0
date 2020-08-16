Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7841245732
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgHPKZX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 06:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgHPKZV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 06:25:21 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7792C061786;
        Sun, 16 Aug 2020 03:25:20 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t10so6071893plz.10;
        Sun, 16 Aug 2020 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yD1QVUv3mtoKE5t+lYQTnKLDU4/LcFxV4PWvOkQyGzY=;
        b=JTAmv8ulavefnGnEQG4bh+CTRpsQHhv4andYvl+37OKWOjdXwi1p1CWxkLCFgoapKD
         jnX2mEzkLaae0pPj0Y8XrBHJkac+70LUHbypwto09OTUUt086qda2/CkjoYFLGJdVDUG
         gX8lVApXOzUo/ho/U8xm2ctW1Z5TEkiLOZe8jwLQtwMmGsnQhedsSuspikKOCICpenr3
         y2gMZaXN60ShLim7lLpyzY05EFAuSasopbQIx6ZkGAWNw224X37ArxZ8qx4Kxa9NrJZ2
         ks1PxCG6uikW7V8+iCbKkrnmvEKCI3or5bVKn5hMeKoP8T4NxaI4FbdmFF+H190sIPWe
         zufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yD1QVUv3mtoKE5t+lYQTnKLDU4/LcFxV4PWvOkQyGzY=;
        b=F5QKSkAWRawdmGgP3dlH/3Pe+UDWHaDkJsVgvCWqXp5xNoX0Fxw4JfpJVCsEeFXx/r
         /+CrVSrewkB/vq+QyVVyn2V9tYJogCoXV6Q8SMYt9pCueFzoRarZ7F3HJ2cqPdRLltK5
         Y+H71XAzWgxbiqjUzDRIlDidXc2CxDhOs1PEvIw6Rh6jkGDQtMmTC4V8ZO7jyGRRnFdY
         MKqJ+eQBZYWN7JunppZC/MgAAhX5AvqMpMFow36zNYdto5Kxn+5ZRqaVI82sCRPzBQEF
         nV41B9QLvonCZmnpXtylGJh3WUYjBVPL5yymlhAHJ6TuoRTazg8My9Y7YIaUOysDEqUg
         VCMw==
X-Gm-Message-State: AOAM533kmIh63CT/amfxC+wo1gCChAP21vtQTF4S3CID8SHeKkPAFqw3
        hNNdZbPOCwUomyQPJ3s8k9E=
X-Google-Smtp-Source: ABdhPJwsJfIMjmPAswx3mX6QJyO+kUzVwgQZ7ZZ/25KpU9ZCFSbnqpr9sYe2sOXcowm09AhTT2LGsg==
X-Received: by 2002:a17:90b:164a:: with SMTP id il10mr8983149pjb.2.1597573519652;
        Sun, 16 Aug 2020 03:25:19 -0700 (PDT)
Received: from localhost.localdomain (c-73-231-197-145.hsd1.ca.comcast.net. [73.231.197.145])
        by smtp.gmail.com with ESMTPSA id m15sm9135780pgr.2.2020.08.16.03.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 03:25:18 -0700 (PDT)
From:   Nirenjan Krishnan <nirenjan@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        nirenjan@gmail.com
Subject: [PATCH] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
Date:   Sun, 16 Aug 2020 03:24:45 -0700
Message-Id: <20200816102445.4928-1-nirenjan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Saitek X52 family of joysticks has a pair of axes that were
originally (by the Windows driver) used as mouse pointer controls. The
corresponding usage page is the Game Controls page, which is not
recognized by the generic HID driver, and therefore, both axes get
mapped to ABS_MISC. The quirk makes the second axis get mapped to
ABS_MISC+1, and therefore made available separately.

Signed-off-by: Nirenjan Krishnan <nirenjan@gmail.com>
---
 drivers/hid/hid-ids.h    | 2 ++
 drivers/hid/hid-quirks.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 6f370e020..bc62537c4 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1010,6 +1010,8 @@
 #define USB_DEVICE_ID_SAITEK_RAT9	0x0cfa
 #define USB_DEVICE_ID_SAITEK_MMO7	0x0cd0
 #define USB_DEVICE_ID_SAITEK_X52	0x075c
+#define USB_DEVICE_ID_SAITEK_X52_2	0x0255
+#define USB_DEVICE_ID_SAITEK_X52_PRO	0x0762
 
 #define USB_VENDOR_ID_SAMSUNG		0x0419
 #define USB_DEVICE_ID_SAMSUNG_IR_REMOTE	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 934fc0a79..6b82eda26 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -147,6 +147,8 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_RETROUSB, USB_DEVICE_ID_RETROUSB_SNES_RETROPORT), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_RUMBLEPAD), HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_2), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_X52_PRO), HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SEMICO, USB_DEVICE_ID_SEMICO_USB_KEYKOARD), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SENNHEISER, USB_DEVICE_ID_SENNHEISER_BTD500USB), HID_QUIRK_NOGET },
-- 
2.25.1

