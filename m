Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78F0232DA49
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233617AbhCDTXb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38057 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234959AbhCDTXJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885703;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=CfnD2ylgJnxRwMrEfLlEe7B78UngIbG/2vXpyXE07fg=;
        b=CRp+y5muUnqAUKAfUykJ61O5ocu2Z7nY2vDM13RQK73Bi5baf+A2ShZQOE+vOixpn1i9AI
        cff7S7qjcUa5HeiliIzTVR0pIWGPy58LBVfHREcD/WmsZUCGqxhnKlg03DRs5xbCoiJ53z
        iTo2jxh+ZsDemkMu+l+Eyc9Dv67v9vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-g3XzUap4PzmisKXZsjgeKQ-1; Thu, 04 Mar 2021 14:21:42 -0500
X-MC-Unique: g3XzUap4PzmisKXZsjgeKQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBB51801814;
        Thu,  4 Mar 2021 19:21:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0D2902BFEB;
        Thu,  4 Mar 2021 19:21:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v4 0/9] HID: lenovo: Mute LED handling fixes and improvements
Date:   Thu,  4 Mar 2021 20:21:25 +0100
Message-Id: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is v4 of my series with mute LED handling fixes and improvements
for the hid-lenovo driver.

This is the same as v3, with 2 new patches added. I'm sending this out as
a v4 because the 2 new patches depend on the previous patches.

Changes in v4:
- Add 2 new patches to add support for the mute-LEDs and special media-keys
  on the Thinkpad X1 Tablet Thin Keyboard

Changes in v3:
- Address the review-remarks from Marek Behún, thank you for all the
  reviews Marek.

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
2.30.1

