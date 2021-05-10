Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5AF7379983
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 00:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbhEJWBV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 18:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhEJWBU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 18:01:20 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4F1C061574
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 15:00:14 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so170712pjb.4
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6arkyk3IWfnlh10eIyVxN4+C46Wz4GpxdTEupi3VfI=;
        b=lxuBNxZS9o06/OGynjfaiFC8tbJB9pP7cC6QCMi8L0fiRh4Eou2a7jtPLEM1QLXLVW
         gtMLg+caGvBuWpFwRfyS5OpPVW/BRPnueXiIO+yevB2MGBJT0PRBB+QopIUjlJwO3oKm
         EnyAuD/WlkK9tUSL2pg2IZ2kVFx2u1IEpJmcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y6arkyk3IWfnlh10eIyVxN4+C46Wz4GpxdTEupi3VfI=;
        b=g7GWU57pih2bS9U78rYKeb+NWIH8ODRmr1ZY9n1gr2w2I67Q1C3RIGThSaCBgIWx6o
         ZaJZLzY406CzQohbartJfv75s4435uv7GG3vNTMivCXCrMeY7/5ORIGS4OHH7wNcKnXG
         hhrPIOmHPI7WvV8eYj1quPzxIIjoSj+d4d9yfP6ReLIPhdYCmHV1wZxGrGWJQfwJQUyx
         JHRRRFYWRxfoTy4xmHAG+ZuUzWo/4jt1QaN2PsU+Yz9aOtgj3q62TmMMTMy2jKPFcfI5
         a+AK6IV2vglakX6fpb7esObttzLlr/pOsf2SwOdhEV4EunJmjw2ypHUx3gpWuUaz4ixl
         4BmQ==
X-Gm-Message-State: AOAM530SzFNUNApXQjLnZcL7cwZCKXOdl+oYSKtwZ8UyQoJ7bVquO+Uo
        BeQBY1r7rSRsLFkRWb2TmKMkQg==
X-Google-Smtp-Source: ABdhPJyJ+htNeBEZhjSatB5U6+cHwWNPaMlJBDD8No5uP2QOO90DVoRFNFO+QQwdjE98lewXT8UnTA==
X-Received: by 2002:a17:90a:1382:: with SMTP id i2mr1368924pja.83.1620684014438;
        Mon, 10 May 2021 15:00:14 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:6765:417e:19fc:9756])
        by smtp.gmail.com with ESMTPSA id a24sm11867717pgv.76.2021.05.10.15.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 15:00:14 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Jingle Wu <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c: Disable irq on shutdown
Date:   Mon, 10 May 2021 15:00:12 -0700
Message-Id: <20210510220012.2003285-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Touching an elan trackpad while shutting down the system sometimes leads
to the following warning from i2c core. This is because the irq is still
active and working, but the i2c bus for the device has been shutdown
already. If the bus has been taken down then we shouldn't expect
transfers to work. Disable the irq on shutdown so that this driver
doesn't try to get the report in the irq handler after the i2c bus is
shutdown.

 i2c i2c-7: Transfer while suspended
 WARNING: CPU: 0 PID: 196 at drivers/i2c/i2c-core.h:54 __i2c_transfer+0xb8/0x38c
 Modules linked in: rfcomm algif_hash algif_skcipher af_alg uinput xt_cgroup
 CPU: 0 PID: 196 Comm: irq/166-ekth300 Not tainted 5.4.115 #96
 Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
 pstate: 60c00009 (nZCv daif +PAN +UAO)
 pc : __i2c_transfer+0xb8/0x38c
 lr : __i2c_transfer+0xb8/0x38c
 sp : ffffffc011793c20
 x29: ffffffc011793c20 x28: 0000000000000000
 x27: ffffff85efd60348 x26: ffffff85efdb8040
 x25: ffffffec39d579cc x24: ffffffec39d57bac
 x23: ffffffec3aab17b9 x22: ffffff85f02d6400
 x21: 0000000000000001 x20: ffffff85f02aa190
 x19: ffffff85f02aa100 x18: 00000000ffff0a10
 x17: 0000000000000044 x16: 00000000000000ec
 x15: ffffffec3a0b9174 x14: 0000000000000006
 x13: 00000000003fe680 x12: 0000000000000000
 x11: 0000000000000000 x10: 00000000ffffffff
 x9 : 806da3cb9f8c1d00 x8 : 806da3cb9f8c1d00
 x7 : 0000000000000000 x6 : ffffffec3afd3bef
 x5 : 0000000000000000 x4 : 0000000000000000
 x3 : 0000000000000000 x2 : fffffffffffffcc7
 x1 : 0000000000000000 x0 : 0000000000000023
 Call trace:
  __i2c_transfer+0xb8/0x38c
  i2c_transfer+0xa0/0xf4
  i2c_transfer_buffer_flags+0x64/0x98
  elan_i2c_get_report+0x2c/0x88
  elan_isr+0x68/0x3e4
  irq_thread_fn+0x2c/0x70
  irq_thread+0xf8/0x148
  kthread+0x140/0x17c
  ret_from_fork+0x10/0x18

Cc: Jingle Wu <jingle.wu@emc.com.tw>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/input/mouse/elan_i2c_core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index bef73822315d..6f64992e70d1 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1338,6 +1338,22 @@ static int elan_probe(struct i2c_client *client,
 	return 0;
 }
 
+static void elan_shutdown(struct i2c_client *client)
+{
+	struct elan_tp_data *data = i2c_get_clientdata(client);
+
+	/*
+	 * Make sure we don't access i2c bus after it is shutdown.
+	 *
+	 * We are taking the mutex to make sure sysfs operations are
+	 * complete before we attempt to silence the device by disabling
+	 * the irq.
+	 */
+	mutex_lock(&data->sysfs_mutex);
+	disable_irq(client->irq);
+	mutex_unlock(&data->sysfs_mutex);
+}
+
 static int __maybe_unused elan_suspend(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -1423,6 +1439,7 @@ static struct i2c_driver elan_driver = {
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe		= elan_probe,
+	.shutdown	= elan_shutdown,
 	.id_table	= elan_id,
 };
 

base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
-- 
https://chromeos.dev

