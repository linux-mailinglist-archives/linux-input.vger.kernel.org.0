Return-Path: <linux-input+bounces-399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C879801F36
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 23:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB641C208E3
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 22:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1347321352;
	Sat,  2 Dec 2023 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzIfYbRx"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9227D116
	for <linux-input@vger.kernel.org>; Sat,  2 Dec 2023 14:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701557182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vFNE/UYCosX/dFguXm9sfoEAqaOtTWkpGicbd3olGYw=;
	b=gzIfYbRxPPQaO8LcAvWWD6Exm1BjmMJeEe2g9b9vYEzWpTtQLNayqI/2w1uGnID5kRIvvQ
	CiEXe3LX+y1JwzN4UxX8YEaC9R+FAmT/GmZND/qWEuBCbZ5XvxoEyTRzTqJQRKbfWuQ+bS
	qv6yF2+tfiwqxU5X91331CnrnoZ6NOY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-ZOaiE4DPOMuPQtpS5sAVaw-1; Sat, 02 Dec 2023 17:46:18 -0500
X-MC-Unique: ZOaiE4DPOMuPQtpS5sAVaw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D18DE803C92;
	Sat,  2 Dec 2023 22:46:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.20])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA2C42166B26;
	Sat,  2 Dec 2023 22:46:15 +0000 (UTC)
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
Subject: [PATCH v3 0/7] HID: i2c-hid: Rework wait for reset to match Windows
Date: Sat,  2 Dec 2023 23:46:07 +0100
Message-ID: <20231202224615.24818-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Here is v3 of my i2c-hid series reworking how the i2c-hid-core waits
for reset to complete.

Further testing on the laptop for which I2C_HID_QUIRK_NO_IRQ_AFTER_RESET
was first introduced, shows that reading the report descriptor before
waiting for the reset helps with the missing reset IRQ, but it only helps
some of the time. About 50% of the time the reset still does not get
acked properly.

Still I believe that it would be good to move forward with
this series:

1. Reading descriptors before waiting for reset does make the reset ack IRQ
   happen some of the time, so it does seem to improve things somewhat and
   maybe it does fully fix the issue on some other models

2. This series should reduce the probe time of the i2c-hid driver

Changes in v3:
- Use "else if" to only wait for reset timeout when
  the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk is not set
- Use goto abort_reset instead of return on i2c_hid_start_hwreset()
  failure, so that the mutex gets properly unlocked

Changes in v2:
- Drop the patch dropping the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks
- Add a patch changing a missing reset ack from an error into a warning
- Move the mutex_[un]lock(&ihid->reset_lock) calls out of
  i2c_hid_start_hwreset() / i2c_hid_finish_hwreset() and into their
  callers, as suggested by Douglas Anderson

Regards,

Hans


Hans de Goede (7):
  HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
  HID: i2c-hid: Split i2c_hid_hwreset() in start() and finish()
    functions
  HID: i2c-hid: Switch i2c_hid_parse() to goto style error handling
  HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the
    report-descriptor
  HID: i2c-hid: Turn missing reset ack into a warning
  HID: i2c-hid: Remove I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
  HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines

 drivers/hid/i2c-hid/i2c-hid-core.c | 137 +++++++++++++++--------------
 1 file changed, 70 insertions(+), 67 deletions(-)

-- 
2.41.0


