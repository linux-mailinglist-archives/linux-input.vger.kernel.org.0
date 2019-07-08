Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6630E61E73
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2019 14:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727545AbfGHMdk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Jul 2019 08:33:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40619 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbfGHMdk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Jul 2019 08:33:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so8217477pla.7;
        Mon, 08 Jul 2019 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=lkjVj98Felp05trt7jRzFQsD+gNA9UjSMyIU2HU/EqU=;
        b=KEp5Uj9Wkb0QGty172p5U0KeVxe2SDg/PDpZfFwtY/HVROxcxnMMhHNwRrpxijdc7+
         HeyCR76HA1WFhMsTtnxHQD0SVVjy2JekKzXuhemh/CIkRD3UIgQSw3P5x1T9WPAur4PN
         WnmcsVTJcP7GtTzBuiHgrx8Cn7LPk8swF3ereGdcpHW239E2+au+t67nLbXWwx+pZxSI
         x3FDjh3ta7gynKpk1YY71VgxnBbZuXagWHDQfxNOvZPTSFN+/1Yt+n8dy3Vmdo3M89cn
         59jpTO5ChLfID61+DwQrlPYNsNYwviN8O0dVGoaO5d+NXKekw2441YufVQiozmfjGC7b
         cGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=lkjVj98Felp05trt7jRzFQsD+gNA9UjSMyIU2HU/EqU=;
        b=oqezzvAvBq9RWkcNFuW6Sy38uVEYcz3QSPMfsqr6kTW4LPq1R07RknIvDGjVHdH4XS
         Fu+0LhgiPM9l90zL4weo3tpCcQv/kR8fPcMWPFsqjlQv0LqXSgJKSrwv1r381BHhPh+f
         Ap0CWGt4gaB8KBVAHehq3dwT9kL4Qi1RR7QwvI6Y3gV/auUcJsUvEHres3vnWEl1bngk
         1TdflqdIQkEaOp6a5YzaWx2VM+eQzebAVTiu45Tsia5NQ7DEZVPiZ7FLlqyR/WMWQ+w5
         VRDVxnoiNQeav3XARAu72A6jqz102gkmeANvf2dG50Q3xkLEfb3ASq1UIln19SqU3hF2
         PKqg==
X-Gm-Message-State: APjAAAVLVezBpuEyPlw3CkNommz9+S6aUOPFtkEOL833aD6kpHbcqeyY
        KBrbV0DDDw7yPfjX//96WUw=
X-Google-Smtp-Source: APXvYqxnKi+ASBL+wRU6+87VJNasFODvRDJ8hl2UkMHkb8EgXBxEiU1qHDgD6AKW8ymV59lm/+QcIA==
X-Received: by 2002:a17:902:7687:: with SMTP id m7mr24837299pll.310.1562589219671;
        Mon, 08 Jul 2019 05:33:39 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id c8sm26537982pjq.2.2019.07.08.05.33.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 05:33:39 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [PATCH 08/14] Input: elan_i2c - Replace devm_add_action() followed by failure action with devm_add_action_or_reset()
Date:   Mon,  8 Jul 2019 20:33:32 +0800
Message-Id: <20190708123332.11989-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_add_action_or_reset() is introduced as a helper function which 
internally calls devm_add_action(). If devm_add_action() fails 
then it will execute the action mentioned and return the error code.
This reduce source code size (avoid writing the action twice) 
and reduce the likelyhood of bugs.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 420efaab3860..a8d4f3bd09bf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1234,9 +1234,8 @@ static int elan_probe(struct i2c_client *client,
 		return error;
 	}
 
-	error = devm_add_action(dev, elan_remove_sysfs_groups, data);
+	error = devm_add_action_or_reset(dev, elan_remove_sysfs_groups, data);
 	if (error) {
-		elan_remove_sysfs_groups(data);
 		dev_err(dev, "Failed to add sysfs cleanup action: %d\n",
 			error);
 		return error;
-- 
2.11.0

