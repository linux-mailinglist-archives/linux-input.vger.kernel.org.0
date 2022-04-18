Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11DD4504F75
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 13:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiDRLoX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 07:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiDRLoW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 07:44:22 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249D4120AF
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:44 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so18259490wrg.12
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X2+v/mdVE6+emb+sfDYM1P2xslwLGC8W8jEMB5qHBpQ=;
        b=J/kQIxXlNOm0eRB1mcb6b2VElo4CbIJprCeSgVIN9HaNg+UwkM3riJ6SqcHjCO4C6S
         RHvIp6GWCSMv/s9JLzBZfRApxmqFZ/sUMuA1L5k8ClqeSwqyYXCPuX4prCiID/PcfmPL
         /W71d1oWv6Atg+Zu9je6JHJs8O9oPWMnffP5TK1LvMvx0NE4VzRIMj2sODX5tQ4DENqi
         fbybCX1HSOiowYldVfegab+WbZpqUWQ71ucs4KF6WXCrhbgGA6NNla7AAuvyoDp9ZmGM
         vF43IjAMxreqZ9GRp5rpoQBwA9xO0GeHC2u3MUHQI05NIUUJkTdXax21giIskFxr3kg0
         KyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X2+v/mdVE6+emb+sfDYM1P2xslwLGC8W8jEMB5qHBpQ=;
        b=rdqdPpe7sEtD3WVHfCnW8tyHawp+/OoxJzamdUqjKMbX/P6z9eZGcCSIWFqdVq6w/3
         O8882WlMLfn4LeCn4XFHid/oKt0MD4vOO8Xcj97FZNzpE0ys+Oz8mnUT/g0XcFj5jf8R
         Y1xlN0JKR+UgUlNhhKld7jjNRd/QH0l+Iz7n9qGTVp8oORcPfyHLTT9fp511XW0fniZ3
         2xjZKbXQZsxQj7s+Agj72Fi5Z8ZjrGwXSom8SlDztjLu+7uXI96tXhesGgqIwe3SBAFf
         0jGhWiUMwaIIj3TfgHMCWj5ixygkzx38+w9tR2WjJAM2rQYrqyxuGB5KMxivwU6SdaTf
         7Y4g==
X-Gm-Message-State: AOAM532IBhnK4PwWYb19Hmv1kuCosK5CtHQYwMBLUNkN2vudJ3AlCX19
        qknx2o6n7iZO83uTpjqImgs8ljtTAXmvgA==
X-Google-Smtp-Source: ABdhPJz407zauzQOeAIo0mlXPYFMQZ5dalwewU4QjFRY1Me8vgBCTmGROiOobgNBAiVTFaPafWYzmQ==
X-Received: by 2002:adf:d1cb:0:b0:20a:880b:13d2 with SMTP id b11-20020adfd1cb000000b0020a880b13d2mr7198449wrd.323.1650282102660;
        Mon, 18 Apr 2022 04:41:42 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b00207b49d3023sm10007211wrq.44.2022.04.18.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 04:41:42 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Cameron Gutman <aicommander@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 2/3] Input: xpad - fix wireless 360 controller breaking after suspend
Date:   Mon, 18 Apr 2022 13:40:21 +0200
Message-Id: <20220418114022.23673-3-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418114022.23673-1-rojtberg@gmail.com>
References: <20220418114022.23673-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Cameron Gutman <aicommander@gmail.com>

Suspending and resuming the system can sometimes cause the out
URB to get hung after a reset_resume. This causes LED setting
and force feedback to break on resume. To avoid this, just drop
the reset_resume callback so the USB core rebinds xpad to the
wireless pads on resume if a reset happened.

A nice side effect of this change is the LED ring on wireless
controllers is now set correctly on system resume.

Signed-off-by: Cameron Gutman <aicommander@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index b9c2e58..2a45733 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1980,7 +1980,6 @@ static struct usb_driver xpad_driver = {
 	.disconnect	= xpad_disconnect,
 	.suspend	= xpad_suspend,
 	.resume		= xpad_resume,
-	.reset_resume	= xpad_resume,
 	.id_table	= xpad_table,
 };
 
-- 
2.25.1

