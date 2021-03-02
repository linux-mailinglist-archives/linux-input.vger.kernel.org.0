Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0E832A588
	for <lists+linux-input@lfdr.de>; Tue,  2 Mar 2021 17:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350816AbhCBMuk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Mar 2021 07:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838287AbhCBKJS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 05:09:18 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29666C061756;
        Tue,  2 Mar 2021 02:08:37 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k9so10466502lfo.12;
        Tue, 02 Mar 2021 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfUQ5KkuJugRcswoXUIYuj0VO0djxRHGJcsWdg+KZjU=;
        b=SREfkOV5YjngyaW6kgRMW6XmqLOOigj8+ADhOCMufJ1iRRUMuNBWbHsCqjUzWWt6RG
         vqIWfYG3W9ZJBvpHPygONmzb9jyvmYo8JlsNZVPPu26vKOGFUwdYvLcDbUFzTizQbxIb
         k8M8URlvwnPCw7E3jD0s1PQEzjVkb3vAtm/RzPLZz/HA+RAnsuPv2IY0fZ8ErMCiHdPX
         MGTznypCqMUo8xtrz2aXggKnx251MUiU6sL9p9EiQNgPxi+9DUtfgEWN74vOmC/iqW6x
         sPA1esYehtYg6JsvtvY6gu/9od9X3IhrHgWd4s6JP+PMEP+KwUhwvqa9BOOYZqjs7tra
         hcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sfUQ5KkuJugRcswoXUIYuj0VO0djxRHGJcsWdg+KZjU=;
        b=Rdm7PfEZ7RNQj01dcYqo1P0H4VUDDDRonoiWWmVvYTkCr2YBbnqP//WmgtvoQJAsla
         R4nqL+HISPxpcLs7LnesuCboE2T/IdNoa+QPtf5vgM0tenJGMrSjhcN5aSdllSTT3Qu1
         zEZ3KyaajiGpwHZxKiepf1s08A/cr5alFchEHDcQKRzNCsmRJ5yugrHoBxAXMqKOCaE7
         BsGIhQ+7Pp5g4035UXX9gdi3mxzRyQcvshZG6B0JESiTLC97i3Zz1hVO3tn4iUJLBhKm
         rVr5nj0hvxLjL1IA6cPzcP04zZ2IfAyMcfbl03unwpsLAlANyWKB+wsWB2xNB4ersG1U
         p+/Q==
X-Gm-Message-State: AOAM530+umB0GBY+2Koe//HsWYYQCQ6xY7D/XwTIudyOlnS32anyt6GA
        ZWFKHickiZ8KIYuQpoXfoe8=
X-Google-Smtp-Source: ABdhPJzmMFbGapGmoNeZO/smtuHVHtf3ixjTLxqIfeAXFo+Ap5rq6rMyT/sYvROMWjn9/0O+wvBcMg==
X-Received: by 2002:a05:6512:547:: with SMTP id h7mr12285352lfl.529.1614679715517;
        Tue, 02 Mar 2021 02:08:35 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id g10sm1725052lfe.90.2021.03.02.02.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 02:08:34 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: elants_i2c - fix division by zero if firmware reports zero phys size
Date:   Tue,  2 Mar 2021 13:08:24 +0300
Message-Id: <20210302100824.3423-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Touchscreen firmware of ASUS Transformer TF700T reports zeros for the phys
size. Hence check whether the size is zero and don't set the resolution in
this case.

Reported-by: Jasper Korten <jja2000@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Please note that ASUS TF700T isn't yet supported by upstream kernel,
hence this is not a critical fix.

 drivers/input/touchscreen/elants_i2c.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 4c2b579f6c8b..a2e1cc4192b0 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1441,14 +1441,16 @@ static int elants_i2c_probe(struct i2c_client *client,
 
 	touchscreen_parse_properties(ts->input, true, &ts->prop);
 
-	if (ts->chip_id == EKTF3624) {
+	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
 		/* calculate resolution from size */
 		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
 		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
 	}
 
-	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
-	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
+	if (ts->x_res > 0)
+		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
+	if (ts->y_res > 0)
+		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
 	if (ts->major_res > 0)
 		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
 
-- 
2.29.2

