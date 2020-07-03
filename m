Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896AE213BE1
	for <lists+linux-input@lfdr.de>; Fri,  3 Jul 2020 16:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgGCOfK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jul 2020 10:35:10 -0400
Received: from forward105o.mail.yandex.net ([37.140.190.183]:46066 "EHLO
        forward105o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726148AbgGCOfK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 3 Jul 2020 10:35:10 -0400
Received: from forward100q.mail.yandex.net (forward100q.mail.yandex.net [IPv6:2a02:6b8:c0e:4b:0:640:4012:bb97])
        by forward105o.mail.yandex.net (Yandex) with ESMTP id 8B9774200493;
        Fri,  3 Jul 2020 17:35:02 +0300 (MSK)
Received: from mxback6q.mail.yandex.net (mxback6q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:9de5:975f])
        by forward100q.mail.yandex.net (Yandex) with ESMTP id 866EF7080004;
        Fri,  3 Jul 2020 17:35:02 +0300 (MSK)
Received: from vla4-a16f3368381d.qloud-c.yandex.net (vla4-a16f3368381d.qloud-c.yandex.net [2a02:6b8:c17:d85:0:640:a16f:3368])
        by mxback6q.mail.yandex.net (mxback/Yandex) with ESMTP id E269mwZcaK-Z1o0TsiZ;
        Fri, 03 Jul 2020 17:35:02 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail; t=1593786902;
        bh=3iIKvw2ppjCYbURmdtj5btpA2K4wROtQeBCxp2WzzO0=;
        h=Subject:To:From:Cc:Date:Message-Id;
        b=d2mK9UmmoWpov3A53LirjWxLCgXRAbIgS43FuENcNE1saBvTlxyOKxmhLsVBbhwEy
         tswEJG2T8X1YBcMsDfN+isum+6IkdcF2hGiUUQyqWTT2Sj2ZtJu0geuTj+XRjE2PKP
         wLXQJC94o4EGU4RrCgmF3AR0vU4lixUfRG/I58ak=
Authentication-Results: mxback6q.mail.yandex.net; dkim=pass header.i=@0upti.me
Received: by vla4-a16f3368381d.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id talXmZQtkQ-Z0lS1w8t;
        Fri, 03 Jul 2020 17:35:01 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   K900 <me@0upti.me>
Cc:     Ilya Katsnelson <me@0upti.me>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Yussuf Khalil <dev@pp3345.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dennis Kadioglu <denk@eclipso.email>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Joe Perches <joe@perches.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] input/synaptics: enable InterTouch for ThinkPad X1E 1st gen
Date:   Fri,  3 Jul 2020 17:34:55 +0300
Message-Id: <20200703143457.132373-1-me@0upti.me>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Ilya Katsnelson <me@0upti.me>

Tested on my own laptop, touchpad feels slightly more responsive with
this on, though it might just be placebo.

Signed-off-by: Ilya Katsnelson <me@0upti.me>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 758dae8d6500..4b81b2d0fe06 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -179,6 +179,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0093", /* T480 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
+	"LEN0099", /* X1 Extreme 1st */
 	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2044", /* L470  */
-- 
2.27.0

