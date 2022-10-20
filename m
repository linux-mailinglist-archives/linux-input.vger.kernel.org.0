Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8951D605743
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 08:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbiJTGUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 02:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbiJTGUI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 02:20:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4EEEC50F
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 23:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666246804;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=uku82WDcQAVczpv9Rg/4HorCI0YOcf70Ao8obtRgY6Q=;
        b=jAzG+armSt5L1sEGQFN/eZIR5ouIvvYMvV6sFUGQweqtk2fxvCWSa4L8Wn+cOY9zmP8OFP
        kQGqx4hdH3j4a8PtUPR4MzXsbS2yzpDJuRg3nNAwchg6hkNolvqF0KYd2ZUG7pvPwVvI7F
        +asiPywSvJryoKEYM3FhkP19wQ5q6tc=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-270-KUBs4F5WMPe2VtERtmGMog-1; Thu, 20 Oct 2022 02:20:02 -0400
X-MC-Unique: KUBs4F5WMPe2VtERtmGMog-1
Received: by mail-lj1-f200.google.com with SMTP id h21-20020a05651c125500b0026fbb460154so8029333ljh.20
        for <linux-input@vger.kernel.org>; Wed, 19 Oct 2022 23:20:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uku82WDcQAVczpv9Rg/4HorCI0YOcf70Ao8obtRgY6Q=;
        b=sUV2XxRmKsLsndhCaadOGRRhko1ZosvIyIp/Gm3nDO8ChFdYOuIV53URG1/9oDppbW
         AF72cBD7BkX3mf8tqflBV42IcwdB8w9rM/1NQPfKAkhObT6mfg5e3lHwAqKIkqKlDGKz
         Htdzd+a7Gvio9I2Ky6gP+52krkwWKr3hxHqUFCvmYsMgXE5+Z9xkGDGyfBp4B26E9omT
         fnb3p7rK7QEpzpd06sJt9oTt8wGZl3G11A1OMHyatL9gSDzbQZfHhhWFone50wj40R6Q
         eWU4In8vzUab3wvdXUddKuTwJy8JyE1XdBHtJIgZrRxBUL5rSho/2A9RvpEyuTTkc7pC
         sNrw==
X-Gm-Message-State: ACrzQf10+iDTI9C4SdNOBMwBFzcbLLHzhD04kZfwO6nnwb1Xz63hZZa9
        62sH83EnoazasJpeW4dPpWUYh8sSRj3AaFYI9Re2JJKnc6SXyyvuEqG8dxQfHZ/DPfCWk7Rx83e
        vLeZPsyq8oV1pxthgivEEGin2R+wSBshxZDgFkqcgn9/MZzuiC+joj0Va+aQvkzous2Q7yOZ/0Q
        ==
X-Received: by 2002:a2e:82c8:0:b0:26d:e8d6:1edb with SMTP id n8-20020a2e82c8000000b0026de8d61edbmr4009308ljh.509.1666246801261;
        Wed, 19 Oct 2022 23:20:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SP9WdyS8Ep/7MBoq5nMUqd3+6qsmCFal/+aI5CdYcrsXPZKzZLh0Ktq3iI5S7Oos/HPNLXQ==
X-Received: by 2002:a2e:82c8:0:b0:26d:e8d6:1edb with SMTP id n8-20020a2e82c8000000b0026de8d61edbmr4009302ljh.509.1666246801019;
        Wed, 19 Oct 2022 23:20:01 -0700 (PDT)
Received: from mjp-Z390-AORUS-MASTER.redhat.com (91-145-109-188.bb.dnainternet.fi. [91.145.109.188])
        by smtp.gmail.com with ESMTPSA id 6-20020ac25f46000000b00492d064e8f8sm2578304lfz.263.2022.10.19.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 23:20:00 -0700 (PDT)
From:   mpenttil@redhat.com
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>
Subject: [PATCH] MAINTAINERS: change sis_i2c maintainer email address.
Date:   Thu, 20 Oct 2022 09:19:48 +0300
Message-Id: <20221020061948.10221-1-mpenttil@redhat.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Penttilä <mpenttil@redhat.com>

Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ca063a504026..f773da0662f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18890,7 +18890,7 @@ F:	drivers/video/fbdev/sis/
 F:	include/video/sisfb.h
 
 SIS I2C TOUCHSCREEN DRIVER
-M:	Mika Penttilä <mika.penttila@nextfour.com>
+M:	Mika Penttilä <mpenttil@redhat.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/sis_i2c.txt
-- 
2.17.1

