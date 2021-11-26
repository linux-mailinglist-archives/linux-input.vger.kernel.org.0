Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86C3D45EE94
	for <lists+linux-input@lfdr.de>; Fri, 26 Nov 2021 14:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236625AbhKZNJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Nov 2021 08:09:31 -0500
Received: from mga18.intel.com ([134.134.136.126]:38673 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236802AbhKZNHb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Nov 2021 08:07:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="222532965"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="222532965"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:02:00 -0800
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; 
   d="scan'208";a="498395567"
Received: from asaechnx-mobl2.ccr.corp.intel.com (HELO tkristo-desk.intel.com) ([10.249.34.152])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2021 05:01:58 -0800
From:   Tero Kristo <tero.kristo@linux.intel.com>
To:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        jikos@kernel.org, mika.westerberg@linux.intel.com,
        tero.kristo@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        peter.hutterer@who-t.net
Subject: [RFCv2 2/8] HID: hid-input: Add suffix also for HID_DG_PEN
Date:   Fri, 26 Nov 2021 15:01:35 +0200
Message-Id: <20211126130141.1811848-3-tero.kristo@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
References: <20211126130141.1811848-1-tero.kristo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Mika Westerberg <mika.westerberg@linux.intel.com>

This and HID_DG_STYLUS are pretty much the same thing so add suffix for
HID_DG_PEN too. This makes the input device name look better.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/hid/hid-input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 39ebedb2323b..73c2edda742e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1737,6 +1737,7 @@ static struct hid_input *hidinput_allocate(struct hid_device *hid,
 		case HID_GD_MOUSE:
 			suffix = "Mouse";
 			break;
+		case HID_DG_PEN:
 		case HID_DG_STYLUS:
 			suffix = "Pen";
 			break;
-- 
2.25.1

