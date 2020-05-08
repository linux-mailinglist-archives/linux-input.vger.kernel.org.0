Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454131CA32B
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgEHF6X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:23 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:2693 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbgEHF6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:22 -0400
IronPort-SDR: ZpqTchIRYgUBl24PfM/5caqAn/X2791qnf2VUApgTU50eTBH4r8OWu3RhKsakgUr6ePfx1BZej
 ywY0fI2hJ852mbQr0eSi3kHFMSV1kNR6ItaO9EY4McbyhNwEv/F7NJe/J7mhPmxuphL2UYisR0
 IEVVrlWNfbRrVl+eXli+fVeQFCQsuRBqmvpWomsmv4joIrG3Axn/yZl6v/Wg4UBO7mgrgC/str
 /GOSDIBUVdSW1vwsI4EpH4uEW88GhE+Pf0lXTzGjdeM/LIBBEKHv0a+Bq2IjVpC+BzDNpiPoy7
 Mvg=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589089"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:21 -0800
IronPort-SDR: QpgF3jsE9EDTAHw+EahVPXT5luom99XRRZBfLm//vN7NVQZqBHalhffWiYMHcUNGm7ft1ykpCH
 nje7qvn0m9ZtM0XdIAABou4y0tWtFViaLzDZjHC33qJzLee7TdlwMJMnmYMEQppclaT+/5evrk
 OGe5iLBp+cvNVuEvdtXkVMNTZJmsrOyRxcnhExY44qZOBIwtsEUttG7j2pys+uWfUiXEJyRgdx
 oNK75w5nsX3qvoig9e9WwHnVHsQb39ZySqDWrWKcSwLKInk+ZLHs5NXWV7difoIu5h14Srr/Q9
 A9w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 21/56] Input: atmel_mxt_ts - check data->input_dev is not null in mxt_input_sync()
Date:   Thu, 7 May 2020 22:56:21 -0700
Message-ID: <20200508055656.96389-22-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Janus Cheng <drxaero@gmail.com>

* Symptom: if update_fw and update_cfg, kernel panic occurs.
* Reproducibility: 10%
* Root Cause:
  - If update_fw, the T6 will send a CFG_ERR message periodically.
  - After that, update_cfg process begin, the mxt_update_cfg_store() will
    invoke mxt_free_input_device() and nullify data->input_dev.
  - The CFG_ERR message will trigger mxt_interrupt(), and mxt_input_sync()
    will be invoked by mxt_process_messages_t44(). And mxt_input_sync()
    references a NULL data->input_dev and kernel panic occurs.

TrackerRMS TKT-004235

Signed-off-by: Janus Cheng <drxaero@gmail.com>
Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit c909ada856861f305653b127db3ea0fa60264331)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 503e70603a67..85b903b8d5c9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -838,9 +838,11 @@ static void mxt_input_button(struct mxt_data *data, u8 *message)
 
 static void mxt_input_sync(struct mxt_data *data)
 {
-	input_mt_report_pointer_emulation(data->input_dev,
-					  data->t19_num_keys);
-	input_sync(data->input_dev);
+	if (data->input_dev) {
+		input_mt_report_pointer_emulation(data->input_dev,
+						  data->t19_num_keys);
+		input_sync(data->input_dev);
+	}
 }
 
 static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
-- 
2.17.1

