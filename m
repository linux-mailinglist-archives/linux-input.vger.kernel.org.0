Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4CC31DE4C
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 18:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbhBQRem (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 12:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46810 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234503AbhBQRdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 12:33:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613583129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=I7iGIcqNfRI0azzlr/+gKDiz0a0keNB5d1rOzEe2O5U=;
        b=UgM8uZ61EmwVl6XRW+UrXq94Xm8c0LOZs+4SKS2XuXDogQ8dpuASaPg5JhJcI2PNioJU9k
        vpnIYMAO+a0ph7/UsO7P5AgKIizvQt2Rxa3GTy8rrHVy8U8tjyWYUxkvEIeMM/LCU7DBMI
        m0xGb0hgR0e+/SV4hh9m0MALtBU7PD0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-YydEuUIKN_qQsNEF0iT7yQ-1; Wed, 17 Feb 2021 12:32:06 -0500
X-MC-Unique: YydEuUIKN_qQsNEF0iT7yQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98FCC192CC40;
        Wed, 17 Feb 2021 17:32:04 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-25.ams2.redhat.com [10.36.116.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1D6060C61;
        Wed, 17 Feb 2021 17:31:59 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Cc:     linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 00/11] HID: playstation: revert LED class exposure
Date:   Wed, 17 Feb 2021 18:31:47 +0100
Message-Id: <20210217173158.3122868-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[sending those patches on behalf of Roderick]

There is a current thread on LED LKML which basically means that
we have to revert the LED class exposure until things are settled.

I am sending here the full series that will end up in linux-next.
But with some git magic, the final PR to Linus will not have the
reverts in it, just the plain patches.

I am queuing in for-5.12/playstation patches 1 to 6 immediately
(the reverts).

I am also queuing in for-5.12/playstation-v2 patches 7 and 8 on
top of 51151098d7ab8 immediately. Those 2 patches have already
been reviewed the usual process.

I am waiting 1 day for others to chime in regarding patches 9 to
11 before applying them to for-5.12/playstation-v2. They are
basically the same patches that were already reviewed on the
linux-input LKML, but without the LED class bits.

With all that, we should have more room to discuss the exposure
of the LEDs to userspace through the LED class.

Roderick, I made small adjustments compared to the series you sent
me privately:
- added the 2 missing reverts/re-add, so I can have clean merges
  for our for-next branch,
- re-ordered the `if (ds->update_rumble)` block in
  `dualsense_output_worker()` to match was was in linux-next
- removed an extra new line to match the current linux-next tree.

Cheers,
Benjamin

Benjamin Tissoires (2):
  Revert "HID: playstation: fix unused variable in
    ps_battery_get_property."
  Revert "HID: playstation: report DualSense hardware and firmware
    version."

Roderick Colenbrander (9):
  Revert "HID: playstation: DualSense set LEDs to default player id."
  Revert "HID: playstation: add DualSense player LEDs support."
  Revert "HID: playstation: add microphone mute support for DualSense."
  Revert "HID: playstation: add DualSense lightbar support"
  HID: playstation: report DualSense hardware and firmware version.
  HID: playstation: fix unused variable in ps_battery_get_property.
  HID: playstation: add initial DualSense lightbar support.
  HID: playstation: add microphone mute support for DualSense.
  HID: playstation: add DualSense player LED support.

 drivers/hid/Kconfig           |   3 -
 drivers/hid/hid-playstation.c | 177 +++-------------------------------
 2 files changed, 12 insertions(+), 168 deletions(-)

-- 
2.29.2

