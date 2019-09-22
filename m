Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3C0BA212
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2019 13:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728598AbfIVLpD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Sep 2019 07:45:03 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37657 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbfIVLpD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Sep 2019 07:45:03 -0400
Received: by mail-pg1-f194.google.com with SMTP id c17so6280539pgg.4
        for <linux-input@vger.kernel.org>; Sun, 22 Sep 2019 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=M+gsrIYxCuJ6PR2ixxOQu/G74Bnmn11J/uv7JZ/wiZY=;
        b=oRoXF1Vi0n+yx07vljB3qTyGtlyfaBvFaTh8Z64rz+b9QF0BiWozVp1int86p8HISP
         ITnOSjhs3g4xPM1YyWXgYw2iTPTxkY/anShBBE/EtnkHNmgbuWH+XsGN6gc34M8weV7P
         rzj//tUTtHClssR3FD20tSXrc22dPZ17yqqKwv8BmgHnNeviEJwi58gB88qrOtHdsmNz
         6WgpvSkjl0LISNWE5efgVKEPA9KYeH3OXknCyWzGJhFOv/khz4sq3Ko9sOpeqhY/AWtG
         TXC9P0RgRoir9b+8hdALIFR03/0A3gyMEjZ9EdT79AX8WpvH91gzPgLnpGjROt0N558m
         OxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=M+gsrIYxCuJ6PR2ixxOQu/G74Bnmn11J/uv7JZ/wiZY=;
        b=p5CsLUpzI9tDIvHPzBkzur7Bvg2M8ghdaGFfeqyx1pBRbu8kyazSjjBGjvhMWUSDIw
         qapOhERcikbemsa087S+Qz6Pnh25H9C7h04k2ZpnDPH8LWPUimfapDsrfTHr1LqzRk7m
         6RaWzXbxFg4s3VOFlTDExNrF1YWhql08p5+vp2/PAxKWda7aWpCmo0BLv621vpg6f47v
         keMGAGumZ6WSXFbk/0t+jrnVBfYc/1z7mwRU1H8PSPNXyf5vQdQWzNjzl6uh3jNiMq0g
         zkOha4e0r9pnXdk576Pz7Hxzer1a+5bq//2UwjX676qO1Gqb8MZ4ZrgIFb/vRQ69QuKH
         GfEA==
X-Gm-Message-State: APjAAAWoVV6Np2d0LZAWIBTFkO6Zg6yWnwh+pgHzG56TUpW5t4D+flay
        4nlBMbvgUvK5iet6sPBnwHzqkuHG4JM0QQ==
X-Google-Smtp-Source: APXvYqwNyXIJvEreiDYG928TkECd+BXfSIhfQe2zrp63O8CtcmKa6K1sC/QjZrSFK4yH7Fte0zBVjw==
X-Received: by 2002:a17:90a:b302:: with SMTP id d2mr8165976pjr.3.1569152702431;
        Sun, 22 Sep 2019 04:45:02 -0700 (PDT)
Received: from gmail.com (ip-103-85-37-119.syd.xi.com.au. [103.85.37.119])
        by smtp.gmail.com with ESMTPSA id s1sm13578717pjs.31.2019.09.22.04.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2019 04:45:01 -0700 (PDT)
Date:   Sun, 22 Sep 2019 21:44:55 +1000
From:   Adam Zerella <adam.zerella@gmail.com>
Cc:     Stefan Achatz <erazor_de@users.sourceforge.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, adam.zerella@gmail.com
Subject: [PATCH] hid: roccat: Convert type uint16_t to __le16
Message-ID: <20190922114455.GA17050@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

