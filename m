Return-Path: <linux-input+bounces-139-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8447F1D5E
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:33:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73F26B21783
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 19:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BF736B0F;
	Mon, 20 Nov 2023 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N0IaKzgd"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80F1EBE
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700508819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=voKyqWkyp0rz2JqD3MUoNJ5G5TxTXtw3i2Qc85nEu2w=;
	b=N0IaKzgdB08aJ4axZ6p/1fUczRqTFN5egROsCvRvmr1H9u+YQ/zieE7fEZMT/6z0ndZifi
	c9tCcY8o8lZqI5Dr92ET37MBJi9VufumsmK65bB7BDKZdoqmkGCOYhVQBz1SLNTUO232lp
	loKVwn1vw8n2jbo4BwCN1JYEAETimNU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-h80J3V1vM7qo2o7RWzMPHQ-1; Mon,
 20 Nov 2023 14:33:36 -0500
X-MC-Unique: h80J3V1vM7qo2o7RWzMPHQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D54E1C0755C;
	Mon, 20 Nov 2023 19:33:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7742166B27;
	Mon, 20 Nov 2023 19:33:34 +0000 (UTC)
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
Subject: [RFC v2 6/7] HID: i2c-hid: Remove I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
Date: Mon, 20 Nov 2023 20:33:12 +0100
Message-ID: <20231120193313.666912-7-hdegoede@redhat.com>
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

Re-trying the power-on command on failure on all devices should
not be a problem, drop the I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
and simply retry power-on on all devices.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 96fb5aafc1fa..3bdfd3e89de5 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -44,7 +44,6 @@
 #include "i2c-hid.h"
 
 /* quirks to control the device */
-#define I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV	BIT(0)
 #define I2C_HID_QUIRK_NO_IRQ_AFTER_RESET	BIT(1)
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
@@ -120,8 +119,6 @@ static const struct i2c_hid_quirks {
 	__u16 idProduct;
 	__u32 quirks;
 } i2c_hid_quirks[] = {
-	{ USB_VENDOR_ID_WEIDA, HID_ANY_ID,
-		I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV },
 	{ I2C_VENDOR_ID_HANTICK, I2C_PRODUCT_ID_HANTICK_5288,
 		I2C_HID_QUIRK_NO_IRQ_AFTER_RESET },
 	{ I2C_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_VOYO_WINPAD_A15,
@@ -395,8 +392,7 @@ static int i2c_hid_set_power(struct i2c_hid *ihid, int power_state)
 	 * The call will get a return value (EREMOTEIO) but device will be
 	 * triggered and activated. After that, it goes like a normal device.
 	 */
-	if (power_state == I2C_HID_PWR_ON &&
-	    ihid->quirks & I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV) {
+	if (power_state == I2C_HID_PWR_ON) {
 		ret = i2c_hid_set_power_command(ihid, I2C_HID_PWR_ON);
 
 		/* Device was already activated */
-- 
2.41.0


