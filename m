Return-Path: <linux-input+bounces-134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D67F1D58
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 20:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48B21C21672
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 19:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1BF334568;
	Mon, 20 Nov 2023 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QiPzGlNu"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BCFCA
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 11:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700508811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8vKjiCeGkYiOr7wyxCSlpN35OKc5LtFM5QUNJM2uCfs=;
	b=QiPzGlNuuxrHlf2Q3N+yyfC1TULD9VRL7d8oapGrIo5BZl8U2UA/EHPQO6j2qAPxWQv8yg
	eK0SJmXvS/NlfdKsS0otbw/ungZ+Pu+E5vFPG1tKPG/Ra0nEGTyn9in4BxQvogQGN+qYUc
	ZssRNTXyu/DP+aq8yjdAMtjbJIh+9fM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-424-w00fSB7kO_uwMUXCZkiCrg-1; Mon,
 20 Nov 2023 14:33:25 -0500
X-MC-Unique: w00fSB7kO_uwMUXCZkiCrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A89063C0FC8D;
	Mon, 20 Nov 2023 19:33:24 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 792D92166B26;
	Mon, 20 Nov 2023 19:33:22 +0000 (UTC)
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
Subject: [RFC v2 0/7] HID: i2c-hid: Rework wait for reset to match Windows
Date: Mon, 20 Nov 2023 20:33:06 +0100
Message-ID: <20231120193313.666912-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hi All,

Here is v2 of my i2c-hid series reworking how the i2c-hid-core waits
for reset to complete.

Further testing on the laptop for which I2C_HID_QUIRK_NO_IRQ_AFTER_RESET
was first introduced, shows that reading the report descriptor before
waiting for the reset helps with the missing reset IRQ, but it only helps
some of the time. About 50% of the time the reset still does not get
acked properly.

Therefor for this v2 I have dropped the patch dropping
the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks and I've demoted
this series to a RFC. It is basically ready for merging, but first
the question if this should be applied at all should be discussed:

Advantages of merging this series:

1. Reading descriptors before waiting for reset does make the reset ack IRQ
   happen some of the time, so it does seem to improve things somewhat and
   maybe it does fully fix the issue on some other models

2. This should reduce the probe time of the i2c-hid driver

Disadvantages of merging this series:

1. Non 0 chance of this causing regressions

Changes in v2:
- Drop the patch dropping the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks
- Add a patch changing a missing reset ack from an error into a warning
- Move the mutex_[un]lock(&ihid->reset_lock) calls out of
  i2c_hid_start_hwreset() / i2c_hid_finish_hwreset() and into their
  callers, as suggested by Douglas Anderson

Original v1 cover-letter:

Looking at:

"2247751 - Touchpad not working on Lenovo Thinkbook 15 Gen 5"
https://bugzilla.redhat.com/show_bug.cgi?id=2247751

I thought at first that this was another touchpad needing
a I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk, further testing
has shown this seems to be an IRQ not working issue though,
so this series does not help for that bug.

The bug has made me revisit I2C_HID_QUIRK_NO_IRQ_AFTER_RESET though and it
made me look at Microsoft's i2c-hid docs again and I noticed the following:

"""
4. Issue a RESET (Host Initiated Reset) to the Device.
5. Retrieve report descriptor from the device.

Note: Steps 4 and 5 may be done in parallel to optimize for time on I²C.
Since report descriptors are (a) static and (b) quite long, Windows 8 may
issue a request for 5 while it is waiting for a response from the device
on 4.
"""

which made me think that maybe on some touchpads the reset ack is delayed
till after the report descriptor is read ?

Testing a T-BAO Tbook Air 12.5 with a 0911:5288 (SIPODEV SP1064?) touchpad,
for which the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk was first introduced,
shows that about 1 ms after the report descriptor read finishes the reset
indeed does get acked.

So this series refactors the reset handling to move the waiting for
the ack to after reading the report-descriptor, so that
the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk is no longer necessary.

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

 drivers/hid/i2c-hid/i2c-hid-core.c | 134 +++++++++++++++--------------
 1 file changed, 70 insertions(+), 64 deletions(-)

-- 
2.41.0


