Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F222AD057
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 08:22:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727389AbgKJHWf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 02:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgKJHWe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 02:22:34 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 667BEC0613CF
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 23:22:33 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f38so9401551pgm.2
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 23:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ps876TUbJ+ThGMnBqmwcOXSkNYsHzrHVKXtf7AJF1n4=;
        b=h/BdlfExZZIL4yRiCxEwStYGqN8GvBgbFnh4JhOdoGzc60hpdBMEmth/a8ik21MomU
         1dIPZs9nopc1CYmX0Dkpm7hZByzpX2jHwNe1w6iOmvqO4qwp1ygWmeojIiHnPNUUtLF/
         zTK6f5aZwL+4tIMJ7iEIBaj3/4Rmx7RqwO48vSKz6gh/9ZTLPR2i75ONt0wFtb7o8XC7
         o8VC44OOLzyaLW0fHE28KnA4f4+8x9zHyFnPuBVZ+p/gKfHC1GXKWNkkD4fmdBRMWvok
         oUR5ZHcLIUbZ7ARAg3BemjFdnPMbZ72YQBlXedxZpI1+nPWRPB8eMgyl1thRHr35MmSw
         3Iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ps876TUbJ+ThGMnBqmwcOXSkNYsHzrHVKXtf7AJF1n4=;
        b=tFNRVxp0CL3LQ/tPrq/mqb0Rnj7p9wN9un9TyfJ6XpPdC6A3N5Uto2tjqFLciQx5e/
         l22tNrq+YFoHGhvV3UbPLDVcVDbbwMtORA2YGJ6Wv1XOkvjpt2fYKcxWID6JCy2hgrAt
         Aahc7yAU7+B5lX75e7pEXWIaYnVzyngy1qlQ9P9tK76thjnHNvAzpA9YE1//cfbF/NPc
         n5UwoK6u5auUpzJ4NScsdKK5zcOP5/xqPx2AYGRdosspwXdXY84w3oiK/pOgCNlSWrqk
         Q/0h7xutLOvW2MmZSWKwS+1qII8+QSSlDI46fe2KZPoxlNI48p5IyeYCN7jn8xwTrRw3
         NLAg==
X-Gm-Message-State: AOAM531vG+vArSh0pV9sew8lkpf4kuUWxPKz6UWJ42x5W+rcRtESamXJ
        N1s1qI62zQTDMmqPuwpUhUsFgw==
X-Google-Smtp-Source: ABdhPJzvVUvVJmBuK1lpr5MY+WePc/kMtCNqH+Lb6TP/tD2YQdcgGL2SEjwcJNSr5f3OAcaODxMqkQ==
X-Received: by 2002:a17:90b:1881:: with SMTP id mn1mr3621480pjb.225.1604992952945;
        Mon, 09 Nov 2020 23:22:32 -0800 (PST)
Received: from us8c16456344dc.lan (cpe-76-87-77-78.socal.res.rr.com. [76.87.77.78])
        by smtp.gmail.com with ESMTPSA id j11sm12908189pfh.143.2020.11.09.23.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:22:32 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 0/3] HID: sony: various DS4 improvements
Date:   Mon,  9 Nov 2020 23:22:26 -0800
Message-Id: <20201110072229.9112-1-roderick@gaikai.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Roderick Colenbrander <roderick.colenbrander@sony.com>

Hi,

This patch series provides a number of independent DS4 driver
improvements.

The first patch improves DS4 battery level and battery status
reporting. The current implementation interpreted the value
ranges and status levels incorrectly.

The second patch fixes a DS4 dongle kernel crash (bug 206785).
The specific problem is related to Steam, which implements
its own user-space DS4 driver using hidraw. It collides during
DS4 dongle hotplug, causing 'out of order HID feature reports'.
The driver didn't expect this and this led to a kernel crash
later on due to interpreting data incorrectly. The workaround
is checking if the right data was returned and retrying.
Though, I really really dislike this type of fix. Long-term
some solution is needed to perhaps prevent hidraw and evdev
drivers to step on each other's toes. For now this fixes
the current problem.

The last patch fixes sysfs cleanup issues encountered using
the DS4 dongle.

Thanks,
Roderick

Roderick Colenbrander (3):
  HID: sony: Report more accurate DS4 power status.
  HID: sony: Workaround for DS4 dongle hotplug kernel crash.
  HID: sony: Don't use fw_version/hw_version for sysfs cleanup.

 drivers/hid/hid-sony.c | 135 ++++++++++++++++++++++++++---------------
 1 file changed, 86 insertions(+), 49 deletions(-)

-- 
2.26.2

