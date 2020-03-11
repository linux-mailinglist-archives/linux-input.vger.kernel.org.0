Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 904C418120A
	for <lists+linux-input@lfdr.de>; Wed, 11 Mar 2020 08:37:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbgCKHh1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 03:37:27 -0400
Received: from mx2.suse.de ([195.135.220.15]:45726 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgCKHh1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 03:37:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 667FFAD72;
        Wed, 11 Mar 2020 07:37:24 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: hid-picolcd_fb: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 08:37:19 +0100
Message-Id: <20200311073719.7173-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/hid/hid-picolcd_fb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index a549c42e8c90..33c102a60992 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -458,9 +458,9 @@ static ssize_t picolcd_fb_update_rate_show(struct device *dev,
 		if (ret >= PAGE_SIZE)
 			break;
 		else if (i == fb_update_rate)
-			ret += snprintf(buf+ret, PAGE_SIZE-ret, "[%u] ", i);
+			ret += scnprintf(buf+ret, PAGE_SIZE-ret, "[%u] ", i);
 		else
-			ret += snprintf(buf+ret, PAGE_SIZE-ret, "%u ", i);
+			ret += scnprintf(buf+ret, PAGE_SIZE-ret, "%u ", i);
 	if (ret > 0)
 		buf[min(ret, (size_t)PAGE_SIZE)-1] = '\n';
 	return ret;
-- 
2.16.4

