Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD6E436265
	for <lists+linux-input@lfdr.de>; Thu, 21 Oct 2021 15:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhJUNLf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Oct 2021 09:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhJUNLe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Oct 2021 09:11:34 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A3EC06161C;
        Thu, 21 Oct 2021 06:09:18 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id ec8so1080534edb.6;
        Thu, 21 Oct 2021 06:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgnChK/V6LgAUB4kw1GaNXmG+i9xjyjTWMC+AtrXfBk=;
        b=i76CAX6Eqknf3lgK4Eu4h5yWb5kIas+hXeA2aMzGQ3Q5qFZgwrKmvMK6fEv9wb007Z
         hZQgNV3nJk3gw0/rtEiIIrjVz/Jpf2k8jyYpYKFQhhypNZn5GvaytkBKZkEslO0s0nCc
         W+9pqHq++tph+22bnJES48513m424/bSSuP+c6s+co66h1EFAV/WNMNw1f1RAz+KbraW
         fLotLACRzuHWRZUrakt3ClFYEaK+GkcTN3ZHam+QLRpWH8Q3KThWSFSF1aUt2+P8wb1J
         x83Y1tUpZ0MALjbAk3KDG29Se0IjGTNpMaH7spSfoF2USAxV+l5kjoWQbtPTCgvVTyAA
         DQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zgnChK/V6LgAUB4kw1GaNXmG+i9xjyjTWMC+AtrXfBk=;
        b=odEucupqSbqFxB8Hx1L93lDOzrfgz4phwiQydlpLAK3ZxDsZLaynERg7OjieBPwnJp
         Pkh9gPEZ90FziaMqxQblsFaiw2zlCarXY+ptGC6FKH+uu8xEL0yhYaDyZoqAqotYNTxO
         Fgah1KiP/op3LNvBnOZHNZLvoECFQ+15c/Nsk82FfQ/is9hR+uLc2V0kyj+2ittvBE0K
         A1av/BRwPDLxGq8Yt1zmpfYABh/lgd0bApKwT/gWb4Eqfn6rNtPimjrk4S+dmlJUbzIQ
         JfJ6c6jPmEWcUwUxCXrwbcVJnVW86swLPtsc6B054aXPlGl39DC2oFW4ZIRGsm32ja5P
         N1KA==
X-Gm-Message-State: AOAM531d6nDN3AxS6nMj/z7nDLSnZDke3xDIqMTxxv/ZtXwIBHEzviXY
        WY2Yl4DqbEjgspqs4+CmXkYj+BcPk+E=
X-Google-Smtp-Source: ABdhPJxhjAHMM+e+1hT/X+RJZAWxodYfHFk22KjnEvcmWIdfJGC6H+hjrJYWjwPIW1qhzNR+Z27JEw==
X-Received: by 2002:a50:da4e:: with SMTP id a14mr7676967edk.154.1634821754097;
        Thu, 21 Oct 2021 06:09:14 -0700 (PDT)
Received: from xws.localdomain ([194.126.177.11])
        by smtp.gmail.com with ESMTPSA id q6sm126987eds.96.2021.10.21.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 06:09:13 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] platform/surface: aggregator: Add support for Surface Laptop Studio
Date:   Thu, 21 Oct 2021 15:09:01 +0200
Message-Id: <20211021130904.862610-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds Surface Aggregator Module (SAM) support for the new
Surface Laptop Studio (SLS).

This is mostly straight-forward addition of devices to the Surface
Aggregator registry, but the Surface HID driver needs a couple of small
changes. Specifically, we need to allow it to probe against SAM devices
with target ID 1 and also need to use the corresponding registry for
those.

I hope it's okay that I've CCed stable to get these included in v5.14+
stable kernels. The changes are fairly small and enable keyboard and
touchpad on the SLS. Most other things (except touch) should already
work well on the latest stable kernels, so back-porting this series
would make the SLS a usable device on those.

Maximilian Luz (3):
  platform/surface: aggregator_registry: Add support for Surface Laptop
    Studio
  HID: surface-hid: Use correct event registry for managing HID events
  HID: surface-hid: Allow driver matching for target ID 1 devices

 drivers/hid/surface-hid/surface_hid.c         |  4 +-
 .../surface/surface_aggregator_registry.c     | 54 +++++++++++++++++++
 include/linux/surface_aggregator/controller.h |  4 +-
 3 files changed, 58 insertions(+), 4 deletions(-)

-- 
2.33.1

