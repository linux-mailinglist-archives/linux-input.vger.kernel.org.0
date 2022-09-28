Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897165ED406
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 06:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbiI1Ex4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 00:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbiI1Exz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 00:53:55 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC301166C7
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 21:53:53 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 65so7127173ybp.6
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 21:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=tWiFBxRDARg9icy6pF597zZFH93d2BgX4XoYf3UAqS0=;
        b=Ryu339x8jQUsMBUptNmORnw0gE4EBrRiumATo22Q+jtLJD6y5aIPnGSTKuBXnwrWcG
         vqDncJOkngdRa1fb29luLXexKEDIJCHbC+y4UsHgRLQgPzbB/8JjheAeRR9P1/0iSFdu
         ic1NlYv2b/vMDxKPNj0bJN1cCQgkYVqpeh0GM1h9AU+Dj0wSfC8fOvMk8rY/JxKTg3l9
         UOkt3CjzG1Y/ieT5e8/8f6e2c6vaD9X53L3q836BvznIRF6w1y5ob0XOQhFODNReiBrL
         EL77AlrU9Kpayy8+5OW7zvR7pUQkU55Lht98S1qOiue3pxMkg/sfw55cBGni3gm+rGf2
         jA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=tWiFBxRDARg9icy6pF597zZFH93d2BgX4XoYf3UAqS0=;
        b=aIklZvno8GH8XWYU52a083QZNEGUU3EXHoXEGH87gQUVGPJNRAMUPSqQqqccE8C60O
         U/TOG3lG3uYvEhMzM07XeYo6PyGOdy03TCa/fmGS0m01PGz8sQ55xmU6qDIRsi8dlBvk
         OdZeQ4SGLJZqoX2I7ZqIHX56nVjZ26ZlOB6j1TJw3Opkl/C4OY/sGUD53gLA5a/1ksuN
         mIzaaWoaP5zczFU09xijNQk8Vr/wakqukqIFb0CWqCHmr0zzUAKkOf9z6RtnIG3JqsSe
         U0OwCzc6m7hXTQgm1uakuZ3XYcZ32cUbt8Y5MGjvrPlKxGXAEyus9pjgJxsPcFixN56x
         YHJg==
X-Gm-Message-State: ACrzQf0dPnx4jbkbDnM8Uvb3Ukz97pPli5KUxqdemAF4plYkp/25zr9M
        s8eIWtMzG2mv5ueeDYOir6wyHwiKJBCTsrpXnHg=
X-Google-Smtp-Source: AMsMyM42XQs79Xlr/zUfdFjdbu+/raZe2+QT24VsaIVVyrqUpo3/tJH+6VYHsshp/jdcS33wSCrgGhd2mOKA5tmsAw0=
X-Received: by 2002:a25:3287:0:b0:6b4:7ab9:1d99 with SMTP id
 y129-20020a253287000000b006b47ab91d99mr26554151yby.569.1664340832595; Tue, 27
 Sep 2022 21:53:52 -0700 (PDT)
MIME-Version: 1.0
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 27 Sep 2022 21:53:41 -0700
Message-ID: <CAEc3jaC1jkoXEZWJOod9WH9+quSta0tUzow4YuKWKxjACGWV6Q@mail.gmail.com>
Subject: hid-playstation race conditions during probe failures
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin and Jiri,

I'm doing some work around hid-playstation and as part of that I
stumbled on some kernel oopses, which I at first couldn't explain. I
believe I understand the problem now, but I don't know what the best
fix is and if it is completely my driver.

The basic summary is that hid-playstation relies on associating custom
data with the device using hid_set_drvdata during probe (in
dualsense_create to be exact). When a probe call fails (one of the sub
paths of dualsense_create), there is currently an undefined pointer
associated with the hid_device.

What seems to happen is that raw_event (ps_raw_event) still gets
called while in this undefined state. I don't fully understand this
well, but it is because the driver has to perform some get feature
requests and had to open the device.

Is my understanding so far correct? If it is, my driver has a race
condition. The ultimate issue is raw_event, would it need to do
something special (e.g. looking at some flags). I can also delay
calling 'hid_set_drvdata' closer to successful setup (a little hacky
perhaps). Or is the issue and fix something else?

Thanks,
Roderick
