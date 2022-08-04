Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6779589E84
	for <lists+linux-input@lfdr.de>; Thu,  4 Aug 2022 17:19:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239029AbiHDPTT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Aug 2022 11:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiHDPTS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Aug 2022 11:19:18 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9BF5266F
        for <linux-input@vger.kernel.org>; Thu,  4 Aug 2022 08:19:16 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id b96so136235edf.0
        for <linux-input@vger.kernel.org>; Thu, 04 Aug 2022 08:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=bg+F2RrBWGFyK2s+cM+4qJbZ09e4qncJ8OPoUyeTF7M=;
        b=KjrJ1lM9HxP6ZLkmvqyj806kURRkqBBXcppj5UwYVRrnfT4nRuWWIXrSWw3zCFucOn
         Tx5wB0L+FRXaWQ8mRj7NvYRJnVy/UFDO2G7/8YHdwszHaqBJv1vCXYQCIc2HUTTwXLW8
         GdFi+v7Y0l2NxFZ7+YEnS/pryMhkUKT18i+gk08kvIQHxLZn87kP8003QN1/WrsJ0avm
         ltemmhQoC5G26N467DRIDGK7U5YpM5STo7oQ6UVNwur3LPBpvTT5NxYL5aFACxn+VOBq
         eHbDwDiPvFUsgyFdHx6drZb9yYFxjeFpjYPqM9ReKlzKImbIBIP7D0ZXcDJfoFJF7apQ
         K/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=bg+F2RrBWGFyK2s+cM+4qJbZ09e4qncJ8OPoUyeTF7M=;
        b=KxH2hnCYkQ0ifPVnhB1KQAuqJjCwUjh3VM92Vw4azS2pC+ssAzK+VPOT/v3dvsKKuh
         i4RMaggFd3Fff4tamhjIqxP0pDhK8zRX/Sr7ND8BtYgChqhpK6IHWuON5fDjj/qQYcle
         h/0/wJMoyvJTWjEcvgCG7NLfPsw5UbiAMHWve2aZHwtEESNxpPcyhqjUbluPkJlAOa4S
         47Ho0JTWFpY5lvSuD0Xs8Notkkd4ms77LmBLiX9i3n6AymSOu1iY3aLfLQ1OdeTNb83a
         vxjXt4u/RsXHhnnOOqap/AO0mzZ8f5eS3+htjwvjUJbWeUQ3/iEqFAnKnUx0WiYeRkQX
         ZUkA==
X-Gm-Message-State: ACgBeo2Z8WiBnI/HrCn7I0CsO2RmZ0VW6oYz0U3CUzN2ZpXe7f8padNW
        PPo08G66fi7IwE5C063Ul/Q=
X-Google-Smtp-Source: AA6agR6Mydv7XG6WM+D/H0Wyk6887karRfXxx6rmmNo1cwRlxFKG20w073ZE2RQ8y8DqlhzMJhwjoQ==
X-Received: by 2002:a05:6402:28c3:b0:43a:6d78:1b64 with SMTP id ef3-20020a05640228c300b0043a6d781b64mr2572864edb.93.1659626355267;
        Thu, 04 Aug 2022 08:19:15 -0700 (PDT)
Received: from ARKON.codeweavers.com (ip5f5bc78c.dynamic.kabel-deutschland.de. [95.91.199.140])
        by smtp.gmail.com with ESMTPSA id b10-20020a1709063caa00b007262b7afa05sm414530ejh.213.2022.08.04.08.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 08:19:14 -0700 (PDT)
From:   Torge Matthies <openglfreak@googlemail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Nikolai Kondrashov <spbnick@gmail.com>,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
        Torge Matthies <openglfreak@googlemail.com>
Subject: [PATCH] HID: Accept Digitizers as input devices
Date:   Thu,  4 Aug 2022 17:18:32 +0200
Message-Id: <20220804151832.30373-1-openglfreak@googlemail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
styluses") broke input from my XP-Pen Star G640. This is because the
"Digitizer" usage is not recognized as a valid usage for input devices.

This patch changes the IS_INPUT_APPLICATION macro so that the "Digitizer"
(HID_DG_DIGITIZER) usage is recognized as an input device usage.

Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for styluses")
Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
---
This patch could be risky, because any digitizer devices that were
previously not treated as input devices are now used for input.
Alternatively the linked commit could be reverted, but that would
re-introduce the problem detailed in its commit message.

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
2.37.1

