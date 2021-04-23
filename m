Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F216D369B03
	for <lists+linux-input@lfdr.de>; Fri, 23 Apr 2021 21:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232619AbhDWTse (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Apr 2021 15:48:34 -0400
Received: from h4.fbrelay.privateemail.com ([131.153.2.45]:58431 "EHLO
        h4.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229691AbhDWTsd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Apr 2021 15:48:33 -0400
X-Greylist: delayed 806 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 15:48:33 EDT
Received: from MTA-13-4.privateemail.com (mta-13.privateemail.com [198.54.118.203])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 05060812B5;
        Fri, 23 Apr 2021 15:34:30 -0400 (EDT)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
        by mta-13.privateemail.com (Postfix) with ESMTP id BFFD68006D;
        Fri, 23 Apr 2021 15:34:27 -0400 (EDT)
Received: from hal-station.. (unknown [10.20.151.233])
        by mta-13.privateemail.com (Postfix) with ESMTPA id 5361080067;
        Fri, 23 Apr 2021 15:34:27 -0400 (EDT)
From:   Hamza Mahfooz <someguy@effective-light.com>
To:     kernel-janitors@vger.kernel.org
Cc:     linux-input@vger.kernel.org,
        Hamza Mahfooz <someguy@effective-light.com>
Subject: [PATCH] hid: remove the unnecessary redefinition of a macro
Date:   Fri, 23 Apr 2021 15:34:05 -0400
Message-Id: <20210423193405.3828-1-someguy@effective-light.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

USB_VENDOR_ID_CORSAIR is defined twice in the same file with the same
value.

Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
---
 drivers/hid/hid-ids.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 67fd8a2f5aba..133101b567f2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -299,7 +299,6 @@
 #define USB_VENDOR_ID_CORSAIR		0x1b1c
 #define USB_DEVICE_ID_CORSAIR_K90	0x1b02
 
-#define USB_VENDOR_ID_CORSAIR           0x1b1c
 #define USB_DEVICE_ID_CORSAIR_K70R      0x1b09
 #define USB_DEVICE_ID_CORSAIR_K95RGB    0x1b11
 #define USB_DEVICE_ID_CORSAIR_M65RGB    0x1b12
-- 
2.31.1

