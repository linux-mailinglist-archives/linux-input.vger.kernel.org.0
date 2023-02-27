Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DE76A3904
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 03:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbjB0CuU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Feb 2023 21:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjB0CuT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Feb 2023 21:50:19 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7C859EF4
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 18:50:18 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id q31-20020a17090a17a200b0023750b69614so4757948pja.5
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 18:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1677466218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AhNJCpM44JtaO0Y1PgOfTDKcjrFJKcFtwcLdZoboSiU=;
        b=BLAgD25MTW0SPmJZOSfba2Jcuw6bULCOVNgE4hF7rGd5ZAaPsVKhXF/vAtb64VbL7z
         DH64eAFOqrfGGPLkkjfjSlMCQlzsoc/z6gUX99BQv+TX/IxKo4KDsZNg1Ofv9i6ihcZI
         SHeXd7fJ2VwderdGudbZrkox/KzMICbdSWiGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677466218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhNJCpM44JtaO0Y1PgOfTDKcjrFJKcFtwcLdZoboSiU=;
        b=UmmLqNbgr9ZaLK1nkk0ty7IwbrA5fHxBk+KRVvksv73X88R6RapM/j0AL9Ku0wgt9r
         vVnM6CVtMXJjDst7zlkpKD2NV/ZTYx5Z4UyQxes11gSyM8BTIIiCkaDT2MOoJ2GqVcrb
         /ZafklQg5FaVWKB+Xk+Df4zGSvqLwH45wsqsvW+XTiu0nYTM/niYVcyJxkVxgvPkUqTc
         A0imYxeBshTxPWwPzwIK0rIJ8cUjknWLofRIoF7yYhKTBoIQ9kFkVQwC62kguMOSHr64
         ZFtktoQox7eShAGA5Sta2oU0iwePGy3vFlPrR4hTUsf5G2pVltrm5CRyM6QBaaXN0TTH
         l3BQ==
X-Gm-Message-State: AO0yUKXWVABiJr6SxluZBNeZdeUsncbbkm8yxCWOVjyiPb1vKxJfNF7x
        siGv4eYjcFvXKISkWymJPIEbQQ==
X-Google-Smtp-Source: AK7set9Fg12IfqdQ7uYu7a67t8Q148siTsaPd2Q3inBFSEV39T8ABuvHgStR86B0OcWX++jtaI6Q+w==
X-Received: by 2002:a17:90b:17d0:b0:233:f393:f6cd with SMTP id me16-20020a17090b17d000b00233f393f6cdmr26959778pjb.5.1677466218169;
        Sun, 26 Feb 2023 18:50:18 -0800 (PST)
Received: from rekanorman3.syd.corp.google.com ([2401:fa00:9:14:a541:6cf2:a513:5418])
        by smtp.gmail.com with ESMTPSA id s6-20020a17090a5d0600b002347475e71fsm3192449pji.14.2023.02.26.18.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 18:50:17 -0800 (PST)
From:   Reka Norman <rekanorman@chromium.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Reka Norman <rekanorman@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Li Qiong <liqiong@nfschina.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: intel-ish-hid: ipc: Fix potential use-after-free in work function
Date:   Mon, 27 Feb 2023 13:49:38 +1100
Message-Id: <20230227024938.2265017-1-rekanorman@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When a reset notify IPC message is received, the ISR schedules a work
function and passes the ISHTP device to it via a global pointer
ishtp_dev. If ish_probe() fails, the devm-managed device resources
including ishtp_dev are freed, but the work is not cancelled, causing a
use-after-free when the work function tries to access ishtp_dev. Use
devm_work_autocancel() instead, so that the work is automatically
cancelled if probe fails.

Signed-off-by: Reka Norman <rekanorman@chromium.org>
---

 drivers/hid/intel-ish-hid/ipc/ipc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-ish-hid/ipc/ipc.c
index 15e14239af829..a49c6affd7c4c 100644
--- a/drivers/hid/intel-ish-hid/ipc/ipc.c
+++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2014-2016, Intel Corporation.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
 #include <linux/delay.h>
@@ -621,7 +622,6 @@ static void	recv_ipc(struct ishtp_device *dev, uint32_t doorbell_val)
 	case MNG_RESET_NOTIFY:
 		if (!ishtp_dev) {
 			ishtp_dev = dev;
-			INIT_WORK(&fw_reset_work, fw_reset_work_fn);
 		}
 		schedule_work(&fw_reset_work);
 		break;
@@ -940,6 +940,7 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 {
 	struct ishtp_device *dev;
 	int	i;
+	int	ret;
 
 	dev = devm_kzalloc(&pdev->dev,
 			   sizeof(struct ishtp_device) + sizeof(struct ish_hw),
@@ -975,6 +976,12 @@ struct ishtp_device *ish_dev_init(struct pci_dev *pdev)
 		list_add_tail(&tx_buf->link, &dev->wr_free_list);
 	}
 
+	ret = devm_work_autocancel(&pdev->dev, &fw_reset_work, fw_reset_work_fn);
+	if (ret) {
+		dev_err(dev->devc, "Failed to initialise FW reset work\n");
+		return NULL;
+	}
+
 	dev->ops = &ish_hw_ops;
 	dev->devc = &pdev->dev;
 	dev->mtu = IPC_PAYLOAD_SIZE - sizeof(struct ishtp_msg_hdr);
-- 
2.39.2.637.g21b0678d19-goog

