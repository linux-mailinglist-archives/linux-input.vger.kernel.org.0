Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2892A328503
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 17:50:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234775AbhCAQra (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 11:47:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:46974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235300AbhCAQnx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 11:43:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 588DF64F4A;
        Mon,  1 Mar 2021 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614616204;
        bh=b3oRAKSxoYIMcb3tTe7J/dQcxTsgWB3yNv0wQQXamek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hbppT7iE8BUYspxKBZQHvPPTTBgva1juHWpJkUYdDZfyqWwccxwP6Wt7eZ744/euo
         Ej6dqdjiFQTKb6HNVwiOABAlUply7Fj2ANiSTmE5CqV+xikkqTLOeffK2r0msoT27o
         iB9xFdLeSihn5Y0V9e9g3VjuhicbOak+sNScyJYo=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 4.14 071/176] HID: core: detect and skip invalid inputs to snto32()
Date:   Mon,  1 Mar 2021 17:12:24 +0100
Message-Id: <20210301161024.488925964@linuxfoundation.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301161020.931630716@linuxfoundation.org>
References: <20210301161020.931630716@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit a0312af1f94d13800e63a7d0a66e563582e39aec ]

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
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index fe4e889af0090..71ee1267d2efc 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1129,6 +1129,9 @@ EXPORT_SYMBOL_GPL(hid_open_report);
 
 static s32 snto32(__u32 value, unsigned n)
 {
+	if (!value || !n)
+		return 0;
+
 	switch (n) {
 	case 8:  return ((__s8)value);
 	case 16: return ((__s16)value);
-- 
2.27.0



