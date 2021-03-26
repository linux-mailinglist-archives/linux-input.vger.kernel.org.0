Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC9734A9DC
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:35:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCZOfQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhCZOfI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:08 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7BCC0613BE
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:06 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id x13so5845599wrs.9
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+wgJT+2rlYaTQGPBJtoa9jo055QORNuijpExOiSwidg=;
        b=lhmKo8zYKTVyHkCYOUL8Dmj6IslDEfKHrK7GAtHgyFM+v+1DMGJttuRZCYrRqhawjr
         PirvVfHNF9jYSluJR4hybQ/3tCmoo56VvcgBlA+HranEzseWKphmEjEU5UQfxAVYpSiX
         dK4LtlrTSfBVJHwjXbG8sx4RFK1aZ8ZH+8gERBrmfT6APFWq4Cbzfiso0lau9kKcrEzM
         3GLT7dNmExpzi8s+Mra9LKmfWL4lvMp9zuAGuMKbSjaKMPOzg2NrgdZzLrEPgryvJtEN
         ctf+Sb46ftgGZq2s29qGWzB8fXw0zGb9zm6bzFwFJ1Oo00AaQ5fL5BtlnBkax8hKKqJW
         5hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+wgJT+2rlYaTQGPBJtoa9jo055QORNuijpExOiSwidg=;
        b=Lx4JGgextnoRHTZEE3/TCo0atXfz+2y6RhwH3GuRAwJ1f2GGYUmrjTfX8DKtesivXH
         Os+TMoK9EdF/+mh4Jv2YWFWOruOl1dcQRZ4J2m07K8nuEvoOP81PCDPxleLV9XHmEen4
         Ram9T4rm71WtFppuyFvElO+yHika1Afl628CspjCNnyp/WKs9svJHw0PqSfDll7VXZiJ
         qxO/vcHPFh5F/QY+SRg+h/AnwlaiczStIYVH4RGz2p/JhdkqEGPyuE00Xilgtwnzjd6X
         iWdunii2nhQYM5eVRzpje6sWMU2Ptt/FS4nQW2qL1aAjTTK+OXX/19b4CH3lLt6y87SS
         eqzw==
X-Gm-Message-State: AOAM53256y04v2Ntyqwcce0jusAMZCaHBZyqttIwmwBz444CD4GC9LE5
        NmtfAyP1OtiSIY4YHD6pNnC+tQ==
X-Google-Smtp-Source: ABdhPJyimJxsZ3rpCSt/gL4lDDTPGwlAOyhXFrW4+tUdqifDhNF/eAHunyWtOVKE1d7NoJ9tWlVVqg==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr15102455wru.218.1616769305350;
        Fri, 26 Mar 2021 07:35:05 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:05 -0700 (PDT)
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
Date:   Fri, 26 Mar 2021 14:34:36 +0000
Message-Id: <20210326143458.508959-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
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
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
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

