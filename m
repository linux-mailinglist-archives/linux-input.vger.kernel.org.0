Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916EC34E65E
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 13:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbhC3Ldr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 07:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhC3Ldd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 07:33:33 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627EAC061574
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:33 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c17so11957132pfn.6
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 04:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KEoDtJ5G5YkBKsavzIevwyaahq/W0RmMwBfapdpIAcU=;
        b=njdY22hHfm7SnPelzuTP9R14K2Lv1+UllTKCIK7v0fjGVt9DMbc974og67bTH2dRu0
         moI9EesDtAYvo4Q7MTfHdxw1bDDeK+5rjy1PwEfZFZtIK6t2jbDDNwekNxHYSBdQTW0c
         uEGPy9udhv3dDh98HSG3MxIaBqk7RrFm/JR0UtkjXE974xeHxm4s1dbLK3e14RC6ZMIp
         7ziHsB/Q2kujYBdMWv1pdFNa4sK2arzibjpm+VXvdL7C9LfM5FMr424isR+snfv1bnRY
         RvoU2FGs+mlWpoNJrSKedW6l6ZpO3hZx9Z6gOd+i7iAee82Gm4NgqWv0agb/GdA6k+ng
         lomg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KEoDtJ5G5YkBKsavzIevwyaahq/W0RmMwBfapdpIAcU=;
        b=JDXxP4NGumDYt1Ou9KT4w6dyzKdhvi59qfRIRxHASLCMrUBlJJ40g9WSljGuOqh2qh
         +l2xEPoBWuJD55p1t9Jdbs5Qmm6lVDtcKUf0DAiwevoHTAOxUZZVMRuhKgKE1rN4m7eh
         yQlAyyvEgtCAN7jYO0ltnw3R2yR7Ad8sg/sGGqIAAmeLalulcSsHsHhUbGyi0YP5T0FM
         M37WRr9WJDb0P0Duk8nxuB8uM7gQEc+Mc/34s+69WYvBtc3oUfOHwyZ3jZl51kgLy3Xa
         urU17q2xLGTMWpqUyyyzET9UE2WBKLYt0MfF/nR2l/ghOPoTNyEouSml8pjUtjEhQExa
         +MXA==
X-Gm-Message-State: AOAM532p/ncFGzHHoBW1sC/ZRHZ6m9xkkKH3v7rWwI+W7J+kXDu/BEIw
        FhS/DGU+dKGCGWrE9Dmj8L1XPC2AWER51wUG
X-Google-Smtp-Source: ABdhPJxb1uVnG6ncLHStkpiFuj2eisNmu06nYK47lYwECImhonrkZobn9Tr2Jiyfk8o+5tKUeJPV+g==
X-Received: by 2002:a63:c646:: with SMTP id x6mr29281290pgg.126.1617104012757;
        Tue, 30 Mar 2021 04:33:32 -0700 (PDT)
Received: from johnchen902-arch-ryzen.. (2001-b011-3815-5a81-9afa-9bff-fe6e-3ce2.dynamic-ip6.hinet.net. [2001:b011:3815:5a81:9afa:9bff:fe6e:3ce2])
        by smtp.gmail.com with ESMTPSA id y4sm19650868pfn.67.2021.03.30.04.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 04:33:32 -0700 (PDT)
From:   John Chen <johnchen902@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        John Chen <johnchen902@gmail.com>
Subject: [PATCH v2 0/4] Hid: add Apple Magic Mouse 2 support
Date:   Tue, 30 Mar 2021 19:33:15 +0800
Message-Id: <20210330113319.14010-1-johnchen902@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HID descriptor of Magic Mouse 2 contains BTN_LEFT, BTN_RIGHT, REL_X,
REL_Y, whether it's charging, whether it's fully charged, and battery
capacity.

$ xxd -p report_descriptor
05010902a101851205091901290215002501950275018102950175068103
05010901a1001601f826ff073601fb46ff046513550d0930093175109502
8106750895028101c00602ff09558555150026ff0075089540b1a2c00600
ff0914a10185900584750195031500250109610585094409468102950581
0175089501150026ff0009658102c000

As hidinput can handle the BTNs and RELs, the Magic Mouse 2 already
functions as a basic mouse. Nevertheless, It should be reasonable to
extend hid-magicmouse to support Magic Mouse 2 as well. Furthermore,
hidinput is patched to handle the battery capacity.

This work is based on Recardo's, which is in turned based on Rohitpid's.
Their GitHub repositories are linked below:
https://github.com/RicardoEPRodrigues/magicmouse-hid
https://github.com/rohitpid/Linux-Magic-Trackpad-2-Driver

Change v1->v2: An extra parameter is passed to hidinput_setup_battery
instead of directly modifying battery_{min,max}.

John Chen (4):
  HID: magicmouse: add Apple Magic Mouse 2 support
  HID: magicmouse: fix 3 button emulation of Mouse 2
  HID: magicmouse: fix reconnection of Magic Mouse 2
  HID: input: map battery capacity (00850065)

 drivers/hid/hid-debug.c      |   1 +
 drivers/hid/hid-ids.h        |   1 +
 drivers/hid/hid-input.c      |  22 +++--
 drivers/hid/hid-magicmouse.c | 156 ++++++++++++++++++++++++++++-------
 include/linux/hid.h          |   3 +
 5 files changed, 145 insertions(+), 38 deletions(-)

-- 
2.31.0

