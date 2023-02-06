Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD08068BEBF
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbjBFNu6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbjBFNuh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:50:37 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D209B2194B;
        Mon,  6 Feb 2023 05:50:19 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id m16so1279615qvm.4;
        Mon, 06 Feb 2023 05:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=PXpbPd6vE1wiSPKrt7MMFNq2IfJ5z1tkoSVO89fD3WY1R11nTXSfuwxrEDTfyqY8zN
         kxyjFdwD8yu5wsy0FCpA1DYTDLtxPlZfqv3PJIbT7WC4yB2ZNVV7CWRV0kRFzk5NxYiH
         PUXSl3p/nKcU0Rxqk2xKCl+Z/599crWS0IGBbJCyw79MInp/7cm5TT+SRMM6eOJDlQOE
         FUQoUb8xvoqY2baftF0d8o3KnwvpWR85q/PNU+J4Etl3SnoAG+rlGmJeFkglnpxIsgqt
         A0HRLxZW1qBXSLARZFHI+BVCoKTDQUhhlk0ZPBvg7FZaetbrR8mV43IfA12FQCcobGbI
         6RQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=2dbl1dKm8imewSKfPFHGCUC36lwqYXGtOHm4Tm50DU8Jd1leRAN5bo6uu22ung4oEb
         hgb5L+LrbN95CJcEGC1QwXeeXjdGQFCV+3HrVJjHhM1CFj22h5mQ51Ue5CAJAvjOUUEj
         PjK/yHLH4sJ7pMT6MDV3SQ1VAldAteNw63baNAlGH6ULq2X5IO5swkPDgmRD3JvyU25E
         gIGy/sfdnwXCpkfEBJD9jW6JG5Uwx6umeMbAwoWJr4iKM7qN7jtIzVaf0FOLtYpyeiYU
         qoXE0vjbmXzxRvPInO1TtLM9o0YGfErz95pWmIpmmU4fXTC1rIvao7sKOJMCBojwIQYP
         0tPg==
X-Gm-Message-State: AO0yUKUvZD3Aw+7L6HGwLgW9UYUWZGYzPdxgx132Tu1YHpnxx0O4aAUp
        ko5QHPW5WNXsydlpp+gAyfw=
X-Google-Smtp-Source: AK7set9y9EDYlgbf8ZAmjl3QCUvNkTVlXAQZuBXLOQI7Ua2RFyS8zEj4kv85Y4LqCgSLXEgDrwSUTg==
X-Received: by 2002:a05:6214:2a83:b0:56b:eab3:baf4 with SMTP id jr3-20020a0562142a8300b0056beab3baf4mr13842160qvb.19.1675691418526;
        Mon, 06 Feb 2023 05:50:18 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id ed4-20020a05620a490400b007195af894e7sm7349492qkb.76.2023.02.06.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:50:18 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v4 3/4] HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
Date:   Mon,  6 Feb 2023 07:50:15 -0600
Message-Id: <20230206135016.6737-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206135016.6737-1-kaehndan@gmail.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
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

