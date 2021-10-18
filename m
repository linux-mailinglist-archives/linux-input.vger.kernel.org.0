Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C45431A12
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 14:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhJRMxq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 08:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRMxp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 08:53:45 -0400
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7773C06161C;
        Mon, 18 Oct 2021 05:51:34 -0700 (PDT)
Received: by mail-ua1-x931.google.com with SMTP id a17so1850676uax.12;
        Mon, 18 Oct 2021 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/nfbXXf+EuyVINKupRSDZdDXc4S8gFPqrfjLCLl4V00=;
        b=MAGHPcnb/9gYIWnkZcbnZFNp8uEqcMIjJR2Zl2CB2FEqNkWOgE6+wCROpoiBf29Hh5
         IgpCnQbP86IJUarKUL6VdnfemqNWHr3/RuOOxtu9xkfjI6rmvlkgGBxcw2pO20UOnRtV
         X/xS5pMigMfWQmaBzLHtdoU8WiR94BM4xzfGSIYbLmSd2qwW/utsCGxkLXA0CMPxVI4j
         5XdQbvCfYONT/JBUQrIg6B5ZBaCnrlvzRuqREEKKGVjWCzqJc+TsJDLNX+Jn0vzzxVDY
         hgQ75DvGz2T9e9W6YTGOWczeuB/oE90yO9NsyOlqMFRsal0d0D9ACTG0i0CK4k4FSFMW
         5BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/nfbXXf+EuyVINKupRSDZdDXc4S8gFPqrfjLCLl4V00=;
        b=BMAdRn9olyFdIvkj136DPPO7AX4hw45h5LHdutc01IGRgTZSJRTi/bfG+BkNl6SWaO
         /fxj8NTewmjBa8hrZCGge8eTsoUDOXs1S4plpyFq6SH23skeSwlvpBNnnQe6MndoLqvT
         rE1RYpUkkC1kQGtQFCaZ2Dr2oeYoyNVeeQD9GHDJMxxw85mmEPfIM+qM/Fxky2ceGxlo
         8D1o0CmYVE8eUL1nwNkRS7c5ChefVapCBhzRWZzHDSMComRrNGELSGCwpPkWCMO2dlHL
         LUgqeoew4TEL0W1ldOQCxsy4oT61PEffVxI6c1URjSlXKZEAPE7mBcZo1FL9P9kfCtJz
         axEw==
X-Gm-Message-State: AOAM530YPpRZQC0B+yu1TgWGMarBwYFlTa56OfVTBme1PT+sEI3C2/1X
        6He7M8KEo+D61rMdQN9Ht/U=
X-Google-Smtp-Source: ABdhPJykCtIT1u9WUnVsysQNWFH1/Q7hBEPJNpDptCqrD3goNwNNMu/3PJAMQiQRSdBF2usXQQrmgA==
X-Received: by 2002:a67:6044:: with SMTP id u65mr27001050vsb.41.1634561493877;
        Mon, 18 Oct 2021 05:51:33 -0700 (PDT)
Received: from rog-zephyrus.. ([201.46.20.90])
        by smtp.gmail.com with ESMTPSA id f27sm8812128vsl.7.2021.10.18.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 05:51:33 -0700 (PDT)
From:   "Vinicius A. Reis" <angiolucci@gmail.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Vinicius A. Reis" <angiolucci@gmail.com>
Subject: [PATCH] HID: hid-asus: Maps 0x35 to KEY_SCREENLOCK
Date:   Mon, 18 Oct 2021 09:51:10 -0300
Message-Id: <20211018125110.3224-1-angiolucci@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Asus laptops are able to turn both the display and keyboard backlit off
by pressing a dedicated "turn display off" key (usually fn+f6). However,
on Linux systems, this key has no effect at all since most desktop
environments don't deal with KEY_DISPLAY_OFF. By mapping that key to
KEY_SCREENLOCK instead, would enable it to work as close as intended by
the manufacturer, since desktop envirorments would handle this as a
screen lock request by the user, locking the screen (and turning both
the display and keyboard backlit off on environments that support it).

Signed-off-by: Vinicius A. Reis <angiolucci@gmail.com>
---
 drivers/hid/hid-asus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index f3ecddc519ee..e5c7bfa68cd6 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -854,7 +854,9 @@ static int asus_input_mapping(struct hid_device *hdev,
 		switch (usage->hid & HID_USAGE) {
 		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
 		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
-		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
+		case 0x35:
+			asus_map_key_clear(KEY_SCREENLOCK);
+			break;
 		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
 		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
 		case 0x82: asus_map_key_clear(KEY_CAMERA);		break;
-- 
2.32.0

