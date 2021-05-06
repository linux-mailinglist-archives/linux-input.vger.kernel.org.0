Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC8F375D52
	for <lists+linux-input@lfdr.de>; Fri,  7 May 2021 01:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhEFXIV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 May 2021 19:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbhEFXIU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 May 2021 19:08:20 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F09DC061574;
        Thu,  6 May 2021 16:07:21 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id g17so3986657qvl.9;
        Thu, 06 May 2021 16:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdoQKvWPL9i1TBAUsjZf0P4J7XliNekoDzOXUw16ac0=;
        b=WtVmoKZvUBY2suy7YuVFx53lCrAJzQ+Iz1WtCTP0c1SuWz+EFuek2wNMZmxGs4MPAl
         1c3AdMhHS1ruqfdnwwL98gIPO2+YBEoIY1D+r+5ZiT2n4DcLeBl/ss9z/pn+7Mv85nzr
         9pby1hzKSfRnz5YvbMoqStht2DrLe9T7NnOEs3P6zs1qTRGLEVcc8Iyay8r/ql4Oa409
         wkXoL2M/FDQAzkI4sSw3oxmLc/o8/G1NBJZbjaCpn/ymmD7ubqE92ro/0fh041tqvrfj
         Wf74Myl96UKOj/dkxGxvhTWg4PWz/DYL74rZCLckw3CzUSoOk1+L9uGjl47zTxUp3qq7
         h+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hdoQKvWPL9i1TBAUsjZf0P4J7XliNekoDzOXUw16ac0=;
        b=IurPAqaDP1MJtlgWwaaXSlvpCfH+srwtLzBZkV5ZoAmACyC2J+4fqHUzSCBzx4c1dO
         mUt3+7dpHymOz4ZtBbXdILzMkSfFmZ5y8490dDbpuNlnSaZmlZlR+XGbDGDTl6T8xiQ9
         QMIPOxHvr5cmPD7xDOlxANufBNZan0jLH2RUxd7QC5lLSEqDR0s2DLq3g1Fiq80Ofc4q
         2AyNv3kTRn1ZGHem19cyGVMYzQsjXqvai3GWkhKn/XXULYunW+Hs0/IHCibmCBJziKxv
         T9X6/CkzWNp+VpHMguOnTcQ16UFFlOR1Jlknm9Y0S6QYMF3gJZAMsICNZhGc7/4W4+P+
         VuIQ==
X-Gm-Message-State: AOAM530VCUFchZdwJosD//zXEJhmnlEU7wo1PImjGqzyQ6UK60VEknKx
        ZIr59A3zr+CMPvVPeU+lEF692HYFbUeN2RUh
X-Google-Smtp-Source: ABdhPJwEHz02mhC8X+DsKOaecOgpqtF7urmqyiL8Q4SSWBZB3QjIgouyobhW7pIJcKAkQ3pfPU7UoA==
X-Received: by 2002:ad4:48c4:: with SMTP id v4mr7051528qvx.16.1620342440573;
        Thu, 06 May 2021 16:07:20 -0700 (PDT)
Received: from localhost.localdomain ([107.171.200.67])
        by smtp.googlemail.com with ESMTPSA id m22sm3514150qtu.43.2021.05.06.16.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 16:07:20 -0700 (PDT)
From:   Michael John Sakellaropoulos <mjsakellaropoulos@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michael John Sakellaropoulos <mjsakellaropoulos@gmail.com>,
        Hansem Ro <hansemro@outlook.com>
Subject: [PATCH] Fix ili210x touchdata coordinates endianness.
Date:   Thu,  6 May 2021 19:06:01 -0400
Message-Id: <20210506230601.429756-1-mjsakellaropoulos@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes how coordinates are parsed from ili210x touchdata. Through observation 
and manual probing of the i2c bus, we have confirmed that the values stored in 
the registers are Little Endian.
(Tested on Amazon Kindle Fire Gen1 : arch/arm/boot/dts/omap4-kc1.dts)

This patch is a follow-up to the earlier one by Hansem Ro. I am also working on another patch
that queries the touchscreen controller for the active panel resolution (via REG_PANEL_INFO)
so we can report the correct resolution to evdev (right now it's hardcoded).

Signed-off-by: Michael John Sakellaropoulos <mjsakellaropoulos@gmail.com>
Tested-by: Hansem Ro <hansemro@outlook.com>
Fixes: e3559442afd2a ("ili210x - rework the touchscreen sample processing")
---
 drivers/input/touchscreen/ili210x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index d8fccf048bf4..15e68d5a96d8 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -90,8 +90,8 @@ static bool ili210x_touchdata_to_coords(const u8 *touchdata,
 	if (touchdata[0] & BIT(finger))
 		return false;
 
-	*x = get_unaligned_be16(touchdata + 1 + (finger * 4) + 0);
-	*y = get_unaligned_be16(touchdata + 1 + (finger * 4) + 2);
+	*x = get_unaligned_le16(touchdata + 1 + (finger * 4) + 0);
+	*y = get_unaligned_le16(touchdata + 1 + (finger * 4) + 2);
 
 	return true;
 }
-- 
2.27.0

