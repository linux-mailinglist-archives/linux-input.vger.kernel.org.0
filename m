Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062C7445407
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhKDNj7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:39:59 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231365AbhKDNj7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:39:59 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755189"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755189"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542011"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:15 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/8] HID: Add map_msc() to avoid boilerplate code
Date:   Thu,  4 Nov 2021 15:36:55 +0200
Message-Id: <20211104133701.1733551-3-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

Since we are going to have more MSC events too, add map_msc() that can
be used to fill in necessary fields and avoid boilerplate code.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-input.c | 6 ++----
 include/linux/hid.h     | 4 ++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..e1f7cef52afa 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -52,6 +52,7 @@ static const struct {
 #define map_rel(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_REL, (c))
 #define map_key(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_KEY, (c))
 #define map_led(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_LED, (c))
+#define map_msc(c)	hid_map_usage(hidinput, usage, &bit, &max, EV_MSC, (c))
 
 #define map_abs_clear(c)	hid_map_usage_clear(hidinput, usage, &bit, \
 		&max, EV_ABS, (c))
@@ -871,10 +872,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 
 		case 0x5b: /* TransducerSerialNumber */
-			usage->type = EV_MSC;
-			usage->code = MSC_SERIAL;
-			bit = input->mscbit;
-			max = MSC_MAX;
+			map_msc(MSC_SERIAL);
 			break;
 
 		default:  goto unknown;
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 9e067f937dbc..010c8bcbee90 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1000,6 +1000,10 @@ static inline void hid_map_usage(struct hid_input *hidinput,
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

