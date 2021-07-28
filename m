Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 486863D9498
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 19:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhG1RxO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 13:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhG1RxN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 13:53:13 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F70C061757;
        Wed, 28 Jul 2021 10:53:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g13so5478709lfj.12;
        Wed, 28 Jul 2021 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm75ZB5VdVuBBmoitin86D/VWTwVxc312/+D3/8LTp0=;
        b=ZnKe+p1a9j7y9qfRm4New4U2K6IhthlUQg47Ch5T5YrD61PAcXK4skqbcsxGyKEwO6
         EVoiHHh+70Aef6qrOoLmweCbo6FOqOqi2teAhmOrOT2C2vjGCoOepcwXmdrSxgSuzLsH
         vRerbo0Bt6pOo8ij+0n7XJdaOFP8TKTwwTjmEs5Gog/DkFDg5pqPHtdfEDFaBbqot/JV
         wvDaTCAnZcMys+xEEgPHU2qDRUKFOlPo7t2aWvKRhjDbBuYI4n9l2j5SUiguWtYnYxX6
         YXjXwEVVmKfQNuzgIhls0bgHmGuAcq146ITrS/qnJOxEj3fFGJxanHDe7I65N3sJ1i7u
         WzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm75ZB5VdVuBBmoitin86D/VWTwVxc312/+D3/8LTp0=;
        b=myEykVhKKmatStQraxMbBMqTwU+AMnKANm91ZGvowMsCcwRcZr5hlXh9ByHP5t8ago
         L833RZSjMO6TOXW4ISkaA6euH6iqKCzcU8E0gOmERsTlcBSCE72uAoBt6ap3bjGjfOmX
         AvJ8fyL6F6lEh67scAnESbLR/pKFj0jNgZ+jNvZhEcMYj0lBCeC0nSM3rAOVKo8zbYAg
         IRrgiATTsoO59nRevWoYKGxfxKbFn7RdCJ+9JPCvVV7zRG7ifM4L0AoGrNCg/zaCE46f
         9CZ2oo9rsyqT/aFKuUEMhPoitKcxr5qyCBZQvOhGT676xytChTJoY5dXF8YE+s+92W55
         0XeA==
X-Gm-Message-State: AOAM531n00AVrjSJTvhAtCkrnliVLxOsSP5KjXILxhP4bAix0Xx5W2ro
        Q/5JXRJgwk9TpcPyWSQoGPo=
X-Google-Smtp-Source: ABdhPJzg0A5mU3Gv0GBUNwL/nup5VXdCucDAF5WWBS+Rxdakp1Ke+S6nZiANg94gjO8Z6IxI057X0w==
X-Received: by 2002:a05:6512:33c9:: with SMTP id d9mr561793lfg.28.1627494789216;
        Wed, 28 Jul 2021 10:53:09 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id t3sm23147ljc.104.2021.07.28.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 10:53:08 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     YueHaibing <yuehaibing@huawei.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] Input: atkbd - constify static struct attribute_group
Date:   Wed, 28 Jul 2021 19:53:03 +0200
Message-Id: <20210728175303.245038-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The struct atkbd_attribute_group is only used by passing its address to
sysfs_create_group() and sysfs_remove_group(), both which takes pointers
to const struct attribute_group. Make it const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index fbdef95291e9..c96e4dcb43d8 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -335,7 +335,7 @@ static umode_t atkbd_attr_is_visible(struct kobject *kobj,
 	return attr->mode;
 }
 
-static struct attribute_group atkbd_attribute_group = {
+static const struct attribute_group atkbd_attribute_group = {
 	.attrs	= atkbd_attributes,
 	.is_visible = atkbd_attr_is_visible,
 };
-- 
2.32.0

