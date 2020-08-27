Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8C77255028
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 22:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgH0UmB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 16:42:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgH0UmA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 16:42:00 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8161C06121B
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 13:41:59 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id s2so7306270ioo.2
        for <linux-input@vger.kernel.org>; Thu, 27 Aug 2020 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EoftoojDAeVQX8wY//7x/4UEhS50XaZvmdzOjteBfD8=;
        b=iPl0MhlqabvHFYLDmYvok+Mrp6RvrqRbSln+E29jFumpS4aG52HkTFqVGZNsjWqYwN
         zN0LhwmdAQtnGBhDxWEHM9GFn3gjWiKp0q7V77nvFhDbDO2Yji8oRr/M/plDLHaiB5qX
         xAjbLaMe7V9I68zWkeJev/SnhldaRBAisJBSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EoftoojDAeVQX8wY//7x/4UEhS50XaZvmdzOjteBfD8=;
        b=iY4WSDMVIEJ/XfNStoYQ2c9h85XxgK00pSKW2pjdgCC6kQKBIgP2GnUZReXqKPHGaM
         yj8kTnw1KJv1JJCldLzXmYoyzKmVzeMw4qyKUVO+rrJgRNKPTCI73eBdY56VT015AZgD
         AY8kPk80+o4n9/xcRTcU6HW8KqgILGWDRFCTIhOjTx1xB7nCfKR1EgFL44121sJDFRTZ
         Z006dq+dl2jVN6ldO43n+M517viuGWt5Uerd7YLtFLSzwVOb9FRAkiMZPPo/zoFNKvHI
         pYpAlbUNLeCuzWI9OgKeUgnfiMS+rwZs3noSRpdIlP7KAJ8ceyXd9lu73ivQjwIfkKAa
         UOBA==
X-Gm-Message-State: AOAM531C4x184sXU1FmvMR+Zo8KYXcrO5B08+fxQDRAGTFlou9zTO359
        el1UROJ1lXxUOGZH5o73GgOtxcwW7z17VWAa
X-Google-Smtp-Source: ABdhPJwUUS+SW6nQgzx12+Hfezv3y+Z7TwGFeh9cjJ9mkhkwvKbByOPK1VP/r2YVwSiB6ImEx1Rk9g==
X-Received: by 2002:a05:6638:12d4:: with SMTP id v20mr20156929jas.108.1598560918954;
        Thu, 27 Aug 2020 13:41:58 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h184-60-195-141.arvdco.broadband.dynamic.tds.net. [184.60.195.141])
        by smtp.gmail.com with ESMTPSA id u17sm1640328ilj.0.2020.08.27.13.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 13:41:58 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, Shirish.S@amd.com,
        Raul E Rangel <rrangel@chromium.org>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Input: i8042 - Lock i8042_mutex before flushing
Date:   Thu, 27 Aug 2020 14:41:54 -0600
Message-Id: <20200827144112.v2.2.I1417edfd3526143f14fea2546787ba4bb6f32ae8@changeid>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
References: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make i8042_flush lock the i8042_mutex before flushing the buffer. This
will prevent i8042_flush from clearing the buffer while a PS/2 command is
in progress. I'm not sure if this is really possible. We already
hold the lock when calling i8042_command, so this makes i8042_flush have
the same behavior.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v1)

 drivers/input/serio/i8042.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 65ca6b47f41e8..b7ed93c5095c4 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -254,6 +254,8 @@ static int i8042_flush(void)
 	int count = 0;
 	int retval = 0;
 
+	mutex_lock(&i8042_mutex);
+
 	spin_lock_irqsave(&i8042_lock, flags);
 
 	while ((str = i8042_read_status()) & I8042_STR_OBF) {
@@ -270,6 +272,8 @@ static int i8042_flush(void)
 
 	spin_unlock_irqrestore(&i8042_lock, flags);
 
+	mutex_unlock(&i8042_mutex);
+
 	return retval;
 }
 
-- 
2.28.0.297.g1956fa8f8d-goog

