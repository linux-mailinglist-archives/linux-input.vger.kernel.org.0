Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8CC65F958
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjAFB7Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjAFB7X (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:23 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4383659F84
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:22 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so352573pjd.0
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9e3tQmCS4HDkYyqjGtAMjGuh58uLx96dhO77mVRrWg=;
        b=mqvjKTmXIzZkOF/lpwJfV9NdDnk1kx8salVG4ZyhKM6xC3HZa9DAFkAndySYxx5bGW
         1rscjfFtg6GsZtLVUxFa3o9zjCvBKXKfm8kcb6L+m/VtfoxFmKJ+rghZkvLhWeTx91b7
         fsataEHmaCA9h+ZeLBeSHjUbS4ava2+Wq49URWwHI6RzYgqMqVyfji2+/+ar1MPCj7dg
         C/gkY5/HypYzdcpRhaYLee0EZ7th3FJo86dpJOjdnnx0sZ3hbopAvQeYcw0lVkpD7GmB
         pfcFyXi3an2L/FZdfkLwcw2DsJe3Zk2SZVLjXLa5xEpcSBRMVCAbgS8yQtoeYiA3mC8J
         Uh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9e3tQmCS4HDkYyqjGtAMjGuh58uLx96dhO77mVRrWg=;
        b=qxnLzixqRapRB06Py+IcC96rgnTct6pFWxswNOHb7aRnutuI6feX4+ioQNjPvcNL9F
         xudsmZALKSxiP5lmZIb+NNb0AqooxKQIDQIAc2szVG8WXhwfnODwWus56qPxDpulPpND
         CA/yz08Aw0D0YsZk9WNUSlc0h+JBk/9rQLfcJ9VL2b5qW0e1Vv1oBouWswiK78rNq0TI
         r4bw9t0/3Jnbb4HSK14qf9teBdrBpDrcceGlbvHDbwnCXabWSIkoIp+/mwsxPCI0k8Oq
         RpZWzUymzbOcvlkOS1pfot2YMROMWYog92BuwTXQjEi+4RYeTdQn2323KvvFwpcMMtpZ
         nsNA==
X-Gm-Message-State: AFqh2ko+FObxbq4gZk6YcTRb01D10AR2OhdMgrvh7Jn3kPhkZrYwgDQi
        yh2C9lKd/gbIe/OBzGRzkwZeg43i8GrNXgww
X-Google-Smtp-Source: AMrXdXupXAyNXsGzqVC6a+ZTPgOoldzK1a1QRfdMOU18JcoSxZCI/AUpggEYjbNMFfky7+vJ4gawdQ==
X-Received: by 2002:a17:902:6b02:b0:191:1c99:57ef with SMTP id o2-20020a1709026b0200b001911c9957efmr60373840plk.67.1672970361853;
        Thu, 05 Jan 2023 17:59:21 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:21 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Abaci Robot <abaci@linux.alibaba.com>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH 1/5] HID: playstation: fix DualShock4 unreachable calibration code.
Date:   Thu,  5 Jan 2023 17:59:06 -0800
Message-Id: <20230106015910.3031670-2-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
References: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Reported-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index f399bf0d3c8c..866cc4e94320 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1759,11 +1759,10 @@ static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
 				if (retries < 2) {
 					hid_warn(hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
 					continue;
-				} else {
-					ret = -EILSEQ;
-					goto err_free;
 				}
+
 				hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
+				ret = -EILSEQ;
 				goto err_free;
 			} else {
 				break;
-- 
2.38.1

