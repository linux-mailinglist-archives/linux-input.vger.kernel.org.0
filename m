Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C3F7419F8
	for <lists+linux-input@lfdr.de>; Wed, 28 Jun 2023 23:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjF1VBN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jun 2023 17:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232006AbjF1VBK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jun 2023 17:01:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D20962113
        for <linux-input@vger.kernel.org>; Wed, 28 Jun 2023 14:01:07 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so4508931fa.1
        for <linux-input@vger.kernel.org>; Wed, 28 Jun 2023 14:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687986065; x=1690578065;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tYrr9alTaXYuU/MkZkhHuZa1UvZlC7jD58KiXpwKE50=;
        b=N7hOwG15FH3n/Nn4j/iK1zDL+o4oCg3GQibeDsOCYwHI8AA79BCSnof8dZaFC4BWCW
         709O6XQbIvJ+LECsnfBVsbszCDUNiCOzov9FImnLftyyvFGrbGJ82PRSzKZfAaQMdy8O
         COLDCzxY8kxAS1qfldsOU1Es8A8JsL6HAobQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687986065; x=1690578065;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tYrr9alTaXYuU/MkZkhHuZa1UvZlC7jD58KiXpwKE50=;
        b=dMwYmY4i34hAfaql9u5SJZO8sX0vNJz4Eoxbtv4JbZhe31pWzltw0huIxf+6cS/Fvx
         9jWYDt1WQ5iZ3KVFUVn9bPN8zcPesbQvSi+Mqgr9ZsmmuwRJJb1Czb0wZodU10y756hN
         NT0pf+UfGRALI5AZbBB35MmNEc8K4Upc3updFfInV1w01KAaIpKA4abc8cus+0WMJnYo
         s7h5eXUJt3gXlfSSM9+1ISjDBjytnN4cnjQ2o6IAMxuJnJ0dbVfFuF3fM+lUSvLYzZ7+
         i+dFTy7JQfexamk855asZN8wQFleb4Msy2hLpJ6d4os5RjGSj/c+BiSkhdxNaUHss4MF
         Q/iQ==
X-Gm-Message-State: AC+VfDx0IK/8s6nJKcH22sQOCpCWTUYFFGKlTJBplmxp9VdaT08AyhrT
        euSJ1lRtswbjqrklx/iim2GmIXBU7Ay/3roLEO2t5rx3QvZvNN9J/lY=
X-Google-Smtp-Source: ACHHUZ75sLsoo3WXVYfVXnAC4jTqwd3VGNEDEWtuArehWWStTBOKgdzXRfcHhC47usUZio04G/XGN022TkpkZvcoFZA=
X-Received: by 2002:a2e:3803:0:b0:2b5:9e51:2912 with SMTP id
 f3-20020a2e3803000000b002b59e512912mr9788785lja.24.1687986065502; Wed, 28 Jun
 2023 14:01:05 -0700 (PDT)
MIME-Version: 1.0
From:   Jonathan Denose <jdenose@chromium.org>
Date:   Wed, 28 Jun 2023 16:00:54 -0500
Message-ID: <CALNJtpUN+DrWtudWdKZxYMR7oM-yt926fj7_Wi9dUPLZybw-vQ@mail.gmail.com>
Subject: Touchpad lost sync at byte 6
To:     linux-input@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I am on a Lenovo N24 laptop.

When this device resumes after closing the lid, the mouse freezes and
is unusable. After right-clicking multiple times the touchpad resumes
working. I am seeing the following in the logs:

[ 1188.690138] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.699636] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.709124] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.718557] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.728110] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.975964] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.985456] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1188.994954] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1189.004443] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6
[ 1189.013930] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
sync at byte 6

This device has an ETPS/2 Elantech Touchpad. I am on kernel version:
5.15.117-19629-gf1eb3139d206

Currently the device suspends to ram when the lid closes. When the
device idles without the lid closing, the touchpad works fine on
resume.

I have tried adding various i8042 and psmouse kernel parameters from
searching different forums related to these error messages, but none
of them fix the issue. I have tried
- psmouse.resetafter=0
- psmouse.resetafter=1
- i8042.nomux=1
- i8042.resetafter=1/0
- i8042.reset=1 i8042.nomux=1
- i8042.noloop=1 i8042.nopnp=1 i8042.nomux=1 i8042.reset=1

I was able to resolve this issue by doing `modprobe -r psmouse &&
modprobe.psmouse proto=imps`. proto=bare and proto=exps also resolve
the issue. However, with those options enabled I can no longer use
gestures like two-finger scroll.

This issue reproduces on ChromeOS Flex and Ubuntu 22.04 but not on
Windows. On Windows the touchpad resuming after closing the lid works
fine.

What can I do to resolve this issue while also keeping touchpad gestures?

Any help is greatly appreciated!
