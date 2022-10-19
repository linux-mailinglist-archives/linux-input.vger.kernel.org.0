Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22646604B4A
	for <lists+linux-input@lfdr.de>; Wed, 19 Oct 2022 17:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232486AbiJSP1K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Oct 2022 11:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbiJSP0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Oct 2022 11:26:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970651FF96
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 08:19:27 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o9-20020a17090a0a0900b0020ad4e758b3so281090pjo.4
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 08:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOk9Xh9yK46Sdz6R1Vdml6CdLb8VId/sbq0qkMYBuuk=;
        b=YzQ72t6cmiNtYPdMCwCeS59RiK4r5B+f9lL00OnAMs3NEX3fkSWQyD7gesIKy0aVYL
         tEfxmLPxFWlBblGqaEILrE8RHefJEKfa5HRe1Wq2e/Mpmzb3JeMBqklRVF81zCD1/s3B
         vjelKR8vCJ1bJRDpWFJa3Mcky0vSIT9ZIlqO4807/vDWBgDlbwmot60znqIaPZwDvR9J
         vyFkN9WB1c7vnfbsFj3wKJhIbhaW2CxS5C3lpKqtfS7EBoMoQCnOjUCpTNv6oasb0h7t
         OoPwPCcd4uWpyxeRYMzEJyFsxz0HhUiZ5Tdx8T+cR6p9V+nZ3GtsLfJ+NFqhmQDgM4Yv
         rHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOk9Xh9yK46Sdz6R1Vdml6CdLb8VId/sbq0qkMYBuuk=;
        b=KpyiU0vP6uBoUwpwkj9ShLxj5k3RNH4XSBr/sb5k6uUKdDUWjxYPDhghJvTZqtKtls
         9QGBsL36T17L9oL0f2iuVwJGTUUgLosGzsR7PgbgsmQtxiBfS/1x0eJOJ0O+D30raUgT
         mZ9FltwZWHmzzliU80OPsaXIunyRe370lsKeRPLcybwRlteGTx6qjhA83v+/RijqYiNR
         oeAnM/JKEcmRFOXfQ/NNsk6+dh7nq19NCGiOm+DRXL/ZB4HEFcYNB99Ec6rb8Gtl+joH
         exrxoqgy1LklHshmQ0FZReLUb4d5Lj8aNHjfeIhMsFYoKDR5XNr/PTSDLzC2FzMu3kI8
         U3/Q==
X-Gm-Message-State: ACrzQf2vtCeBEjSHtB226FgEJM6YoJv5Xnf1fCgkhuJlbrD+5K3obtkW
        RQbA7HdgBzTbDEVc1iMuOJhkTzPNNsweRQ==
X-Google-Smtp-Source: AMsMyM4Y8Io/QTadtf1k8BydVHGnA/tW4WxIdoNzKhSBJA257jEflWLU7soe4RewoROiUURauk6qIg==
X-Received: by 2002:a17:902:968f:b0:180:a7ff:78ba with SMTP id n15-20020a170902968f00b00180a7ff78bamr9183484plp.87.1666192725461;
        Wed, 19 Oct 2022 08:18:45 -0700 (PDT)
Received: from localhost.localdomain (047-044-188-234.biz.spectrum.com. [47.44.188.234])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090311cc00b001801aec1f6bsm11089744plh.141.2022.10.19.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 08:18:44 -0700 (PDT)
From:   "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua@joshua-dickens.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: Recognize "Digitizer" as a valid input application
Date:   Wed, 19 Oct 2022 08:18:32 -0700
Message-Id: <20221019151832.44522-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Gerecke <jason.gerecke@wacom.com>

"Digitizer" is a generic usage that may be used by various devices but
which is particularly used by non-display pen tablets. This patch adds the
usage to the list of values matched by the IS_INPUT_APPLICATION() macro
that determines if an input device should be allocated or not.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
---
 include/linux/hid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4363a63b9775..07803e144d98 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hdev)
 /* We ignore a few input applications that are not widely used */
 #define IS_INPUT_APPLICATION(a) \
 		(((a >= HID_UP_GENDESK) && (a <= HID_GD_MULTIAXIS)) \
-		|| ((a >= HID_DG_PEN) && (a <= HID_DG_WHITEBOARD)) \
+		|| ((a >= HID_DG_DIGITIZER) && (a <= HID_DG_WHITEBOARD)) \
 		|| (a == HID_GD_SYSTEM_CONTROL) || (a == HID_CP_CONSUMER_CONTROL) \
 		|| (a == HID_GD_WIRELESS_RADIO_CTLS))
 
-- 
2.38.0

