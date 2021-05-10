Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5513793FC
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 18:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhEJQg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 12:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhEJQg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 12:36:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC5EBC061574;
        Mon, 10 May 2021 09:35:23 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id y124-20020a1c32820000b029010c93864955so11525826wmy.5;
        Mon, 10 May 2021 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7CyBniwOPY8tdUbpu/vyod1IQczw+Lx7Gt7hD7CHSiE=;
        b=edmVc4vEoj+vVu6hrbDgVhufb4geSAjDgThsIGQTVMT5HZ4GJ8L5LpgigU08uhuHoJ
         +6rNnBuq4i2YtIKnGtl4u5fTY+FHfBUBnJ8dUSEyL/pfKbw+jjyvGJ3i/0YlGVXbSkCt
         4W+qYf5ou+e5z812qHpg3d4x4HOyQ6qxdUWY5W79xiyeT6wf5+58wDKW0XmUts1v9+wU
         0KWGZQmKHIupsDD8+4Agp5dWaDTiOM5FW37yk5+YrD3zvAiaTufb5z7arCGDWNx0jlMs
         BVJkrYKeneo1VWH4z39mxxgIgPsnlfizai0vm5xDA49llDB8uwT+1VQO3ok08wovJZFc
         QsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7CyBniwOPY8tdUbpu/vyod1IQczw+Lx7Gt7hD7CHSiE=;
        b=PcW9ymxKTlBMVEzkGi/XCNORVwPihD2OOGKgp09/rfwcaZOKZzVNwo0Uu+i6bfRVyd
         amNzArhEel6f3Z1FCMeCiUp/tSiQHSYSyfrb0cT0NmcF1ZxiVFoiHlVfvwhHAYhH4kD6
         UNxOVGjkhI9mrYUKUgyD2T5WnB87Z64buMrAvaRFGmPw5xjSXmuhb0f98bbn2VDHqvSi
         efYu7YOtN6TNJjYK+BJU0qOUn/9NhL1+m8LYf6P1mdKI33gqSoZJPJ6QWzSHHctoxiYl
         I/n6IC+fWE4VsfLERG4duhkmLMNKexkRCJ2oxCarEYQktrCP8c+bL2rNFoGP1f22RRnY
         uRkg==
X-Gm-Message-State: AOAM533UY23RgRIFMVkNXFTV2rU+7fc8TxTLl7nLzcV0xlCgV2h2NPjr
        KKXvKYFiBuh8awyKlSSkrkmDom3Xs8Gqag==
X-Google-Smtp-Source: ABdhPJz66QGT0ifBmhFa1w9697xJVRFm8QvqW7gLBKuDL8Zum1vbolRCnb6urNgNONhkB21fe5RX8w==
X-Received: by 2002:a1c:f20d:: with SMTP id s13mr27169110wmc.92.1620664522711;
        Mon, 10 May 2021 09:35:22 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent ([31.168.255.170])
        by smtp.googlemail.com with ESMTPSA id c14sm23944991wrt.77.2021.05.10.09.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:35:22 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     lkp@intel.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org, joe@perches.com,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3] HID: ft260: fix format type warning in ft260_word_show()
Date:   Mon, 10 May 2021 19:34:28 +0300
Message-Id: <20210510163428.2415-1-michael.zaidman@gmail.com>
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

Any sprintf style use of %h or %hi for a sub-int sized value isn't useful
since integer promotion is done on the value anyway. So, use %d instead.

https://lore.kernel.org/lkml/CAHk-=wgoxnmsj8GEVFJSvTwdnWm8wVJthefNk2n6+4TC=20e0Q@mail.gmail.com/

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Suggested-by: Joe Perches <joe@perches.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 047aa85a7c83..ff2a49b5cac5 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -779,7 +779,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret != len && ret >= 0)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "%hi\n", *field);
+	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -791,7 +791,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret != len && ret >= 0)
 		return -EIO;
 
-	return scnprintf(buf, PAGE_SIZE, "%hi\n", le16_to_cpu(*field));
+	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- 
2.25.1

