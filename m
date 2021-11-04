Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274BA44540A
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbhKDNkA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:40:00 -0400
Received: from mga12.intel.com ([192.55.52.136]:50270 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231420AbhKDNkA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 09:40:00 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="211755205"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="211755205"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:22 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; 
   d="scan'208";a="501542036"
Received: from eyulyugi-mobl1.ger.corp.intel.com (HELO tkristo-desk.intel.com) ([10.251.215.15])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2021 06:37:20 -0700
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        mika.westerberg@linux.intel.com, tero.kristo@linux.intel.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 4/8] HID: input: Make hidinput_find_field() static
Date:   Thu,  4 Nov 2021 15:36:57 +0200
Message-Id: <20211104133701.1733551-5-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
References: <20211104133701.1733551-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

This function is not called outside of hid-input.c so we can make it
static.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Tero Kristo <tero.kristo@linux.intel.com>
---
 drivers/hid/hid-input.c | 4 ++--
 include/linux/hid.h     | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 05449fa59dc4..0506612800db 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1458,7 +1458,8 @@ void hidinput_report_event(struct hid_device *hid, struct hid_report *report)
 }
 EXPORT_SYMBOL_GPL(hidinput_report_event);
 
-int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int code, struct hid_field **field)
+static int hidinput_find_field(struct hid_device *hid, unsigned int type,
+			       unsigned int code, struct hid_field **field)
 {
 	struct hid_report *report;
 	int i, j;
@@ -1473,7 +1474,6 @@ int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int
 	}
 	return -1;
 }
-EXPORT_SYMBOL_GPL(hidinput_find_field);
 
 struct hid_field *hidinput_get_led_field(struct hid_device *hid)
 {
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 010c8bcbee90..555b5de654b1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -889,7 +889,6 @@ extern void hidinput_disconnect(struct hid_device *);
 
 int hid_set_field(struct hid_field *, unsigned, __s32);
 int hid_input_report(struct hid_device *, int type, u8 *, u32, int);
-int hidinput_find_field(struct hid_device *hid, unsigned int type, unsigned int code, struct hid_field **field);
 struct hid_field *hidinput_get_led_field(struct hid_device *hid);
 unsigned int hidinput_count_leds(struct hid_device *hid);
 __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code);
-- 
2.25.1

