Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43DFA68A840
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 05:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjBDEnU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 23:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232470AbjBDEnT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 23:43:19 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5152C2278D;
        Fri,  3 Feb 2023 20:43:18 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id w3so7817419qts.7;
        Fri, 03 Feb 2023 20:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=dgTSqwI7ELB8gfVEaC+P6eJ0ZIz6imZEbNjBgCyLuj83MUXFRVEbOQ445d72d6mo5C
         /yEVOUuYW9qQDxf9kMYMftUD0jfjB2EG04ZW6T0+25TDspXhWKBO0XfUPgFdl+Od+VcJ
         7DGO6OLPZm1qF1eOgdPVHeids8MrmdopV7Q+/90tVQItviL1x2zJoFEjYlblGHHN43UN
         7Sq0OzJI/AgKNyoSngBt3P5ojygS6+lJJIJSIrjNuKzw+pLGNQpxUzK+FNMk6gVa44g3
         lCjbypgtRoNPOiaKJ5inZHBOnB9jIMIJGUrJt4wmmlK/Uj03ixfzdlNqsTS7nfWAMc5n
         XeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAYdJzzeTeXOhvH5ct62NBOgopLWCsTH7OnUSEt6qQ0=;
        b=n44/FOUKc037fyikn+QcnrVLxFxKzh2iOirIYllCvVUkLw8w5vJ51C/rE84cGtSqI1
         6mdChf593HGFuXVyfLSKvWuIzp5NHNQGWuON9ABqZlmjxUXPn8517sA2Z+DsBqNthLMo
         9XWdKjKBJMotqfq8shmIui2qf9AymYKeHEq0DWkF+9JDhs3X9pv/oFGCbgafP0XbaAee
         M/rCdAN66D3MYZWtSIbwxlLcS6Ri0nuzzV42VrD78OfH85oqj+SHV0G2SSItxB0CJ80Q
         wBMLQKmK/cebKtrLQhieWyI1G0UbsIdxeATX/Fqn1DPhs5YPEb2Hjvw1zONZh1zoTZiH
         eCYQ==
X-Gm-Message-State: AO0yUKXGGuAq6SYB4mWQ1WaL7qfddPK8E0Z6RY/blwui7QRUmczoV52X
        Md2LkaS1uAPNZ2h24ctwNtYdw8J3bL+Ckw==
X-Google-Smtp-Source: AK7set+WDPnHolfBXnmrawiwv3l5sfJGC7AbMRGX8Hr4TzhELzVsWIH5W6sGLc9JDRYw++MHLOrpRA==
X-Received: by 2002:a05:622a:2d5:b0:3b9:ed95:6ab9 with SMTP id a21-20020a05622a02d500b003b9ed956ab9mr12864016qtx.51.1675485797306;
        Fri, 03 Feb 2023 20:43:17 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id l23-20020ac84597000000b003b85ed59fa2sm2882135qtn.50.2023.02.03.20.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:43:17 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v2 3/4] HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
Date:   Fri,  3 Feb 2023 22:43:12 -0600
Message-Id: <20230204044313.364-4-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230204044313.364-1-kaehndan@gmail.com>
References: <20230204044313.364-1-kaehndan@gmail.com>
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

