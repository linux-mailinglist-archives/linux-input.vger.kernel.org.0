Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC4A2C0023
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbgKWGhQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:37:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWGhQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:37:16 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF367C0613CF;
        Sun, 22 Nov 2020 22:37:15 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id v5so9937573pff.10;
        Sun, 22 Nov 2020 22:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=KpShnKVttdp37I3RhLIbeVpDk3jfnd/Fq6u1ok+4a3Q=;
        b=krPGUkQx4arxlxrhaB2ymV4cgj0KDzWIMypxsn14D4zJV6M5b2haLs5sLqv1HLqcFr
         UEe6dmHYt3C1BzL6CnchimSTFzcZfG/6zJrEoDuTuT4IfjK3d1/B49GLYr9DBRCCb0Od
         pIGCBr2xokZkaJLu/SUOhnEIIYBIrJhkOCzRgKKGAL+HhT74vIOGygYXnVR8uLkL2LdO
         K4CzGKNXHBJu+lvYMAfPux3ozlnl7A+c1LsGJdxnXhul87rHOVRgDSJfeeZ6yXCyiUcq
         +P/XJ5TS5e0jg+d9fOAJ9XCLfd2O/357Of6UuLFTFhyk0ZtbjATqU8rURAz4WQ7GEMfM
         K2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KpShnKVttdp37I3RhLIbeVpDk3jfnd/Fq6u1ok+4a3Q=;
        b=WZUBZwdPl9G6SExrItiSMNkvZ/fK1647sd/6YCR4UUcv+Mkbtl7mGDxmVTqwySqEEV
         qJynWB0nj3B+xwunwAx2QlKIa3x74drLx4EsL1UEpQP/mvbu9zQmfU5c/C6A4z2eERGV
         ApRRKR8JkN0VVTDp/FtgKFIw2J5fxRCqII5QnY2j7eUJcxfj0FWRUUp68gZHcCJFzlhx
         ssIQWWx2C4RiH62kvGE1IIpobQybN4nkzJImmzM9nLAgbkIVU4LDw6SHJnROdwnlkLoy
         WHl4sPfBItzndGm4W9xwbo1RpW47iAAE5fzeW1jG3FJDFskv6bs7A2C+dsdIRx6WV60c
         q/pg==
X-Gm-Message-State: AOAM531L+ztRSA0Je4yHMMCArB5PT+OiFnZ5mPiPcriZLZX2J1DyDT6h
        +zxoX3CiaeSbdqMUbEvEuzbIuJZuzg==
X-Google-Smtp-Source: ABdhPJxU9E8nC/buUNO4PTC/Ufg7ettszhhqvrcX5Pj/Qg7cEFAGizHFg64Y5NAJeytuFPdKNoDpLw==
X-Received: by 2002:a17:90b:1011:: with SMTP id gm17mr22422993pjb.73.1606113435328;
        Sun, 22 Nov 2020 22:37:15 -0800 (PST)
Received: from he-cluster.localdomain (67.216.221.250.16clouds.com. [67.216.221.250])
        by smtp.gmail.com with ESMTPSA id z5sm8353787pgp.79.2020.11.22.22.37.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2020 22:37:14 -0800 (PST)
From:   xiakaixu1987@gmail.com
X-Google-Original-From: kaixuxia@tencent.com
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
Subject: [PATCH] Input: synaptics-rmi4 - remove the useless unsigned variable compared with zero
Date:   Mon, 23 Nov 2020 14:37:08 +0800
Message-Id: <1606113428-21462-1-git-send-email-kaixuxia@tencent.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Kaixu Xia <kaixuxia@tencent.com>

It is always true that the value of unsigned variable size_presence_reg
greater than or equal to zero, so compared with zero is unnecessary.
Remove it.

Reported-by: Tosk Robot <tencent_os_robot@tencent.com>
Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
---
 drivers/input/rmi4/rmi_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
index 258d5fe3d395..e7c9300417e3 100644
--- a/drivers/input/rmi4/rmi_driver.c
+++ b/drivers/input/rmi4/rmi_driver.c
@@ -580,7 +580,7 @@ int rmi_read_register_desc(struct rmi_device *d, u16 addr,
 		return ret;
 	++addr;
 
-	if (size_presence_reg < 0 || size_presence_reg > 35)
+	if (size_presence_reg > 35)
 		return -EIO;
 
 	memset(buf, 0, sizeof(buf));
-- 
2.20.0

