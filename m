Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581AD14E40C
	for <lists+linux-input@lfdr.de>; Thu, 30 Jan 2020 21:34:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgA3Ueb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jan 2020 15:34:31 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35286 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727630AbgA3Ueb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jan 2020 15:34:31 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so2255720pgk.2
        for <linux-input@vger.kernel.org>; Thu, 30 Jan 2020 12:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ls2tMeKv9f/jgxrcgT00rlFPgO3Iqf2bPNU9NTKhuuA=;
        b=g7awB2ne4o5cENNYO4XNZlKcdtN8PAc/gTPbg8CFzfTmV7vVXy0DaMpOT1WCpvirXj
         ILtB4VGoCSqxDbVxIIg6dkSkjOOAzvGm2Muc0iM7VUAcvoFOWtR6d8uoQGpV8IHdkguE
         GUejGP2g1hEG3giv+H3VxhLiwH9QDlLB1OYpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ls2tMeKv9f/jgxrcgT00rlFPgO3Iqf2bPNU9NTKhuuA=;
        b=UHL7kfD++7pxJSdb+TncdjEI6tt4nwGfm9mrTtwENseKZrbTJI8/yVffoArVSS2Rby
         vH4WP/2Ab19wOftML/tWETyPxxALve2cz9tB4VxgQ649Ov/T63rnP+B0GVU7iDqwGKoS
         4aJOHQEwlyRzqHAqgQOHqJJxZykUbjeZqwG+OZOPBC29us4cB/PdhCaKOPvlG8A8hAjM
         eUvuMogOEuH3m/+6arjPggM5bDRAOMLyjATUO15VX+aQDsRnvF9Bca5j03QZuNh7DDiI
         aJErKO8MCSQk4lb1kXsWBKqWvUEp7Fh5hOAoZk5ejDh+Gwjag/VCMGjiyVSv9NkSQ6FE
         6rag==
X-Gm-Message-State: APjAAAVTsSu5zBOiJNIFPsQRPK11z1a8k8TDyc0mhgNBj17zU3XGfxgy
        rCop7QUhP9khr915AcuY9oPVMg==
X-Google-Smtp-Source: APXvYqy/Joy7rxQu+O8dsSuoijXrNllSzK67kFbyoHNLVIFp3OdJPOLc29S4oQ8YzWkHSSCf0ip0mA==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr5736301pgk.99.1580416469829;
        Thu, 30 Jan 2020 12:34:29 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:172e:4646:c089:ce59])
        by smtp.gmail.com with ESMTPSA id q12sm7469321pfh.158.2020.01.30.12.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 12:34:29 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Prashant Malani <pmalani@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org (open list:HID CORE LAYER)
Subject: [PATCH 09/17] hid: google-hammer: Use cros_ec_send_cmd_msg()
Date:   Thu, 30 Jan 2020 12:30:52 -0800
Message-Id: <20200130203106.201894-10-pmalani@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130203106.201894-1-pmalani@chromium.org>
References: <20200130203106.201894-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace cros_ec_cmd_xfer_status() with cros_ec_send_cmd_msg() which does
the message buffer setup and cleanup.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 2aa4ed157aec87..428762a6a4993f 100644
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
+	ret = cros_ec_send_cmd_msg(ec_dev, 1, EC_CMD_MKBP_INFO,
+				   &params, sizeof(params), state, sizeof(u32));
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

