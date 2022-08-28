Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39915A4031
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 01:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbiH1X45 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Aug 2022 19:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiH1X45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Aug 2022 19:56:57 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C6821810
        for <linux-input@vger.kernel.org>; Sun, 28 Aug 2022 16:56:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq23so9043328lfb.7
        for <linux-input@vger.kernel.org>; Sun, 28 Aug 2022 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=umXhZE4PS31B0LZRjwePjoplbeRMPCwJjdzu0NizgIE=;
        b=AfHceim0fodht5Fz6/2uCazT7xMBzaxCf3s/XNJWzZIncUFR+dvYjDJvysZJ0rV2LM
         idfTWh0q7lPVCY33VxbUyoQOWokx5f3Mebg4NyUcRSzY/JvEE4LJr5zIc7cBfPkbWVl5
         ++NwvDgxrFbI3fFj7jNomRCLOCrVmx8SgU7NNVbBWikk+WN+2IX5rJh9XnVfhZWup/S3
         SZCib1TCjq5iBBFYK7pz02U6deBEFOqxH1nO8VhgRbwhdLKFwDWsJe/zUpb5GeuIRdYC
         U+P8+uqcZXr8iTYoG5gEBbE97NNbGDwHfDx+RSdKCjCIwqujMbeeT8qYo/euSoPvkyUJ
         8g1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=umXhZE4PS31B0LZRjwePjoplbeRMPCwJjdzu0NizgIE=;
        b=FnBtDiyCS/rdmAKlH5gQKfMVPSB/VbqxtkCgUR5wmz517Pw4ZqlZcqkj418gjd4aa6
         pakqxopcyn0MEufEp46gKIo9GNTGmnGZgTxLUM8qgS4v3Xjnf9wDh8tVXV8pYh8WwKKR
         9H91112jwGyJ+ZhxWM9jyAx1PAFdJ4530i12EwQ504cBKKN182c9CqT2iC83+F6S44kp
         AMzPjxQwUQRpNxcZYPIOWMdAR98dFBspCLZJqIVhcCudkwq2+dQxtFWIhVDft3j9ZyKa
         6VkRNoaGMCvXBd+XJTFa1ajQpig7x1xD3lHJxYnN6qRlE6Tagr3939JVWZh9uunCDwSV
         Rgnw==
X-Gm-Message-State: ACgBeo2NyJbE8cp/1X7NCVZQPmT9MVD5KZkRwue/qptsrI0Hoog7iIp+
        khueQ2RvN3ROux0CR4Ltiabl0rXxmhrX+enySn3HhTlv
X-Google-Smtp-Source: AA6agR75rHV54AGqm21iDyyIP54U/tO7je46okVpN7dxFfdkuCCIthFo1Om8KE+CUlg4Y5n9uBq6XQfNvwuEDmoRLFs=
X-Received: by 2002:a05:6512:2814:b0:492:f9fc:567e with SMTP id
 cf20-20020a056512281400b00492f9fc567emr6063771lfb.394.1661731013734; Sun, 28
 Aug 2022 16:56:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:a594:0:0:0:0:0 with HTTP; Sun, 28 Aug 2022 16:56:52
 -0700 (PDT)
From:   Greg Tulli <greg.iforce@gmail.com>
Date:   Mon, 29 Aug 2022 01:56:52 +0200
Message-ID: <CAKEH-64P5HTWtqrgGoS4RF74XXOvnDZ4o5z2bx7LZ=9r=3tsjw@mail.gmail.com>
Subject: [PATCH] Input: iforce - add missing vendor and product ids to the
 Unknown device name
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

An unknown iforce device is named "Unknown I-Force Device
[%04x:%04x]". The vendor and product ids should be substituted.

diff --git a/drivers/input/joystick/iforce/iforce-main.c
b/drivers/input/joystick/iforce/iforce-main.c
index b2a68bc9f0b4..6de5d06d2bd0 100644
--- a/drivers/input/joystick/iforce/iforce-main.c
+++ b/drivers/input/joystick/iforce/iforce-main.c
@@ -323,7 +323,11 @@ int iforce_init_device(struct device *parent, u16 bustype,
                        break;

        iforce->type = iforce_device + i;
-       input_dev->name = iforce->type->name;
+       if (iforce_device[i].idvendor)
+               input_dev->name = iforce->type->name;
+       else
+               input_dev->name = devm_kasprintf(parent, GFP_KERNEL,
iforce->type->name,
+                       input_dev->id.vendor, input_dev->id.product);

 /*
  * Set input device bitfields and ranges.
