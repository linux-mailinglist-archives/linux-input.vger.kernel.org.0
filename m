Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4F8307C72
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbhA1R3q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:29:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233042AbhA1R1o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:27:44 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA4E2C0613ED
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:04 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e9so4731293pjj.0
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVGSKoyNcrzWu21R7OHE3ZPGE8JKEcOshn7TS4tMWZ0=;
        b=br7myvw5AOL+jjzfGOGJ7usohRjwS5bk+bT7b8sjKmG8gf06GZK9ZN0KuncTQz8lxv
         9C2BaUWIq4iTxCS0+37GTLRqIMucjMPoMK1BqVfKfn6qcXVb4wNM6jCybP0CoEu4jTAG
         s1kdL54OtYiwLxReGQccfiJS84jca/JigdwcYQevn/1oidJwrCBS5un14g4ENZyXodRa
         t/NOkQTRxtXeV3GW2BYp/7kZSKU2TpD3Q2r6bfmWgFuegz7hE9drB4X+YPaPOfTta+b+
         7guRXF0t3myFdW0Ym3MRLFuf9aLj2rCIp7J1+zmc/ledkTE7sIupTiQSa9EA2LSoe03G
         Tm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVGSKoyNcrzWu21R7OHE3ZPGE8JKEcOshn7TS4tMWZ0=;
        b=m3F6iZg/eOGEYoCOm3n2Ed2yDAb7E0OuQVy+/+iZfMce6YqW+HbEPbr4l1HBSQ64uU
         5hBlLoueuJQW7ZlE6Rjtv/OCopG4rUmuaPba8Puzke9cn157DLdKGd7/hc/5NQuFjeO2
         SVghVsBHYPnj4gJ8EfPRUPR8aUyVCb4X6rz4n6H7NvecHJUJaLa9NQ9ENYSZltlJo/BR
         4HX1VSDail6tXYlHD2b/vVARQV0ziHsU9sAVVMR/Gj8IiQDEUsu3wqNjDHWH3sQnrQlP
         EfkTgbG0prS2v65WgWNUX6LfR91Q70dohNw3cyj6DTHx6RL2zTbf3IYh3YC5yRec7+VR
         Bfcw==
X-Gm-Message-State: AOAM533+owcknAuAONm91CYLSs2OC9EhRgLOg0jeDnbexcWbcjdKwZMa
        FLtX10hXlUQ8A8/35gmIuOOrcg==
X-Google-Smtp-Source: ABdhPJxtEkIUc4vIcDT9gwq87pLQwMfViXdxwlsIuVYBn2HnFVL9m2y39Mn6juve5zNe7S1d8HISWw==
X-Received: by 2002:a17:90a:2e0d:: with SMTP id q13mr395626pjd.101.1611854824282;
        Thu, 28 Jan 2021 09:27:04 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a31sm6190445pgb.93.2021.01.28.09.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 09:27:03 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v5 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Thu, 28 Jan 2021 09:26:44 -0800
Message-Id: <20210128172657.24516-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

This is hopefully the final revision of this patch series. Patch v4 had
a rebase issue of a part of the sensors patch for which a part had moved
to the end of the series. This has been fixed. I have double, no triple
checked the patches. Made sure they build using a 'rebase -x' script
and also ran the hid-tools tests on the final driver.

Thanks to everyone who provided feedback through the mailing list or privately.
As suggested by Benjamin on the 'v4' version of this email, if you were
involed in the review or testing of this series and would like some credit,
please provide a reviewed-by or tested-by tag.

Changes since v4:
- Fixed bad rebase of ps_sensors_create, moved it to appropriate patch.

Thanks,

Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (13):
  HID: playstation: initial DualSense USB support.
  HID: playstation: use DualSense MAC address as unique identifier.
  HID: playstation: add DualSense battery support.
  HID: playstation: add DualSense touchpad support.
  HID: playstation: add DualSense accelerometer and gyroscope support.
  HID: playstation: track devices in list.
  HID: playstation: add DualSense Bluetooth support.
  HID: playstation: add DualSense classic rumble support.
  HID: playstation: add DualSense lightbar support
  HID: playstation: add microphone mute support for DualSense.
  HID: playstation: add DualSense player LEDs support.
  HID: playstation: DualSense set LEDs to default player id.
  HID: playstation: report DualSense hardware and firmware version.

 MAINTAINERS                   |    6 +
 drivers/hid/Kconfig           |   21 +
 drivers/hid/Makefile          |    1 +
 drivers/hid/hid-ids.h         |    1 +
 drivers/hid/hid-playstation.c | 1492 +++++++++++++++++++++++++++++++++
 5 files changed, 1521 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

