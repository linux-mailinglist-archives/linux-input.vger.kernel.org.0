Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C704E3222
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 22:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiCUVHG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 17:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiCUVHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 17:07:03 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC2A1D2526
        for <linux-input@vger.kernel.org>; Mon, 21 Mar 2022 14:05:36 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-2db2add4516so170584387b3.1
        for <linux-input@vger.kernel.org>; Mon, 21 Mar 2022 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=UelxEca0+8UhtdXiPwo10nVR2FdTmhLAka9zHLil0pA=;
        b=TwefeKnMxPyzKqWyuXcOmi46BVwe7AO+7OG7AQw30ajbk7YuVH6tyyXHPrEhhoZ1oW
         CPdvRxwaA6XrGuAe505UonE+RGmOu5sWDdSMOFQmorYwUxCcoN60H/qNdbK1BYiFgXkP
         5xDN9sXaAXpmISL8bna0p6MfQvZ0TGrd1MUaaaMjzXwfjV5oy4RYO6/TWj5HMswsh/Bn
         teoHtIvW93gScDyd2pyVPP+NNc9TCZUE122P2k0fGOQ4vJ/VmuNsU2V3m3CTtD5NRuU9
         m6LABas8ne5zMs82OYJGzJa/aPr1MtyanbtsvPy3zLydrdzosSzipyFNpDfYIPxBsnzG
         jqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=UelxEca0+8UhtdXiPwo10nVR2FdTmhLAka9zHLil0pA=;
        b=UCHQArt3O/i8CntEtHfpwaTxeR5adnk2bgl/gTKlM+poVLDXlbQr0E+EZDBe6v8fnZ
         QLskgmrhWEbKOHpI6vk4uw0cxpbFf0CllJ0LjOz+4kQXWMVlcBcvAnLplPTCsTLtBdVT
         9O8OQQMPav1dm1fsV12prqV2sbgN5vbI5rnEgIVsQWOxxtKmy57qc4IQB8D9ZDEOn6FC
         M4RnJnEwBsAYMs2QXrdUCFc+7/XlRDy7gVowd/b49K/W8BzVbHpSpQevfawtxfX0Qamw
         ae2i9QgtuvjHHShZAR/vWmHhYaDefboxxd8mr0+unMrRnEotQdqGp0BFKhd9yInI7suA
         977Q==
X-Gm-Message-State: AOAM5338XCopHtkFeWQ8e4LYQ/JAhXC/+/CM+GFs4XnqyAe9MqBAVGT1
        W6XQldv+M4lVEkiq9N3aH5c6bt0bwRqo7PGAO+4L/3+asL9zXw==
X-Google-Smtp-Source: ABdhPJyl1kdPn0b1ZXib5AZs/WjS0xgzs+JtYlfaDqs2SLUhX5cgMsG5B45/+QPEbvo8U/4gaPgetAQ4fK3gP1LPIfY=
X-Received: by 2002:a81:184e:0:b0:2e5:c025:89e6 with SMTP id
 75-20020a81184e000000b002e5c02589e6mr24112443ywy.428.1647896735997; Mon, 21
 Mar 2022 14:05:35 -0700 (PDT)
MIME-Version: 1.0
From:   Angela Czubak <acz@semihalf.com>
Date:   Mon, 21 Mar 2022 22:05:24 +0100
Message-ID: <CAB4aORX8BYLL9xY6XiC1P_+J4o2LQrXV8x_-3gdU1PJsdx+-aQ@mail.gmail.com>
Subject: HID device initiated reset and need for device reconfiguration in
 linux driver
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Hi Benjamin,

I am wondering if there is some mechanism already present in the linux
kernel that would trigger
some (re)configration process once a (device initiated?) reset has
been detected for a HID device.

My precise scenario is a case in which a haptic device decides to
reset itself for some reason
after it has been already probed. The default device mode is autonomous mode.
However, since I would like to add kernel support, the driver itself
would believe the device is
in manual mode, and either it would generate output reports itself or
would allow the user space
to do so.
This might result in doubled haptic feedback (from the device itself
and the kernel/user initiated one).

I can see that in drivers/hid/i2c-hid/i2c-hid-core.c that there is a
point where we realise that a reset
has happened (interrupt handler case where response size is actually
0). I would guess it could
be a good place to issue some callback that would trigger all
necessary reconfiguration (in my case
it would be putting the device back into manual mode).
I suppose we could add something like 'int (*reset)(struct hid_device
*hdev)' to 'struct hid_driver'
definition, then set it if applicable in a relevant hid-* driver, so
that we could issue it in case of reset,
specifically the device initiated reset.

It does not seem a problem specific to haptic devices, so I am
wondering if that would be a good
approach, or, perhaps, there is some kind of already existing
workaround for such situations.

Any advice would be welcome :)

Regards,
Angela
