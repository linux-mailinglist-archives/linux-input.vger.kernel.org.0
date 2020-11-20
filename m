Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640732BB360
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 19:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730262AbgKTSd1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 13:33:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:52318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729888AbgKTSdY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 13:33:24 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21E5124073;
        Fri, 20 Nov 2020 18:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897203;
        bh=e72PuMwxdWFBb+ePZEwFWflLpDULnVUr1ZlSKiuGqbQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dcsKJOZVTV2vAi/dDaVWmUtketBuJQpNWOHwTzbUgmRzFcEKX2aKv8CgVOFc5IM9v
         aZppYaMdx7DLt6e+e5HYT9r1pGgFnfHqBuJwVaWxOi1eCnpZoOuy4ZazietmbLQjjn
         3kRK8sEruA7TYWzlRb5TI+Ut+NO9ooIa/bxqcSKA=
Date:   Fri, 20 Nov 2020 12:33:29 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 063/141] HID: input: Fix fall-through warnings for Clang
Message-ID: <18a24381b4461ec8174211c78eac549808b15e6f.1605896059.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a goto statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/hid/hid-input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9770db624bfa..37601b800a2e 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -743,6 +743,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 				field->flags |= HID_MAIN_ITEM_RELATIVE;
 				break;
 			}
+			goto unknown;
 
 		default: goto unknown;
 		}
-- 
2.27.0

