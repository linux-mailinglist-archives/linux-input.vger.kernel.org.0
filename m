Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4F67E0F04
	for <lists+linux-input@lfdr.de>; Sat,  4 Nov 2023 12:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231958AbjKDLSk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Nov 2023 07:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjKDLSj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Nov 2023 07:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6384D1BF
        for <linux-input@vger.kernel.org>; Sat,  4 Nov 2023 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699096670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=aNrJLcFevb4M5p6qOPU82B1rBtjup87bnZrUYmo2Kc0=;
        b=EhDH+7pZnq3NDuif70FrQsXQEdTghqxUbQ25kUsLkgmW2uHKXKsP04ToGsbtJJWngm/5an
        GANcO+gXsrUUsbzU6Ano3rZ0DMeZ2LyCo1zyIiKD9BFJHfbKn1Wr1xZC5bcUcnp8eFyoYI
        EYqPZ8SzxfJA3xFod5V/iqP94gCZfL8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-NzgKcIrbNdWzqs9O4sgyCQ-1; Sat, 04 Nov 2023 07:17:46 -0400
X-MC-Unique: NzgKcIrbNdWzqs9O4sgyCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E21285A58A;
        Sat,  4 Nov 2023 11:17:46 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21F75502E;
        Sat,  4 Nov 2023 11:17:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Julian Sax <jsbc@gmx.de>, ahormann@gmx.net,
        Bruno Jesus <bruno.fl.jesus@gmail.com>,
        Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com,
        Tim Aldridge <taldridge@mac.com>,
        Rene Wagner <redhatbugzilla@callerid.de>,
        Federico Ricchiuto <fed.ricchiuto@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/7] HID: i2c-hid: Rework wait for reset to match Windows
Date:   Sat,  4 Nov 2023 12:17:36 +0100
Message-ID: <20231104111743.14668-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

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

Julian, I've added you to the Cc because you developed the code
for touchpads where the HID report descriptors are missing and are
provided by the kernel through a DMI quirk. The behavior for these
touchpads should be unchanged, but if you can test on a laptop
with such a touchpad that would be great.

Regards,

Hans


Hans de Goede (7):
  HID: i2c-hid: Fold i2c_hid_execute_reset() into i2c_hid_hwreset()
  HID: i2c-hid: Split i2c_hid_hwreset() in start() and finish()
    functions
  HID: i2c-hid: Switch i2c_hid_parse() to goto style error handling
  HID: i2c-hid: Move i2c_hid_finish_hwreset() to after reading the
    report-descriptor
  HID: i2c-hid: Remove I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks
  HID: i2c-hid: Remove I2C_HID_QUIRK_SET_PWR_WAKEUP_DEV quirk
  HID: i2c-hid: Renumber I2C_HID_QUIRK_ defines

 drivers/hid/i2c-hid/i2c-hid-core.c | 155 +++++++++++++++--------------
 1 file changed, 79 insertions(+), 76 deletions(-)

-- 
2.41.0

