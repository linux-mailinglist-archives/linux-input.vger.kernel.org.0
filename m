Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC792DAF94
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 16:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbgLOO4x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 09:56:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23350 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729986AbgLOO4p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 09:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608044119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qd74pqXXAWk4/1pugQHgbmoI9O7DnKvJND+IdUuebOE=;
        b=Vfl0jLGlFKxQKFHCF1aG5riaN0x43qGnoDUpawSnxtL5YMwfDPQeC3yEjjXmwi9Oslgt72
        iFQXrESAB2pa1qrqYj7HvOWi+mHkysh6ce/cbAgF9AgPoKv9/IMxk2xfVcB2IErAq1lbIN
        zV5gGCWMV4KUNixP1F4189h2mofLTJs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-X-lkhPUiOQeOxe3lc_iceA-1; Tue, 15 Dec 2020 09:55:17 -0500
X-MC-Unique: X-lkhPUiOQeOxe3lc_iceA-1
Received: by mail-qv1-f70.google.com with SMTP id x19so14386537qvv.16
        for <linux-input@vger.kernel.org>; Tue, 15 Dec 2020 06:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qd74pqXXAWk4/1pugQHgbmoI9O7DnKvJND+IdUuebOE=;
        b=lNrbeLPUEWYs1VB31kOWeRqFd0vDjOmCGLXRf5KwQvdHrDNIhNXeZ1JkRe181xwI5K
         mHKM1m4QEPjFI8pep91RH45PSBfsMYlVKylbMQA+mIpffN04mX3DvSWkQ4Dfu0C9nFXO
         R6dlaEpsQiQqvZM2gkhr1YHfg8Lv+3e9JV/0Wr5Z2Fo9IGZGegeDt+AibxSdTdUYEAgY
         gVo/dxUsGR4jZzTOZsF5aDeF42sMKZGcnznQGTIWhpie+QBYZz/4VIV/9HSASwTRU4SS
         aQLpx/j8WPWJzPHXSByaFkrGDJ3m7HujM24Ip7HInV3sgz9soND0kNb3v2TULzDsdxfP
         y8MA==
X-Gm-Message-State: AOAM532BpRTsEY6sh9L55oMBhwkpLXlZn41lcvBgTThlavaPFY7JR8Wq
        XsG295TK69/7rvqCXxXuMZyvYY5BwwdcGUmJ+GWXhvQc3fZJ7nAJsSNGAznKzkU2H6QrbvMiyzc
        9kd7h6pxSVOIYY0NY1vNu/VY=
X-Received: by 2002:ac8:7b9d:: with SMTP id p29mr29057551qtu.75.1608044117129;
        Tue, 15 Dec 2020 06:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnjJIF1rP8/8z6OurE/HZ5HWpDd/Q6ttloGxkqcxKH5Dphu7TL5uxkreadMHYK/dyJ6BYphQ==
X-Received: by 2002:ac8:7b9d:: with SMTP id p29mr29057535qtu.75.1608044116970;
        Tue, 15 Dec 2020 06:55:16 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id b14sm16271740qtx.36.2020.12.15.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 06:55:16 -0800 (PST)
From:   trix@redhat.com
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] HID: uclogic: remove h from printk format specifier
Date:   Tue, 15 Dec 2020 06:54:54 -0800
Message-Id: <20201215145454.1905175-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

See Documentation/core-api/printk-formats.rst.
h should no longer be used in the format specifier for printk.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/hid/hid-uclogic-params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
index d26d8cd98efc..56406cee401f 100644
--- a/drivers/hid/hid-uclogic-params.c
+++ b/drivers/hid/hid-uclogic-params.c
@@ -90,7 +90,7 @@ static int uclogic_params_get_str_desc(__u8 **pbuf, struct hid_device *hdev,
 		goto cleanup;
 	} else if (rc < 0) {
 		hid_err(hdev,
-			"failed retrieving string descriptor #%hhu: %d\n",
+			"failed retrieving string descriptor #%u: %d\n",
 			idx, rc);
 		goto cleanup;
 	}
-- 
2.27.0

