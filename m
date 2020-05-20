Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C900F1DAC43
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 09:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbgETHdg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 03:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726309AbgETHdf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 03:33:35 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8EBC061A0E;
        Wed, 20 May 2020 00:33:35 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id k19so1819936edv.9;
        Wed, 20 May 2020 00:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JhMvQ6wT2z/w9jJ1AFzBZlKrPInU1Ytn40KkatChIbI=;
        b=OMMvxKw98HtRI0PuS3gCbRt7U0oBV+X/jYhUXMOzZtBBWsa/2zBaiAzySqnvgAbuUi
         rXiyqAkfovsELMtD4msd6trgfju0pOHGSoBT8VZCDGNAT9XjF3ah2vTD9OM2tgYxED/z
         4joKMkb917LW6jRKmKdPT6OHqdRIL5Zo3Pc8DqqCiKCb4Y06YOtLsdpG8s7JPa6+QHNB
         k7cxDzlzU8ASGhhBQERLxZYTsEsEROjs+YYtrC46x8k5nl6CtAp3k4uGaMcaa5zV+kAo
         J+VMdZa5vjFOJcp8nW/y73ommkh2dISrDXYp7hr+UhhVopWkTZ5VlGnZt1WKydQHDQus
         wE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JhMvQ6wT2z/w9jJ1AFzBZlKrPInU1Ytn40KkatChIbI=;
        b=H6lKsKOsL7tAg/69FTKQLY0wHTV8mUxKaJ+2Wxjln8r6gBUmHxzLFNIN0RreYBRo5A
         FHK/RrlZ7leu5lQVe6tErZGKwWTlGk1kFlpQjVOogPpFVA70TWQhRUYH1ksiS8RLCG1V
         A4w2LMOWX2dLr1PGNAYgKRg4IHu8BaQ12d0BV9TiS77spyCOqK12lr+SMwaxOHPX5uuh
         SeBiaQZ0a425oyQ4rvyvPzxkOvmujbbL2yGAPo7K7PwxTxXRw3HfM/9ZTDnagDiMQnrG
         K1dm0c93PoeRiwz4fPaYgTsQvUFboAFqHi8vAW8XpL28K5BeJpb1WJVFj9FcyoT+tYrh
         aOXA==
X-Gm-Message-State: AOAM531aQvIGib+HJizwwpmpU90ry+kbMxvaAkK39Gg1TDd0mXMJ0NVd
        UaCuN6wMXi+mRnBJ9ZdzoqxV5xi+c9c=
X-Google-Smtp-Source: ABdhPJwB4O0WJOY8eMzSBtHOUZMdLBdwqnBOUTE9viaGo0ldgqm4CzJ5o972WDJ7A+EM4U1tBXuh0Q==
X-Received: by 2002:aa7:c4da:: with SMTP id p26mr2186573edr.184.1589960013840;
        Wed, 20 May 2020 00:33:33 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u10sm1057252edb.65.2020.05.20.00.33.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 May 2020 00:33:33 -0700 (PDT)
From:   Johan Jonker <jbx6244@gmail.com>
To:     heiko@sntech.de
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: input: touchscreen: edt-ft5x06: change reg property
Date:   Wed, 20 May 2020 09:33:27 +0200
Message-Id: <20200520073327.6016-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A test with the command below gives this error:

arch/arm/boot/dts/rk3188-bqedison2qc.dt.yaml:
touchscreen@3e: reg:0:0: 56 was expected

The touchscreen chip on 'rk3188-bqedison2qc' and other BQ models
was shipped with different addresses then the binding currently allows.
Change the reg property that any address will pass.

make ARCH=arm dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/input/touchscreen/
edt-ft5x06.yaml

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index 383d64a91..baa8e8f7e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -42,7 +42,7 @@ properties:
       - focaltech,ft6236
 
   reg:
-    const: 0x38
+    maxItems: 1
 
   interrupts:
     maxItems: 1
-- 
2.11.0

