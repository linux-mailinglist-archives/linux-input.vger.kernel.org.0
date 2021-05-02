Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB20370B04
	for <lists+linux-input@lfdr.de>; Sun,  2 May 2021 12:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhEBKKr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 May 2021 06:10:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23854 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230322AbhEBKKr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 May 2021 06:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619950195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1/ADmldQr1R8zhRLqQ7W2xL7DpdwCZaaSkQyPcvdm+Q=;
        b=PauzAsA/AjQG48ujVVstQYb2TzVqtsm47ANP/duBxm6sJyjZBDT2XTS2dSuW8JUsDRJUEW
        8l691za7/w+UXzL0gd6qI4WARb6rOwtXR10mEw10IIxhUA2jxC/35RWRM4cQHqpwPmQKPH
        MP+lxKheIO9NIqDR724gVavZrHKy1xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-96kHLDn0Nm6okGx6qfnBIQ-1; Sun, 02 May 2021 06:09:54 -0400
X-MC-Unique: 96kHLDn0Nm6okGx6qfnBIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286B6107ACC7;
        Sun,  2 May 2021 10:09:52 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-34.ams2.redhat.com [10.36.112.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F246F19714;
        Sun,  2 May 2021 10:09:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC 0/4] Input: goodix - platform/x86: touchscreen_dmi - Move quirks to touchscreen_dmi.c
Date:   Sun,  2 May 2021 12:09:45 +0200
Message-Id: <20210502100949.5371-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Bastien,

As discussed before here is a patch series which moves the
DMI quirks for upside-down and x-axis-inverted touchscreens in goodix.c
to the generic x86 touchscreen mechanism found in
drivers/platform/x86/touchscreen_dmi.c .

Note this is marked as RFC for now since I have been unable to confirm
the ACPI HID for the touchscreen on the Cube I15-TC which is necessary
for the touchscreen_dmi.c code. I've send an email to the reporter and
the author of the patch adding the quirk for the Cube I15-TC.

Since this patch touches files in both the Input and pdx86 subsystems
we need to discuss how to merge this. Dmitry I can create an immutable
branch which these 4 patches on top of 5.13-rc1 (once released) and
then send you a pull-req for that im-branch, would that work for you ?

Regards,

Hans


Hans de Goede (4):
  platform/x86: touchscreen_dmi: Match on ACPI HID instead of ACPI
    companion-dev-name
  Input: goodix - platform/x86: touchscreen_dmi - Move upside down
    quirks to touchscreen_dmi.c
  Input: goodix - platform/x86: touchscreen_dmi - Move inverted-x quirk
    to touchscreen_dmi.c
  platform/x86: touchscreen_dmi: Add an extra entry for the upside down
    Goodix touchscreen on Teclast X89 tablets

 drivers/input/touchscreen/goodix.c     |  74 ----------
 drivers/platform/x86/touchscreen_dmi.c | 184 ++++++++++++++++++-------
 2 files changed, 131 insertions(+), 127 deletions(-)

-- 
2.31.1

