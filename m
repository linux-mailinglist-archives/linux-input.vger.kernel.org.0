Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58900C3F96
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 20:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbfJASPP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 14:15:15 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37748 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfJASPP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Oct 2019 14:15:15 -0400
Received: by mail-pg1-f193.google.com with SMTP id c17so10238509pgg.4
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2019 11:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H4Th4IEXCL9ir74s2zgWbQ/AH3VtZ8QsHbxgUcgvt2Q=;
        b=Dwdw0/GjhFwZckV674siggVRHgb7S6C50hRRYg+2+KNYSa2oH49DY2/6NftHuFlM+2
         cE27+C2Im1lagPA534PGPBBWfXKFHt34qH4scjbp9ORk7thOX6EHbtLLq0Cai8NVLHVv
         YymSErGty/wqCDittZB/zXXZxReMeF091wPnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H4Th4IEXCL9ir74s2zgWbQ/AH3VtZ8QsHbxgUcgvt2Q=;
        b=IYEc+grXJxepZ/6R0aed8WQUnhEzRMKn41pzVd4/f/PJIdtTjq64jCnMJQgMrVxfrj
         JPBwgzL25C6uCTstwouesx6LC/kuspmfj0dQzEBQjDv2la++nnyNNTMw4SDYMiLA+1rL
         Lr2q6eDegAr5scQi8lI7fjjzybutYfImixRbQQuGsxGub9GqPlOVMPOb+PfvaGaM6gAi
         Z7V16Gr+lAJenbxukak4bw3CsUmO2ZSqrdmCy9hdr8NppCt2vgU/MrZcf47qdJ3yHW6h
         dXAExMqYFxec05YeQCvm02EibyiBQ7NCDdcO7AN5xe9zR+VII4IZ2tgER7SAge/c00lX
         sgjQ==
X-Gm-Message-State: APjAAAVW7p5CDT8t+cDJLsG1tLrZ1yt/1+z55X/JDeHsylR7b0tP1CwC
        oPSIrefI6lVq4hs9WHDTfDc5Cg==
X-Google-Smtp-Source: APXvYqz5z5To1zbizqM5edNatDVKvyA2DH51v5JrkYve/OfJgWwCleZOYkNHTj+udOuMRE/i2qDuwA==
X-Received: by 2002:a63:9a11:: with SMTP id o17mr31176218pge.434.1569953713481;
        Tue, 01 Oct 2019 11:15:13 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com ([2620:15c:202:201:ffda:7716:9afc:1301])
        by smtp.gmail.com with ESMTPSA id dw19sm3449074pjb.27.2019.10.01.11.15.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 01 Oct 2019 11:15:12 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v3] Input: atmel_mxt_ts - Disable IRQ across suspend
Date:   Tue,  1 Oct 2019 11:15:03 -0700
Message-Id: <20191001181504.207486-1-evgreen@chromium.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Across suspend and resume, we are seeing error messages like the following:

atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)

This occurs because the driver leaves its IRQ enabled. Upon resume, there
is an IRQ pending, but the interrupt is serviced before both the driver and
the underlying I2C bus have been resumed. This causes EREMOTEIO errors.

Disable the IRQ in suspend, and re-enable it on resume. If there are cases
where the driver enters suspend with interrupts disabled, that's a bug we
should fix separately.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
 - Move enable_irq to the beginning of resume (Dmitry)

Changes in v2:
 - Enable and disable unconditionally (Dmitry)

 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 24c4b691b1c9..1627fcb27f35 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3155,6 +3155,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 		mxt_stop(data);
 
 	mutex_unlock(&input_dev->mutex);
+	disable_irq(data->irq);
 
 	return 0;
 }
@@ -3168,6 +3169,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	if (!input_dev)
 		return 0;
 
+	enable_irq(data->irq);
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-- 
2.21.0

