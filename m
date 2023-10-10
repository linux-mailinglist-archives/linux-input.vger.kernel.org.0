Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD59C7BF873
	for <lists+linux-input@lfdr.de>; Tue, 10 Oct 2023 12:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbjJJKVi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Oct 2023 06:21:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjJJKVh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Oct 2023 06:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F42C4
        for <linux-input@vger.kernel.org>; Tue, 10 Oct 2023 03:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696933249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DBNu/jLg/r5fkSA6h/0qDP5PC+2RpE4N7UFpYCNlu3k=;
        b=RDSuKQCmKSxaU2/4fTeC6098lSZm0E3yizDzDZOLMLd7ODNR1u+DW75QZfVL/TzlEQthrA
        yO5adHUaMdJ+mKa9R4KHMYM/1rO87rafgr5iPLpG48Z91RJ/xBb//iUdNZ2Nfnx1wVWTtx
        9Fm3dH/S7bU7FUdJn4J4sJJ9rbpm93A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-130-Lt5UA8jVPIuwycThQrwXcQ-1; Tue, 10 Oct 2023 06:20:36 -0400
X-MC-Unique: Lt5UA8jVPIuwycThQrwXcQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 355AC80CDA1;
        Tue, 10 Oct 2023 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 46B0140BAED;
        Tue, 10 Oct 2023 10:20:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 00/12] HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO
Date:   Tue, 10 Oct 2023 12:20:17 +0200
Message-ID: <20231010102029.111003-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hi Benjamin,

As dicussed here is v3 of my series to rework / cleanup the hidpp
probing code.

Note the $subject of the cover-letter is not entirely accurate anymore,
but I kept it the same since this is the successor of series with
the same subject.

Changes in v3:
- Call hid_connect() to connect the hid-input and hidraw drivers
  after retrieving the name + serial instead of restarting IO
- Shuffle the series order to put patches with Fixes tags at the start
- Squash 2 changes to G920 handling into one
- Since probe() now no longer restarts IO the following patches have been dropped:
  "HID: logitech-hidpp: Add a hidpp_connect_and_start() helper"
  "HID: logitech-hidpp: Move the connected check to after restarting IO"
  "HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO"
- Add "HID: logitech-hidpp: Drop HIDPP_QUIRK_UNIFYING"

Regards,

Hans


Hans de Goede (12):
  HID: logitech-hidpp: Don't restart IO, instead defer hid_connect()
    only
  HID: logitech-hidpp: Revert "Don't restart communication if not
    necessary"
  HID: logitech-hidpp: Move get_wireless_feature_index() check to
    hidpp_connect_event()
  HID: logitech-hidpp: Remove wtp_get_config() call from probe()
  HID: logitech-hidpp: Move g920_get_config() to just before
    hidpp_ff_init()
  HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect
    check
  HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
  HID: logitech-hidpp: Remove connected check for non-unifying devices
  HID: logitech-hidpp: Remove unused connected param from *_connect()
  HID: logitech-hidpp: Fix connect event race
  HID: logitech-hidpp: Drop delayed_work_cb()
  HID: logitech-hidpp: Drop HIDPP_QUIRK_UNIFYING

 drivers/hid/hid-logitech-hidpp.c | 173 +++++++++++--------------------
 1 file changed, 61 insertions(+), 112 deletions(-)

-- 
2.41.0

