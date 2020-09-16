Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C15C026BD7D
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 08:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIPGqf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 02:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgIPGqf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 02:46:35 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B63AC06174A;
        Tue, 15 Sep 2020 23:46:35 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id c3so2666391plz.5;
        Tue, 15 Sep 2020 23:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Kpj/DuG1KHwygxJGjUrwyfiegl4CyDbC8dhUBmKLyWE=;
        b=NehCZBbtir+YIepkr+PfL6RfJe8nJcnVt1oiVhrW6HDjkXbhuwSWTPlqggxyXwbf7W
         mqSsqS9JqUOMwLz2XEx4EWrawn43r9oHSYfW0tkTJ053lyBaRXPVeIH+5tSW6Hqq2xwO
         /LuSTdjeL9DsnVFE8FqJdvt4urZxAyKMVYzuL3ssH+WRIlTpUtnIOhPnJyovIe3iLYD7
         iTArwmMqlqMuRHDdq8vnnVXezLrICGKM5Ve8lm97ARs0UZaZO9kwkcqpH0PSHXdt6lu9
         zSPoTuuc/NeMTRNo0y58L54p8GMNjZwF5ChH97jK8jGN4WqEcn9RtAWztVV0+2aC4vNB
         5pfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Kpj/DuG1KHwygxJGjUrwyfiegl4CyDbC8dhUBmKLyWE=;
        b=B4giqm5D1QyzeRQXQo8E2Iny2IbVWeMZHdYsEfwbPEaYtK1b8YEKW2VEkf9nFtInwN
         jQ9vvQSXtlXAaJSm5y5sGMU6G1qGI2xhum5pEcEu5qVeRmAfSZY1GR8lnCaIpmjoZvwA
         4wBoSDFF9XjNHMBNUmpVuOy6pSHCgSuvfzPgnWHfoqJpnzzsiZASEiGuvDA8+eaRLzg4
         LCtqajxQNnGSkep5v0DtWWdDK2VUIqwH18rqByK5PKAN/IHnVXcyXDgadxCFZIlRyXeJ
         DtUaveOXyVaYnAZb7XhJlco0GD3spmQwGnsrp7eVNhWPteO3Tl9TOzjHQuLFUA8v1e03
         M8Aw==
X-Gm-Message-State: AOAM530vw6EAjl31Dw/dtsMn1dw0Ile013lwRELCRdGcp1lo77rWXait
        7fNdWv5cGohyG+jverfZaTA=
X-Google-Smtp-Source: ABdhPJxojof20813U9ri871jpwnbm+kbCs3WMT93ZYuWo8xgF8zWPNfbv4qbPYAVuzeXrSBa28rRQA==
X-Received: by 2002:a17:90a:4ec4:: with SMTP id v4mr2664986pjl.62.1600238794702;
        Tue, 15 Sep 2020 23:46:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:88a2:147c:4578:9e9b:6ebc:aff1])
        by smtp.gmail.com with ESMTPSA id w203sm15502566pfc.97.2020.09.15.23.46.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 23:46:34 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Subject: [PATCH] Input: elants_i2c - fix typo for an attribute to show calibration count
Date:   Wed, 16 Sep 2020 14:46:23 +0800
Message-Id: <1600238783-32303-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixed typo for command from 0xE0 to 0xD0.

commit cf520c643012 ("Input: elants_i2c - provide an attribute
to show calibration count")

There is an non-touch case by non-calibration after update firmware.
Elan could know calibrate or not by calibration count.
The value of '0xffff' means we didn't calibrate after update firmware.
If calibrate success, it will plus one and change to '0x0000'.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index c8d7bdd..50c3482 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -90,7 +90,7 @@
 /* FW read command, 0x53 0x?? 0x0, 0x01 */
 #define E_ELAN_INFO_FW_VER	0x00
 #define E_ELAN_INFO_BC_VER	0x10
-#define E_ELAN_INFO_REK		0xE0
+#define E_ELAN_INFO_REK		0xD0
 #define E_ELAN_INFO_TEST_VER	0xE0
 #define E_ELAN_INFO_FW_ID	0xF0
 #define E_INFO_OSR		0xD6
-- 
2.7.4

