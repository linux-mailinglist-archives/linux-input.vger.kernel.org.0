Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12FA3127A0
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 22:50:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhBGVtz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 16:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBGVty (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 16:49:54 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C58C06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Feb 2021 13:49:13 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id fa16so6705241pjb.1
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 13:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G91cqHMwYNZxlCkTNM7dzuddB9rE5Qf9VNjlDB5Ktj4=;
        b=vNGD2EmsY7DBN3ParLPL0/PsQRKHjdT6D05N0G7kNGGr9sQHluaq/mTKModVqcH8Tm
         JiOO8wvT8C+ADML36qrngvdnEGXXEWKocGF0hPWgNaplSWeSaEkc8HpDixNsDuihbcA5
         I/hSpFgTCMya5e7kqFyu7LSC0GJKJlQ8r3UvWRUfDgrHSMQYHgZ41KAcgCyl/CX/PLgq
         bD1MhKNHqty7SktOiZHvycGYnwhgz29njFyzLe261EIKVHCzSjT1Bg2P2UNHQI4gTuR9
         Tu2ozlAW411gxzJNZlCy0Ky5B5Zo8bdZ97kw09OtNErUleIaYJA1+Lk9slzbnT/Vqyov
         pi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G91cqHMwYNZxlCkTNM7dzuddB9rE5Qf9VNjlDB5Ktj4=;
        b=Yxgn+dqLan/g1JRKLzXeoitwTDnT1lewgqahw9t3zPzkHoMtDV1NYaor6lGs1jXNWP
         pgu6S2RTbGTFE+v29tCWFuxll1fMAGeXvzum05Pt1tpfgLy7ah7YsVY8QJ99ySPdY9N2
         07nEhxEfalwwH8FuL7w4UemwPcx0gsOF3m0EkPUA9N6BIsDSGuSimBxhNq7VwkAWUG3f
         ipYmvbyMdq27VHP6X6IbjT4NwxvGNn4v27Gr6VJTSktOFvxkdkzys5Cj/Fv/2YzjQpga
         cH+XFuPlzFBBxfzc/i0R2hbDg6MMuSlm1Cwfo1hqmurX1rPB5n/AiueEGu9My7NZwo32
         fpmw==
X-Gm-Message-State: AOAM530JSzlqBoqj2WG4fAWgmBSuXVeyv7jxchqbL+wEBYm+Z9Mxyuqf
        S+nO0sISF2/vJHiLX9cLPyZ6cA==
X-Google-Smtp-Source: ABdhPJxZ5fWZq2Wz/gVUCXCHhBIV9wMhCyOPaNjkX03LjmjnO7WAqEGhG/hlmd0fwd1AlrrT7uJCbg==
X-Received: by 2002:a17:902:70c6:b029:df:d62a:8c69 with SMTP id l6-20020a17090270c6b02900dfd62a8c69mr13220208plt.20.1612734553262;
        Sun, 07 Feb 2021 13:49:13 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id a141sm16578991pfa.189.2021.02.07.13.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 13:49:12 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        =?UTF-8?q?Samuel=20=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?q?Florian=20M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v6 00/13] HID: new driver for PS5 'DualSense' controller
Date:   Sun,  7 Feb 2021 13:48:55 -0800
Message-Id: <20210207214908.79573-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

This is an updated version with a few small changes suggested by
by Barnabás and Benjamin. It is mostly a few additional checks and
a few checkpath related changes.

Changes since v5:
- Fixed a couple of checkpath warnings.
- Renamed firmware_/hardware_version show functions.
- Used DEVICE_ATTR_RO for firmware/hardware_version show functions.
- Changed player_ids array to static const.
- Added error check for power_supply_powers.
- Ensured devm_kasprintf return value is checked.

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
 drivers/hid/hid-playstation.c | 1504 +++++++++++++++++++++++++++++++++
 5 files changed, 1533 insertions(+)
 create mode 100644 drivers/hid/hid-playstation.c

-- 
2.26.2

