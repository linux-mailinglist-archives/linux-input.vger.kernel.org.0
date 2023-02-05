Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8A468B06C
	for <lists+linux-input@lfdr.de>; Sun,  5 Feb 2023 15:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjBEOyz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Feb 2023 09:54:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBEOyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Feb 2023 09:54:54 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0F81ABEC;
        Sun,  5 Feb 2023 06:54:53 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id c2so10369261qtw.5;
        Sun, 05 Feb 2023 06:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=oN3s8lEqF/jrI7uWWfNCp/oOOHpd1zMcvrWlv2YrgLr+XiQ6zNorSiNpI4RjTK1bJM
         KSkK4uJwxh97f4BTgE1AhX/r1ovMkhDGYISDgEbNEkcgkxidzDO0vkYW2ixoNSg6TxbJ
         T0gs1FbisNe93O40KZB7pCOCKaxjnUpN2lPUVqj92SPmlIMinXaTct+6CZPY+AZtwld/
         8ojaGqUCNpbtWs12b9SMNXC05riA295OvAvg9QF4Y+loa0gG7kxmQmdWLmkAAC2YI+cA
         szCSRXjYOBHtzGVYurhs4cp1iuZzpmkMkOMjGKN6zK+m0jSFaln+u9bHa6iLgilWbnLX
         u9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=XOcjpnzea069iPULPUD3QVCFjLqkn4R+263RoxMbvrUlMWBN67Nt2Tp+A/F4kC3lPu
         evA42AheaX6TIZfRyLrQr2OhtRN0qdLtwFY86cBB6xKNKZL3XnUwLub9n0cbdXWw/qxk
         wCGTtaMBTDB46DJuentMA4LxnFZKcdiHQBnXiP6tc4at5G9Z/YK6uItNbYcR5Wk/evJj
         XYR64DksuDoqdzC6aK/b7Y/ZhrvIhjC4kkaBrXmc61z0r1j5NnMkN9Zp8dFjiNvSKNQ0
         vdaKfVg2te//gOdZd5Stv1MxTx46SzI20giY0O4wRa9spRZk2g7YMJEFcsKZYBmzCV6z
         W+ow==
X-Gm-Message-State: AO0yUKWUHutWrrA78JI7v88ryBAfDOFayCRHu2UhtcqoJ48CEiW5jYv8
        ehP7fM3uhyFbNhY6YcKUYu0=
X-Google-Smtp-Source: AK7set+dn/tif92slXEcOkAutHmwPOep6FbQxODDy5hgz7sttVDRnzSWwdZUW8ZR2stma3B9YHE/pw==
X-Received: by 2002:a05:622a:1986:b0:3ba:38:2f5f with SMTP id u6-20020a05622a198600b003ba00382f5fmr15718539qtc.32.1675608892579;
        Sun, 05 Feb 2023 06:54:52 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm5560048qkf.91.2023.02.05.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:54:52 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v3 3/4] HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
Date:   Sun,  5 Feb 2023 08:54:49 -0600
Message-Id: <20230205145450.3396-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205145450.3396-1-kaehndan@gmail.com>
References: <20230205145450.3396-1-kaehndan@gmail.com>
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

The CP2112 generates interrupts from a polling routine on a thread,
and can only support threaded interrupts. This patch configures the
gpiochip irq chip with this flag, disallowing consumers to request
a hard IRQ from this driver, which resulted in a segfault previously.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/hid-cp2112.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
index 1e16b0fa310d..27cadadda7c9 100644
--- a/drivers/hid/hid-cp2112.c
+++ b/drivers/hid/hid-cp2112.c
@@ -1354,6 +1354,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	girq->parents = NULL;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_simple_irq;
+	girq->threaded = true;
 
 	ret = gpiochip_add_data(&dev->gc, dev);
 	if (ret < 0) {
-- 
2.25.1

