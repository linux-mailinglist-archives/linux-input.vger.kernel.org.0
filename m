Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C76874A96F
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 05:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbjGGDpw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jul 2023 23:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjGGDps (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jul 2023 23:45:48 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE471FE5
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 20:45:44 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-78360f61ba0so51075739f.1
        for <linux-input@vger.kernel.org>; Thu, 06 Jul 2023 20:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688701543; x=1691293543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXrCaE827f/y4M814lypXFQOYV600i1J9BYf0EJ1JzM=;
        b=YlHkDS5L97x9+3SC0Gz7szYzz53OSqCDSMmvTXF3TeubdRVuGOLRD+S4w/7dLd5BS4
         1Og+HEc8sSlvdq4+fc1aHMD6cQXd5JbmY9ti9bm2/U7GclgLH2+5AWkiR4x/iKsJ/deW
         vt5oSjUlcmuK5wCKlcvH+bcu2jtHAEk4xXONnjZXAsCWWyJtUbs6UVn+2rnQ6Ci84VXj
         wazP8IiLtJU+LDEaX3gzv64uMdvp15Mps38KUXt4lrElKOglMspIOJkR7yeD0Tqi3LpT
         RzNGrBP3ia6ZmLL9o+quanHCOLYS4jg6loN3zLFXaxKNXpYq2+TzsCUMw5Ejbx5YLOf0
         JEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688701543; x=1691293543;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXrCaE827f/y4M814lypXFQOYV600i1J9BYf0EJ1JzM=;
        b=aHpWL38u59eDp1dNiYvCTo8sI9Apj78cWZIq5pDgO8+jjhywkQ+isL+55PCfrJtZ9Z
         c8HdhhnkNARZQvZZpYJ46Vt9RvL90ZHZn/ISMbqRzNu9zXmCwI+dDuyITCvqnxeriV7k
         fZ0+7kF1IeeQTSqlksubDGnVN0IiB8NUkmyzFo1i7DB4oIn92vUjwM9JoT0p11pJHWzP
         /6alqsGKjv3/mIY1z/KiaiKamb82hL7clXSxP856Mvcaw9vZ5UerDinHxkT9l6/3Zent
         PRICtgp8akA9DvMq99gynYiBecDkMSPkvNg8IaX6FFnjZTSXsf1FZ2+iT5ZmYLYam867
         0teg==
X-Gm-Message-State: ABy/qLYQWG/yQ1NNti+LFhgj6JLuTMzpru1EdFV6mktuuDoMrF3t53Ce
        ExNj1W72Fo/YkBf+6Mn5bAgkuGzgpnw95g==
X-Google-Smtp-Source: APBJJlEVhMX9Y6fm8CW2MahFXGhVv2n+7CADdZaGsm/bg/jiZP+EBLa6aHznmxUEYygD4KIQVcscLQ==
X-Received: by 2002:a5d:8849:0:b0:783:5fd9:3789 with SMTP id t9-20020a5d8849000000b007835fd93789mr3812331ios.1.1688701543203;
        Thu, 06 Jul 2023 20:45:43 -0700 (PDT)
Received: from dbj-hp-flip ([64.39.204.200])
        by smtp.gmail.com with ESMTPSA id v9-20020a02cba9000000b004290fd3a68dsm1004500jap.1.2023.07.06.20.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 20:45:42 -0700 (PDT)
Date:   Thu, 6 Jul 2023 22:45:18 -0500
From:   Jonathan Frederick <doublej472@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: [PATCH] Input: xpad - add GameSir T4 Kaleid Controller support
Message-ID: <ZKeKSbP3faIPv5jB@dbj-hp-flip>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add VID and PID to the xpad_device table to allow driver
to use the GameSir T4 Kaleid Controller, which is
XTYPE_XBOX360 compatible in xinput mode.

Signed-off-by: Jonathan Frederick <doublej472@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 8f65f41a1fd7..9b12fa909cf5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -366,6 +366,7 @@ static const struct xpad_device {
 	{ 0x31e3, 0x1300, "Wooting 60HE (AVR)", 0, XTYPE_XBOX360 },
 	{ 0x31e3, 0x1310, "Wooting 60HE (ARM)", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
+	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
@@ -498,6 +499,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	{ }
 };
 
-- 
2.41.0

