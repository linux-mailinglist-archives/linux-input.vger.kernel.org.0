Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6910E347F73
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237203AbhCXRej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237216AbhCXReM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:12 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659BAC0613DE
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:12 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id w3so34249323ejc.4
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FHkipYTKnSstTFJnbmdtyQKucMWsrejAj9mUW3hzYUM=;
        b=dUF0+KwB9tywOuOSJN7KHib9Kyj/mxSFofYtmO0WjMyKiP1sOnIX73pcL5dWCmsJvx
         4XuYOG5Uck0eRnIJVqUgu2yed2C3XXiIXIfET9I2tdgDTq7zte11+1x//fPLnqF4epmm
         K4sR2dWrF2TYT3KRMkKnZ2d1H/DI63sKsZwulreFHlLVjFTzCqtjIrQJ6W9u/z4PqyAb
         0nGssOXfQAeqCcSqd5RtE+UcFkOHDHjZ9wI3yV7hyqbaxlHTuX1L/NGKq1SjC/X3r66F
         Hl0QVM0NwpgDQ9MYhrI/ovFk65C15grVvKJDOBB+9ID5q/SeVNwJnPqp+Y9FgcM2gAGt
         LCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FHkipYTKnSstTFJnbmdtyQKucMWsrejAj9mUW3hzYUM=;
        b=X7HWxAT894rPqOSgNuOqZ/AMb+1vhiPqoHhQjeakj62wocSI/jRosKGCeIfS1tm56H
         +Enn2FwweEwk3DR6aAgQ3rAx74YCGd9hl/oveGlJcnVFpByNV7TU79naS4Jqx/sHVNb0
         wLknF1dq6SLTUYo7VYRaQeepf6OlW1bXWPvQD55+LmbwKuEvmcayYARtlFJkfKa7zA7S
         3kWn9UbNHH6h8p88mWRgwZJ3HMea3nkzMTx7VKuQ3sW/iSd1BiKt4IVfQm5WR7Cd0WNC
         3kRLCzlt3WD48wCLx1vM/6CEYOOmmasbOqmQmjMxd7vU+eOmWYUAIrStVjr8/M69dj8l
         onTQ==
X-Gm-Message-State: AOAM530Zbt/uTzvxMhjohg/tGCBiJOftvWCo0bcbJD+af/Y4mbQE/4en
        YeoVQYQ5QQCVA6gsvpHnJCr5Aw==
X-Google-Smtp-Source: ABdhPJxeSr7aEdRF1BRPbkJkacLU9X6tluwT/TI5/mx4dRxSDXbOALvCJ/ejHQJz5B880dDFOCSAhw==
X-Received: by 2002:a17:907:7785:: with SMTP id ky5mr4814480ejc.133.1616607251078;
        Wed, 24 Mar 2021 10:34:11 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Zhang Lixu <lixu.zhang@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 03/25] HID: intel-ish-hid: pci-ish: Remove unused variable 'ret'
Date:   Wed, 24 Mar 2021 17:33:42 +0000
Message-Id: <20210324173404.66340-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/intel-ish-hid/ipc/pci-ish.c: In function ‘ish_resume_handler’:
 drivers/hid/intel-ish-hid/ipc/pci-ish.c:264:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Zhang Lixu <lixu.zhang@intel.com>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Daniel Drubin <daniel.drubin@intel.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/intel-ish-hid/ipc/pci-ish.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ipc/pci-ish.c b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
index 06081cf9b85a2..61efc30ed9afb 100644
--- a/drivers/hid/intel-ish-hid/ipc/pci-ish.c
+++ b/drivers/hid/intel-ish-hid/ipc/pci-ish.c
@@ -261,7 +261,6 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 	struct pci_dev *pdev = to_pci_dev(ish_resume_device);
 	struct ishtp_device *dev = pci_get_drvdata(pdev);
 	uint32_t fwsts = dev->ops->get_fw_status(dev);
-	int ret;
 
 	if (ish_should_leave_d0i3(pdev) && !dev->suspend_flag
 			&& IPC_IS_ISH_ILUP(fwsts)) {
@@ -273,7 +272,7 @@ static void __maybe_unused ish_resume_handler(struct work_struct *work)
 
 		/* Waiting to get resume response */
 		if (dev->resume_flag)
-			ret = wait_event_interruptible_timeout(dev->resume_wait,
+			wait_event_interruptible_timeout(dev->resume_wait,
 				!dev->resume_flag,
 				msecs_to_jiffies(WAIT_FOR_RESUME_ACK_MS));
 
-- 
2.27.0

