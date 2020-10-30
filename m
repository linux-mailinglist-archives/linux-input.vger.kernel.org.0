Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A882A090B
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 16:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgJ3PD0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 11:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgJ3PD0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 11:03:26 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F16C0613CF;
        Fri, 30 Oct 2020 08:03:26 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id a200so5528005pfa.10;
        Fri, 30 Oct 2020 08:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wPOAjVV4kiO3dWbN38ZM7t7PINpMC3qR5idiAzp0tGk=;
        b=amrzcl738LajoCmFS/izY5kX4I851ieJc1z+K5NLuP7nuomseLM84xj4hw4foC4ErW
         Ez2vfyd+LJoPiH5IezpktuHyraF3fWyh/Fp9VcxDFatYWqZ1SoiTrrbj8T/+t+EbRjTz
         PWAkbFgrPa2IBpUKb+0nJ1ap4nL2s9fISA5Ps4FS5COYa3NZRMsvgSyX6oNIvLIVKaoS
         7CyViu7AJzRhypaw30j36w+1Qzxr41P89gA3HgMoF0qBz8FcJzt//lVpXZTZCE1gAvY4
         WjrgFb7UC1WbtXEDUs+mcWC/ZIGPQqM0gxjswpZR0j4Mty/x6OJdwYCvwVw+7qukP+K0
         wVCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wPOAjVV4kiO3dWbN38ZM7t7PINpMC3qR5idiAzp0tGk=;
        b=OaxbRrZVbQ+4d0nwoJq6RljlnqrnGOh1bn7WbnwEfBg4CHNWwQLfO0It4DMeuuaOfs
         9zSl2frfw3V2XyDR/6S6lJc+uHWhIsDJBoRreKL6dot4a0qdcHZC/UHCylJK5THPTbiL
         HYbWEgN01vTiuBB//4A6Cs9pVoYlmCVXrr5edHjEY9/UZmvYhSu0BFhGSX6KkB03dV4j
         NFaPt3qol8hBT0COA3grtMOUB7kHVN8T3/hfyCTwdB2wsp1wBGMDPx9/ftU7VQ3kSPQS
         eI0R0Oz7NypjkLsd4+bk44jXFCgaU5AHGtK52R+sOkVLmkeukEv8+EZdD68xboEq50zF
         +2Rw==
X-Gm-Message-State: AOAM533wJz+dxxTWhe8J1WYsEDu6wbbMQjtVKGFfvdsi5YYE65zZ2VK3
        UAjloplS/LY9FyqPaIqGtfk=
X-Google-Smtp-Source: ABdhPJyAGGbq4tjzeFzGIbuJu2koitBl4Uj1p6728dAosxhDBoQN3lLorfjSzbzJoXv9fbP54H8oMQ==
X-Received: by 2002:a17:90a:7e4:: with SMTP id m91mr3624326pjm.47.1604070205685;
        Fri, 30 Oct 2020 08:03:25 -0700 (PDT)
Received: from localhost.localdomain ([112.10.75.149])
        by smtp.gmail.com with ESMTPSA id kr14sm4039318pjb.26.2020.10.30.08.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 08:03:24 -0700 (PDT)
From:   Zhaoyu Liu <zackary.liu.pro@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhaoyu Liu <zackary.liu.pro@gmail.com>
Subject: [PATCH] hidraw: Remove the redundent spaces
Date:   Fri, 30 Oct 2020 23:02:52 +0800
Message-Id: <20201030150252.701-1-zackary.liu.pro@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Remove spaces to align code.

Signed-off-by: Zhaoyu Liu <zackary.liu.pro@gmail.com>
---
 drivers/hid/hidraw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hidraw.c b/drivers/hid/hidraw.c
index 2eee5e31c2b7..249666ea9a5a 100644
--- a/drivers/hid/hidraw.c
+++ b/drivers/hid/hidraw.c
@@ -600,7 +600,7 @@ int __init hidraw_init(void)
 		goto error_cdev;
 	}
 
-        cdev_init(&hidraw_cdev, &hidraw_ops);
+	cdev_init(&hidraw_cdev, &hidraw_ops);
 	result = cdev_add(&hidraw_cdev, dev_id, HIDRAW_MAX_DEVICES);
 	if (result < 0)
 		goto error_class;
-- 
2.25.1

