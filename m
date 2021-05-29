Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F79F394CAC
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbhE2PQO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47738 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229800AbhE2PQO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622301277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E6z2KQCwXUL7cBDRQvr6zbE2G+6RgL/BGKju6hE72/M=;
        b=N9aZRWDfQCgQyF4zruvWEFovYGZyCgVXfX4p4uQXv0wO8JqRHp7d9BgmkUTvk4zC16X8nj
        Si+Kjacz+5kg2xHLU7XXeRWPHR5OBhCOCIlECHKllQx9T3mUzpIkjhgyyguEWFJ3P3AGL7
        cg7gWpB3o1ycLpyHOC1GFjOSmpn5NO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-XP-5NVgGNNGc1lsJtZ2u2Q-1; Sat, 29 May 2021 11:14:36 -0400
X-MC-Unique: XP-5NVgGNNGc1lsJtZ2u2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06551800FF0;
        Sat, 29 May 2021 15:14:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1A6631002F12;
        Sat, 29 May 2021 15:14:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 4/4] HID: multitouch: Disable event reporting on suspend when the device is not a wakeup-source
Date:   Sat, 29 May 2021 17:14:24 +0200
Message-Id: <20210529151424.12212-5-hdegoede@redhat.com>
In-Reply-To: <20210529151424.12212-1-hdegoede@redhat.com>
References: <20210529151424.12212-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Disable event reporting on suspend when the hid device is not
a wakeup-source. This should help save some extra power in this case.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-multitouch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index cfb68e443ddd..c5a7523f97ac 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1764,7 +1764,8 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	struct mt_device *td = hid_get_drvdata(hdev);
 
 	/* High latency is desirable for power savings during S3/S0ix */
-	if (td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP)
+	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
+	    !hid_hw_may_wakeup(hdev))
 		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
 	else
 		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
-- 
2.31.1

