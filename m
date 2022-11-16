Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01B062C344
	for <lists+linux-input@lfdr.de>; Wed, 16 Nov 2022 17:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbiKPQA3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 11:00:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233578AbiKPQA1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 11:00:27 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFDFE4D5CC
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 08:00:26 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id b11so16933320pjp.2
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 08:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WtgaDNVhMgVXJ3N4E/yFTSNZOrv/diPIQziwuk/V+ko=;
        b=GcdWHrnJljIyEcbBvuhhOkkNgxC8FnhsyXDtre8wKn78n7GW/MVtMdAZihTKsfql6I
         tBg3HuT1IrVTXfNye81OFqeBTH2EAr9TMySl4sLHZOFDK9bO+hbFYJ4buR8afPQCcWH1
         WWp8LRAjXIvv58MTyUIGJaSOYG3faAWgXDEYKyluZY+yjEGC0qvoC+gXGatYG1294KB7
         np/RrFM/hg+hKd3fWKUUBjyCUHbXtg9QlNwULe2Ii6fzDH/HKk/SCvriqMeyy3h0JEqS
         uGy8JDnvwQvuTmcE8boU/j7+x0NmSNfIiy6ywirDVlmcNmtcwZeXQxv+uO6nJnRLrw2I
         xYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WtgaDNVhMgVXJ3N4E/yFTSNZOrv/diPIQziwuk/V+ko=;
        b=GfAJZen3+vkEb1mu18yd63p+7JIEQp9s140jbGoZYPDpLN5v4I524d1q7L/FI3bl41
         F/fa2c9DpRCw7iuUoH2731UogkL2tjYfcOsNmOW1wYmbRww5AWeWczSJT3uZn3gJhRxO
         mq/tyqxow+29I8grnAqu8yHJthywPrgWz5JV3R8HoHVVIyv/p+Yfo28ZpAeYqPnP5iIy
         nOcmo/pMsU7MjioiVURlTQvaqHBCfYsOMtbCc6ASt6Q4f5OqKpIXN4EdH5ChQ6f0vfDr
         a+Vd6d23A9sjHotUIbmrY3fRPWDVrvvnb0KB20ZuMI1aUEVJ0x5cT98Elr4+rGXCz9k1
         bMJw==
X-Gm-Message-State: ANoB5pl8OG1fvYTE7cq6+c7O3qAtq5NDanjpOS/6D0cD4x1kCBBB2X7t
        8G+S2/uTCIENgtUJUrqFbKa6R9jtaVlfrQ==
X-Google-Smtp-Source: AA0mqf4cciPNowv2+ziEGXp1O7azCOOv2vsglmNzYwTin3heHnh7oSNOkfT1r6jBbS5YnsuFxahsyA==
X-Received: by 2002:a17:90b:3608:b0:213:3521:f83a with SMTP id ml8-20020a17090b360800b002133521f83amr4339851pjb.84.1668614426439;
        Wed, 16 Nov 2022 08:00:26 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902edc700b0018693643504sm12381854plk.40.2022.11.16.08.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:00:25 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 1/2] HID: playstation: fix DualShock4 bluetooth memory corruption bug.
Date:   Wed, 16 Nov 2022 08:00:21 -0800
Message-Id: <20221116160022.51829-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The size of the output buffer used for output reports was not updated
to the larger size needed for Bluetooth. This ultimately resulted
in memory corruption of surrounding structures e.g. due to memsets.

Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index bae3e712a562..f5e0d06d3cd8 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -2461,7 +2461,7 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	ds4->output_worker_initialized = true;
 	hid_set_drvdata(hdev, ds4);
 
-	max_output_report_size = sizeof(struct dualshock4_output_report_usb);
+	max_output_report_size = sizeof(struct dualshock4_output_report_bt);
 	ds4->output_report_dmabuf = devm_kzalloc(&hdev->dev, max_output_report_size, GFP_KERNEL);
 	if (!ds4->output_report_dmabuf)
 		return ERR_PTR(-ENOMEM);
-- 
2.38.1

