Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6CA93F8504
	for <lists+linux-input@lfdr.de>; Thu, 26 Aug 2021 12:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241088AbhHZKHk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Aug 2021 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240937AbhHZKHj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Aug 2021 06:07:39 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389ADC061757
        for <linux-input@vger.kernel.org>; Thu, 26 Aug 2021 03:06:52 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id mw10-20020a17090b4d0a00b0017b59213831so6260990pjb.0
        for <linux-input@vger.kernel.org>; Thu, 26 Aug 2021 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=KyCkOwX6FlAykrEfVDREM7slwqhWzjVtSiMdbpagDO4=;
        b=LgjRvH59s9Ccoi0kWYtI5CqxF5OUK1O5mRFtMOdjPda7viEmj5dsN9GwXQu3D8AUGs
         ALWBsj6M7kZ3DHllMof7rm9FJtnLZm6kMtX2tGLErVqT1NhG40Makw5kqmmRNvCeAyu9
         QxJNwJzhDhfBKkGpTO1m0ZjoJAURCZPn/H/RY8tWhyau1PkG0SDR6xL7OtbZ6D8VfpJG
         /ICI1dydna/j6Ztq/MUw3yhLSN2G3t2Y/luJESv1vw3IWz2zy6UdVXq1BfnKjgmVSr8i
         cTfHn/hE8H4d9q62Sbs/8cDwG+nEz/n2mDRR7BApG6ubveCKnO2x4S6Drsodhu1FE/hc
         TZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KyCkOwX6FlAykrEfVDREM7slwqhWzjVtSiMdbpagDO4=;
        b=XWS8AeK4DaTHXmmEux9gYEGfjW8oAgKNPf0CeZVzjy8/OrJK9U7jlNDcy7dExUmVfp
         NWRuLuUT1uCIj3wtUnx5sSP/wcGDBg0RCFJPjcjsjjiBM33Hj8RMObXMFmz9lxC83YxA
         O4G9ra2Y06RVVMHgJ2hdTIbZ5wQ6MLJ5HBlUW/OdZfrTVr/uE2pxDg9MKBVJ33KiQsjQ
         aZuTP5rNLDHCuoH2P6FW/FIxPMRwUO/Fv3MvOTv3JBI7SkVNm3NyQENTfjkt46q8g7xj
         I5tbVpBp6FD2RKfzIJYbLfxC3umbvCeoiUW3c9m4cdN6/OPGXcy9oxNO2oVsUE2bX7gN
         aMXA==
X-Gm-Message-State: AOAM531uka9NBSFbMseV0jojU90bVCf5zxVV4HpJCBcFUYhqup59ZbYe
        dbqP9/hY5Hhl7Z4Wyww76eUHx1Vit0rq
X-Google-Smtp-Source: ABdhPJwMNkPwuLMRtpOr1r+KTvWtHBhmpaFSHKPH9eOLpfcWOFty41sxUDZ5gQpbzSWosUEdoajzQQ==
X-Received: by 2002:a17:902:bf49:b0:136:7033:8963 with SMTP id u9-20020a170902bf4900b0013670338963mr2937843pls.75.1629972411656;
        Thu, 26 Aug 2021 03:06:51 -0700 (PDT)
Received: from localhost.localdomain ([175.157.109.217])
        by smtp.gmail.com with ESMTPSA id p16sm2364957pjz.44.2021.08.26.03.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 03:06:51 -0700 (PDT)
From:   "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fix inconsistent indentation
Date:   Thu, 26 Aug 2021 15:36:34 +0530
Message-Id: <20210826100634.24183-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch fix the inconsistent indentation
warning in hid_add_device().

Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk> 
---
 drivers/hid/hid-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index dbed2524fd47..76781f940186 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2401,10 +2401,10 @@ int hid_add_device(struct hid_device *hdev)
 	/*
 	 * Check for the mandatory transport channel.
 	 */
-	 if (!hdev->ll_driver->raw_request) {
+	if (!hdev->ll_driver->raw_request) {
 		hid_err(hdev, "transport driver missing .raw_request()\n");
 		return -EINVAL;
-	 }
+	}
 
 	/*
 	 * Read the device report descriptor once and use as template
-- 
2.17.1

