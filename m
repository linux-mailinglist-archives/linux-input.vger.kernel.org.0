Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB1243E627
	for <lists+linux-input@lfdr.de>; Thu, 28 Oct 2021 18:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhJ1QgT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 12:36:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37516 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229565AbhJ1QgS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 12:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635438831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=XFVZJxe+aV/zomQ2R+JTMFzVsFHOwPHGNT354iO6BJU=;
        b=f13zqZD0ABbNdJXpGnDDis7CnB8aYpYO9d+sDTc/VaHz7236kEcBrV9nK0kcJGxTEzONaL
        9EkHdnTBuEkgaZoGEVNvLSCgCbFCQmQh3oIW3xWErOat5xYAXkcblsK3Zs2MuBhxqssW8j
        UMujtvZQwyYoE4vqmqWXC7ZVXyvtDy4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-7u2xvKqaNTuODEO0FJfhtQ-1; Thu, 28 Oct 2021 12:33:50 -0400
X-MC-Unique: 7u2xvKqaNTuODEO0FJfhtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 422989F949;
        Thu, 28 Oct 2021 16:33:48 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD38A60BF1;
        Thu, 28 Oct 2021 16:33:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Benjamin Tissoires <btissoir@redhat.com>
Subject: [PATCH] HID: input: Fix parsing of HID_CP_CONSUMER_CONTROL fields
Date:   Thu, 28 Oct 2021 18:33:30 +0200
Message-Id: <20211028163330.503146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix parsing of HID_CP_CONSUMER_CONTROL fields which are not in
the HID_CP_PROGRAMMABLEBUTTONS collection.

Fixes: bcfa8d14570d ("HID: input: Add support for Programmable Buttons")
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2018096
Cc: Thomas Weißschuh <linux@weissschuh.net>
Suggested-by: Benjamin Tissoires <btissoir@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-input.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4b5ebeacd283..4b3f4a5e2305 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -650,10 +650,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 						code += KEY_MACRO1;
 					else
 						code += BTN_TRIGGER_HAPPY - 0x1e;
-				} else {
-					goto ignore;
+					break;
 				}
-				break;
+				fallthrough;
 		default:
 			switch (field->physical) {
 			case HID_GD_MOUSE:
-- 
2.31.1

