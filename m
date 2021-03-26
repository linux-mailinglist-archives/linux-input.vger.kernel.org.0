Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B970034A9DA
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhCZOfR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbhCZOfI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:08 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81084C0613B2
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:07 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id b9so5844998wrt.8
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KY+ot5dzoWxg13y22fAr16+A3Tqxw//rMDzqbWyDuaI=;
        b=e5yd/ueye/lKJH2c40Aeqvr4G3DXwcpQzPjCIFfr+s2BV+TGCk/I5W7r/K4w4+fRoQ
         gxklrV/kmFnk5mbKiUJ63f3wXyZ7woUvAgUKsEy2o/nFdNTYqleS5DwBCi4dlosL++GA
         3M7XHNlHMN/O5wAM1P0ITL+WgqCMdeIhvcGr1O5uensGqZxrASHEj7FFFHTPbV2oTzln
         wiXx5JVb53jeR+3+RS8vA0gbIztp8rlQ8GQipYoh1c5B20MDfImhvf3Yjn+NdkqsWLHV
         XEZoGMnu92awWzJ+df0f0UOClWcz7vpbYwmpn1pVwD2SdZ3uTGs8DDUBUWf13Qss+iKk
         wpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KY+ot5dzoWxg13y22fAr16+A3Tqxw//rMDzqbWyDuaI=;
        b=IaKsU2QZ4mFj4kGAkUVS1sV90uEaoJwoAeOLUQv2U0nYvFLvyGGq5kxMs1wq64YoZ4
         bYaRBDDD4lz6h3jbZoGrMGfDOYXjdxZZpLMAE6F3zHdLglOhjKHFxRomFEOXmATE/Zc3
         iIAKfyKM0b4I0btOZBmQtdQNgy4RrQZDdJ2AX/vZs3ieSMpMOfY00wc9tK8OnS/BZeIX
         I18ffSisNS5bLxceqoCw9KlxgXqCPSOnl5E3i7twD1C+ZUmDzyiI70YJ0EyFukJqNj4G
         SSW2kEyrkRMjTFVhFr1JR6qPWAnpHYNbYXqEpMpPlZSCLYznG1aVb0uRducyZvBJIxGE
         +UWQ==
X-Gm-Message-State: AOAM53367R7G00b3B6CJWKa38WQBv1AtnBZq5DT3D7V+dTtKlTEaVnnX
        +KFB0rIWmCKEEowO5M78xg3JnQ==
X-Google-Smtp-Source: ABdhPJy0qmvZuHKAQADNW0Bwq0kJZfWnVUFoAsQsXQYa3YacplAADX8qwz2tRaJA751tWOaAegTxZA==
X-Received: by 2002:a5d:6092:: with SMTP id w18mr14806536wrt.52.1616769306280;
        Fri, 26 Mar 2021 07:35:06 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:05 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-input@vger.kernel.org
Subject: [PATCH 04/25] HID: intel-ish: Supply some missing param descriptions
Date:   Fri, 26 Mar 2021 14:34:37 +0000
Message-Id: <20210326143458.508959-6-lee.jones@linaro.org>
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

 drivers/hid/intel-ish-hid/ishtp/bus.c:173: warning: Function parameter or member 'fw_client' not described in 'ishtp_get_fw_client_id'
 drivers/hid/intel-ish-hid/ishtp/bus.c:845: warning: Function parameter or member 'device' not described in 'ishtp_device'
 drivers/hid/intel-ish-hid/ishtp/bus.c:858: warning: Function parameter or member 'device' not described in 'ishtp_get_pci_device'
 drivers/hid/intel-ish-hid/ishtp/bus.c:871: warning: Function parameter or member 'cl_device' not described in 'ishtp_trace_callback'
 drivers/hid/intel-ish-hid/ishtp/bus.c:884: warning: Function parameter or member 'dev' not described in 'ish_hw_reset'

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "Uwe Kleine-König" <uwe@kleine-koenig.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index ffc9ce5c86ee6..c1c7d5356208d 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -164,6 +164,7 @@ EXPORT_SYMBOL(ishtp_fw_cl_get_client);
 
 /**
  * ishtp_get_fw_client_id() - Get fw client id
+ * @fw_client:	firmware client used to fetch the ID
  *
  * This interface is used to reset HW get FW client id.
  *
@@ -835,6 +836,7 @@ int ishtp_use_dma_transfer(void)
 
 /**
  * ishtp_device() - Return device pointer
+ * @device: ISH-TP client device instance
  *
  * This interface is used to return device pointer from ishtp_cl_device
  * instance.
@@ -851,6 +853,7 @@ EXPORT_SYMBOL(ishtp_device);
  * ishtp_get_pci_device() - Return PCI device dev pointer
  * This interface is used to return PCI device pointer
  * from ishtp_cl_device instance.
+ * @device: ISH-TP client device instance
  *
  * Return: device *.
  */
@@ -862,6 +865,7 @@ EXPORT_SYMBOL(ishtp_get_pci_device);
 
 /**
  * ishtp_trace_callback() - Return trace callback
+ * @cl_device: ISH-TP client device instance
  *
  * This interface is used to return trace callback function pointer.
  *
@@ -875,6 +879,7 @@ EXPORT_SYMBOL(ishtp_trace_callback);
 
 /**
  * ish_hw_reset() - Call HW reset IPC callback
+ * @dev:	ISHTP device instance
  *
  * This interface is used to reset HW in case of error.
  *
-- 
2.27.0

