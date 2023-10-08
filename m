Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843F97BCDA4
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 11:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343527AbjJHJzx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 05:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344580AbjJHJzv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 05:55:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C189BA
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 02:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696758908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wfkHalpzIKUUA67CkYt4nmyRHVcrfY1tVSwDUWyvfGs=;
        b=EfkxTnEYcRRqJMJJh0oz348mnCrFHCiMRONCwR5N/q8NPe0mRq9YJ1JH17I//PlwV9DU+M
        OWMGy5qiabkJNhsdTpAGud57p6QQ6juLoRGg6AtrH3YmyJ9PJ4nxtzBe7/x8WKaiaC+4ji
        l0BsEySd00XS877AAFxcFmwag/FzLps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-Pp9V8nDiMRC781uJyuxDQA-1; Sun, 08 Oct 2023 05:55:00 -0400
X-MC-Unique: Pp9V8nDiMRC781uJyuxDQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCEC2811E7B;
        Sun,  8 Oct 2023 09:54:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DDC72C15BB8;
        Sun,  8 Oct 2023 09:54:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 00/14] HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO
Date:   Sun,  8 Oct 2023 11:54:43 +0200
Message-ID: <20231008095458.8926-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Here is a v2 of my series to fix issues with hidpp_connect_event() running
while restarting IO, which now also fixes the issues you mentioned with
potentially missing connect events.

This series is best explained by a brief sketch of how probe()
looks at the end of the series (1):

Prep work:

1. All code depending on a device being in connected state is moved to
   the hidpp_connect_event() workqueue item

2. hidpp_connect_event() now checks the connected state itself by
   checking that hidpp_root_get_protocol_version() succeeds, instead
   of relying on possibly stale (racy) data in struct hidpp_device

With this in place the new probe() sequence looks like this:

1. enable_connect_event flag starts at 0, this filters out / ignores any
   connect-events in hidpp_raw_hidpp_event() avoiding
   hidpp_connect_event() getting queued before the IO restart

2. IO is started with connect-mask = 0
   this avoids hid-input and hidraw connecting while probe() is setting
   hdev->name and hdev->uniq

3. Name and serialnr are retrieved and stored in hdev

4. IO is fully restarted (including hw_open + io_start, not just hw_start)
   with the actual connect-mask.

5. enable_connect_event atomic_t is set to 1 to enable processing of
   connect events.

6. hidpp_connect_event() is queued + flushed to query the connected state
   and do the connect work if the device is connected.

7. probe() now ends with:

        /*
         * This relies on logi_dj_ll_close() being a no-op so that
         * DJ connection events will still be received.
         */
        hid_hw_close(hdev);

   Since on restarting IO it now is fully restarted so the hid_hw_open()
   there needs to be balanced. 

This series now obviously is no longer 6.6 material, instead I hope we
can get this rework (and IMHO nice cleanup) into 6.7 .

Regards,

Hans


1) For reviewing you may also want to apply the entire series and look
at the end result to help you understand why various intermediate steps
are taken.


Hans de Goede (14):
  HID: logitech-hidpp: Revert "Don't restart communication if not
    necessary"
  HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect
    check
  HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
  HID: logitech-hidpp: Remove connected check for non-unifying devices
  HID: logitech-hidpp: Move get_wireless_feature_index() check to
    hidpp_connect_event()
  HID: logitech-hidpp: Remove wtp_get_config() call from probe()
  HID: logitech-hidpp: Remove connected check for g920_get_config() call
  HID: logitech-hidpp: Add a hidpp_connect_and_start() helper
  HID: logitech-hidpp: Move the connected check to after restarting IO
  HID: logitech-hidpp: Move g920_get_config() to just before
    hidpp_ff_init()
  HID: logitech-hidpp: Remove unused connected param from *_connect()
  HID: logitech-hidpp: Fix connect event race
  HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe()
    restarts IO
  HID: logitech-hidpp: Drop delayed_work_cb()

 drivers/hid/hid-logitech-hidpp.c | 211 +++++++++++++------------------
 1 file changed, 91 insertions(+), 120 deletions(-)

-- 
2.41.0

