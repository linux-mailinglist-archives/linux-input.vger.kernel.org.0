Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBC9283527
	for <lists+linux-input@lfdr.de>; Mon,  5 Oct 2020 13:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbgJELtZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Oct 2020 07:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30173 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725914AbgJELtZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Oct 2020 07:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601898564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Du4EISmUtwSm1KyhYm5ulVRTTb3lTTCYB1HO95Ho+68=;
        b=L//ZIaPhfChwaoPe6JkCYX22rGGFh1NEU7Zhws5H2YuQSgnCCrsRRy9ibUI+GdYSIrDb/V
        um1XLlgWkRbhOZnVcsReCoD1NwYYuZJ3LHSiVWFfcPPDnouLKP1Z7mFojJstaymk3Jl/iq
        CmmBVxLuaej3kkZHbZef9RD+LdNDdxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-sFity-EiOAOIu2NOXEcC-Q-1; Mon, 05 Oct 2020 07:49:22 -0400
X-MC-Unique: sFity-EiOAOIu2NOXEcC-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CEC18A8223;
        Mon,  5 Oct 2020 11:49:21 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-156.ams2.redhat.com [10.36.113.156])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6694761176;
        Mon,  5 Oct 2020 11:49:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Lyude Paul <lyude@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] Input: synaptics - enable InterTouch for ThinkPad T14 Gen 1
Date:   Mon,  5 Oct 2020 13:49:19 +0200
Message-Id: <20201005114919.371592-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the new RMI4 F3A support, we're now able to enable full RMI4
support for this model.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 43a200ca68b8..82577095e175 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -186,6 +186,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2044", /* L470  */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
+	"LEN2068", /* T14 Gen 1 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
 	"SYN323d", /* HP Spectre X360 13-w013dx */
-- 
2.28.0

