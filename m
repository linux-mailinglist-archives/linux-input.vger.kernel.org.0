Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27BD373010
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 20:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhEDS6t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 14:58:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38713 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231473AbhEDS6t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 May 2021 14:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620154673;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gd2p2QV1EPtc/NkvtW/sibqV9Ys/KDYOq5RpsUFDSEA=;
        b=OzcdbXiqJrZxLBXbB1884kYeikaqQZyVGiXEUKwWc8VhqJlu2o0kOd8JUQe1/neSJAwvdz
        8yagbkjAFIW++acJBuBDJ7xfdkrl/Qu9w46IutNulqpvcMTkdOKvi0HJ2VKoETj5pjF/o/
        nJpLfQafVq7zJbYwAmjQRC3CkNzk/oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-U22rN4j4NUiTnPitmTx8zg-1; Tue, 04 May 2021 14:57:51 -0400
X-MC-Unique: U22rN4j4NUiTnPitmTx8zg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 733C3801AB6;
        Tue,  4 May 2021 18:57:50 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C7C8D5D6CF;
        Tue,  4 May 2021 18:57:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Arkadiy <arkan49@yandex.ru>,
        "Sergei A . Trusov" <sergei.a.trusov@ya.ru>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [RFC v2 0/5] Input: goodix - platform/x86: touchscreen_dmi - Move quirks to touchscreen_dmi.c
Date:   Tue,  4 May 2021 20:57:41 +0200
Message-Id: <20210504185746.175461-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Bastien,

Here v2 of the patch series to move the DMI quirks for upside-down and
x-axis-inverted touchscreens in goodix.c to the generic x86 touchscreen
mechanism found in drivers/platform/x86/touchscreen_dmi.c .

As I mentioned in my reply to the v1 RFC I've dropped the:
"platform/x86: touchscreen_dmi: Match on ACPI HID instead of ACPI companion-dev-name"
patch from this version; and for completeness sake I've added a
couple of other pending touchscreen_dmi.c patches.

Note this is still marked as RFC for now since I have been unable to confirm
the ACPI HID for the touchscreen on the Cube I15-TC which is necessary
for the touchscreen_dmi.c code. I've send an email to the reporter and
the author of the patch adding the quirk for the Cube I15-TC.

As discussed in the "[PATCH] platform/x86: touchscreen_dmi: Add swap-x-y
quirk for Goodix touchscreen on Estar Beauty HD tablet" thread, I'll
prepare an immutable branch for Dmitry to pull once this is ready
for merging.

Note if I get no reply to the questions surrounding patch 2/5,
I'll probably just drop that patch and merge the rest.

Regards,

Hans


Hans de Goede (4):
  Input: goodix - platform/x86: touchscreen_dmi - Move upside down
    quirks to touchscreen_dmi.c
  Input: goodix - platform/x86: touchscreen_dmi - Move inverted-x quirk
    to touchscreen_dmi.c
  platform/x86: touchscreen_dmi: Add an extra entry for the upside down
    Goodix touchscreen on Teclast X89 tablets
  platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of
    TM800A550L tablets

Teava Radu (1):
  platform/x86: touchscreen_dmi: Add info for the Mediacom Winpad 7.0
    W700 tablet

 drivers/input/touchscreen/goodix.c     |  74 ----------------
 drivers/platform/x86/touchscreen_dmi.c | 112 +++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 74 deletions(-)

-- 
2.31.1

