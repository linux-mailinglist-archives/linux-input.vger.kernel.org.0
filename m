Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C3527F582
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 00:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731882AbgI3WvD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 18:51:03 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:39265 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731816AbgI3WvD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 18:51:03 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cffc2817;
        Wed, 30 Sep 2020 22:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
        :subject:date:message-id:in-reply-to:references:mime-version
        :content-transfer-encoding; s=mail; bh=kOYM4L67LRr9QyZjXSzj5T+Yb
        qc=; b=j+tN/SRCVIA+xaydInczb6w/j22ecShlMmmrS8UrYppmgKHX5paXXXuBc
        vbXyGpYfH7GQ4efTwfN7tOyFWj/HuLs6O7KACzxoc5s/ywN3+0vbk0nHrqZ5Cb1t
        dOpAKN+xvWsGzLqW6IUutJrBR+jJP8oE89fAZmANkEYeQHp1hfOLfI0okaxnqnzb
        OxFK60a196zpVsRI02a9LYLdRjGM7kod0dawoDNDROcuzwsONpUWRyx5gW5RSG1I
        3JmEyABbW9UV4yCr0XCE2ICTgm5MXWHc4ZW6TIMNfaCK5zeQrjuOebzUkskr0Gg5
        XtT8IIbWMoOSkjmG2qU0aaM2yIoKA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c784ca7a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 30 Sep 2020 22:19:15 +0000 (UTC)
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3 2/2] Input: synaptics - enable InterTouch for ThinkPad P1/X1E gen 2
Date:   Thu,  1 Oct 2020 00:50:46 +0200
Message-Id: <20200930225046.173190-3-Jason@zx2c4.com>
In-Reply-To: <20200930225046.173190-1-Jason@zx2c4.com>
References: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
 <20200930225046.173190-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the new RMI4 F3A support, we're now able to enable full RMI4
support for this model. We also tidy up the comments a bit, as the X1E
is essentially the same computer as the P1.

Acked-by: Lyude Paul <lyude@redhat.com>
Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/input/mouse/synaptics.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 8a54efd6eb95..bf0f3fdf10d9 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -179,7 +179,8 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0093", /* T480 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
-	"LEN0099", /* X1 Extreme 1st */
+	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
+	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
 	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2044", /* L470  */
-- 
2.28.0

