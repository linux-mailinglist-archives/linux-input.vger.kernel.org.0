Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E715F5E8C
	for <lists+linux-input@lfdr.de>; Thu,  6 Oct 2022 04:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJFCCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Oct 2022 22:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiJFCCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Oct 2022 22:02:07 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11227B1E6
        for <linux-input@vger.kernel.org>; Wed,  5 Oct 2022 19:02:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h10so446897plb.2
        for <linux-input@vger.kernel.org>; Wed, 05 Oct 2022 19:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=nSu0IHfPRYTAbVJNkTYHVyl8dAhdymIG9nts4TMeOW0=;
        b=R5QPbNKAUpWChvbD5ogg8gHnat6luWQB4dK7GGmoaFARvqoTU1XTQc35dZ8wR0dIm7
         VFUYL339uYyCPyeXbtsb9xvwpGHMHmSQfMpuA9haSfmHrJz6A2wvsITpzTlMJXHyqZz6
         w0b6bnLq9zBI0Omhtb/Vq6rVORTSYJQfQEiMUBvY+Nnm/65eLP1YGY2Jcd9q8Y2RpFbZ
         krzn+qApyaEEze2QeQuQgtJWC0bRfj/sJIXkalxBrv9ruBnENBWWKDI3fHvH1AAgJcDk
         gRRHQsb5tCUKgcgIAvprdCCTDNvVJ2rT4qzwwdCVmrISNxpTVdMXTrOJ32jFkOOqf/8c
         NKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=nSu0IHfPRYTAbVJNkTYHVyl8dAhdymIG9nts4TMeOW0=;
        b=e/IAStPj+rfkMbs3eSUJjNzlFHkxw1SuRXWoKLHe8gPPtonAFA9lnV0hUz/Ue26h7J
         J9tfe5IPnnCtjQRQwcqSzy6/74s+B09DLBcZKUXrWJCYVsxo2DPZfUHz/ICF/AZyf/Q5
         J1e3HW9ykww1wD5JmA3BnrgYmyjsqQ/QzDNZV9hp53zaq4xzPrInhXotRz9gt9ZZwh0i
         I6w1kBp/c9a4/4IuoCXxBLHnRhtAGvUyyeF9bCW7NXNA+0n4UifnHOjt7u5bj1vgcQm3
         BMp1ykKLGi0ffFaNQ/gZ4ZhxcaS10KgM/zg5s/CAOhLH9wmFvoD6CT2ppQhZPFXxIKGq
         1xKw==
X-Gm-Message-State: ACrzQf2f+2smoB+ox8X0j+DMcU6HTSnJvT7s5lz+HQRm9PZMo9xm+H1e
        wYbashb3+/RZJ0TZtrdD+RLIvA==
X-Google-Smtp-Source: AMsMyM4A/fXCNw/+SmWkYJCI1YornUWSEO1cWRETWc62gznk2c4ZINcBqQ+5fR8A6IJ8Mw6c31t1Cw==
X-Received: by 2002:a17:90a:1b65:b0:1f7:4725:aa6e with SMTP id q92-20020a17090a1b6500b001f74725aa6emr2571699pjq.179.1665021725162;
        Wed, 05 Oct 2022 19:02:05 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id w13-20020a63d74d000000b0043be67b6304sm482768pgi.0.2022.10.05.19.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 19:02:04 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 0/3] HID: playstation: improvements and new device support
Date:   Wed,  5 Oct 2022 19:01:48 -0700
Message-Id: <20221006020151.132434-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This patch series adds a couple of small bug fixes and improvements.

First, itt fixes a race condition on device removal in case new work got queued
during cleanup. This similar to something done before in hid-sony.

Next, the driver brings initial support for the new DualSense Edge controller.
It is a new controller with various new features (e.g. new special buttons),
but for now the device behaves like a regular DualSense.

Finally, the driver adds support for a new rumble mode, which has become
the default over time across PlayStation and non-PlayStation platforms (iOS/Windows)
as the original DualSense vibration mode felt different compared to previous
PlayStation controllers like DualShock 3 and DualShock 4. This new mode
requires an updated DualSense firmware (released in 2021) and is the default
mode used on the DualSense Edge.

Thanks,
Roderick Colenbrander
Sony Interactive Entertainment, LLC


Roderick Colenbrander (3):
  HID: playstation: stop DualSense output work on remove.
  HID: playstation: add initial DualSense Edge controller support
  HID: playstation: support updated DualSense rumble mode.

 drivers/hid/hid-ids.h         |  1 +
 drivers/hid/hid-playstation.c | 85 ++++++++++++++++++++++++++++++++---
 2 files changed, 79 insertions(+), 7 deletions(-)

-- 
2.37.3

