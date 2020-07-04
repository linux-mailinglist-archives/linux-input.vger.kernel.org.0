Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6841921488A
	for <lists+linux-input@lfdr.de>; Sat,  4 Jul 2020 22:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgGDULM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jul 2020 16:11:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46425 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726909AbgGDULM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jul 2020 16:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1593893471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GZUWGBY079HdPtJfJ9xL8pvpmmS5DoqP85o4e4lKjMw=;
        b=LSOP6zlaHaSqbN2KBX+kEQThpiL2jx05oX+GR+UZvrVcWAe49KhhmF3eGMC6f/0W70C7UQ
        22zAcaHiLF7hZwxY4wifx1mDyjtlp55VXbSz/NHJTYQkqXZ4gV+363Q8QcNlzAUvKIrHtf
        RelIacy5EA/B4X7H8b3QFxNrlUcaovM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-WbRayBe6OkOM7zGMZnr9Bg-1; Sat, 04 Jul 2020 16:11:06 -0400
X-MC-Unique: WbRayBe6OkOM7zGMZnr9Bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03E8B107ACCA;
        Sat,  4 Jul 2020 20:11:06 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 175CB73FFE;
        Sat,  4 Jul 2020 20:11:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: lenovo: Fix spurious F23 key press report during resume from suspend
Date:   Sat,  4 Jul 2020 22:10:59 +0200
Message-Id: <20200704201059.126823-2-hdegoede@redhat.com>
In-Reply-To: <20200704201059.126823-1-hdegoede@redhat.com>
References: <20200704201059.126823-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Ultrabook Keyboard sends a spurious F23 key-press when resuming
from suspend. GNOME uses F23 to toggle the touchpad on/off so this causes
the OSD graphics for the touchpad toggle to show on resume.

The keyboard does not actually have a F23 key, se we can simple fix it
by marking the 0x00070072 HID usage, which normally is F23, to be ignored.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index b5122ee46801..c6c8e20f3e8d 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -245,6 +245,13 @@ static int lenovo_input_mapping_tp10_ultrabook_kbd(struct hid_device *hdev,
 		}
 	}
 
+	/*
+	 * The Ultrabook Keyboard sends a spurious F23 key-press when resuming
+	 * from suspend and it does not actually have a F23 key, ignore it.
+	 */
+	if (usage->hid == 0x00070072)
+		return -1;
+
 	return 0;
 }
 
-- 
2.26.2

