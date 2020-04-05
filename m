Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A75919EEBC
	for <lists+linux-input@lfdr.de>; Mon,  6 Apr 2020 01:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgDEX4t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 19:56:49 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42672 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDEX4t (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Apr 2020 19:56:49 -0400
Received: by mail-lj1-f193.google.com with SMTP id q19so12714690ljp.9;
        Sun, 05 Apr 2020 16:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGe8loEapeJmPIdBpBDGFx+X338aVD4kqb0BzOqBzlA=;
        b=bmLaF0LuN5vMGMxYtp/8r6oosLAig2YwcjaAigUgmHPzAD8zPC6X8lRQWxKf/S+WjQ
         pkBk/S/M4Kvfu/j0qVxNqqK/YtYVjOL1XLe4p84yoIKQZnr1JFFrYQ8X9soAvorg19nh
         wD/vNHoc3QWuxwyEAytm2UEVwHmI11mVmScEKIv4HvDORKwPXvUjRxtJUKFIukuP00Fk
         fKlJpMYDVMGz+pKwkHC5it3ch2YdKUEWC5gVh1LYfXw0B3yfnBhIcwymSKTWsEmqyb4J
         CzCD8fS9t4LG1Bsxf4WW3gQtvfCfBhZDEAIkkNPbcy7Pp9wEQifGtrKF4stsNoW+7NlD
         jC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGe8loEapeJmPIdBpBDGFx+X338aVD4kqb0BzOqBzlA=;
        b=GqJe9BSvMDyDUQiEJqubUy3QUC4c/Z8vuFNwFZEbVdsOtL8iWiRWyjwlD0yF3WOVPI
         RBeB9Njiyww1VE7RHRitHWPo2LVDK0SnBLCHMASbbhMKFULXTUebKUpxP7b4FKi4mzWJ
         oRZmtcjFhTc32tNQvSnHC4lKBt7ACzlFS9wJI1WWdlr5zER9qGxk8QeChmTrKWPcxEyE
         K7KgjYee9JveZyFaM+j9gn91IkN1tuENYyJ6QoKMqZSdTj/P5DtlonV/Mlur3yAuikg0
         8afFsLBAVk2fA+BXT4Lzdn1VDg5z7zP7BPlkj9ID1PmOflBKW4vv0DDWTVVlWO6aFo98
         lT0w==
X-Gm-Message-State: AGi0PuZ+ZbU9QVk1pO1YmldwR71uHDRRpT1cW3HF1f+meS8tO+Vb8EPm
        HghAQpd9YRceg9FAdTGYY9U=
X-Google-Smtp-Source: APiQypId+OkeAKQVjYonQ7fnSczg5p23paR3ytjt3jcmDlW0z3s+RcMljG8vbnJmkX/p8Z4RTaId/A==
X-Received: by 2002:a2e:8648:: with SMTP id i8mr10506648ljj.188.1586131006972;
        Sun, 05 Apr 2020 16:56:46 -0700 (PDT)
Received: from localhost.localdomain ([5.139.61.144])
        by smtp.googlemail.com with ESMTPSA id d21sm8980841ljc.49.2020.04.05.16.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 16:56:46 -0700 (PDT)
From:   Artem Borisov <dedsa2002@gmail.com>
Cc:     jikos@kernel.org, Artem Borisov <dedsa2002@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: alps: Add AUI1657 device ID
Date:   Mon,  6 Apr 2020 03:55:15 +0400
Message-Id: <20200405235517.18203-1-dedsa2002@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This device is used on Lenovo V130-15IKB variants and uses
the same registers as U1.

Signed-off-by: Artem Borisov <dedsa2002@gmail.com>
---
 drivers/hid/hid-alps.c | 1 +
 drivers/hid/hid-ids.h  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index fa704153cb00..c2a2bd528890 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -802,6 +802,7 @@ static int alps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		break;
 	case HID_DEVICE_ID_ALPS_U1_DUAL:
 	case HID_DEVICE_ID_ALPS_U1:
+	case HID_DEVICE_ID_ALPS_1657:
 		data->dev_type = U1;
 		break;
 	default:
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b18b13147a6f..324fddb37e27 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -81,7 +81,7 @@
 #define HID_DEVICE_ID_ALPS_U1		0x1215
 #define HID_DEVICE_ID_ALPS_T4_BTNLESS	0x120C
 #define HID_DEVICE_ID_ALPS_1222		0x1222
-
+#define HID_DEVICE_ID_ALPS_1657         0x121E
 
 #define USB_VENDOR_ID_AMI		0x046b
 #define USB_DEVICE_ID_AMI_VIRT_KEYBOARD_AND_MOUSE	0xff10
-- 
2.26.0

