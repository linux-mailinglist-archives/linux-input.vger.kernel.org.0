Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7DF64AEBA
	for <lists+linux-input@lfdr.de>; Tue, 13 Dec 2022 05:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbiLMEtr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Dec 2022 23:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbiLMEto (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Dec 2022 23:49:44 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F9818B00
        for <linux-input@vger.kernel.org>; Mon, 12 Dec 2022 20:49:42 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id jn7so14367101plb.13
        for <linux-input@vger.kernel.org>; Mon, 12 Dec 2022 20:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bx0zRtCxTT+bkwxXYKGWZ90m8EgvJKqMbFYYCSPEFJM=;
        b=zMlLZkC1F5MQWGoeHAjtIUsGraP75YeLB+BTWQ5pbWtSaUDoG9cx/eYlWGTs7rtvc4
         k88HY0CYfk2dv8FYNTYnmExmeFvqIUI00NULuuaCZvha4wNR6lU38qNknON2gypiWmXT
         kN/rl00i5FeMh7eCpRrsiqITdKL5OKktWwQkxWTn+RHs+r416AsyG+y8UcodUn+/U1l+
         pJ8KyQ5X8ndkuKpdpJmbE2+tM2zcyuqQaAEvaPjiUBawtSPDHzbOjH14fLHAi1q4TBRs
         S5gjheVT/7ew5+MqpuUjltY5OW1pDN+iEUbfbpal/7r12fZEuQcBxBPYtY+bcFaY0njB
         MSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bx0zRtCxTT+bkwxXYKGWZ90m8EgvJKqMbFYYCSPEFJM=;
        b=FVGubltY4bvCKpJO363qXyX7HM/Mlkky9YZoeVJWJtIClRg4qVy91mf9QqEyJ93rCO
         qabl/z/MkRz7P/cx14c64qGF1NZzRxe0FDnW2o4STaSobHyFD/nD/sarRcsKK0c0bo9z
         F7dNTxM2jhcpU8DlwT7Tw213ZatF3vZLiRXxtLnb7FVCP0RYm/lZVo5ebKaIjj1aFDH1
         hlqMeIadgIM81IoY0hkgsbA0oPQ+WtW2IQ3BrvgtG0YLGSWH+05UKEtYjzN8fIxR3lHC
         ZZ///eEL1+l8sr2X5mGGs2RLhXsx5vKQ9LnTV6kegUCs+j5lNKpCozK5n2ZSlbahwSq+
         NgrQ==
X-Gm-Message-State: ANoB5pl7YbqYZPJpd/ijSAwOgIcfqyKG0rT1oEcGPRBIKluUU7Y/m5xR
        ywGEQDO9kOwda1lFVmmZRaA0dA==
X-Google-Smtp-Source: AA0mqf68CL0NloOL2B8aN7eBlF5LMMRvy+HMv1ciDNWbmsHyIv8+H7lptOa7HbNo8r2myvPyt6eWEQ==
X-Received: by 2002:a17:902:c10d:b0:188:f0eb:ce10 with SMTP id 13-20020a170902c10d00b00188f0ebce10mr21759136pli.65.1670906982445;
        Mon, 12 Dec 2022 20:49:42 -0800 (PST)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id t13-20020a17090340cd00b00176acd80f69sm7280522pld.102.2022.12.12.20.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 20:49:41 -0800 (PST)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 1/1] HID: playstation: fix free of uninialized pointer for DS4 in Bluetooth.
Date:   Mon, 12 Dec 2022 20:49:35 -0800
Message-Id: <20221213044935.1775499-2-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213044935.1775499-1-roderick.colenbrander@sony.com>
References: <20221213044935.1775499-1-roderick.colenbrander@sony.com>
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

The 'buf' variable is only used in the USB (if-path) and not in the Bluetooth
else-path. Since it is not set to NULL. this results in freeing an uninitialized
pointer. Since the else code-path doesn't need buf, just return 0.

Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/Kconfig           | 2 +-
 drivers/hid/hid-playstation.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index f9d66a00951b..a1e4322a73f5 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -904,7 +904,7 @@ config HID_PLAYSTATION
 	select CRC32
 	select POWER_SUPPLY
 	help
-	  Provides support for Sony PS5 controllers including support for
+	  Provides support for Sony PS4/PS5 controllers including support for
 	  its special functionalities e.g. touchpad, lights and motion
 	  sensors.
 
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 7b5aef538044..f399bf0d3c8c 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1916,7 +1916,7 @@ static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 		if (ret != sizeof(ds4->base.mac_address))
 			return -EINVAL;
 
-		ret = 0;
+		return 0;
 	}
 
 err_free:
-- 
2.38.1

