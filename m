Return-Path: <linux-input+bounces-405-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4746E801F3D
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8ADDB20ADB
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060BC22313;
	Sat,  2 Dec 2023 22:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ix8Mx2D7"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A7EA4
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nf1pQbWALgDx4Av5g8ut4BqGzwX8AbMpG3tCw8R5DdE=;
	b=ix8Mx2D7xCB1eQUKX1yYQOfjItEapILxt4Gipa7ciSnt6m2rDi/hDlmJyNMZNkndTPdJ51
	4fHR3OoJwlTaX8xcBSTZ2boIMffPSHxeyb3fqX8Ma4/+0eQ+N2ijDO5bRImyNfsPPljph4
	UC1h0+doXi9nr/+jB/H4XFDaCX6LngE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-0syH7NkIMDGWip5Vc0h8zQ-1; Sat, 02 Dec 2023 17:46:31 -0500
X-MC-Unique: 0syH7NkIMDGWip5Vc0h8zQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B570980C345;
	Sat,  2 Dec 2023 22:46:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DEBF2166B26;
	Sat,  2 Dec 2023 22:46:29 +0000 (UTC)
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
Subject: [PATCH v3 7/7] HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines
Date: Sat,  2 Dec 2023 23:46:14 +0100
Message-ID: <20231202224615.24818-8-hdegoede@redhat.com>
In-Reply-To: <20231202224615.24818-1-hdegoede@redhat.com>
References: <20231202224615.24818-1-hdegoede@redhat.com>
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
index 0c1a7cd84e4c..90f316ae9819 100644
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


