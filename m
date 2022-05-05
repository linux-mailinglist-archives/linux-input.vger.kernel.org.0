Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A914751C8BC
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 21:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383937AbiEETQy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 15:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348852AbiEETQw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 15:16:52 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC98B25293
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 12:13:07 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id f5so3464957ilj.13
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 12:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ywkfCRn5RsGI07t5yc02LBvzzj7BHTu1E0fF5tOWDE=;
        b=cZIQof88UPOKYaPCCJjWsWpFrvsoFlErgpX55zfYpEzMJkkQnn4f4fx3GNuxKPn6Aw
         4t9xQLdAa2HsvEmYOtvlnGqCg0FDwmkX+oLDREj5u9SidySy3uMFtObpxBFKkaAcZEBD
         9sedMai+1drXsKwLFnPDuXhj2bhl73cm+1UYg7PvuDjdYW5W63je9SrZ44+YLG7GsZKN
         d1HB40297CdxAf1piqayfdXyXyIDo5I0Ob3VyQIEB65UmgNYd2sB5NQwJfTmmduWWtAB
         hYx7PT96+TABaVY47px1JW0IgkRfpLG3iibotTxrbr/EsS+qMX3aqyM/Pkn8MXzSUmZ4
         ayfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ywkfCRn5RsGI07t5yc02LBvzzj7BHTu1E0fF5tOWDE=;
        b=11LnDmd3s+6/uJSV3X0UFRudpdf2WCFNVPqUm9vNYQ9+3aIDoDE59iz/TChX0Ks3w+
         fg5vBw677FgpQZLXo1QThR/suFlvbQVuPSLmbe8YiJCgZ9l46ghXEFbxkK82Ww5SsREm
         0gKilRYcujUGx3EMUolxtoRlCY3exHLk1hyPrFNtkg6y3oFjH4kMbRhXV1M7fpU+YLzG
         CTCtK6gZhzzPJxVLWqQqHTKLTE2dFX6DmW8Idg7JGAfTwA8uyeXnKBaT/D+N9rwQw4qH
         vTNaplitwT7foX9dWrokZuOUfMQ+p4jVZiD21upvvAakHQiGvpguuOeFZAyLzIz+ry5Q
         PSrg==
X-Gm-Message-State: AOAM5322VizupHhNlDNN/vTXOuMgK7HW5y1irUvVelhejwEtPL7b+Gk8
        m4pEcV3Lk3H5cml7A8D1sXxS8VebeSc=
X-Google-Smtp-Source: ABdhPJwjpWjKiXD4OtaOJb41kAIgnbcDQZe0XxKUQuv9AS/FKkl481W7+7u/9Ov7puGYQr3sCbvS2w==
X-Received: by 2002:a92:db0e:0:b0:2cc:2590:767b with SMTP id b14-20020a92db0e000000b002cc2590767bmr12409637iln.260.1651777987009;
        Thu, 05 May 2022 12:13:07 -0700 (PDT)
Received: from localhost.localdomain (97-118-108-178.hlrn.qwest.net. [97.118.108.178])
        by smtp.gmail.com with ESMTPSA id u20-20020a02b1d4000000b0032b3a7817bbsm698171jah.127.2022.05.05.12.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 12:13:06 -0700 (PDT)
From:   Bryan Cain <bryancain3@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bryan Cain <bryancain3@gmail.com>
Subject: [PATCH 0/1] HID: apple: Properly handle function keys on Keychron keyboards
Date:   Thu,  5 May 2022 13:12:20 -0600
Message-Id: <20220505191221.36172-1-bryancain3@gmail.com>
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

Hi,

As the new owner of a Keychron C1 keyboard, I recently found this thread from
this mailing list (linux-input):

https://lore.kernel.org/all/897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com/T/

To summarize the findings in that thread:
* Keychron keyboards (C-series and K-series) use the vendor:product IDs from a
  2009 Apple keyboard. When set to "Mac" mode, they actually do behave like
  that device, but in "Windows" mode, the Fn key doesn't generate a scancode,
  making it impossible to use F1-F12 when the fnmode parameter is set to its
  default value of 1.
* The universally accepted "fix" among Keychron owners online is to set
  fnmode=2 in /etc/modprobe.d/hid_apple.conf.
  (See https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444)
* Keychron devices can be distinguished from Apple ones by the USB manufacturer
  string, but it's impossible for the kernel to programatically detect whether
  a Keychron keyboard is in "Windows" or "Mac" mode.

The thread arrives at a conclusion I agree with: that fnmode=2 should be the
default behavior for Keychron keyboards. But no one has actually implemented
this change yet, so I decided to do it myself.

My patch sets the default fnmode to the new value of 3, which behaves like
fnmode=2 for Keychron keyboards, and like the previous default of fnmode=1
for real Apple keyboards and any non-Keychron clones. This should produce
sensible behavior in all cases, including the corner case where someone plugs
a Keychron keyboard into their MacBook.

This change does mean that Keychron function keys in "Mac" mode won't default
to Apple-like behavior, but even in that case, both the Fn and non-Fn versions
of the keys are still usable. And as Bastian Venthur said in the thread linked
above, there's no particular reason for a user to expect Apple-like behavior
when using a non-Apple device with a non-Apple operating system.

This is my first time contributing to the kernel, so please let me know if I
need to do anything differently. Also, I don't have an Apple keyboard on hand
to test with, so I'd appreciate if someone could test my patch with one to
verify that their function key behavior is unchanged.

Regards,
Bryan


Bryan Cain (1):
  HID: apple: Properly handle function keys on Keychron keyboards

 drivers/hid/hid-apple.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.25.1

