Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC63BA20D
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2019 13:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbfIVLlC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 07:41:02 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42346 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfIVLlC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 07:41:02 -0400
Received: by mail-pg1-f193.google.com with SMTP id z12so6260429pgp.9
        for <linux-input@vger.kernel.org>; Sun, 22 Sep 2019 04:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:message-id:mime-version:content-disposition:user-agent;
        bh=eEaxqTTfK2bFUDK9nZAPVdIjNfwI3q73Rob/B6vAAC0=;
        b=IrrYjWoA1ukoLa9//7YBipnFENx7On3zv2PFzwwK0v3sNIy+gAEwgCoH+pFarwNSdr
         P2K1YMBq5SFP63ihWr3ZrYtpIuaYZeDS3moCgjodvNuFeClUXQc4PHzBwmIj/xC2Njk5
         k9sWkAUXvxPrr6xgDrNoILTGVlXm1aQakZKrBU2WfU1KM6iXlW6Zx+tuMZT7DQdhlWOf
         ZKc3Z3jLncEMu2l3m0/BslJ3AK2O4wKWT3vnB4ZqrDpuwWTCa6X4h+HFIO5QfwLccbxz
         SPEB01vOHcLoRxAx0ya+ZwvUrwvUrxMtd7FZ0TP1OrrIbhuTGcqf0k+M/N6FVJ6xUgT3
         q2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:message-id:mime-version
         :content-disposition:user-agent;
        bh=eEaxqTTfK2bFUDK9nZAPVdIjNfwI3q73Rob/B6vAAC0=;
        b=maYYBbglzdr7HX9k95/flGVxXfDbQbjrAP1tlCGHgH7i4xm23oaNhyJJh73gqHM2jL
         5GcgV2xe08fvQBvMS4FnIKHYXRg12Z1EQDY/zNKJgGKMlx8aNvJGLfys6phm1eDoELdg
         YrXZuq0tLKxP9zpHrgAsHMxuwNIAeypj4Tz94iZ9LfgTX7YKNIFnDdlwlWUFfaD6Ay0J
         Q+nRUUrtotYLO58KYYg/qrjhkdFAPyW1ID1a/4Hv7ZZLnUKODMV715io4ULTcWzY0mOF
         P1H25x58gNqAu+occlMt/h/KZbo5Z/uqfz5Yu7ehvVs11LVFmIb4yHpWSpe07fLoTJZ8
         Vu8A==
X-Gm-Message-State: APjAAAXUsoY7Q0a6JnfU1aSm03TN+gXcXfH7n/2ZYEaUg6s2W5l3swl6
        hrQzW9nusqbCn2k2ZR9RpQQ=
X-Google-Smtp-Source: APXvYqxzZok2Lm0E0IUU6AO7WOkNbEZNI+nIRfEYH8h2/EPr7/Q2Zo3+C7vL4SKAZETciXmHTQBKSw==
X-Received: by 2002:a17:90a:a589:: with SMTP id b9mr15112892pjq.51.1569152461152;
        Sun, 22 Sep 2019 04:41:01 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id z20sm7777691pjn.12.2019.09.22.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 04:41:00 -0700 (PDT)
Date:   Sun, 22 Sep 2019 21:40:53 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     erazor_de@users.sourceforge.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        adam.zerella@gmail.com
Message-ID: <20190922114053.GA16684@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

<erazor_de@users.sourceforge.net>, Jiri Kosina <jikos@kernel.org>,
Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-input@vger.kernel.org
Bcc: 
Subject: [PATCH] hid: roccat: Convert type uint16_t to __le16
Reply-To: 

As pointed out by Sparse we have some warnings about
incorrect type assignments.

warning: incorrect type in assignment (different base types)
	expected unsigned short [usertype] checksum
	got restricted __le16 [usertype]
warning: cast to restricted __le16

This patch assumes we want the data type for 'data'
and 'checksum' to be LE based on the cpu_to_le16()
and similar assignments.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 drivers/hid/hid-roccat-kone.c | 2 +-
 drivers/hid/hid-roccat-kone.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 1a6e600197d0..c5434df1f5dc 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -252,7 +252,7 @@ static int kone_get_weight(struct usb_device *usb_dev, int *result)
 static int kone_get_firmware_version(struct usb_device *usb_dev, int *result)
 {
 	int retval;
-	uint16_t data;
+	__le16 data;
 
 	retval = kone_receive(usb_dev, kone_command_firmware_version,
 			&data, 2);
diff --git a/drivers/hid/hid-roccat-kone.h b/drivers/hid/hid-roccat-kone.h
index 4a1a9cb76b08..401037b4aed5 100644
--- a/drivers/hid/hid-roccat-kone.h
+++ b/drivers/hid/hid-roccat-kone.h
@@ -140,7 +140,7 @@ struct kone_settings {
 	uint8_t  unknown2[23];
 	uint8_t  calibration_data[4];
 	uint8_t  unknown3[2];
-	uint16_t checksum;
+	__le16   checksum;
 } __attribute__ ((__packed__));
 
 /*
-- 
2.21.0

