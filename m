Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F252654C5
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2019 12:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbfGKKyn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 06:54:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55466 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbfGKKyn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 06:54:43 -0400
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hlWim-00084h-Pq; Thu, 11 Jul 2019 10:54:41 +0000
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
To:     dmitry.torokhov@gmail.com
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH] Input: synaptics - enable RMI on ThinkPad T580
Date:   Thu, 11 Jul 2019 18:54:36 +0800
Message-Id: <20190711105436.6290-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Like the ThinkPad T560 case, now we can use RMI on T580 to have a more
responsive touchpad.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b8ec301025b7..eb3f642967ab 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -175,6 +175,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0092", /* X1 Carbon 6 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
+	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
-- 
2.17.1

