Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9689432053D
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhBTM0N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53266 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229476AbhBTM0N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=3XGW2IdbfK0+RXlIsNYf734DWnS6Nq0t/VLqZqK7arc=;
        b=b8PvDD+gDHdO/odp8LLKS16Go5FmLfvCCKMIefzDZYr2E2FWOUuYI8co1tXkQCxideIv2j
        JB8ot2zO2etm/xOqIrRHQMjNbR2S0OpdQT8jIqso8yMK0LBrmA4LM59bbP1qV5kKNlPWvm
        zaf6ktKmi6KiRCuAGOUW/8N5X28TRMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-TwRzw7quOmWl46LkpQPKNQ-1; Sat, 20 Feb 2021 07:24:44 -0500
X-MC-Unique: TwRzw7quOmWl46LkpQPKNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 694E8107ACC7;
        Sat, 20 Feb 2021 12:24:43 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 79B1910016FF;
        Sat, 20 Feb 2021 12:24:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 0/7] HID: lenovo: Mute LED handling fixes and improvements
Date:   Sat, 20 Feb 2021 13:24:31 +0100
Message-Id: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is v2 of my series with mute LED handling fixes and improvements
for the hid-lenovo driver.

This time I've added the LED folks to the Cc in case they have any input,
but there is nothing controversial in here wrt use of the LED API.

The following patches were changed or are new in version 2 of the
series, see the individual patches for detaisl:

[PATCH v2 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
[PATCH v2 4/7] HID: lenovo: Remove lenovo_led_brightness_get()
[PATCH v2 5/7] HID: lenovo: Set LEDs max_brightness value

Regards,

Hans


Hans de Goede (7):
  HID: lenovo: Use brightness_set_blocking callback for setting LEDs
    brightness
  HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
  HID: lenovo: Check hid_get_drvdata() returns non NULL in
    lenovo_event()
  HID: lenovo: Remove lenovo_led_brightness_get()
  HID: lenovo: Set LEDs max_brightness value
  HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
  HID: lenovo: Set default_trigger-s for the mute and micmute LEDs

 drivers/hid/hid-lenovo.c | 61 ++++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 30 deletions(-)

-- 
2.30.1

