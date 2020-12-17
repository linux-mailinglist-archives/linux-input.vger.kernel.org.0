Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B0A2DCA6E
	for <lists+linux-input@lfdr.de>; Thu, 17 Dec 2020 02:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389087AbgLQBNL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Dec 2020 20:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389016AbgLQBNK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Dec 2020 20:13:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434B8C0617B0;
        Wed, 16 Dec 2020 17:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=F8PQcYi3gvouvVHva2A57eJGUWi5JG5zYlkbXK0yVMo=; b=EBkrCGqMq/3cf0a2Z0P7yAhM0r
        LoFNNB7S/agSex5YbwWgpt+4NKxHgCTaBgsbCX4qXSlEqt1CQoxSYpTdElUe0nHP5bkE5G2k2Xx/J
        tnYxQiyJNSUPLBjmsGqHwmi3xMHtoIPHKY4Z4Lu4JkSlcPCBMo7rqlKBoa2GSnfs6k42gQkvVpc2+
        cVzc+Dgm1gR7QNN6F40mulJCOfSnmztxSgNBXp/HfG0r5EKd/4VcEXpb7tQPkbksvdu619QepoDAI
        LxkOxtdfiKUya/YARcUxc7FSzsGfPqLjBvsWRxA5+TIDKM9wAxOJtNlK0dkRooPshWOcfeQutC1Gm
        6+O/QoPw==;
Received: from [2601:1c0:6280:3f0::64ea] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kphqF-0003ck-7i; Thu, 17 Dec 2020 01:12:27 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: core: detect and skip invalid inputs to snto32()
Date:   Wed, 16 Dec 2020 17:12:21 -0800
Message-Id: <20201217011221.25678-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Prevent invalid (0, 0) inputs to hid-core's snto32() function.

Maybe it is just the dummy device here that is causing this, but
there are hundreds of calls to snto32(0, 0). Having n (bits count)
of 0 is causing the current UBSAN trap with a shift value of
0xffffffff (-1, or n - 1 in this function).

Either of the value to shift being 0 or the bits count being 0 can be
handled by just returning 0 to the caller, avoiding the following
complex shift + OR operations:

	return value & (1 << (n - 1)) ? value | (~0U << n) : value;

Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org
---
 drivers/hid/hid-core.c |    3 +++
 1 file changed, 3 insertions(+)

--- lnx-510.orig/drivers/hid/hid-core.c
+++ lnx-510/drivers/hid/hid-core.c
@@ -1307,6 +1307,9 @@ EXPORT_SYMBOL_GPL(hid_open_report);
 
 static s32 snto32(__u32 value, unsigned n)
 {
+	if (!value || !n)
+		return 0;
+
 	switch (n) {
 	case 8:  return ((__s8)value);
 	case 16: return ((__s16)value);
