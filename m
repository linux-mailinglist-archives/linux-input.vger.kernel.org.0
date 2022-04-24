Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA83650CFE2
	for <lists+linux-input@lfdr.de>; Sun, 24 Apr 2022 07:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238302AbiDXFkO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Apr 2022 01:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238299AbiDXFkN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Apr 2022 01:40:13 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5BDF3A66
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 22:37:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id h12so16276442plf.12
        for <linux-input@vger.kernel.org>; Sat, 23 Apr 2022 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJZ57rotgknGriVoCSZpWB/lU6/heLoKJgxUVtwHoP4=;
        b=qd6XyztRR7ksx7nXPZC/bxKjrFC7ezvLZrfSsFweQKmfcbCIUIYA6zO+fxRVYBxhVn
         7x4x2ekr70zKV4pW5z6UBx+Og1Mgl+HHXiVgm61EKrzDz3EoHp8K8vd1CDcfHfbKuKGl
         j7RXNa0DEJpA4iLZUHqILx30Q0gaFEcRy5qpY5CDGnfK5vhBzaiP+2BUdEVjIxe73xti
         1zZsRl+GpPBP7b/LKzBTKjiTwjlW7A10eQZGlKbpExDxOzyfiQ0tj2lu5rYZJBBlsWVy
         7SIlUv4e7jzTBQuctFCdTG7ZQAb5c1gR6jfyHqWzLCirxJLBhD2RKwc9jDZ7nIHdv+be
         7mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJZ57rotgknGriVoCSZpWB/lU6/heLoKJgxUVtwHoP4=;
        b=3I30Z9IW8avK0aPwLx6YtdFGsk78LaVCMRvIV4jIL9yK/CMOkDnIQ5WBiaZZ/NQbVS
         8ntIRDiU4MGtDT1dLkF8qAqhM/0rE4eP94uIuNizdXKHSvNrvDkDAiGEiO61vvpN14dp
         dezSk63tZqZt6vN2KY/kixSTilBa4w+6itpPAKj/8FjJRmijNBDvFP1GIxsHySGRGKsD
         K+y5hrYaMEwffxoQQnVwWtIjkLY+GLuM2Yqc7uqL2EfpovDdvJzdiEqdOj16Qa+m2CW2
         UFoRP+U4bruj5XxvdqehuAkrT0upWc0f8hDZ4eYU9O/TlqgSbLzT/PfEOrYnvOCkT8Ef
         KrcA==
X-Gm-Message-State: AOAM5317mlBGnBlDK2912z1AVRXna1Y3LGArTK3GytykiY8m+o9t7quq
        YG5hgrXCdJ+tA6PBXO1xw3o=
X-Google-Smtp-Source: ABdhPJxM0OI4CRisGET9d2imqymv93LLDIQtF88TDSgZuWYu4HN6ApVkZ4HK03OZ4OzR2Q9xVIU7KA==
X-Received: by 2002:a17:90a:638e:b0:1d2:b6e3:6e9d with SMTP id f14-20020a17090a638e00b001d2b6e36e9dmr25009957pjj.74.1650778634073;
        Sat, 23 Apr 2022 22:37:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:4f00:cef0:80bc:70bc:7f0e:3477])
        by smtp.gmail.com with ESMTPSA id s22-20020a17090a5d1600b001d967248885sm171695pji.29.2022.04.23.22.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 22:37:13 -0700 (PDT)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, hadess@hadess.net,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] MAINTAINERS: Add Wacom driver maintainers
Date:   Sat, 23 Apr 2022 22:36:58 -0700
Message-Id: <20220424053658.62328-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As suggested by Bastien and Jiri.

Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e8c2f611766..3d387a11ea36 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8749,6 +8749,14 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID WACOM DRIVER
+M:	Ping Cheng <ping.cheng@wacom.com>
+M:	Jason Gerecke  <jason.gerecke@wacom.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/wacom.h
+F:	drivers/hid/wacom_*
+
 HIGH-RESOLUTION TIMERS, CLOCKEVENTS
 M:	Thomas Gleixner <tglx@linutronix.de>
 L:	linux-kernel@vger.kernel.org
-- 
2.25.1

