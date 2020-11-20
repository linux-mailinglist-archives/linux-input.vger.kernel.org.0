Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E993C2BB323
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 19:37:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729878AbgKTS35 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Nov 2020 13:29:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:49772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729572AbgKTS35 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Nov 2020 13:29:57 -0500
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11B7D2224C;
        Fri, 20 Nov 2020 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605896996;
        bh=LI5dppKYFXmpET3UXCEMVT3nMwGAHMo4iLh6NaayELQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MRrWysqlNGFWo+ioOVoiGfwruEpZ/BVjc9yIYhIk3Bsu9GKQc7gO+0OQyk0XJvBF7
         2OOPDT1eD8ShEhzw8iiKH4saLMMu5WtqAClKALCcC7UKO9+j1zBHzB895zPRQ5MSdQ
         467Pyh5f39dB4KkQLm5VlXXbEf6t0KTf2BFy6Tws=
Date:   Fri, 20 Nov 2020 12:30:02 -0600
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 037/141] Input: pcspkr - Fix fall-through warnings for Clang
Message-ID: <4b659e3e65f2fa3c8bb7ed153e2016c3fb395bbc.1605896059.git.gustavoars@kernel.org>
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
by explicitly adding a break statement instead of just letting the code
fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/input/misc/pcspkr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/misc/pcspkr.c b/drivers/input/misc/pcspkr.c
index e5e0d8ba80e1..9c666b2f14fe 100644
--- a/drivers/input/misc/pcspkr.c
+++ b/drivers/input/misc/pcspkr.c
@@ -33,6 +33,7 @@ static int pcspkr_event(struct input_dev *dev, unsigned int type,
 	case SND_BELL:
 		if (value)
 			value = 1000;
+		break;
 	case SND_TONE:
 		break;
 	default:
-- 
2.27.0

