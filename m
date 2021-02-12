Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E04319A06
	for <lists+linux-input@lfdr.de>; Fri, 12 Feb 2021 07:45:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhBLGlw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Feb 2021 01:41:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhBLGlv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Feb 2021 01:41:51 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C92C061574
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 22:41:11 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id s15so4607591plr.9
        for <linux-input@vger.kernel.org>; Thu, 11 Feb 2021 22:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLo2cPKFl8L92kv1OZkZ6eeFbvtWh0ZA5ytRkdfBx4s=;
        b=xN7OrClzd/0hHZ3UBOu62zl46yddJvZlu2dymNgGu37F1DFA4SyAWOezYvWy8eoKdE
         ydeDSEbczL2KkDXxBrjND7R69e/GMdaTkL4YAs39v38UE8wqirI18a3N6OworMHdmw1o
         FEWSUdJXio8NfrzaMMIrexV0XIqzuU3MqqYBGEAlK0mUVJE9I8x+Biwrs5HStPTuMaM/
         zvIDCyCf4JKsvdsy8cssKS/t3rJvEbkfgLhpTtYiLifQqB3f8PZmGLEeC0/8YkwlQnQy
         /NkqWHXlD1HkRLFK7TcDOaKcuQxInxwTqhAT5tE+qX7/5pNiv1DfoFK5O0fjRBlT4+nf
         1Ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eLo2cPKFl8L92kv1OZkZ6eeFbvtWh0ZA5ytRkdfBx4s=;
        b=NWDZFnvlSYFc1i+U2nQKYJePbf5xMH/UEk67gc4wWgbOMUs6zE1kgP4ImUJzsnQKkY
         xCkxhNY+2089OTu4rykBuC69WxPoJVI4bEAlpv5+GC6IQE2UlOaBeh4POLY5ZS7bg1Yn
         qmPgAQAU9hGaUTt09+G+ExAf5f3FsApaXgOnG87+261jCHkNVJH47HOROFDbzHgKzejp
         P3Ge0zc3ZEweNo8A1iiKWdlyNvl6HxKfKUeUK1eSfsDi12rV6hitwdumRrV8n5CMWGLo
         2+N72dyoksIWMkwOiOYCb2pKqPPqDyD9MJwuoEKeh9Qz6CTRhKguDuq3pnk4DgTwfHpM
         zZwg==
X-Gm-Message-State: AOAM533WyGfhi7ET5Upg58/R70HvOTNEzOCQztOuTEvvLJGKUHMtotLc
        ToNXIAlnC/UUA+qnPw6npS5M6NXXT9saJQ==
X-Google-Smtp-Source: ABdhPJwyfQLs95iMbGBGNHc7Ty6YCUf0kngFkAcagik+JQWLVBW6PhIm7tOvScb+24k4u3a2H4liyA==
X-Received: by 2002:a17:90a:3188:: with SMTP id j8mr1471280pjb.53.1613112070874;
        Thu, 11 Feb 2021 22:41:10 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id jt21sm7025081pjb.51.2021.02.11.22.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 22:41:10 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: playstation: fix unused variable in ps_battery_get_property.
Date:   Thu, 11 Feb 2021 22:41:00 -0800
Message-Id: <20210212064100.27193-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

The ret variable in ps_battery_get_property is set in an error path,
but never actually returned. Change the function to return ret.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index cc93c16cc822..408b651174cf 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -391,7 +391,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 	uint8_t battery_capacity;
 	int battery_status;
 	unsigned long flags;
-	int ret;
+	int ret = 0;
 
 	spin_lock_irqsave(&dev->lock, flags);
 	battery_capacity = dev->battery_capacity;
@@ -416,7 +416,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int ps_device_register_battery(struct ps_device *dev)
-- 
2.26.2

