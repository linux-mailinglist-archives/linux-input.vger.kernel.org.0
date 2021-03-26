Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCE334AA06
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCZOgC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhCZOfa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D942AC0613AA
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:29 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b9so5846127wrt.8
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ClFGCdlyfHku/4SK1RS5YcXqT4jfIPIFaVtjJpjt8dI=;
        b=zBUWxDzz0qsrzy2U455hoEcT4SP9C4Lm/4mPsseMd6sftp+9qjrwtdVWRDIlVUR2x+
         w6h7Q0xiW8Bzp6YynifdA8gq/zqqyRwbcDo66EEm8S1Drim13BvKjZKbpx2IFJ57IggZ
         8dM0l76bPEoIA5gXy/ZPQH4V/8H9iGTmt4h5xfzYRtTSThHrC2Lr/W5to69igPN6TzzE
         P/RSQKpbeewsihN0s8oZBQyC2/RNS7miSKfZXusQQFsHdcOJgHbOOpFli/+4kyosRl51
         KMDV47YmxBnIuVteCrUTadawpoAUFNmitlpM5WQNd+Jn1Vpz/XhyrpeYeAXCaCuf0s+G
         V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ClFGCdlyfHku/4SK1RS5YcXqT4jfIPIFaVtjJpjt8dI=;
        b=A4GwjsbWXMkDv1HYDjYH+0V/BBzF8J4/of0iHwzR2KycwgAZZ13kNO7dVX3LH3sT8b
         uOWrheCzllLOgOoktn7+kkfuL8rfPJK9M/lRbrhfLcyYjifRD8cQ/E1qb5vcaGHp1VhG
         +h3GAMJupwUx9JNeOpK/P1HzLkGgprEvYPqkDDGot46AfgJ2ZGdnNwE86BfngVPfeyOZ
         HZR97FNeuyskq4li/c9HAJYBzCOhUmGTbUdyTQM45ieNNYU96fI3sV1vSFH4ye1scY1Y
         JSUrwAozo1povoHVVRaJDNNcagmwKUSFWyJOCgX0nt0tvXq6tJQCZOgnULPL0v2URjdg
         BfeA==
X-Gm-Message-State: AOAM532NA545NoF4pxuYi4hkz+4Bn/8o7anZa6Undv5e0LPQSZ8bQVuL
        f1qqttHxAz4sCPE3BhMGd2EEaQ==
X-Google-Smtp-Source: ABdhPJxJ43fMfcqtKUbjAcvCSxXzdtMVZTMWkDgD6B8lxdQ7AyQZa2evvtl6rXxcLldcDxglGsetBQ==
X-Received: by 2002:adf:cf11:: with SMTP id o17mr14923097wrj.391.1616769328584;
        Fri, 26 Mar 2021 07:35:28 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:28 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 25/25] HID: ishtp-hid-client: Fix 'suggest-attribute=format' compiler warning
Date:   Fri, 26 Mar 2021 14:34:58 +0000
Message-Id: <20210326143458.508959-27-lee.jones@linaro.org>
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

 drivers/hid/intel-ish-hid/ishtp/bus.c: In function ‘ishtp_trace_callback’:
 drivers/hid/intel-ish-hid/ishtp/bus.c:876:29: warning: return type might be a candidate for a format attribute [-Wsuggest-attribute=format]
 876 | return cl_device->ishtp_dev->print_log;
 | ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Daniel Drubin <daniel.drubin@intel.com>
Cc: linux-input@vger.kernel.org
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 4 ++--
 drivers/hid/intel-ish-hid/ishtp-hid.h        | 4 ++--
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 4 ++--
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h  | 4 ++--
 include/linux/intel-ish-client-if.h          | 8 +++++++-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 042a7091802dd..6b1fa971b33e2 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -784,7 +784,7 @@ static void hid_ishtp_cl_reset_handler(struct work_struct *work)
 	}
 }
 
-void (*hid_print_trace)(void *unused, const char *format, ...);
+ishtp_print_log ishtp_hid_print_trace;
 
 /**
  * hid_ishtp_cl_probe() - ISHTP client driver probe
@@ -823,7 +823,7 @@ static int hid_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
 
 	INIT_WORK(&client_data->work, hid_ishtp_cl_reset_handler);
 
-	hid_print_trace = ishtp_trace_callback(cl_device);
+	ishtp_hid_print_trace = ishtp_trace_callback(cl_device);
 
 	rv = hid_ishtp_cl_init(hid_ishtp_cl, 0);
 	if (rv) {
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid.h b/drivers/hid/intel-ish-hid/ishtp-hid.h
index e2423f7d2b547..f88443a7d935e 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid.h
+++ b/drivers/hid/intel-ish-hid/ishtp-hid.h
@@ -16,9 +16,9 @@
 #define	IS_RESPONSE	0x80
 
 /* Used to dump to Linux trace buffer, if enabled */
-extern void (*hid_print_trace)(void *unused, const char *format, ...);
+extern ishtp_print_log ishtp_hid_print_trace;
 #define hid_ishtp_trace(client, ...) \
-		(hid_print_trace)(NULL, __VA_ARGS__)
+	(ishtp_hid_print_trace)(NULL, __VA_ARGS__)
 
 /* ISH HID message structure */
 struct hostif_msg_hdr {
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index c1c7d5356208d..f0802b047ed8d 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -869,9 +869,9 @@ EXPORT_SYMBOL(ishtp_get_pci_device);
  *
  * This interface is used to return trace callback function pointer.
  *
- * Return: void *.
+ * Return: *ishtp_print_log()
  */
-void *ishtp_trace_callback(struct ishtp_cl_device *cl_device)
+ishtp_print_log ishtp_trace_callback(struct ishtp_cl_device *cl_device)
 {
 	return cl_device->ishtp_dev->print_log;
 }
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 1cc6364aa957f..f579b16e6d7a9 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -10,6 +10,7 @@
 
 #include <linux/types.h>
 #include <linux/spinlock.h>
+#include <linux/intel-ish-client-if.h>
 #include "bus.h"
 #include "hbm.h"
 
@@ -202,8 +203,7 @@ struct ishtp_device {
 	uint64_t ishtp_host_dma_rx_buf_phys;
 
 	/* Dump to trace buffers if enabled*/
-	__printf(2, 3) void (*print_log)(struct ishtp_device *dev,
-					 const char *format, ...);
+	ishtp_print_log print_log;
 
 	/* Debug stats */
 	unsigned int	ipc_rx_cnt;
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index 94669e21dc8b3..25e2b4e805023 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -8,11 +8,17 @@
 #ifndef _INTEL_ISH_CLIENT_IF_H_
 #define _INTEL_ISH_CLIENT_IF_H_
 
+#include <linux/device.h>
+#include <linux/uuid.h>
+
 struct ishtp_cl_device;
 struct ishtp_device;
 struct ishtp_cl;
 struct ishtp_fw_client;
 
+typedef __printf(2, 3) void (*ishtp_print_log)(struct ishtp_device *dev,
+					       const char *format, ...);
+
 /* Client state */
 enum cl_state {
 	ISHTP_CL_INITIALIZING = 0,
@@ -76,7 +82,7 @@ int ishtp_register_event_cb(struct ishtp_cl_device *device,
 /* Get the device * from ishtp device instance */
 struct device *ishtp_device(struct ishtp_cl_device *cl_device);
 /* Trace interface for clients */
-void *ishtp_trace_callback(struct ishtp_cl_device *cl_device);
+ishtp_print_log ishtp_trace_callback(struct ishtp_cl_device *cl_device);
 /* Get device pointer of PCI device for DMA acces */
 struct device *ishtp_get_pci_device(struct ishtp_cl_device *cl_device);
 
-- 
2.27.0

