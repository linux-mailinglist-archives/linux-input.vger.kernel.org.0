Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6ECF53AF09
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 00:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiFAU4n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 16:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbiFAU4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 16:56:42 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A808F14CA18;
        Wed,  1 Jun 2022 13:56:31 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id a16-20020a4ad1d0000000b0040edb942aa2so572604oos.2;
        Wed, 01 Jun 2022 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y64Dk9Gp0PAgxJ7sfKpj7Q8xmRgj1XPdr4vbaQ2Vvvc=;
        b=a52e8DSxqVCHI8H9henNoSP2Ec4gmTq+uhhvBGCDZBmDIq2CBQVZFvBwCQcwegkrxI
         Kw3xK93M9EdqduU35jvm1La4p/epHzBgLz+hs6Y//WvKAVVqDRfOkS5iq6GDui9SyNU1
         /bkxQWKvztWHVWMODB5HobspcPWWz9hMxz8EHJ2w9KUieB6QU8CT9sl+0FEZsskB+YdX
         AaDbqTMmNCvEgeW/aZf71cJVoKQHkeWYGmn5maagLyjfL/jyompdreRy0QgXegV/hJ70
         fil29Mm0bRNhGXNB8iq6oFKgz1wmlyiIUhP5CL/WuGGVh/CAkc8005yj2OW+ntRkFVpV
         gpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y64Dk9Gp0PAgxJ7sfKpj7Q8xmRgj1XPdr4vbaQ2Vvvc=;
        b=uQN41XAVbrzl4cPNPLgSJBEyu+M63mA2ue7b0MaYT1QPfPuzh6P4dq9yx5ooLQt0Qu
         uhyffPHdhw10RNhzN/1nYkxoXSwiGPDjtWMWGIEQGT6IRKQVFYItIGOUZ/P+QhyQSmRw
         culUetOke3aTgpfKB3CjqB2GsvMA8rpbMd88+8gEUI3EHpMzTtfAv2Zb9JPAPuncOdhK
         lk3XuSwjzbBvwdZB3zRqsxeDjuBbLnIfuz0c68nl/t19mcg+ARtgOrTIeW92K5ijDu3i
         wqNbr4JJ0zTMK4FZiyGYoZUE/5SimafUlD/f0CohPzxnXoIAWTsgvdYonhOKvQRn8Na3
         7LzQ==
X-Gm-Message-State: AOAM530mwj/YDzJgqvC/VXElDOuEGOvxOJ14xy6E8oD4CU93xaGDpPfP
        p3rq27LRn7Wx3oDkJT+dgTK2llanC0UnrQ==
X-Google-Smtp-Source: ABdhPJwqoAjusbqeYCLV1NnBXEjnEuJFKUcT8EA0CgpDhwTdzs5bH5/jhoUEUS8V6ntG8fwfJwN2dw==
X-Received: by 2002:a05:6830:2b09:b0:606:8f8:f16e with SMTP id l9-20020a0568302b0900b0060608f8f16emr595118otv.91.1654111062043;
        Wed, 01 Jun 2022 12:17:42 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id w41-20020a056830412900b005b22a0d826csm1194512ott.1.2022.06.01.12.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:17:41 -0700 (PDT)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     devicetree@vger.kernel.org, contact@artur-rojek.eu,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        maccraft123mc@gmail.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 0/3] adc-joystick: Add polled support
Date:   Wed,  1 Jun 2022 14:17:27 -0500
Message-Id: <20220601191730.29721-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

Add support to the existing adc-joystick driver to support polling
rather than relying on triggered buffers. This is useful for devices
that do not offer triggered buffers in hardware. Code adapted from
changes made by Maya Matuszczyk <maccraft123mc@gmail.com>.

Chris Morgan (3):
  dt-bindings: adc-joystick: bindings for adc-joystick-polled
  Input: adc-joystick - Add polled input device support
  arm64: dts: rockchip: Update joystick to polled for Odroid-Go2

 .../bindings/input/adc-joystick.yaml          |  8 ++-
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  2 +-
 drivers/input/joystick/adc-joystick.c         | 53 +++++++++++++++----
 3 files changed, 49 insertions(+), 14 deletions(-)

-- 
2.25.1

