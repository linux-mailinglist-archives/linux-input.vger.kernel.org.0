Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D55426DC068
	for <lists+linux-input@lfdr.de>; Sun,  9 Apr 2023 16:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjDIOne (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Apr 2023 10:43:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIOnd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Apr 2023 10:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC2730DA
        for <linux-input@vger.kernel.org>; Sun,  9 Apr 2023 07:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681051368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5BnjhgG3AS+OBSzeFNkAckdPT2mm6rp9JcAUIqJ02Ik=;
        b=P8f2VGZbaVY8oFFI4dh5SSg0bt0JDjpVC84bh2OV1Z6UZkF924E1fai0FJSHd12dVWKEVI
        dTZUV0uLt8rxN8JS2Y1GZxkAH8ZolYCD4mCBgJI46BVLTUbdtEwMtI/I8GlCW2yHM75few
        mu+kHtiihWTPwZiKdpYdZieGTCYiPjM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-efcYJzP_PoOP7ljv--EX8Q-1; Sun, 09 Apr 2023 10:42:45 -0400
X-MC-Unique: efcYJzP_PoOP7ljv--EX8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BD661C0418B;
        Sun,  9 Apr 2023 14:42:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 765DB2027040;
        Sun,  9 Apr 2023 14:42:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms + remove specialized drivers
Date:   Sun,  9 Apr 2023 16:42:37 +0200
Message-Id: <20230409144243.25360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

This series consist of 2 parts:

1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
   devices which are not enumerated by ACPI to work on ACPI platforms
   (by manual i2c_client instantiation using i2c_client_id matching).

2. Patches 4-6. Remove the special i2c-hid-of-elan and i2c-hid-of-goodix
   driver, folding the functionality into the generic i2c-hid-of driver.
   Since 1. requires adding reset-gpio support to i2c-hid-of there was
   very little difference left between the generic i2c-hid-of code and
   the specialized drivers. So I decided to merge them into the generic
   driver instead of having duplicate code.

Note patches 4-6 have not been actually tested with an "elan,ekth6915"
touchscreen nor with a "goodix,gt7375p" touchscreen.

Douglas, can you perhaps test this patch-set with an "elan,ekth6915"
touchscreen and with a "goodix,gt7375p" touchscreen ?

Regards,

Hans


Hans de Goede (6):
  HID: i2c-hid-of: Consistenly use dev local variable in probe()
  HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
  HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
  HID: i2c-hid-of: Add chip_data struct
  HID: i2c-hid-of: Consolidate Elan support into generic i2c-hid-of
    driver
  HID: i2c-hid-of: Consolidate Goodix support into generic i2c-hid-of
    driver

 drivers/hid/i2c-hid/Kconfig             |  36 +------
 drivers/hid/i2c-hid/Makefile            |   2 -
 drivers/hid/i2c-hid/i2c-hid-of-elan.c   | 129 ------------------------
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 125 -----------------------
 drivers/hid/i2c-hid/i2c-hid-of.c        | 124 +++++++++++++++++++----
 5 files changed, 106 insertions(+), 310 deletions(-)
 delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-elan.c
 delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c

-- 
2.39.1

