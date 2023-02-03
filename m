Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A4868A4EF
	for <lists+linux-input@lfdr.de>; Fri,  3 Feb 2023 22:51:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233815AbjBCVvv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 16:51:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjBCVvu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 16:51:50 -0500
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3F7A640A
        for <linux-input@vger.kernel.org>; Fri,  3 Feb 2023 13:51:25 -0800 (PST)
Received: by mail-qt1-x831.google.com with SMTP id h24so7113563qta.12
        for <linux-input@vger.kernel.org>; Fri, 03 Feb 2023 13:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OW6brrVGDv1+z0JYesxuHexWAv2hRKpnFtZW+2Mpkkc=;
        b=XHCeyObBUiY4wdEENssTZvVzNtFejIAovGt9jZSFE1/Tj+iGqQzh5s4DmnNjs6cSaz
         v9d1U6/Leu2bYgpIzM4jc0n9FKSzAENyXHzWlaiu+7jSUOQJhwy2+8Rj7s1+jDrY/IpO
         D1eCC5OzSKU9oFi/45kt6GBUVX3ZyluyritlJlp1CBSGw+kh/HEpLva50tdZ5wyQuLNw
         nu9DnUqOhirGN4MPSNhsxEQKJHeF8xhaCubHmLNnDAIGIzRWVOj1ijxgd+ffBEidfDD7
         klctdcuFkbQ3/ih93eQtkIJSq9tYmw2KDUHPmjb13L/is4PPjAQQxNsP3kO/38pH2sqA
         qktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OW6brrVGDv1+z0JYesxuHexWAv2hRKpnFtZW+2Mpkkc=;
        b=xHA4BgJeZFTRkXMWs319HM3jvJZdG6tPKYfcylMV+AWJVmPw64j5YkZYC6yo4nsFXy
         xRg/0GAfk/TaiR0ZcKsD3Uv3KPUbo6Vtyk/Ntx9nbpMK9cLtafoM7UPjjDVJwFkJDMk3
         qQ8xZ3aIAytziYgQ3OVh1I7g9YU5jk1W2B5yB9x8FFASIsPe5rxndF08Z3JhZOygRtCZ
         X+6WBd8FB6E/fRhpx/HFXzB+KWCaSDurTx6Wh/SmwLeMpIVMYwNb1J3zI9GgRXmJGbM0
         8Og5nubv+dTxA7OcoAGlU84EGFy34HCWTrjttMXER0eaRsTs6aSa4FcJWwg6m3pQr3os
         q9DQ==
X-Gm-Message-State: AO0yUKXHEdDBFQHQkB7e+AgR4LPW6c6/muBGgdGJIeDorpne1Z8XlCAQ
        Bg8Ham3EQGMoTsBxMSIHyNoHWXb/wJY=
X-Google-Smtp-Source: AK7set8IBLKiitc8q04pZCnoBaJC1aGJiP78SBTcNjwGg2O7lNYiZMHXtYXx7ayg0NsLKGANrfLQ8w==
X-Received: by 2002:ac8:4e81:0:b0:3b8:52b6:a313 with SMTP id 1-20020ac84e81000000b003b852b6a313mr21826177qtp.30.1675461083582;
        Fri, 03 Feb 2023 13:51:23 -0800 (PST)
Received: from Arrakis.djogorchock.com (pool-173-68-97-122.nycmny.fios.verizon.net. [173.68.97.122])
        by smtp.gmail.com with ESMTPSA id r10-20020ac83b4a000000b003b9bcd88f7dsm2277408qtf.43.2023.02.03.13.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:51:21 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v0 0/2] HID: nintendo: avoid BT rumble disconnections
Date:   Fri,  3 Feb 2023 16:51:16 -0500
Message-Id: <20230203215119.435091-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.39.1
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

The hid-nintendo driver has been plagued by an issue where rumble
command traffic to bluetooth-connected controllers can cause frequent
power downs of the controllers.

Digging into other pro controller driver implementations, I've not found
anything that hid-nintendo is doing incorrectly. Some implementations
seem to be working around the same problem (e.g. libsdl's hidapi
implementation rate limits rumble commands to avoid the problem).

hid-nintendo already rate limits rumble control packets, but that does
not solve the problem.

Using btmon output, I've fuond the the disconnections reliably occur
shortly after the controller's reporting rate become erratic. The
controller is meant to report input packets roughly every 15ms. Sending
rumble commands can sometimes result in the input packets arriving in
bursts/batches. Once the controller and/or BT stack enters this state,
even halting rumble commands will never allow the reporting rate to
recover to nominal. The controller will eventually disconnect.

This patch set strives to avoid the problematic scenario. It detects if
input reports arrive at clearly incorrect deltas. During these times,
the driver will hold off on transmitting any rumble commands to the
controller. This approach has allowed the reporting rate to reliably
recover in my testing. I've not been able to generate a controller
disconnection during hours of testing games with frequent rumble.

The behavior of this mechanism is tunable using #defines. We may need to
tweak/tune as the mitigation is used on different hardware setups.

My suspicion is that the core issue is somewhere in the bluez stack. My
next step is to investigate that lead in more detail. This patchset at
least allows for use of the controllers via bluetooth with rumble
enabled without frequently disconnecting.

Daniel J. Ogorchock (2):
  HID: nintendo: prevent rumble queue overruns
  HID: nintendo: fix rumble rate limiter

 drivers/hid/hid-nintendo.c | 95 ++++++++++++++++++++++++++++++++++----
 1 file changed, 86 insertions(+), 9 deletions(-)

-- 
2.39.1

