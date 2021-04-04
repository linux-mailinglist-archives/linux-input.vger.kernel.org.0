Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAB435374B
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 10:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhDDIEp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 04:04:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42125 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229483AbhDDIEp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 04:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617523481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=pukuduU3TIawYxQHAoMTy0xbKqYzMYDKhN45m9gOUjk=;
        b=SZp1PDZ8NnVh6HE3Z4oanEiHw9LWYOupBPtvybktvFbPDBvtNcUtNRLuSaWRMx2fbi4L/w
        UDcIXdNA0w51xQWbl0wb2M+ZN+62+lZBkhvBqf7FGG7oz6OoH+U7khkUoSvDQ9svR9PsUi
        5h3tDHCy8w68ML5W0A5ig2TKQ8Gaejs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-0YjccrviOR-RXq1Yi_-SlA-1; Sun, 04 Apr 2021 04:04:39 -0400
X-MC-Unique: 0YjccrviOR-RXq1Yi_-SlA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74A6D87A82A;
        Sun,  4 Apr 2021 08:04:38 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72D38100E113;
        Sun,  4 Apr 2021 08:04:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 resend 0/9] HID: lenovo: LED fixes and Thinkpad X1 Tablet kbd support
Date:   Sun,  4 Apr 2021 10:04:23 +0200
Message-Id: <20210404080432.4322-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

This seems to have fallen through the cracks, again (IIRC this is the
second resend) can you please pick this series up?

Patches 1 - 7 have:
Reviewed-by: Marek Behún <kabel@kernel.org>

Patches 1, 4, 5, 7 have:
Acked-by: Pavel Machek <pavel@ucw.cz>

With the ack from Pavel (the LED subsys maintainer) indicating that
there are no problems with the LED classdev API usage in these patches.

Patches 8 - 9 are new in v2 of this series, these add support for the
Thinkpad X1 Tablet Thin keyboard. They have been tested by me on a
Thinkpad 10 ultra keyboard dock (so that that does not regress) and
by Alexander Kobel on a Thinkpad X1 Tablet Thin keyboard.

Regards,

Hans


Hans de Goede (9):
  HID: lenovo: Use brightness_set_blocking callback for setting LEDs
    brightness
  HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
  HID: lenovo: Check hid_get_drvdata() returns non NULL in
    lenovo_event()
  HID: lenovo: Remove lenovo_led_brightness_get()
  HID: lenovo: Set LEDs max_brightness value
  HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
  HID: lenovo: Set default_triggers for the mute and micmute LEDs
  HID: lenovo: Rework how the tp10ubkbd code decides which USB interface
    to use
  HID: lenovo: Add support for Thinkpad X1 Tablet Thin keyboard

 drivers/hid/hid-lenovo.c | 147 ++++++++++++++++++++++++++++++---------
 1 file changed, 114 insertions(+), 33 deletions(-)

-- 
2.30.2

