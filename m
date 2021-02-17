Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B20031DE59
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbhBQRfZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:35:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48035 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234511AbhBQRdk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L/SLrY6Dr+of38vaWIpXiDXossh0WQU+rKd8tehKfFM=;
        b=RAARGXzSO7UZKFYb9LliAWd5fAjbFq2I1r7Ca8C2fE7O485VM7Amb46oygLuT8eo2TVNgJ
        OMSx1OAyFKguMb6JCuKaaIkOQC07I3VjUMu7lFG7f3GSViHI4b9I7ap4aAXGOOYhz3vnX9
        GVYHh2VD30j0UjBs3Tv+0F1L65pzqBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-Hx6TvH97OWiz_Mz-iszgTg-1; Wed, 17 Feb 2021 12:32:09 -0500
X-MC-Unique: Hx6TvH97OWiz_Mz-iszgTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CF23192CC55;
        Wed, 17 Feb 2021 17:32:06 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ED2DA60C61;
        Wed, 17 Feb 2021 17:32:04 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 01/11] Revert "HID: playstation: fix unused variable in ps_battery_get_property."
Date:   Wed, 17 Feb 2021 18:31:48 +0100
Message-Id: <20210217173158.3122868-2-benjamin.tissoires@redhat.com>
In-Reply-To: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
References: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This reverts commit 3847d15b41ce ("HID: playstation: fix unused variable
in ps_battery_get_property.")

There is currently an ongoing discussion on linux-leds LKML,
and so to give us more room, we need to revert those related
LEDs patches from linux-next.

To have a cleaner merge with the new version, we also revert
all patches on top of the LED ones.

This is not a big deal, they are still not pushed to Linus.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/hid-playstation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 408b651174cf..cc93c16cc822 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -391,7 +391,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 	uint8_t battery_capacity;
 	int battery_status;
 	unsigned long flags;
-	int ret = 0;
+	int ret;
 
 	spin_lock_irqsave(&dev->lock, flags);
 	battery_capacity = dev->battery_capacity;
@@ -416,7 +416,7 @@ static int ps_battery_get_property(struct power_supply *psy,
 		break;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ps_device_register_battery(struct ps_device *dev)
-- 
2.29.2

