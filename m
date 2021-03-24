Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39274347F7F
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237310AbhCXRen (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237070AbhCXRe0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:26 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AE4C0613E7
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:22 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id w3so34250199ejc.4
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rL2mdk6qmLyu4l9CO1LjB/Fy6Q7Estk6EutMx9RWcNQ=;
        b=cGfmb9Ahj4GoVdknRK5zBEm0WRV/rmSsCFJCDiQqtA6qYIzMEz1WKGh1kDUOyYxQON
         J3KH9Lv/o/PxeWE72TIy+zT4wy4Yqh5zR+/9F2zLduHYhpBRk7kygdVtFMEQdEuL70Z+
         GebqGQtq7UCn8M6FWc385+DryjwLfMyS3ejU4qMo6qGspPGwsuB8tzUcr3f7vmedDepo
         s6uqVzuGZNym0/kEkc3Yj/rmDC9gNaa1oJNBFemtHcHiz3+3PeByXXq1VnHtEPoP4yyV
         x845RvkxhV0krjmMg5hb9q81wOkjLP02ocX7jxRG3GD7vsT/iNFWLyx4QW6IBTJ1pQTQ
         dVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rL2mdk6qmLyu4l9CO1LjB/Fy6Q7Estk6EutMx9RWcNQ=;
        b=OGqeBADBFAA+sIRyWXQYsBaVPOigrDD2tCWdAob8PGcHyoDgDvGbgmv6ZWRw1Lr23e
         yq0eb5dryeQXm2GSGu2PF4MoaZXPxmVR038+VHcCEchdDNIsoUQ+dbyI9tCn8OVm2wyd
         2c42G0gI/SXrxdQevqTLbI0jdZSFIVR7KS7HiMO6OMr/U78lKEEeyktsoeFszwtvjZmX
         fRLOeJNAwM8QKfFAFhCYby9qRvYwhVnP3zHa/GFt5o3zJo5/M1+bRMfTjNMxfs5GgE/Y
         SHf86pFJ+MqrDThXbvmsVGo6sDjyhwIDjv5CT//F5J4xECW2Jl2ypHjEtuVg7d3pasWV
         gJbA==
X-Gm-Message-State: AOAM531b0V/dBSwmgY2zmMMHqA4QwZBrUe0KVUNqDL6CXbfDRNmQksaB
        qzGtxJYjwXLQLr+BOrZzxX1qSw==
X-Google-Smtp-Source: ABdhPJwf02ng7fpjFAextXu71pHqM94bIT0ggGpD3yLNfVBOz2yVq6Lvqj/SEV4Q1l09yryl7SL5dw==
X-Received: by 2002:a17:906:f896:: with SMTP id lg22mr4809036ejb.124.1616607261450;
        Wed, 24 Mar 2021 10:34:21 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:21 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniel Drubin <daniel.drubin@intel.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 13/25] HID: ishtp-hid-client: Fix incorrect function name report_bad_packet()
Date:   Wed, 24 Mar 2021 17:33:52 +0000
Message-Id: <20210324173404.66340-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
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

