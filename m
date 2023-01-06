Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC18365F957
	for <lists+linux-input@lfdr.de>; Fri,  6 Jan 2023 02:59:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjAFB7X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 20:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjAFB7W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 20:59:22 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2542D59F83
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 17:59:21 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso324566pjc.2
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 17:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0qusvn5B77dSVH/bR1o93bu2pfXKHjaiYxUqfS6HYgE=;
        b=PSnw6rz9m0VOBxWYqKIlL23lUb7yIeR6UPlnPKpogL5z3xJBTKkHXQxkgJnc1scQEQ
         c84A9zgFv1qCOUeVmp2KuYqEAYiD8soVOQZJR8cXbHuW+q1fV9ZoZh9myT1CXyhgA2Ei
         oaBmxm40jVIN+85Oxr8M0AVS2QL8LLA4hniC7n4m4D4kqlbzOp4NNBIEYXnL1ZSaCYUV
         jxdu5kmiH0NxmE51xjL8BK1WoEJu1iLLHgb/vCgcn2KbsxBHsiVKmJNov7jeqFw2HJZf
         /+OG38iJ9DQ923A/8NBHSgbCsewgi2xuHldIOtmf53LjKzlwCwQgpsX68emllEnjfneb
         1pTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qusvn5B77dSVH/bR1o93bu2pfXKHjaiYxUqfS6HYgE=;
        b=hWQWVIyA5qrbUgyDuFmv8ysCFVIr+sSAEpq9m8XrxhnyBQX/TXXc0aXWbwxoyjDEc/
         9bcKNLeVDiQsxHjvpkfAdsyda3VqoMrEckPAPTQRhq88RFcWYdUT7DT/Gj/AM0v3R0ge
         TCd00Wf7QmSqP51qE9S7WhUFzY8wrahQ8sWd4AsaxVxcSVCW/ugKDJyln6Vkc8mJGapA
         6fCepAB1p0WZnP4s6DC8rxFW0437mn0t6FPMBqF1ZAMggPRS5nPpvYFIJnffJC7Tsm+l
         v/NePGLqNf3okJFAoKwlaVicvPQ5rbjQAhHp56ZONsUcL5IW1ZqJAb9EEcnU3/LKv5lk
         QEyg==
X-Gm-Message-State: AFqh2krwHTD55WS42llbuTu6fwdH5f9mXytn4ZsEvar+tQV6kagvX1ac
        gNxL2riZaIPm0q4d7w7nPh1TdA==
X-Google-Smtp-Source: AMrXdXuBgurj60qw8ZF+st+k0oDDCX8LOkMo+7sT+D5HUAwHqyot6ceAAZ//KTlXnBa2OSh91MJzTQ==
X-Received: by 2002:a17:902:bb85:b0:189:8ca1:e641 with SMTP id m5-20020a170902bb8500b001898ca1e641mr57002200pls.60.1672970360664;
        Thu, 05 Jan 2023 17:59:20 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090332d200b001897a8b537asm26811165plr.221.2023.01.05.17.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 17:59:19 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 0/5] HID: playstation: various DS4 and DualSense fixes
Date:   Thu,  5 Jan 2023 17:59:05 -0800
Message-Id: <20230106015910.3031670-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
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

This patch set contains a number of small fixes and stability improvements.

The stability patches are most critical as they prevent kernel crashes.
Over the years there have been various buggy devices usually clone devices,
but now apparently some official devices with wiped calibration data.
It is hard to handle all permutations of devices as some have constants,
some have broken constants (e.g. wrong sign of a coefficient). We disable
calibration when we see an invalid 0 denominator. The patch adds the same
logic to both the DualShock4 and DualSense code.

As part of the calibration stability improvements, a thorough review was
performed of the calibration code as it was suspected it was potentially
incorrect. It was found to be only slightly wrong for the handling of the
bias of the gyroscopes. Two patches fix this for both DualShock4 and DualSense.
There is only a marginal impact on practical values as the bias values
tend to be quite small.

Thanks,
Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (5):
  HID: playstation: fix DualShock4 unreachable calibration code.
  HID: playstation: sanity check DualShock4 calibration data.
  HID: playstation: sanity check DualSense calibration data.
  HID: playstation: correct DualShock4 gyro bias handling.
  HID: playstation: correct DualSense gyro bias handling.

 drivers/hid/hid-playstation.c | 104 +++++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 19 deletions(-)

-- 
2.38.1

