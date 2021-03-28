Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40C2834BFE4
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 01:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhC1Xzf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Mar 2021 19:55:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhC1XzY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Mar 2021 19:55:24 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B11C061756;
        Sun, 28 Mar 2021 16:55:23 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id c4so10937924qkg.3;
        Sun, 28 Mar 2021 16:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/X7rLd9c4uJ3A2f0AZurEyNpS9KP1WXO54XbpQnR5g=;
        b=J0MT42qZJSdOmCP70SSp5E763yWMZCmJVk5R/L0YumVd9Ev989M/WMyetXKkeP22NH
         0clixICxIaMpObN/L7YE4sMbOYB8JIk184qsHOGoCcVLYcH5uwqRPJdDx3LQqF/smls3
         RQEZkl+v/KmewMoi369DzYMIs7cismKVucNYjsmLN2iEyYo1EicQzBt6L4uHJnh4JGLx
         L1MWlO6UAfI4SjicBwTcEUsykad8c+AfPX8vKrQ5a/XXvUAlhOX69yyRHxth+9EFO9Sw
         z12yIcXAkKK68Z8Sr7seLHppcDmnu4SkQ+0Ri3Ya22WO5xezd4ZUZkkmYiFyWIAbOcQM
         Gzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y/X7rLd9c4uJ3A2f0AZurEyNpS9KP1WXO54XbpQnR5g=;
        b=sg4qieTPIoufX+yahMeAr+7Q3GVHlirGweMJ/9WM6Db2qnmKzUFz+LBN5R/dbdSZDV
         +mLUfnnabtOx0fxVfQ34xs9+ELedgxVSM7rAD7BeDEKTdhvIbx2BTOKuTYo2Ll+LpAHO
         jBEBBj5tdKz40kx2Fy6LVv24eIYe3XZbBiYfuO3qIvHSFnm8BT4qcLrFW21VNOKhbM68
         Vpi3UyN+M5RDp2Nsw3Q4ZqC/PuVlsVqPTKzUdHlA3Rj3+QbAwJt3F56rzG+s9tCst/1c
         NwAbMydvRfHXZt03ZHo3aKkz9N9XPMJp1JDMEavL4N76XoCHHpfFK3Wh8b22Kyx9CVLP
         Bqdg==
X-Gm-Message-State: AOAM531UZT1RlS2BL2VZ2YpVdKgvMIQB12N2G0mkEMipNIHa1Lyvp+UL
        10ia1sSWBbcZeb1zYqpoV/quJVYaL1Q=
X-Google-Smtp-Source: ABdhPJzkaVo9UnsB1HXDVkwln3DMD6ElY0KbO1AASnLgqsE6bSuyGh3orlfjj4DdCu7mTiz1CqQKbw==
X-Received: by 2002:a37:a404:: with SMTP id n4mr22659531qke.439.1616975723126;
        Sun, 28 Mar 2021 16:55:23 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id t2sm9969129qtd.13.2021.03.28.16.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 16:55:22 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: elants_i2c - drop zero-checking of ABS_MT_TOUCH_MAJOR resolution
Date:   Mon, 29 Mar 2021 02:55:07 +0300
Message-Id: <20210328235507.19240-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Drop unnecessary zero-checking of ABS_MT_TOUCH_MAJOR resolution since
there is no difference between setting resolution to 0 vs not setting
it at all. This change makes code cleaner a tad.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 4c2b579f6c8b..7ddc24471819 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1449,8 +1449,7 @@ static int elants_i2c_probe(struct i2c_client *client,
 
 	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
 	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
-	if (ts->major_res > 0)
-		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
+	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
 
 	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
-- 
2.30.2

