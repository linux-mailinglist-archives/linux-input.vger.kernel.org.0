Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B161215BF
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 19:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731933AbfLPSTa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 13:19:30 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:43424 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731307AbfLPST1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 13:19:27 -0500
Received: by mail-pj1-f67.google.com with SMTP id g4so3335365pjs.10
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2019 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PxmKhf4EN52hvBuRrEZEydHfqYeSioUUZN+MZi2mPE=;
        b=VHM7somSpN2ns38KusljMlXA585eJcrYEVekkMnfNIpaqmHL4MMrHTwYgk8oRlppF4
         6kFwP8uIDgeTxzVFG0W8gaT+8Z4B/S6AM79xEpX8urxYeiSFWORQJYJvmcGUOsTMNjpC
         OaqEaxuAw3KjpuiEhZC5PzaQK+iZjwGRkodFV0Gfz+KlPrjtbHLepFyuQvXPcvE1YHyK
         +Ct3sbGu7KCdDNMCUSd69GUi3oHKZqhranedrAdZS4JNLHvjQ5GtZjDU9Nk/DMX68Eg9
         p7ZF/hKM0LRjnrNB5cIf5NcuEVub7h25GRFrj9HQGHOgE4TtcHdPNCk77svWtBlguZen
         ZmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PxmKhf4EN52hvBuRrEZEydHfqYeSioUUZN+MZi2mPE=;
        b=kQtc+oSXHPGmWbtaQRNmgMWrwPgqvid1bMydLSFL8DMENo+tw9w7EvycH5rsNF3i+M
         5bmQjDKAh1DRPRNUbGsPNjtjooFDVWbTC2XEhxrP5rc07PuCBbzwTQyXe8W0ZaM5uLjW
         twX8P7xIAFVTq3R3HahaL85Axrm1xhuysNoVUDmF7CWp/6ZC48Gx7VDi//6kwifS4n5+
         +d3IltwZ0PFdw1K2iE1uZkIRo+718aGZT32aZvzlJvV5t8BsH6vnerbL8sejMR12/DSW
         hzQQTO8CSBcvOV5g05nkbBkcf9RFjkRRZf/gx31zPSsdFFWzuVxfB3h2NidzW0BjLWl1
         P6bg==
X-Gm-Message-State: APjAAAUcpB3yaELf2FyGA228WTRtbG0cnhlaiaULR4/huYXBRZAe/ko9
        XvK0KVHpJC4pasE1lLTQo1JgZhRj
X-Google-Smtp-Source: APXvYqwuc6wV7AAfstefWtsjI5s5vHI353+aCdntXBNqxs+UBRPC2wrXtYotCu7fYNEDNYnKZy8k9A==
X-Received: by 2002:a17:90a:234f:: with SMTP id f73mr449097pje.109.1576520366200;
        Mon, 16 Dec 2019 10:19:26 -0800 (PST)
Received: from US-191-ENG0002.corp.onewacom.com (75-148-82-17-Oregon.hfc.comcastbusiness.net. [75.148.82.17])
        by smtp.gmail.com with ESMTPSA id e20sm22894725pff.96.2019.12.16.10.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:19:25 -0800 (PST)
From:   "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Recognize new MobileStudio Pro PID
Date:   Mon, 16 Dec 2019 10:18:57 -0800
Message-Id: <20191216181857.10783-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Gerecke <killertofu@gmail.com>

A new PID is in use for repaired MobileStudio Pro devices. Add it to the
list of devices that need special-casing in wacom_wac_pad_event.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_wac.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index ccb74529bc78..d99a9d407671 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2096,14 +2096,16 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 		    (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
 		     hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
 		     hdev->product == 0x392 ||				  /* Intuos Pro 2 */
-		     hdev->product == 0x398 || hdev->product == 0x399)) { /* MobileStudio Pro */
+		     hdev->product == 0x398 || hdev->product == 0x399 ||  /* MobileStudio Pro */
+		     hdev->product == 0x3AA)) {				  /* MobileStudio Pro */
 			value = (field->logical_maximum - value);
 
 			if (hdev->product == 0x357 || hdev->product == 0x358 ||
 			    hdev->product == 0x392)
 				value = wacom_offset_rotation(input, usage, value, 3, 16);
 			else if (hdev->product == 0x34d || hdev->product == 0x34e ||
-				 hdev->product == 0x398 || hdev->product == 0x399)
+				 hdev->product == 0x398 || hdev->product == 0x399 ||
+				 hdev->product == 0x3AA)
 				value = wacom_offset_rotation(input, usage, value, 1, 2);
 		}
 		else {
-- 
2.24.1

