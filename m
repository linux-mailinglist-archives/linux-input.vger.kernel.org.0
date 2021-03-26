Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C834D34A9F6
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 15:37:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhCZOfv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbhCZOfQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 10:35:16 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60982C0613B1
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:16 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v4so5828875wrp.13
        for <linux-input@vger.kernel.org>; Fri, 26 Mar 2021 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NJdO66bBiMjdzl40aPWSxjSxYbd7b06CD4GwxwSgEOE=;
        b=oVXBaSdzja21bLFS3YKojWhTspCiskPc7lUKekQuR/j9cR93Rwf9uysg2BjcZ9Z27U
         B2l2s8IIwAWFB9C6ncYz2DkG/DlgonSbi6LFDvDJmr3Z7alQ+o/MBmqKjBqPl37tfoa2
         1CupoabpsVd65MqH4Dl7w+RpMtLyfAyhy/9HLpFOYkyHlJHUIeNaKZx9t+HMITZB3SNn
         0qz/FJ0oD8bMBp9FGdQM/L2GiSPZLmMhklY/0ICvm6qU3H0nguYmjo77q4Ouk9K8obdN
         H/0MNhsikXBVl+w+KDM2jil8AJNJNsnjLShkFp/mfm+N9EjAkk7WoDDped3QJxIqXg8O
         H8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NJdO66bBiMjdzl40aPWSxjSxYbd7b06CD4GwxwSgEOE=;
        b=LXrVWfGW81Zl3s66YKV/ZqmHEVcu9RqwmJtc/A3C4TmReNv0rxmI7FsNipcidRqG+P
         CnQ5RXeI8nlgkO0SemjzAYvreHqsoOW0g/Q2s6WedLt6ylCh1buCRH7tulNUK7mgQj1n
         nHnwLmih1nXN+6tuLFqI+0tVZc9eDIHxD6d+uUr1XcMy75yu2SHUkrhCS20PBFGGwjky
         Ev+5fy+yZbrkGOHaxkgtfQxF1PVFwRCo7ojDDrh1XaRTKI+L4RjgmTZertaTKyDtzu58
         L80Ev3nlvuvT0AyPKtuTXpr26XU40fDukyPnzjJ7UMkn4nw2O3U56IzQrcqyS4Pf5T6U
         VlFw==
X-Gm-Message-State: AOAM530zGXMhOOEOZTNihZwHIUEh/Dh5wagj0JAnu6oN/u/v0XSSZCr9
        QVxHtE/G0v/4OnAdWM98KzcWlw==
X-Google-Smtp-Source: ABdhPJzcEyClgXLnv43H5eGGmUS6hcRJB94AGPu07sy9CmEwQHq2sO2bCC6k/4Kduzrxiv4bqTNuTw==
X-Received: by 2002:adf:90f0:: with SMTP id i103mr14537444wri.318.1616769315151;
        Fri, 26 Mar 2021 07:35:15 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
        by smtp.gmail.com with ESMTPSA id j26sm12878225wrh.57.2021.03.26.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:35:14 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 13/25] HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
Date:   Fri, 26 Mar 2021 14:34:46 +0000
Message-Id: <20210326143458.508959-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210326143458.508959-1-lee.jones@linaro.org>
References: <20210326143458.508959-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/intel-ish-hid/ishtp-hid-client.c:36: warning: expecting prototype for report_bad_packets(). Prototype was for report_bad_packet() instead

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Daniel Drubin <daniel.drubin@intel.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 24599280105d8..042a7091802dd 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -23,7 +23,7 @@ static const guid_t hid_ishtp_guid =
 #define cl_data_to_dev(client_data) ishtp_device(client_data->cl_device)
 
 /**
- * report_bad_packets() - Report bad packets
+ * report_bad_packet() - Report bad packets
  * @hid_ishtp_cl:	Client instance to get stats
  * @recv_buf:		Raw received host interface message
  * @cur_pos:		Current position index in payload
-- 
2.27.0

