Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3091D1DAE
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 20:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389529AbgEMSka (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 14:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733166AbgEMSka (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 14:40:30 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E722C061A0C;
        Wed, 13 May 2020 11:40:30 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 72so252855otu.1;
        Wed, 13 May 2020 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:date:subject;
        bh=UxFgBfxYrtbfoSRrOJwSR/jyUGAcjc3AvR5Q5DZlML4=;
        b=WWSgjyrCoTbyAWUxcuhfmVBWMnDa/jr0mgszsCK06LeZ7T6hNUulr/inWZhSUl/Ezi
         DyDQ6QCTwZSd2IpimRKqvKKFRPnlUgjbqcNI0f9vOZYB2S5HIud7LUGgnEKUT5QsZzT5
         mpWRflLfR3jn7FdB6vKWgvRxda7/Yc0+H6U6cB/MRB2mm7ejQbWWRRaCBVSql9L6NhnK
         PFn4eIV1VPXGbSj8l/qx4K47ZMOLNo1zRwgCa2n0C1CSqZao4YENbHVPdWaPT4MbQUpx
         wek+nx01r+715FsDqJwkbCmrTXufoYYn2J2iBsxLDtZFsU/Z7Wg8l+AFOJxNXqRCDPMU
         z0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:date:subject;
        bh=UxFgBfxYrtbfoSRrOJwSR/jyUGAcjc3AvR5Q5DZlML4=;
        b=fryzC6BZw+ZEjKGDHgh+72sm8YU0f38zTsAUH76lEmV+kCirRQ5YcYemrSqNSKXfQl
         awF2c7uwF1K1e6HC4xsr19vyl2WIgbuSfFW+dAkj3MfzTOz24YlAcHl5E9JvTCiCLXjm
         PfHEMAcudYc/2vBEu0SuPjmsKQf4pYfifAghOwbaZnQkkuXdFxSo06ITDWOmgwl5UkHV
         TnfFhmn82tGjoGpEHc6xzuHJpmEct8vfFc4x4hETk3fmwsaVmMVYhIKex1r+9Sd9/8zj
         AF2CVOgYWbj7ZK2S8Cc6hNWFWUM9qDYb1zQ56oRhMTZChcWPHV+Tqx+sBRmwNkQjO0uW
         vbfA==
X-Gm-Message-State: AOAM533SD2cbFWPdNmNIH3o1J+nSzvdeH/aVfmaHi0YlSY53xBfWNj3b
        JWQlmuYWIRepYF4p2x+wp+E=
X-Google-Smtp-Source: ABdhPJzYMTolrbvJsxED0OyBKcnX7Ev6/+qqUrrtWH2tXqca0oe0DZLCUoeSbkoWWuokmgUcd9LVjw==
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr597103otf.31.1589395229593;
        Wed, 13 May 2020 11:40:29 -0700 (PDT)
Received: from localhost (cpe-70-112-70-240.austin.res.rr.com. [70.112.70.240])
        by smtp.gmail.com with ESMTPSA id v17sm6222113oif.51.2020.05.13.11.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 11:40:28 -0700 (PDT)
Message-ID: <5ebc3f1c.1c69fb81.772f9.7003@mx.google.com>
From:   scott.shumate@gmail.com
Date:   Wed, 13 May 2020 13:39:26 -0500
Subject: [PATCH] HID: sony: Fix for broken buttons on DS3 USB dongles
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix for non-working buttons on knock-off USB dongles for Sony
controllers. These USB dongles are used to connect older Sony DA/DS1/DS2
controllers via USB and are common on Amazon, AliExpress, etc.  Without
the patch, the square, X, and circle buttons do not function.  These
dongles used to work prior to kernel 4.10 but removing the global DS3
report fixup in this commit exposed the problem:

commit e19a267b9987 Author: Roderick Colenbrander
 <roderick.colenbrander@sony.com>
Date:   Tue Mar 7 15:45:08 2017 -0800

    HID: sony: DS3 comply to Linux gamepad spec

Many people reported the problem on the Ubuntu forums and are working
around the problem by falling back to the 4.9 hid-sony driver.

The problem stems from these dongles incorrectly reporting their button
count as 13 instead of 16.  This patch fixes up the report descriptor by
changing the button report count to 16 and removing 3 padding bits.

Signed-off-by: Scott Shumate <scott.shumate@gmail.com>
---
diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 4c6ed6ef31f1..2f073f536070 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -867,6 +867,23 @@ static u8 *sony_report_fixup(struct hid_device *hdev, u8 *rdesc,
 	if (sc->quirks & PS3REMOTE)
 		return ps3remote_fixup(hdev, rdesc, rsize);
 
+	/*
+	 * Some knock-off USB dongles incorrectly report their button count
+	 * as 13 instead of 16 causing three non-functional buttons.
+	 */
+	if ((sc->quirks & SIXAXIS_CONTROLLER_USB) && *rsize >= 45 &&
+		/* Report Count (13) */
+		rdesc[23] == 0x95 && rdesc[24] == 0x0D &&
+		/* Usage Maximum (13) */
+		rdesc[37] == 0x29 && rdesc[38] == 0x0D &&
+		/* Report Count (3) */
+		rdesc[43] == 0x95 && rdesc[44] == 0x03) {
+		hid_info(hdev, "Fixing up USB dongle report descriptor\n");
+		rdesc[24] = 0x10;
+		rdesc[38] = 0x10;
+		rdesc[44] = 0x00;
+	}
+
 	return rdesc;
 }
 
