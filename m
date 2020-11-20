Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102542BB35D
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 19:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730767AbgKTSdT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 13:33:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:52280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729614AbgKTSdT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 13:33:19 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E25C92245F;
        Fri, 20 Nov 2020 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897198;
        bh=P3EZLYd0QhQJLDXAcdrw4whSi+kprBrLz9RB8uOFe54=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I62Mp7FkEJMKc+XwJDG4kcAJ1X9CUA7f7ibpvH+1R20qAGNSvITKU5KYVJQKdr2SM
         PrUkweh2y+sgBZhGgR1LziQ51WB2pBQJGVteAwoM9j0SKb3SvUMZ5AfGH1F0CQ66bm
         bC1BkPQL6IMfZw8Xzegv38gBrPNcjsH6vuXrHzuM=
Date:   Fri, 20 Nov 2020 12:33:24 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 062/141] HID: usbhid: Fix fall-through warnings for Clang
Message-ID: <2ca011901b6a1313f71f3a3775078224c941a908.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
of warnings by explicitly adding a couple of break statements instead
of letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/hid/usbhid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 17a29ee0ac6c..86257ce6d619 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -438,6 +438,7 @@ static void hid_irq_out(struct urb *urb)
 		break;
 	case -ESHUTDOWN:	/* unplug */
 		unplug = 1;
+		break;
 	case -EILSEQ:		/* protocol error or unplug */
 	case -EPROTO:		/* protocol error or unplug */
 	case -ECONNRESET:	/* unlink */
@@ -489,6 +490,7 @@ static void hid_ctrl(struct urb *urb)
 		break;
 	case -ESHUTDOWN:	/* unplug */
 		unplug = 1;
+		break;
 	case -EILSEQ:		/* protocol error or unplug */
 	case -EPROTO:		/* protocol error or unplug */
 	case -ECONNRESET:	/* unlink */
-- 
2.27.0

