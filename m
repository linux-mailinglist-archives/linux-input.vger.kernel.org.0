Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE3636209A
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239122AbhDPNN7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43504 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235575AbhDPNN7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578814;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5A3fp/cmojZQhykcJnsyJK/CDGgxHvSrDHImy/tnTOI=;
        b=CxCippaQaUhfMDDK1hI9pDlyhnaeXEt6fYnmvIVL/eNXkoqDYIEtIniFKahB/ykGjlGhLR
        lzGxn/rtkpogFv14P3uEs6qWjVUSmXMgljIp78DQVII6nMF10oDUtDK80HPImo9iCXf3eB
        kQ5hSXV5gwMvx8oxRzYUMaDeFnYQyWM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-xw9javTiMDGQHuLjgvZQSg-1; Fri, 16 Apr 2021 09:13:30 -0400
X-MC-Unique: xw9javTiMDGQHuLjgvZQSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A2E84BA40;
        Fri, 16 Apr 2021 13:13:29 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CAEBA5C260;
        Fri, 16 Apr 2021 13:13:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/6] HID: lg-g15: Add support for the Logitech Z-10 speakers
Date:   Fri, 16 Apr 2021 15:13:17 +0200
Message-Id: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is a patch series adding support for the LCD menu keys +
LCD brightness control on the Logitech Z-10 speakers (with LCD)
which use the same protocol as the G15 keyboards.

The first patch is an unrelated cleanup, patches 2-4 move some code
into helper functions to allow re-use in the Z-10 case, patch 5
adds the actual Z-10 support and patch 6 is a bonus patch adding
missing MODULE_AUTHOR tags to 2 HID drivers which I maintain.

Regards,

Hans


Hans de Goede (6):
  HID: lg-g15: Remove unused size argument from lg_*_event() functions
  HID: lg-g15: Add a lg_g15_handle_lcd_menu_keys() helper function
  HID: lg-g15: Add a lg_g15_init_input_dev() helper function
  HID: lg-g15: Make the LED-name used by lg_g15_register_led() a
    parameter
  HID: lg-g15: Add support for the Logitech Z-10 speakers
  HID: lg-g15 + ite: Add MODULE_AUTHOR

 drivers/hid/hid-ids.h    |   1 +
 drivers/hid/hid-lg-g15.c | 140 ++++++++++++++++++++++++++-------------
 2 files changed, 96 insertions(+), 45 deletions(-)

-- 
2.31.1

