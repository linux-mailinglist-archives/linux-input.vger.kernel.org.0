Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4817FBDF3
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2019 03:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfKNCeS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 21:34:18 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45318 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfKNCeS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 21:34:18 -0500
Received: by mail-pg1-f195.google.com with SMTP id k1so1349662pgg.12;
        Wed, 13 Nov 2019 18:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNuGigDplefke9uD7V7a46qDlXxl9M1mwAXio0kpbpE=;
        b=Rm8IGYNOINdzalkfXlhDLBut0xFA3QR+4oOZqnksjtGqQf6EAQLG+bQjsZkMBvYAr9
         Ob3iqfrHmVsyoZqY3XVAqKhWABCUy9/HyFGuYQrJ6gmV3AvsomnVxtGtbHIqvq+af9hm
         bRh6S/ZKb0a8iqLvVpIy8DHgaIp74QEZMOILAnF3z5+1T1gTwjri69BrOdDc1EOwcA+S
         VQXjFivHIgOpSWchXNM+sOR1E9Ud53/9DZ2B/4XjJ127Cm1+lUq7j/NzYfdVjO+Ri1UT
         u0Es0XzDmYa0FQOkXrwoWzR6Xf9amY0cA6OU6SrizjhjolKhIpCc1v4ulvCsDy73vt/9
         WsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNuGigDplefke9uD7V7a46qDlXxl9M1mwAXio0kpbpE=;
        b=NGMZ67phk5YMpX/ibcbs2AyPori5q0BdyGu4qtxmq8BGjPg2tpN67PEosuRjQlf0n7
         eO/WVrDCP76ACWYQqUCEVZ1oGpNgEZlT9QRVkLCJY8MSCqJPxyoHK9brAB0k2q3GLDVC
         fMvG+uvvRqvf2BJrzihEdHYw+aLy5ow4WF/hssCxvFDs7UgJ3D28Mh4+u+LhrezuktWx
         i7KXqd8AD1q1M0TdKoY9+RY2kSSdLBfbgJmfpifK4e2RgMB/fjLXkBamMxxmCbyNtqck
         WM+yAnvUY0NM8mIZ3k/WtXDrS9W3F+GiL2oztlA6cKN/9EgTNW3MJMP8vhqEOzrmSON/
         Q/Tg==
X-Gm-Message-State: APjAAAXbshvZCKFXgV0id1e2p6jBU++2DITA7aZBl2Htd4hRdyDl7/0B
        cYl2bRaIWWsASPwBIa6+eK78Oi5xcGs=
X-Google-Smtp-Source: APXvYqw6Ec+VA08qnwA+GCINf+BnGboNfsiOi/cCX7ICrikf1WLFZIb2fRKPbf1wH20spNB4bNd0Yw==
X-Received: by 2002:a62:1ad6:: with SMTP id a205mr8174498pfa.64.1573698857402;
        Wed, 13 Nov 2019 18:34:17 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id u36sm4848774pgn.29.2019.11.13.18.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 18:34:16 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] Input: synaptics-rmi4 - add missed operations in remove
Date:   Thu, 14 Nov 2019 10:34:05 +0800
Message-Id: <20191114023405.31477-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver forgets to destroy workqueue in remove like what
is done when probe fails.
Add a call to destroy_workqueue to fix it.

Since unregistration will wait for the work to finish, we do
not need to deal with work in remove.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Remove the calls of canceling delay and flushing workqueue.
  - Modify the commit message.

 drivers/input/rmi4/rmi_f54.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
index 484ae1f97330..897105b9a98b 100644
--- a/drivers/input/rmi4/rmi_f54.c
+++ b/drivers/input/rmi4/rmi_f54.c
@@ -730,6 +730,7 @@ static void rmi_f54_remove(struct rmi_function *fn)
 
 	video_unregister_device(&f54->vdev);
 	v4l2_device_unregister(&f54->v4l2);
+	destroy_workqueue(f54->workqueue);
 }
 
 struct rmi_function_handler rmi_f54_handler = {
-- 
2.23.0

