Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E68AB3A5798
	for <lists+linux-input@lfdr.de>; Sun, 13 Jun 2021 12:22:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhFMKYE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Jun 2021 06:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40118 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231576AbhFMKYE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Jun 2021 06:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623579723;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=o9lcE/XmXhGtTzFmIWHJqmEgqiHNxEXSfB8bKEd80pk=;
        b=UToK2U5DsVBmv53lqvSSaFZxgc92IRMUzxgxxgjPAFOOinSY8fw97zpx1NXq1g3RJLSsoE
        cAmFTGXbLKUblGr+LlyxP+08pMbBj3BUvrOC/cFLIClkLxs8f5pj9DvkZP6nqBiWI+UBYp
        Y/82p+MVuwga+eL02Kzmp5s8inauMT8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-B8AqSebxPyaanMheHIA4WQ-1; Sun, 13 Jun 2021 06:22:01 -0400
X-MC-Unique: B8AqSebxPyaanMheHIA4WQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4375F100C619;
        Sun, 13 Jun 2021 10:22:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-77.ams2.redhat.com [10.36.112.77])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC1560C0F;
        Sun, 13 Jun 2021 10:21:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/3] Input: touchscreen - Allow setting touchscreen properties with module options
Date:   Sun, 13 Jun 2021 12:21:55 +0200
Message-Id: <20210613102158.16886-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

On x86/ACPI platforms touchscreens mostly just work without needing any
device/model specific configuration. But in some cases (mostly with Silead
and Goodix touchscreens) it is still necessary to manually specify various
touchscreen-properties on a per model basis.

This is handled by drivers/platform/x86/touchscreen_dmi.c which contains
a large list of per-model touchscreen properties which it attaches to the
(i2c)device before the touchscreen driver's probe() method gets called.
This means that ATM changing these settings requires recompiling the
kernel. This makes figuring out what settings/properties a specific
touchscreen needs very hard for normal users to do.

This series adds a new "settings" module parameter to the silead and
goodix touchscreen drivers which allows setting touch-screen properties
without needing a kernel re-compile.

Regards,

Hans


Hans de Goede (3):
  Input: touchscreen - Extend touchscreen_parse_properties() to allow
    overriding settings with a module option
  Input: silead - add a settings module-parameter
  Input: goodix - add a settings module-parameter

 drivers/input/misc/iqs626a.c                  |  2 +-
 drivers/input/touchscreen.c                   | 96 +++++++++++++++++--
 drivers/input/touchscreen/ad7879.c            |  2 +-
 drivers/input/touchscreen/ads7846.c           |  2 +-
 drivers/input/touchscreen/bu21013_ts.c        |  2 +-
 drivers/input/touchscreen/bu21029_ts.c        |  2 +-
 drivers/input/touchscreen/chipone_icn8318.c   |  2 +-
 drivers/input/touchscreen/chipone_icn8505.c   |  2 +-
 drivers/input/touchscreen/cy8ctma140.c        |  2 +-
 drivers/input/touchscreen/cyttsp_core.c       |  2 +-
 drivers/input/touchscreen/edt-ft5x06.c        |  2 +-
 drivers/input/touchscreen/eeti_ts.c           |  2 +-
 drivers/input/touchscreen/ektf2127.c          |  2 +-
 drivers/input/touchscreen/elants_i2c.c        |  2 +-
 drivers/input/touchscreen/exc3000.c           |  2 +-
 drivers/input/touchscreen/goodix.c            |  6 +-
 drivers/input/touchscreen/hideep.c            |  2 +-
 drivers/input/touchscreen/hycon-hy46xx.c      |  2 +-
 drivers/input/touchscreen/ili210x.c           |  2 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c     |  2 +-
 drivers/input/touchscreen/iqs5xx.c            |  2 +-
 drivers/input/touchscreen/mms114.c            |  2 +-
 drivers/input/touchscreen/msg2638.c           |  2 +-
 drivers/input/touchscreen/pixcir_i2c_ts.c     |  2 +-
 drivers/input/touchscreen/raspberrypi-ts.c    |  2 +-
 .../input/touchscreen/resistive-adc-touch.c   |  2 +-
 drivers/input/touchscreen/s6sy761.c           |  2 +-
 drivers/input/touchscreen/silead.c            | 16 ++--
 drivers/input/touchscreen/st1232.c            |  2 +-
 drivers/input/touchscreen/stmfts.c            |  2 +-
 drivers/input/touchscreen/stmpe-ts.c          |  2 +-
 drivers/input/touchscreen/sx8654.c            |  2 +-
 drivers/input/touchscreen/tsc200x-core.c      |  2 +-
 drivers/input/touchscreen/zet6223.c           |  2 +-
 drivers/input/touchscreen/zinitix.c           |  2 +-
 include/linux/input/touchscreen.h             |  9 +-
 36 files changed, 143 insertions(+), 48 deletions(-)

-- 
2.31.1

