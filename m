Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F8418C295
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 22:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgCSVvx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 17:51:53 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.196]:47276 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726785AbgCSVvx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 17:51:53 -0400
X-Greylist: delayed 1242 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 17:51:52 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 50B33673B
        for <linux-input@vger.kernel.org>; Thu, 19 Mar 2020 16:31:10 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F2kwjC5dREfyqF2kwjC8dG; Thu, 19 Mar 2020 16:31:10 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=F/X8AV0SyDOczqT5fcbbSJoYqfEhIJ1IAZBjwL9pgcc=; b=xZ37cBYcH7NR608de6Z/tTrxFC
        9rEF2KEFoWRe4sY8ca4Ezxj8d2xhcO8e1T4mrTUSIxEh7aa6i5YlsHVCEGICPcT4FD99ozldaTYvW
        6op9Wj9V9Dw7uZEsZxUSf7nnaT4sQO9JVQFlzbUkYct/i/V2ih1uwb3R5OJNaNlkqHHRQfNFy6XfH
        ygyTt1U2GZ7OD6CVq9ex5iNzdrG+4zjg/TeCBaTxWcKCd1yG/7OoaaoUlQ4x15KB5fv6ZQlsfNo26
        Lpf1iY3qtsWEYAOhC9b7Tgr2jksSQu8RpaOAqJAqAwSX2b3QqmwiQjHlzVX0ecN7uIARxzklgumVI
        gwMlRFhg==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53326 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF2ku-001dAc-O4; Thu, 19 Mar 2020 16:31:08 -0500
Date:   Thu, 19 Mar 2020 16:31:08 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] intel-ish-hid: ishtp: ishtp-dev.h: Replace zero-length
 array with flexible-array member
Message-ID: <20200319213108.GA9320@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF2ku-001dAc-O4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53326
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 24
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index 39e0e6c73adf..1cc6364aa957 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -214,7 +214,7 @@ struct ishtp_device {
 	const struct ishtp_hw_ops *ops;
 	size_t	mtu;
 	uint32_t	ishtp_msg_hdr;
-	char hw[0] __aligned(sizeof(void *));
+	char hw[] __aligned(sizeof(void *));
 };
 
 static inline unsigned long ishtp_secs_to_jiffies(unsigned long sec)
-- 
2.23.0

