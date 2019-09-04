Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F00BBA93FF
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2019 22:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729727AbfIDUo7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Sep 2019 16:44:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40024 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfIDUo7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Sep 2019 16:44:59 -0400
Received: by mail-pf1-f193.google.com with SMTP id x127so29891pfb.7
        for <linux-input@vger.kernel.org>; Wed, 04 Sep 2019 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=vnrHMw4gB/Qh2iK4DZCZ2LhIIegPX2hnPgxOxmqO+po=;
        b=mV8LF3ccV3sYkimNAIjUieFAD49gtdH7oqr0FALvV30G9dX0Nr7930E5Y5/jKsuqDo
         7CfVjPH2OobrGwL0IrqeDhX9CDnvwLS4N0IPtiNHaNIQSmq/F1hZiMBStboXuUxcQXJu
         lRyyAKbnwwPaG9N5Bi+o3sd0KuWpLqAUSWoBNVg1sJl7s0HjvkCRYVeMUrnWCHFxyulM
         PaSdkAvg6mHy0TYI8+Mr3hZGQD6DGEt3MztZ29AAsjTOmltGmHeB0Ab8qwVqi5WlNvB+
         1A1YhbGHGbmQd5l9xhXULugasVBcZCZqcwX1g1w5DU8+kbT9lP3CmOE5mA6DhO9LSVvZ
         vRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vnrHMw4gB/Qh2iK4DZCZ2LhIIegPX2hnPgxOxmqO+po=;
        b=b7efutnSbI2k/oKrhqnxvxysh1MWZQIm0LsUXdCq98kj3gSAz/6RruUAveEvEF8E7D
         qneYInvTk16GJucCjUKpwq6/0m1Xta/AFGPdKQSbgyVUnG3T8fhzUSDIlA00B8yQSYXn
         IeO80LI11zt9C/oS7dkGFNKEKk9363BlgAqOVRoc4tcNUYOLBOQdmQmIH976nKaycbLl
         L3YoFWbsYBwFhj9U6+Pykrec7hvzQTK1w5U3XtmWHGxdbpgTn4Ar+1QyUm2vMCm2SqCK
         IcHp6wx8V92GNPcQG3GuDKsZB0HkeZJ8K3TuG8bkW4mdy9LEwhZDgzayZSoH9VBEAxyj
         jZ5Q==
X-Gm-Message-State: APjAAAUouFHi1U8M9zxIiCJ2hWfn3Ua0/gSiomZMTuIdk/b+lGe40UNR
        QTjBb84qc/iM4xXndWTm9mxsI8gJVsM=
X-Google-Smtp-Source: APXvYqyv4SfhOS+EpWUgELBCiRtZ9ikzhrAJEEJXUXNcIdUsNacKmfH4V3lZrIwtSj4wLrWuEhUX1Q==
X-Received: by 2002:a17:90a:1916:: with SMTP id 22mr171616pjg.62.1567629898488;
        Wed, 04 Sep 2019 13:44:58 -0700 (PDT)
Received: from pingc-XPS-8500.corp.onewacom.com (75-148-82-17-Oregon.hfc.comcastbusiness.net. [75.148.82.17])
        by smtp.gmail.com with ESMTPSA id bb7sm3550647pjb.2.2019.09.04.13.44.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Sep 2019 13:44:57 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org
Cc:     jkosina@suse.cz, Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: add new MobileStudio Pro 13 support
Date:   Wed,  4 Sep 2019 13:43:23 -0700
Message-Id: <1567629803-12451-1-git-send-email-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

wacom_wac_pad_event is the only routine we need to update.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>

---
Patch is based on Jiri's for-5.4/wacom branch
---
 drivers/hid/wacom_wac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 6b739c1..85a3082 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2093,14 +2093,14 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 		    (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
 		     hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
 		     hdev->product == 0x392 ||				  /* Intuos Pro 2 */
-		     hdev->product == 0x399)) {				  /* MobileStudio Pro */
+		     hdev->product == 0x398 || hdev->product == 0x399)) { /* MobileStudio Pro */
 			value = (field->logical_maximum - value);
 
 			if (hdev->product == 0x357 || hdev->product == 0x358 ||
 			    hdev->product == 0x392)
 				value = wacom_offset_rotation(input, usage, value, 3, 16);
 			else if (hdev->product == 0x34d || hdev->product == 0x34e ||
-				 hdev->product == 0x399)
+				 hdev->product == 0x398 || hdev->product == 0x399)
 				value = wacom_offset_rotation(input, usage, value, 1, 2);
 		}
 		else {
-- 
2.7.4

