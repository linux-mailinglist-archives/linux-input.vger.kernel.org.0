Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93C5D10B36C
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2019 17:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfK0Qdi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Nov 2019 11:33:38 -0500
Received: from mga06.intel.com ([134.134.136.31]:6440 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726514AbfK0Qdi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Nov 2019 11:33:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:38 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; 
   d="scan'208";a="409063466"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 27 Nov 2019 08:33:35 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     ville.syrjala@linux.intel.com, intel-gfx@lists.freedesktop.org,
        jani.nikula@intel.com,
        =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        linux-input@vger.kernel.org
Subject: [PATCH 11/13] HID: picoLCD: constify fb ops
Date:   Wed, 27 Nov 2019 18:32:07 +0200
Message-Id: <a578b8c791e1223112b43d0e209766ba4e4ddcbc.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Now that the fbops member of struct fb_info is const, we can star making
the ops const as well.

Cc: Bruno Prémont <bonbons@linux-vserver.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/hid/hid-picolcd_fb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index e162a668fb7e..a549c42e8c90 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -417,8 +417,7 @@ static int picolcd_set_par(struct fb_info *info)
 	return 0;
 }
 
-/* Note this can't be const because of struct fb_info definition */
-static struct fb_ops picolcdfb_ops = {
+static const struct fb_ops picolcdfb_ops = {
 	.owner        = THIS_MODULE,
 	.fb_destroy   = picolcd_fb_destroy,
 	.fb_read      = fb_sys_read,
-- 
2.20.1

