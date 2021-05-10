Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1963793CE
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 18:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhEJQcE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 12:32:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhEJQcC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 12:32:02 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E50DC061574;
        Mon, 10 May 2021 09:30:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id l13so17251377wru.11;
        Mon, 10 May 2021 09:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R6WlYIrjXhMMjZDmiNrG4Yb4zFnbOA06CnHiWUBda2k=;
        b=Px1xRieQxe8ehGRuN7Wyo2OY6CRbuNXoURb1Riu6ipDPqPJSCaC4UfdOfGLZwFpzFo
         PNcryMDWzfzonBmoaJ7+dvnq5F0dGEUgpuirAVal5ruTpi+vymrykViINecL5riZX3yC
         ovG0qCtfgjKwignTnSva//cbxTHAyMKbXv6/OeBkjLWgJfkqazPD2K9iUQP14F96gdqm
         Y8BF5GwWAf8aGSnctTXkXPtbB47v4uE89/ad+QJLaIKnMs+G3iYZkQpXlbeNvqvR5NI1
         Bffaqc6K7BzOmbHFnrB4h9AwOR3s/wUVZ4pch6MPz9pPEKttUVTwidRI+g5NF8YdPrYk
         BtIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R6WlYIrjXhMMjZDmiNrG4Yb4zFnbOA06CnHiWUBda2k=;
        b=FpQ2lu1A5bY0timy0ksmWFb/jrF6eDv/SeR1wIlvS/p5hlCxnDYWE98iUwzPiKWXDk
         Q1Ohn/EpAdBZR99qeE8e7jdP+ALISfhDgJUJfwOoCJ4vbiKmuQNs9WrrhDxiAkCf7wK/
         LYP5lF8xLx1QeMQZCyl70iyhrBFuOPK1zIM+pgr1Jdu63mhr/BGWics5fjcCbZcPnJWw
         gt+0ya2jEF2uYkZU296eyRB7rZh9GoYzXb445nIlnt1TVe+ZgW7i7yXb7iBW5hLil35I
         O9cdmshDUHuYqrT9ypRNuSU6/Zt4v9aZ8HQEowl1y+PHXX2bdaOMGXaueayOeE52D+7l
         0tQg==
X-Gm-Message-State: AOAM531icpiP1nMLfVn6oq24I0mBk+3vS05vRQqpyiS4C5/tEPY5QO+d
        wM2suZHPmvScKmW1sBF3q/A=
X-Google-Smtp-Source: ABdhPJxiP80SgspqWEp7vlbzcr7pBoWxrZItqUl7atVFSSA9G61xs6uo/nr1DMR60ewPN3dDoWyQLg==
X-Received: by 2002:adf:cf0f:: with SMTP id o15mr31765037wrj.181.1620664254079;
        Mon, 10 May 2021 09:30:54 -0700 (PDT)
Received: from michael-VirtualBox.xsight.ent ([31.168.255.170])
        by smtp.googlemail.com with ESMTPSA id w4sm22827156wrl.5.2021.05.10.09.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 09:30:53 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     lkp@intel.com
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org, jikos@kernel.org, joe@perches.com,
        dan.carpenter@oracle.com, linux-input@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v2] HID: ft260: fix format type warning in ft260_word_show()
Date:   Mon, 10 May 2021 19:30:29 +0300
Message-Id: <20210510163029.2217-1-michael.zaidman@gmail.com>
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

