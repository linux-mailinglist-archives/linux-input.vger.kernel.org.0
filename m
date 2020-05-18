Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611AE1D7769
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 13:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgERLhz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 07:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgERLhz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 07:37:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D595C061A0C
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 04:37:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u15so9474909ljd.3
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=elastisys-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etuyyLDi9+6yRYFkxZaEIaKvjHuF4Uw20lt//DorAmI=;
        b=l7Heo0oqKoGRA1PDqodjhHvPMG67bm0BcPzKHxExcdQWRC/NaDXesq4ZMMnKQehFqD
         gc7TJ0dVBU0FmIbOdjES2s7fT06YufQ3bArgApfodm9C7tMX8T/hFovtFag2lPJrqQBm
         QTz07YuMtlyT6eF0XRZr1dhedDVXBCDhoUy5IhbIiuVY3bjpRyRki6elsv1KGHlSSMJQ
         8TdueorH6H5OgZVWHy8g+gSRXFf9T3C8IvN7ynkXGIGkNDwpTRf/vL6Z95P5nTTrUdK+
         6cvDBAHZMRebOt/sKrOd2mLhYe3UUaxTvBje+2wn23ZeHBuvsS4Vi+lxwmHZuEvaagtt
         GkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=etuyyLDi9+6yRYFkxZaEIaKvjHuF4Uw20lt//DorAmI=;
        b=e9VRIhpFH5WHe0b/XiSJeWywCfIgrN+AU5hVCcNnrXQWiskLtjzSRRT/iVFyZrJoIS
         zMv5HIamXAC7pANSzFPSoDOf09quLhGqI726iv7+DsIsGG7nK7ZA+Nw01SAHT4KjIuZd
         ex+NfMhLLhHkIw9fA0hoZ0Z77TRTh+FetHXKoplblgvWk2sHAnzHNojPWgxRjl0RYrWa
         QyAMyA5Y4H7Leimtaj272MYEShgQvt39TVk/13qxPmei0AwZ+Ldv6mnJRHBIm4aLIyJA
         NxxGLGzn2xkOLlcG+5a5RATZZR7IfFV/SRBWkrsKqqWNHYSVUV3J47n+OlyD7LlndleZ
         o23A==
X-Gm-Message-State: AOAM533zDbmDDV++qA52SYYRAhKUCBqeM22DZfA6U1mfjz9NUcuxM/D+
        SY95Pjj6YO5HoAaDLhzkPJxxCw==
X-Google-Smtp-Source: ABdhPJxvr5p1ow/dBNo9mKP6lZ8iRjN7qTho0sZRiI5xk7De6fOTVWqA975NtlR7wTHI3s0GSAcyEA==
X-Received: by 2002:a2e:7615:: with SMTP id r21mr4676159ljc.33.1589801872072;
        Mon, 18 May 2020 04:37:52 -0700 (PDT)
Received: from localhost.localdomain (90-224-48-115-no56.tbcn.telia.com. [90.224.48.115])
        by smtp.gmail.com with ESMTPSA id m20sm5567489ljj.94.2020.05.18.04.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 04:37:51 -0700 (PDT)
From:   Cristian Klein <cristian.klein@elastisys.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org,
        Cristian Klein <cristian.klein@elastisys.com>
Subject: [PATCH] Allow building hid.ko as an "external" module
Date:   Mon, 18 May 2020 13:37:42 +0200
Message-Id: <20200518113742.21718-1-cristian.klein@elastisys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For quickly testing USB HID quirks with a larger community, it is useful
to be able to build hid.ko as an external module, e.g., against the
source code of the running kernel.

Before this patch this failed as follows:
```
$ make -C /lib/modules/$(uname -r)/build M=$PWD/drivers/hid
make: Entering directory '/usr/src/linux-headers-5.3.0-51-generic'
  CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-core.o
  CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.o
  LD [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/init.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/hbm.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/bus.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/dma-if.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client-buffers.o
  LD [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/intel-ishtp.o
  CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o
/home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.c:12:10: fatal error: client.h: No such file or directory
   12 | #include "client.h"
      |          ^~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:290: /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o] Error 1
make[1]: *** [scripts/Makefile.build:519: /home/cklein/linux/drivers/hid/intel-ish-hid] Error 2
make: *** [Makefile:1656: _module_/home/cklein/linux/drivers/hid] Error 2
make: Leaving directory '/usr/src/linux-headers-5.3.0-51-generic'
```
---
 drivers/hid/intel-ish-hid/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/Makefile b/drivers/hid/intel-ish-hid/Makefile
index f0a82b1c7..db4974c43 100644
--- a/drivers/hid/intel-ish-hid/Makefile
+++ b/drivers/hid/intel-ish-hid/Makefile
@@ -23,4 +23,4 @@ intel-ishtp-hid-objs += ishtp-hid-client.o
 obj-$(CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER) += intel-ishtp-loader.o
 intel-ishtp-loader-objs += ishtp-fw-loader.o
 
-ccflags-y += -I $(srctree)/$(src)/ishtp
+ccflags-y += -I $(src)/ishtp
-- 
2.20.1

