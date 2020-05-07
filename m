Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3B31C8626
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 11:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgEGJxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 05:53:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33375 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725893AbgEGJxo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 May 2020 05:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588845223;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZnCANNtvRmIO0rCPc0iQgMmAvy5uNOHNsxyQ9QU3C08=;
        b=c1MpC2knMH6DPWZlgw4zY6eIxRq1InlCq7AvoCZezDWJ8Eazt6BokgN9BtScuQeCx2WI/x
        mrWqbg0XOXMhnehDTdSp2qyoSADwpmzALY/pWqdCjS+ECkspwjZKQOIfWPupRcE6ghVEjy
        /40DHchwCl6gzL6xXYbMQFU387McQO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-oCxOTnc8OTSesQ2UCW2oSw-1; Thu, 07 May 2020 05:53:41 -0400
X-MC-Unique: oCxOTnc8OTSesQ2UCW2oSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFA19107ACF7;
        Thu,  7 May 2020 09:53:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-120.ams2.redhat.com [10.36.115.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5B6695D9C5;
        Thu,  7 May 2020 09:53:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] HID: asus: Add depends on USB_HID to HID_ASUS Kconfig option
Date:   Thu,  7 May 2020 11:53:34 +0200
Message-Id: <20200507095334.11645-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since commit 4bc43a421218 ("HID: asus: Add
hid_is_using_ll_driver(usb_hid_driver) check") the hid-asus.c depends
on the usb_hid_driver symbol. Add a depends on USB_HID to Kconfig to
fix missing symbols errors in hid-asus when USB_HID is not enabled.

Fixes: 4bc43a421218 ("HID: asus: Add hid_is_using_ll_driver(usb_hid_drive=
r) check")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 7c89edbd6c5a..9e54dd254613 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -149,6 +149,7 @@ config HID_APPLEIR
=20
 config HID_ASUS
 	tristate "Asus"
+	depends on USB_HID
 	depends on LEDS_CLASS
 	depends on ASUS_WMI || ASUS_WMI=3Dn
 	select POWER_SUPPLY
--=20
2.26.0

