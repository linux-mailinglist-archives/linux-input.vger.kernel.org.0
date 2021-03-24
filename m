Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104C0347F75
	for <lists+linux-input@lfdr.de>; Wed, 24 Mar 2021 18:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237245AbhCXRek (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Mar 2021 13:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237226AbhCXReO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Mar 2021 13:34:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 500D1C0613DE
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:14 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id bx7so28564881edb.12
        for <linux-input@vger.kernel.org>; Wed, 24 Mar 2021 10:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YX2rXBybL20wXzWEgbJFWLYt9DGgkwCmYeXkOpQbl+4=;
        b=Bfp57e1lQCY5EFWX4luD5N2fEWYpccMVTLKliRDQiNa6NB9MeuKuVW/OnZAxt3gryp
         87Myoc7DNQFoZSRfyQDVUc6ww4tJE7LQmZWMF7uBiQFF0zFIfruv5I0pTSvWtCWqkAme
         Br+V0yd4e9SUTg2fPyk+z2nvqy+EeFUtkJdGHUyz7CtXqfBCF4uZkIyDkhQv145f7Q1T
         5TjjYkcNVGcAEjJoTI+EnZFyqXZU/Gk0+38r2/geqhI20tLUZU1um5zEwsCnO0kgPAoB
         +jobYECsruYUzK/2mZ3qRQURK3G4u2uezIik7Q8hsWPTJo0gEBNh8C5TvxICZBnwN75v
         arSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YX2rXBybL20wXzWEgbJFWLYt9DGgkwCmYeXkOpQbl+4=;
        b=Q3tG8RLUb5EtNThYVVe0x3TPq38EC9H18gnZNxFxdrC3wAZGmzxwPFLwDv9NdT37GH
         lPCnMziEtdjJl3809GidtoTD/HbPhjH1J+MBhc3/luxwGgrzqQ4HyaKeR6NsIsQG1CF2
         gPzP5I/FTh+tkdQn5wHW8TnLoD8JnbE67EiyxZtvIPZPB5GjgBxSOnMFSC3jW1tf01PA
         rIjWLeS/k//+xDwaxqUXEJx1IzUMWCdSmG8QZQyXOMPZtzu5bmaNweQv3KbFfSjOA4A9
         GQxQG8giZZhq/GeQCLAP9V3eBc+BFpfGmZ+Bx3lXA6PndF2j5SRjtWDbyD2TADAnbVQH
         Ophg==
X-Gm-Message-State: AOAM533vQxioGuyzqcGntOmCNR7Vu9Sn6TOrG6sN2BwgcwSsssC+FaoK
        bUOHsdYra52EpR12X8Q6sfsVow==
X-Google-Smtp-Source: ABdhPJwCPqXP3jqO62z9IUUGkbePEAMenKTIuU1I7W2tHc5o4gR44zrdACq+n9DNpRRywppISA6OkA==
X-Received: by 2002:a05:6402:142:: with SMTP id s2mr4677887edu.2.1616607253067;
        Wed, 24 Mar 2021 10:34:13 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:12 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 05/25] HID: intel-ish: Fix a naming disparity and a formatting error
Date:   Wed, 24 Mar 2021 17:33:44 +0000
Message-Id: <20210324173404.66340-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/intel-ish-hid/ishtp/hbm.c:409: warning: expecting prototype for ishtp_client_disconnect_request(). Prototype was for ishtp_hbm_fw_disconnect_req() instead
 drivers/hid/intel-ish-hid/ishtp/hbm.c:433: warning: wrong kernel-doc identifier on line:

Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/intel-ish-hid/ishtp/hbm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/hbm.c b/drivers/hid/intel-ish-hid/ishtp/hbm.c
index dbfae60f26216..9c031a06e4c40 100644
--- a/drivers/hid/intel-ish-hid/ishtp/hbm.c
+++ b/drivers/hid/intel-ish-hid/ishtp/hbm.c
@@ -398,7 +398,7 @@ static void ishtp_hbm_cl_connect_res(struct ishtp_device *dev,
 }
 
 /**
- * ishtp_client_disconnect_request() - Receive disconnect request
+ * ishtp_hbm_fw_disconnect_req() - Receive disconnect request
  * @dev: ISHTP device instance
  * @disconnect_req: disconnect request structure
  *
@@ -430,7 +430,7 @@ static void ishtp_hbm_fw_disconnect_req(struct ishtp_device *dev,
 }
 
 /**
- * ishtp_hbm_dma_xfer_ack(() - Receive transfer ACK
+ * ishtp_hbm_dma_xfer_ack() - Receive transfer ACK
  * @dev: ISHTP device instance
  * @dma_xfer: HBM transfer message
  *
-- 
2.27.0

