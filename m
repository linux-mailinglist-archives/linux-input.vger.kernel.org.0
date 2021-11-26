Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3C345EE92
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 14:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240257AbhKZNJ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Nov 2021 08:09:27 -0500
Received: from mga18.intel.com ([134.134.136.126]:38672 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236270AbhKZNH1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Nov 2021 08:07:27 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222532954"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="222532954"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:01:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="498395546"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO tkristo-desk.intel.com) ([10.249.34.152])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:01:55 -0800
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mika.westerberg@linux.intel.com,
        tero.kristo@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        peter.hutterer@who-t.net
Subject: [RFCv2 1/8] HID: Add map_msc() to avoid boilerplate code
Date:   Fri, 26 Nov 2021 15:01:34 +0200
Message-Id: <20211126130141.1811848-2-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
References: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Since we are going to have more MSC events too, add map_msc() that can
be used to fill in necessary fields and avoid boilerplate code.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/hid/hid-input.c | 6 ++----
 include/linux/hid.h     | 4 ++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 2c72ce4147b1..39ebedb2323b 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -52,6 +52,7 @@ static const struct {
 #define map_rel(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_REL, (c))
 #define map_key(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_KEY, (c))
 #define map_led(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_LED, (c))
+#define map_msc(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_MSC, (c))
 
 #define map_abs_clear(c)	hid_map_usage_clear(hidinput, usage, &bit, \
 		&max, EV_ABS, (c))
@@ -872,10 +873,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 		case 0x5b: /* TransducerSerialNumber */
 		case 0x6e: /* TransducerSerialNumber2 */
-			usage->type = EV_MSC;
-			usage->code = MSC_SERIAL;
-			bit = input->mscbit;
-			max = MSC_MAX;
+			map_msc(MSC_SERIAL);
 			break;
 
 		default:  goto unknown;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e95800bab56a..96eaca0d5322 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -766,6 +766,10 @@ static inline void hid_map_usage(struct hid_input *hidinput,
 		bmap = input->ledbit;
 		limit = LED_MAX;
 		break;
+	case EV_MSC:
+		bmap = input->mscbit;
+		limit = MSC_MAX;
+		break;
 	}
 
 	if (unlikely(c > limit || !bmap)) {
-- 
2.25.1

