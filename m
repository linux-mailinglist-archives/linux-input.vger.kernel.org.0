Return-Path: <linux-input+bounces-140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F318E7F1D5D
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3074A1C2183A
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 19:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718CC36AF0;
	Mon, 20 Nov 2023 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEEFWC8P"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6B68B9
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700508825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z3iOt6TF4m21HqgKip0VNs6/jW+2VNd+2q+MwQfbRg0=;
	b=jEEFWC8PaX4FfA+0ptzxCRsBkWCe98ArMSrdID01FpOXoYl/GeWQ9ahdtoip+aeXgWFq7e
	XU/64XE0xD3y6Fa7yOf2Spr82ww6XcpqqL/pD+uywTPsrj63IlZhAqwoOmIGomFBtthyw6
	+qhTvwxC0vplTP6Dz8U/KNwwtv6pS58=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-144-nwnsRGyiOdWAYz0przMNAQ-1; Mon,
 20 Nov 2023 14:33:38 -0500
X-MC-Unique: nwnsRGyiOdWAYz0przMNAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26DE43804524;
	Mon, 20 Nov 2023 19:33:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F3132166B26;
	Mon, 20 Nov 2023 19:33:36 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Julian Sax <jsbc@gmx.de>,
	ahormann@gmx.net,
	Bruno Jesus <bruno.fl.jesus@gmail.com>,
	Dietrich <enaut.w@googlemail.com>,
	kloxdami@yahoo.com,
	Tim Aldridge <taldridge@mac.com>,
	Rene Wagner <redhatbugzilla@callerid.de>,
	Federico Ricchiuto <fed.ricchiuto@gmail.com>,
	linux-input@vger.kernel.org
Subject: [RFC v2 7/7] HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines
Date: Mon, 20 Nov 2023 20:33:13 +0100
Message-ID: <20231120193313.666912-8-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-1-hdegoede@redhat.com>
References: <20231120193313.666912-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

The quirks variable and the I2C_HID_QUIRK_ defines are never used /
exported outside of the i2c-hid code renumber them to start at
BIT(0) again.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 3bdfd3e89de5..151d5a5c87ca 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -44,11 +44,11 @@
 #include "i2c-hid.h"
 
 /* quirks to control the device */
-#define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(1)
-#define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
-#define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
-#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
-#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(7)
+#define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(0)
+#define I2C_HID_QUIRK_BOGUS_IRQ			BIT(1)
+#define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(2)
+#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(3)
+#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
-- 
2.41.0


