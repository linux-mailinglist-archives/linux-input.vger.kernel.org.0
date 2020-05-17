Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 047931D6B30
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 18:51:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgEQQvv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 12:51:51 -0400
Received: from traxus.robots.org.uk ([37.139.10.94]:56522 "EHLO
        traxus.robots.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728021AbgEQQvv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 12:51:51 -0400
X-Greylist: delayed 2780 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 May 2020 12:51:51 EDT
Received: from sam by traxus with local (Exim 4.92)
        (envelope-from <4badbd47580c65e3daf7ff5099fb72de98fc5c5e@traxus.robots.org.uk>)
        id 1jaLn7-0002Wb-V1
        for linux-input@vger.kernel.org; Sun, 17 May 2020 16:05:29 +0000
From:   Sam Morris <sam@robots.org.uk>
Date:   Sun, 17 May 2020 15:56:06 +0100
Subject: [PATCH] Use RMI/SMbus for Dynabook (Toshiba) X30/X40
To:     linux-input@vger.kernel.org
Message-Id: <E1jaLn7-0002Wb-V1@traxus>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Prevents a stream of garbage button press events from being emitted
whenever a hapless user touches the AccuPoint (pointing stick).

https://bugzilla.kernel.org/show_bug.cgi?id=205817

SynPD.inf from the Windows driver has a list of ACPI devices that may
also use InterTouch:

* ACPI\TOS0203
* ACPI\TOS0204
* ACPI\TOS0211
* ACPI\TOS0212
* ACPI\TOS0213
* ACPI\TOS0214
* ACPI\TOS1100
* ACPI\TOS110C
* ACPI\TOS110E
* ACPI\TOS1110
* ACPI\TOS1120
* ACPI\TOS1130
* ACPI\TOS1131
* ACPI\TOS1140
* ACPI\TOS1150
* ACPI\TOS1151
* ACPI\TOS1160
* ACPI\TOS1161
* ACPI\TOS1162
* ACPI\TOS2020
* ACPI\TTP1606
* ACPI\TTP1607

Signed-off-by: Sam Morris <sam@robots.org.uk>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 4d2036209b45..76812475de57 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -187,6 +187,7 @@ static const char * const smbus_pnp_ids[] = {
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
 	"SYN3257", /* HP Envy 13-ad105ng */
+	"TOS0213", /* Dynabook (Toshiba) X30, X40 */
 	NULL
 };
 
-- 
Sam Morris
<https://robots.org.uk/>
