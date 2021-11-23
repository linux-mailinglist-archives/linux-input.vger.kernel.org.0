Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535B245AC10
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 20:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238694AbhKWTP4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 14:15:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235934AbhKWTPx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 14:15:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C826BC061714;
        Tue, 23 Nov 2021 11:12:44 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso3241784wml.1;
        Tue, 23 Nov 2021 11:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xDqZRHmjUMP1gBRX+GmHMf3kW8bNST0jfrLIGxm98KQ=;
        b=TZHXFYz/64YoQhHXJ1XH/Lj0ard4iYCXGZPvnn8w83RorlQwTGdMvCuDrzeJqquW5z
         RfQNQdBvhRIBVdi+fJdxSwRqz0EFQAtJwANoHUU7/gswh2mzH/cydIyOelHnUJwFn7n1
         hVrLn9Dasl8bjvj+0YU51CH5mlKySJwUKxwHw6d7OihBMxUuPcWf1JsHdOwDTVfrtgec
         J8sqXnHcjooM5aoMcMeJcQyb6zcwUmtbIKQLxp5768T/1YC/dHNApQZcM52c6PYXHtp7
         2Y4jSLLKda5ZzxkG9sge7r+XEI6osjmXoAyAqjUsjxhGfEzAxKJyQ7MbO10QQv/nJTwN
         Z/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xDqZRHmjUMP1gBRX+GmHMf3kW8bNST0jfrLIGxm98KQ=;
        b=u1cZXD2CVPp0jBZGJKcxxHaXLwK2+bXLTtQNiUoWPj+LUxKtMzOnfoxSjbllgcAur7
         vMJI4RDC30tOQ0kEMUESz4I3bNLI+dPLcB1EX4GPQhKml+hi+zrYhztLgYsn++QkVnxe
         V7N+LauCmnwdZN8XeVeghK8QIc2Q50X/SCOBwxK9uURQCDWVA9KtiEEPUDA+2v/MOerg
         vgyyd0Z/xxoKijJ7r7b5F0p7xxkbMqSLE6oZjSDVbYT2Vq6uHmxU36sEHCBe+vPJ+MdC
         A6ljHWzyXLhVrkMnRRTkGlLCif5BPWbxoMn4kNcwtXiNyEXymHdIAUFM9M07MdwLGgKw
         Eelw==
X-Gm-Message-State: AOAM532b0cb80WcJLrX8xRa9A9KQAoXb7UsE1HCZVV4UAsKRSvtsH2TM
        pOH4/shmCLyfZ09m/BJRyAU=
X-Google-Smtp-Source: ABdhPJwrPGK6FXF/YgZsdGLHmnN4q2vt8WdLExsGFnQeyuIsVUAfq1UgJjaiN6LsKVmF/+Nkhz2eVA==
X-Received: by 2002:a05:600c:3b27:: with SMTP id m39mr6544213wms.132.1637694763313;
        Tue, 23 Nov 2021 11:12:43 -0800 (PST)
Received: from localhost.localdomain ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id r11sm3088081wrw.5.2021.11.23.11.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 11:12:43 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, peter.hutterer@who-t.net,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/1] HID: multitouch: only map BTN_LEFT on buttonpads
Date:   Tue, 23 Nov 2021 20:12:38 +0100
Message-Id: <20211123191238.12472-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123191238.12472-1-jose.exposito89@gmail.com>
References: <20211123191238.12472-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In addition to map the INPUT_PROP_BUTTONPAD property, make sure that
the BTN_RIGHT and BTN_MIDDLE key bits are not mapped.

Mapping more than one button on buttonpads is a bug plus avoids issues
with some touchpads on user space. For more information, check these
bug reports:

 - https://gitlab.freedesktop.org/libinput/libinput/-/issues/674
 - https://gitlab.freedesktop.org/libinput/libinput/-/issues/689
 - https://gitlab.freedesktop.org/libinput/libinput/-/issues/629

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-multitouch.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e1afddb7b33d..37697ebe27f9 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1286,8 +1286,11 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	    (app->buttons_count == 1))
 		td->is_buttonpad = true;
 
-	if (td->is_buttonpad)
+	if (td->is_buttonpad) {
 		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
+		__clear_bit(BTN_RIGHT, dev->keybit);
+		__clear_bit(BTN_MIDDLE, dev->keybit);
+	}
 
 	app->pending_palm_slots = devm_kcalloc(&hi->input->dev,
 					       BITS_TO_LONGS(td->maxcontacts),
-- 
2.25.1

