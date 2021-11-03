Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DBED443D5C
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 07:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhKCGnn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 02:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231760AbhKCGnm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Nov 2021 02:43:42 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD8ECC061714
        for <linux-input@vger.kernel.org>; Tue,  2 Nov 2021 23:41:06 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x64so1357676pfd.6
        for <linux-input@vger.kernel.org>; Tue, 02 Nov 2021 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TIvRM+Cy1i9b6EJun6Re1/fAKnc4AyFX1l1x0gctEY=;
        b=eldsMNQezk1HYir332mslG+SkhNXFRJFGzGl3QKMUa1XX8TjaOtA0wjRkL1ztXOOqG
         /81QDzj0Px2wj3/YNZc1TVC36tiXlk7vt1ONqXDOZieAIWsD1iKSuKeqh+OXmohiibUs
         bCb+LIemR/Mni+RsbxiNIzpDjc7MJVqpwDyHKTKdgHyf35yF3vICQjBovUlx7G2QzilI
         aZjUrsxIHtYTaPtgTbxKtYW+n2UFAc+9ucgI26ETq0ZxN0jA/R6V6gTPIkAdI7tI5XIo
         zuR+Py81lKP03rokBkoQ7Wv44IgVo3Su6sAu5VV4OEkSAC/2UVA7LbaVtddnJ8hida9h
         6D/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TIvRM+Cy1i9b6EJun6Re1/fAKnc4AyFX1l1x0gctEY=;
        b=hQqmd8nlE8/yaUb4ZBxiwRT3eBtS0M8lQdZkvzXcS3qrDlh7+n7nm713xsxq9qZ+bB
         qid91Pm/+lVdVF18BylxgZ69JaxuYQJM6eMLDjGoGRjqpl5801BwlUsJ3CLvBmLTgUrh
         FGwClF/kKJG4r/+btTVFwBmfguZsBju4+SMOOgOWh8zqQAsde9QTGARXsn1NWOnoqJc1
         S8UxhFHABNeAhZ4sm8rB80m5bStyh/EiT9QfNPth5UIaYocNnwKnyvJ/KChcKxLW2fOc
         mLzxt+82seN6p/o+qC7uGRUo5mTUtgvNn5oUoHR9sBGmFN4Fqo5wqCRX2ZOmOydTtyjv
         7XOA==
X-Gm-Message-State: AOAM530rzbuVGWXmkWmjT36KXWxuh6ZgCcL2WJzG8JCs/w2cYZU5XNg8
        6tDIZVO4fY5CPwudqkvBpLjZUuiMF97XBIRO
X-Google-Smtp-Source: ABdhPJyeLi5fqVoMAgcImqhGMKzUYW+htNX5POXmPW4ppHSyy7exdo/3i98hn2EdDOBpt++uSN4Jyw==
X-Received: by 2002:a62:ea16:0:b0:47b:f3d7:7a9 with SMTP id t22-20020a62ea16000000b0047bf3d707a9mr41983223pfh.60.1635921665970;
        Tue, 02 Nov 2021 23:41:05 -0700 (PDT)
Received: from localhost.localdomain (24-117-70-85.cpe.sparklight.net. [24.117.70.85])
        by smtp.gmail.com with ESMTPSA id p1sm1295014pfo.143.2021.11.02.23.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 23:41:05 -0700 (PDT)
From:   Trevor Davenport <trevor.davenport@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Trevor Davenport <trevor.davenport@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH] HID: Ignore battery for Elan touchscreen on HP Envy X360 15-eu0xxx
Date:   Wed,  3 Nov 2021 00:40:24 -0600
Message-Id: <20211103064024.23047-1-trevor.davenport@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Battery status is reported for the HP Envy X360 Convertible 15-eu0xxx
even if it does not have a battery. Prevent it from always reporting the
battery as low.

Signed-off-by: Trevor Davenport <trevor.davenport@gmail.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..8d3a9f9ea48e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -393,6 +393,7 @@
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
+#define I2C_DEVICE_ID_HP_ENVY_X360_15	0x2d05
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..e31041ae3e43 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -324,6 +324,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_ENVY_X360_15),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN),
-- 
2.33.1

