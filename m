Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E36C71538CC
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2020 20:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727492AbgBETLx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Feb 2020 14:11:53 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:33140 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgBETLw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Feb 2020 14:11:52 -0500
Received: by mail-pj1-f65.google.com with SMTP id m7so2084057pjs.0
        for <linux-input@vger.kernel.org>; Wed, 05 Feb 2020 11:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y/dxpKcYEXxmnsITAJ6pnZifEuXekQdEG50zLc7fDeo=;
        b=CxEmMnwR6rjD71F46jEADMXkj7EssJmMqd+P3L3f6w6ESIFbj1Hw7dJPhu400glIU7
         9HNGruSKqCRaiHvJNyIp5ineGRVLgeIkRrfxwSw0Ry2Ne74Iu/U8pYeooGac19uXIZ4g
         Bgrk8bznNFJ+13cj9tnhhFsYs0hNLKSvUA6Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y/dxpKcYEXxmnsITAJ6pnZifEuXekQdEG50zLc7fDeo=;
        b=FaakZ5ByYWgT6x0gBXf/w7wdw7GEbrohDpW+JaZajrmI1vf4ej05oc3BxRNqBB+GUJ
         USljYp2y6+3CR8qF8GhYlWLoPgKYG7Jso3BQIJOI/rstW1t38MZtEuxg3Ki1zjir3hAg
         wXOhwK45E+UcNrryD72N9VnNpD/Pc0wQNP5daakxQ4QA+ERj/eqT2OYRG1B3SR0EzRC1
         Y2XIC65YQ/tksyd/Zag2QxloMzih4+cM4Sh2wmu2SBmOhkUqHvq8sFGVwmbCBEtr7Ctf
         M6tBwZfPNDgsSMUwnzBns0uaHkjA0k7Kx5PlQkrjmwQLZztZT4KLxSgcR4P86rQhUK/V
         NpQQ==
X-Gm-Message-State: APjAAAVGKIfJJOHw3hZNfhLVLHqwMtzkRmcizAOgxsDECmxL9BzmSD4k
        dbxBS5ti7IipvgP9z8jS+YG72w==
X-Google-Smtp-Source: APXvYqxHu1ZnioRv8yjOxEtywN6zzgA9Bc4iTDVAOFO5SWiSh8udQjlCLSp9knX7DA4TIgWFrn+mhQ==
X-Received: by 2002:a17:902:82c3:: with SMTP id u3mr34711027plz.73.1580929910558;
        Wed, 05 Feb 2020 11:11:50 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id u23sm257224pfm.29.2020.02.05.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 11:11:50 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER)
Subject: [PATCH v2 09/17] hid: google-hammer: Use cros_ec_cmd()
Date:   Wed,  5 Feb 2020 11:00:11 -0800
Message-Id: <20200205190028.183069-10-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200205190028.183069-1-pmalani@chromium.org>
References: <20200205190028.183069-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace cros_ec_cmd_xfer_status() with cros_ec_cmd() which does the
message buffer setup and cleanup.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Updated to use new function name and parameter list.

 drivers/hid/hid-google-hammer.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 2aa4ed157aec87..fb0d2a01e2736e 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -53,38 +53,25 @@ static bool cbas_parse_base_state(const void *data)
 static int cbas_ec_query_base(struct cros_ec_device *ec_dev, bool get_state,
 				  bool *state)
 {
-	struct ec_params_mkbp_info *params;
-	struct cros_ec_command *msg;
+	struct ec_params_mkbp_info params = {0};
 	int ret;
 
-	msg = kzalloc(sizeof(*msg) + max(sizeof(u32), sizeof(*params)),
-		      GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	msg->command = EC_CMD_MKBP_INFO;
-	msg->version = 1;
-	msg->outsize = sizeof(*params);
-	msg->insize = sizeof(u32);
-	params = (struct ec_params_mkbp_info *)msg->data;
-	params->info_type = get_state ?
+	params.info_type = get_state ?
 		EC_MKBP_INFO_CURRENT : EC_MKBP_INFO_SUPPORTED;
-	params->event_type = EC_MKBP_EVENT_SWITCH;
+	params.event_type = EC_MKBP_EVENT_SWITCH;
 
-	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+	ret = cros_ec_cmd(ec_dev, 1, EC_CMD_MKBP_INFO, &params, sizeof(params),
+			  state, sizeof(u32), NULL);
 	if (ret >= 0) {
 		if (ret != sizeof(u32)) {
 			dev_warn(ec_dev->dev, "wrong result size: %d != %zu\n",
 				 ret, sizeof(u32));
 			ret = -EPROTO;
 		} else {
-			*state = cbas_parse_base_state(msg->data);
 			ret = 0;
 		}
 	}
 
-	kfree(msg);
-
 	return ret;
 }
 
-- 
2.25.0.341.g760bfbb309-goog

