Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA8D3DA1BA
	for <lists+linux-input@lfdr.de>; Thu, 29 Jul 2021 13:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236430AbhG2LDz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Jul 2021 07:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236320AbhG2LDz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Jul 2021 07:03:55 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553F0C061765
        for <linux-input@vger.kernel.org>; Thu, 29 Jul 2021 04:03:52 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i10so6554366pla.3
        for <linux-input@vger.kernel.org>; Thu, 29 Jul 2021 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuEz2vPY6z/oR0MOk+A2rcy2JVtYQON76U+66EJ+VfA=;
        b=FD3RXoF6FgIO40xTQ3k1d76W0Jv+LbXR6t5Ac4506VswHy1DSm7EsbkVYSs3sAfbJk
         6dTRg+sEZscqrXx16PCsXdBu+UOb9z/dDmpULwUWBdDa4SLT8doIPT1KBiV1+cYngXPp
         XHRGIEH1q4RcQnjMvNmOt0mSisgli72oQkIaqbxFwo2NDAJn/bpq8VTZ99B1Z1cRnrAF
         KTLAsyZInyCPZYYX+HBTPICNP1R0ML6rzYhzXetDHWe4S5Ks+llgy7IR8iMOqHQhKy5R
         T696a8m5NN5ywytNabvpZHPdSJ6sI8wEoxB6kKxqLde2Sq+zzK87yj4Pp2J39m3/olLP
         WliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nuEz2vPY6z/oR0MOk+A2rcy2JVtYQON76U+66EJ+VfA=;
        b=ufNt38fVUJiURbsIdZuAkb3oEy+wgd0FsaZANVKU5y4Z69rLn8i78MPwattee47qnH
         MDaOQwsVeNzQDYXb8o9L5GMOFIgz7vDUeSS2hBeHdEfRur/srSUo2nBmy86uovunDjZv
         fBAr8TUHF8fKSeuaRmHbhB5V1IZQsfF3F2KS/aqRc6Yh+9mU7OzLNLJJzBfHLal2oH3J
         BdRKHrnBSD5hxkA6QZqq4pCmEv9CoP5JasdKIiWVrxwm4X3lbyupezfDXREglxXGLDL4
         41Mn4TtALjyfeyBoINeHB2XW1SouGcaNN5dMlCqhEgVk6N3E40I8wxJhNRbz4MmtDuvL
         FMZA==
X-Gm-Message-State: AOAM530pYkFnTBUCUqCfysS9Q/Y6VvsYqNoa+JQUjTO6Mx09prIG7cKR
        73EQ+UxzV3GsBkVaXJHYErA=
X-Google-Smtp-Source: ABdhPJzTz9HtS1xW8opBctT31RPCeKT3ydnWj3kPCcU3AK5v+CdDkiJvM/t1bSsNy6T+/uBgy61zMQ==
X-Received: by 2002:a17:902:7c81:b029:12b:6ac2:3ad9 with SMTP id y1-20020a1709027c81b029012b6ac23ad9mr4094568pll.76.1627556631867;
        Thu, 29 Jul 2021 04:03:51 -0700 (PDT)
Received: from localhost.localdomain (p909013-ipoe.ipoe.ocn.ne.jp. [153.243.10.12])
        by smtp.googlemail.com with ESMTPSA id w2sm8317337pjf.2.2021.07.29.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 04:03:51 -0700 (PDT)
From:   Mizuho Mori <morimolymoly@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Mizuho Mori <morimolymoly@gmail.com>
Subject: [PATCH] HID: apple: Fix logical maximum and usage maximum of Magic Keyboard JIS
Date:   Thu, 29 Jul 2021 20:03:25 +0900
Message-Id: <20210729110325.15089-1-morimolymoly@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Mizuho Mori <morimolymoly@gmail.com>
Apple Magic Keyboard(JIS)'s Logical Maximum and Usage Maximum are wrong.

Below is a report descriptor.

0x05, 0x01,         /*  Usage Page (Desktop),                           */
0x09, 0x06,         /*  Usage (Keyboard),                               */
0xA1, 0x01,         /*  Collection (Application),                       */
0x85, 0x01,         /*      Report ID (1),                              */
0x05, 0x07,         /*      Usage Page (Keyboard),                      */
0x15, 0x00,         /*      Logical Minimum (0),                        */
0x25, 0x01,         /*      Logical Maximum (1),                        */
0x19, 0xE0,         /*      Usage Minimum (KB Leftcontrol),             */
0x29, 0xE7,         /*      Usage Maximum (KB Right GUI),               */
0x75, 0x01,         /*      Report Size (1),                            */
0x95, 0x08,         /*      Report Count (8),                           */
0x81, 0x02,         /*      Input (Variable),                           */
0x95, 0x05,         /*      Report Count (5),                           */
0x75, 0x01,         /*      Report Size (1),                            */
0x05, 0x08,         /*      Usage Page (LED),                           */
0x19, 0x01,         /*      Usage Minimum (01h),                        */
0x29, 0x05,         /*      Usage Maximum (05h),                        */
0x91, 0x02,         /*      Output (Variable),                          */
0x95, 0x01,         /*      Report Count (1),                           */
0x75, 0x03,         /*      Report Size (3),                            */
0x91, 0x03,         /*      Output (Constant, Variable),                */
0x95, 0x08,         /*      Report Count (8),                           */
0x75, 0x01,         /*      Report Size (1),                            */
0x15, 0x00,         /*      Logical Minimum (0),                        */
0x25, 0x01,         /*      Logical Maximum (1),                        */

here is a report descriptor which is parsed one in kernel.
see sys/kernel/debug/hid/<dev>/rdesc

05 01 09 06 a1 01 85 01 05 07
15 00 25 01 19 e0 29 e7 75 01
95 08 81 02 95 05 75 01 05 08
19 01 29 05 91 02 95 01 75 03
91 03 95 08 75 01 15 00 25 01
06 00 ff 09 03 81 03 95 06 75
08 15 00 25 [65] 05 07 19 00 29
[65] 81 00 95 01 75 01 15 00 25
01 05 0c 09 b8 81 02 95 01 75
01 06 01 ff 09 03 81 02 95 01
75 06 81 03 06 02 ff 09 55 85
55 15 00 26 ff 00 75 08 95 40
b1 a2 c0 06 00 ff 09 14 a1 01
85 90 05 84 75 01 95 03 15 00
25 01 09 61 05 85 09 44 09 46
81 02 95 05 81 01 75 08 95 01
15 00 26 ff 00 09 65 81 02 c0
00

Position 64(Logical Maximum) and 70(Usage Maximum) are 101.
Both should be 0xE7 to support JIS specific keys(ろ, Eisu, Kana, |) support.
position 117 is also 101 but not related(it is Usage 65h).

There are no difference of product id between JIS and ANSI.
They are same 0x0267.
---
 drivers/hid/hid-apple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 833fcf07ff35..6ccfa0cb997a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -336,12 +336,19 @@ static int apple_event(struct hid_device *hdev, struct hid_field *field,
 
 /*
  * MacBook JIS keyboard has wrong logical maximum
+ * Magic Keyboard JIS has wrong logical maximum
  */
 static __u8 *apple_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
 	struct apple_sc *asc = hid_get_drvdata(hdev);
 
+	if(*rsize >=71 && rdesc[70] == 0x65 && rdesc[64] == 0x65) {
+		hid_info(hdev,
+			 "fixing up Magic Keyboard JIS report descriptor\n");
+		rdesc[64] = rdesc[70] = 0xe7;
+	}
+
 	if ((asc->quirks & APPLE_RDESC_JIS) && *rsize >= 60 &&
 			rdesc[53] == 0x65 && rdesc[59] == 0x65) {
 		hid_info(hdev,
-- 
2.25.1

