Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3FA1377819
	for <lists+linux-input@lfdr.de>; Sun,  9 May 2021 21:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhEITe7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 May 2021 15:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbhEITe6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 May 2021 15:34:58 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39B7C061573;
        Sun,  9 May 2021 12:33:54 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id u5-20020a7bc0450000b02901480e40338bso8705598wmc.1;
        Sun, 09 May 2021 12:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pwB6mElenYhBSU4aRvtAJPhfJNuyfv9xAVTG9qry76s=;
        b=jl/qaGJ6DA1tGtP4TY1bPVQiBb9lZErRS0VBuhkwYBUbykbTkHYU4pbnlrGbGAkB80
         Fk6LSkfpAtsGG2eGTsHWHYkzJzhkHio/EtIaXx6feE4wEhk1+JHIx/+A5NGWAhRJOkKD
         UnoANa0IGaWP4+jGg8+Y4KK2+FbQEPKRG8VhXLpovNQmtruy96sHzrhf0CABlKp50kz6
         ce4BoGyPDsaHHelzsmg2HXCCLmCAc/MuTb/gr2bsTmSG+gvyOiYfmuHUuKO4H/E7kwuz
         5YEGL6AaOaVDLw0AjcPjzslHV0QDd8ReB84nVs9L2QsXV5w9jGJycKIFhmNiPDG+3tZz
         52Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pwB6mElenYhBSU4aRvtAJPhfJNuyfv9xAVTG9qry76s=;
        b=IpQhp2X0O6897Gr3ySJGsxMmTiPMSC+UcUPWUQ0nK124q2T2yO3G4Xh+vDiwm0QWfq
         IJijdOEVS263Z+bjNWuw+Q4DXazjOe8nXtHkSMmEM5sTYRYXuM7JyAlBBrtLOJ5Ctl5y
         i+q9TEA+O2+Wy3Gs6bPGGkWDlloec1vbckwYF8A/H8ziccUfU+NIexRTv2TrHCewHnHi
         N/mN57ZW0ThHwK/kWaV/0434S+gsMUV5inxN727lkGwvHaI7stBRL6ARxPa3oDyQUCJo
         3wOzP5PRkO+rjQs6NPzdlpjK7nHFKNlMoxOpq2ShaP1LgI3FfDSzGtpMblGeje/X9Vt6
         Pm2w==
X-Gm-Message-State: AOAM5314J418UbgQRBjxcZQp285n4MgT6Gt1q0++NHALEwpR8cv8dKqM
        sMwsQLXunbbf9SFhdn8bMS4=
X-Google-Smtp-Source: ABdhPJy+FzrYLL77UmWpjLMmDX7CH1Id+LoNfk37WRoYlCxv7B8Bx/uqvxjw6PRE2KFs+JVq0q9KmA==
X-Received: by 2002:a05:600c:26c9:: with SMTP id 9mr206497wmv.176.1620588832793;
        Sun, 09 May 2021 12:33:52 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.googlemail.com with ESMTPSA id n124sm23502655wmn.40.2021.05.09.12.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 May 2021 12:33:52 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     lkp@intel.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH] HID: ft260: fix format type warning in ft260_word_show()
Date:   Sun,  9 May 2021 22:32:13 +0300
Message-Id: <20210509193213.5974-1-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202105060637.LeEC6ztp-lkp@intel.com>
References: <202105060637.LeEC6ztp-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes: 6a82582d9fa4 ("HID: ft260: add usb hid to i2c host bridge driver")

Fix warning reported by static analysis when built with W=1 for arm64 by
clang version 13.0.0

>> drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but
   the argument has type 'int' [-Wformat]
           return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
                                             ~~~     ^~~~~~~~~~~~~~~~~~~
                                             %i
   include/linux/byteorder/generic.h:91:21: note: expanded from
                                            macro 'le16_to_cpu'
   #define le16_to_cpu __le16_to_cpu
                       ^
   include/uapi/linux/byteorder/big_endian.h:36:26: note: expanded from
                                                    macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/swab.h:105:2: note: expanded from macro '__swab16'
           (__builtin_constant_p((__u16)(x)) ?     \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/hid/hid-ft260.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..38794a29599c 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret != len && ret >= 0)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
+	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- 
2.25.1

