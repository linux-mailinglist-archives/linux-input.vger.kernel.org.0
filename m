Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB96A2167
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 18:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfH2Qvo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 12:51:44 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39136 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728161AbfH2Qvh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 12:51:37 -0400
Received: by mail-wm1-f68.google.com with SMTP id n2so3165494wmk.4;
        Thu, 29 Aug 2019 09:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ga+XMFiFry9YiHyXr2eap6q73l3MbDmaJElZidrxT1c=;
        b=Uly+OWR6uY2dDl3aasBq9oAfVvAMFsNaILQM78roRCRzmvO626dk4NpscajCeryt7f
         uG1YrrUSPfcj7RodP26+jn4QoAN4nh/KyL4SAus7T7nPCMJe72bx1NgWGWT2sTxcA4IS
         TFvD+DQXiQ3KTm76eZVRMlWmFAstBKF22E0pWDZCvo9q4pk2tHHMf2soornIeqhgBSsl
         9JUarQzT35NkmrMBYhp98BP8Svo2kxfSr4pFgPBFaTwQ2H6nW+NCeG3fhFC81z6rPjqN
         v5OsboGI2Nhxejl4qDWN9e7GSn+Rb3OIR1MUCS9TnlNV/e/J93K90F36Pmk1kJ99zXQQ
         9VgQ==
X-Gm-Message-State: APjAAAXjZJXrv/SMKVeSvkuzlgH/B1espaZm9VdWMlslo1UOLLwl34u1
        EJbgxvCsnFVVkE3OZzPiOXywcIJ7Vnk=
X-Google-Smtp-Source: APXvYqyuRGgjumaKuo9LKUtTe2GVwiwRDCPAhwD1EdZaxDw8hHFa503mAIqp7DuHTHEoKl0fYRjzLw==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr13309528wmc.67.1567097495899;
        Thu, 29 Aug 2019 09:51:35 -0700 (PDT)
Received: from green.intra.ispras.ru (bran.ispras.ru. [83.149.199.196])
        by smtp.googlemail.com with ESMTPSA id o14sm8340770wrg.64.2019.08.29.09.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:51:35 -0700 (PDT)
From:   Denis Efremov <efremov@linux.com>
To:     linux-kernel@vger.kernel.org
Cc:     Denis Efremov <efremov@linux.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*() condition
Date:   Thu, 29 Aug 2019 19:50:23 +0300
Message-Id: <20190829165025.15750-9-efremov@linux.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829165025.15750-1-efremov@linux.com>
References: <20190829165025.15750-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already uses
unlikely() internally.

Signed-off-by: Denis Efremov <efremov@linux.com>
Cc: "Pali Rohár" <pali.rohar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-input@vger.kernel.org
---
 drivers/input/mouse/alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 34700eda0429..ed1661434899 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
 		/* On V2 devices the DualPoint Stick reports bare packets */
 		dev = priv->dev2;
 		dev2 = psmouse->dev;
-	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
+	} else if (IS_ERR_OR_NULL(priv->dev3)) {
 		/* Register dev3 mouse if we received PS/2 packet first time */
 		if (!IS_ERR(priv->dev3))
 			psmouse_queue_work(psmouse, &priv->dev3_register_work,
-- 
2.21.0

