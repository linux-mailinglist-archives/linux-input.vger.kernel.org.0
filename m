Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7911374AA2
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhEEVlA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24033 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234324AbhEEVkl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=fbd0PuMdcUzOxa5zQG9fqNd1ma0fMuLJNHV7EDpSe8I=;
        b=Uz+8uj1q+H0UeQCd7222VOy3f4Tp2G/FrmltGUFJnwbecYcp4PIXS57JIQzCjrmugMNKeO
        8WEmI6bm7ydZzLXk1MMFyHqxoNOfojMMQcorI2OSL9+sogn62JYWChNizromDayTwSQA98
        9ODJUIs7ZyxnWhrSEaV6gHzzOslDp2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-gY-37gDsNWWxeLknHgo8WA-1; Wed, 05 May 2021 17:39:42 -0400
X-MC-Unique: gY-37gDsNWWxeLknHgo8WA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E68801B12;
        Wed,  5 May 2021 21:39:41 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 22B4D5D6A8;
        Wed,  5 May 2021 21:39:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 0/6] HID: Misc. fixes
Date:   Wed,  5 May 2021 23:39:29 +0200
Message-Id: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri, Benjamin,

Here is v2 of what started out as a small series to fix spurious wakeups
on T101HA 2-in-1s.

This adds the discussed hid_is_usb_device() helper and uses that in:

"HID: multitouch: Disable event reporting on suspend when our parent is
not a wakeup-source"

To avoid needing to add a "depends on USB_HID" to hid-multitouch Kconfig
settings.

I've checked all other hid_is_using_ll_driver(hdev, &usb_hid_driver) callers
and the only one which can truely benefit from the new helper is the
hid-asus driver, which also deals with some I2C devices on some Asus hw.

All other drivers using hid_is_using_ll_driver(hdev, &usb_hid_driver)
are only for USB devices, so dropping the "depends on USB_HID" does not
make sense for them.

The one other driver which may benefit from the new hid_is_usb_device()
helper would be the Wacom driver which seems to also support I2C devices,
but that contains a lot of USB specific code, so I don't think we can
easily drop the "depends on USB_HID" there.

Even though this is a bit if a mixed-bag of patches, their are several
dependencies between them, so these should probably all go on a single
topic branch.

Regards,

Hans


Hans de Goede (6):
  HID: core: Remove extraneous empty line before
    EXPORT_SYMBOL_GPL(hid_check_keys_pressed)
  HID: core: Add a hid_is_usb_device() helper function
  HID: multitouch: Disable event reporting on suspend on the Asus T101HA
    touchpad
  HID: multitouch: Disable event reporting on suspend when our parent is
    not a wakeup-source
  HID: asus: Cleanup Asus T101HA keyboard-dock handling
  HID: asus: Switch to the new hid_is_usb_device() helper

 drivers/hid/Kconfig          |  2 +-
 drivers/hid/hid-asus.c       | 26 ++++++++-----------
 drivers/hid/hid-core.c       | 11 +++++++-
 drivers/hid/hid-multitouch.c | 49 ++++++++++++++++++++++++++++++++++--
 include/linux/hid.h          |  1 +
 5 files changed, 70 insertions(+), 19 deletions(-)

-- 
2.31.1

