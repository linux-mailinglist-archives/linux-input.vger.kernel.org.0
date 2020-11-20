Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1941E2BA395
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 08:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbgKTHjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 02:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgKTHjY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 02:39:24 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76475C0613CF;
        Thu, 19 Nov 2020 23:39:24 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id a18so7055602pfl.3;
        Thu, 19 Nov 2020 23:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWp3zDlJAaUqTC0OXFuSg6mMstAV4gZkHJCc90d2B2g=;
        b=jYPhL6oxtEKpceK9BE0duZ4iD2Drdu3b66Ix64fmdvSEIHb6Znpz48K/tz8yk9CxCJ
         diqbJlp8r381o6trmo7wESS3ZdnZ52VR39NCqcCwAPVuRE7UFUXYpdta39OljrLQYaK9
         yj7yO3o0rmcOmsZJ9CyhK5B8f7bC0GKnAdLDYJhr6GK9Mdt9kcVHxibcipMFpru30O3l
         4FXmcnxIZh9639M/mvJ5dhsfNtYR/16UdMfjpDDJ0It75AnaJa86fBS7SZ4b4G8XxgRy
         +COrIm1K0hffebWaCFSG7D1xxoi2fcUMYZJffO7jwHli8Eeg9Lq3U8hVA3hyuJcOO8fM
         fIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IWp3zDlJAaUqTC0OXFuSg6mMstAV4gZkHJCc90d2B2g=;
        b=pmz8hpsWw6ryKCvzDklXYLC5VJM3K5LACXhqk8XZ0k5pTmxxFAczHl6aEbb7bMHCSa
         ClxVz4vxA+WqNbdHMJkcU8wXiJGDH9zaezCWnR1zc/OzDxsUwuI1WBggWaru6Zu+zSEY
         zXaVl4YRbjFjc2oNrrRu08IRLeausrWVVNWu03yduFvRgOY4XBCZtMtwcwYFhhg+RpNn
         YY/NWeJ+JdOo2/BoHm4EUVwCbLcqObTXUYpxAk/HhgZC07MTbvQg/q2qOfE5/H8y7Ohc
         /DsgyNLvbzdI+hxXF7Kqmx7mwh1qlVRcErwuzTmEdNGy/50SSfOEbeQNtb6PYozBVlsp
         kf+A==
X-Gm-Message-State: AOAM531Fp9r6wIG7RF8xQHCSL9+NYxlcrKMJSMONMC24u5ges4kqqz+W
        bWNMnHXrU3PP/dfCriZtxIVUrEpjAQg=
X-Google-Smtp-Source: ABdhPJws7A9Tx9BTL4zZkWZnwTv7juAqUtVLVTnFxautS6dAFnk3SO8ldQit5Ug8f0oesoP/vnMAFQ==
X-Received: by 2002:a65:4241:: with SMTP id d1mr15468131pgq.18.1605857963809;
        Thu, 19 Nov 2020 23:39:23 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b3sm2324002pfd.66.2020.11.19.23.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 23:39:23 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: adp5589 - do not unconditionally configure as wakeup source
Date:   Thu, 19 Nov 2020 23:39:19 -0800
Message-Id: <20201120073920.3214492-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should not be configuring the controller as a wakeup source in the
driver, but rather rely on I2C core to mark it as such by either
instantiating as I2C_CLIENT_WAKEUP or specifying "wakeup-source" device
property.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/adp5589-keys.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index e2cdf14d90cd..d76b0e4e67c4 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -930,8 +930,6 @@ static int adp5589_keypad_add(struct adp5589_kpad *kpad, unsigned int revid)
 		return error;
 	}
 
-	device_init_wakeup(&client->dev, 1);
-
 	return 0;
 }
 
-- 
2.29.2.454.gaff20da3a2-goog

