Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57902394CA9
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 17:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbhE2PQK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 11:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20071 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229800AbhE2PQJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 11:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622301273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Yf5nysNhFoEupXvoZhYnqKtwHuep9F/LjEf29zSR9lg=;
        b=TEY/ex5Sk4d2exol15+9WvnINx7kVk23f6IG2KcbmCeU0Wb/cEGHOH24N4sYqYC6wVGf5y
        VgeXOa05s1FhmGZyEJtHFDhIAgwTO2iMgj0hdYRNbHyE8bVUaOWR6WPGiRJxXTyU8hg/aN
        yWRqRteG5Fvve3SWZIYIAMZN87QzDy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-PnwIFXRYOQeh36ZO3NjBGA-1; Sat, 29 May 2021 11:14:31 -0400
X-MC-Unique: PnwIFXRYOQeh36ZO3NjBGA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AA54501E3;
        Sat, 29 May 2021 15:14:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 956E01002F12;
        Sat, 29 May 2021 15:14:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/4] HID: multitouch: Disable event reporting on suspend when the device is not a wakeup-source
Date:   Sat, 29 May 2021 17:14:20 +0200
Message-Id: <20210529151424.12212-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri, Benjamin,

As discussed here is a complete rewrite of my serious to have
hid-multitouch disable touch and button-press reporting on hid-mt
devices during suspend when the device is not configured as
a wakeup-source.

Regards,

Hans

Hans de Goede (4):
  HID: core: Add hid_hw_may_wakeup() function
  HID: usbhid: Implement may_wakeup ll-driver callback
  HID: logitech-dj: Implement may_wakeup ll-driver callback
  HID: multitouch: Disable event reporting on suspend when the device is
    not a wakeup-source

 drivers/hid/hid-logitech-dj.c |  8 ++++++++
 drivers/hid/hid-multitouch.c  |  3 ++-
 drivers/hid/usbhid/hid-core.c |  8 ++++++++
 include/linux/hid.h           | 18 ++++++++++++++++++
 4 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.31.1

