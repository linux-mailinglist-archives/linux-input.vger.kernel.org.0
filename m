Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1147BB2E7
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjJFIT6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjJFIT4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FD7DE9
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 01:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696580349;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Z7xRcw0ThiDj57CBRamtuQ3KqW+Iz0P5vrUUpzThW14=;
        b=VL2ZK4hWh1VSM4VLBmrpPzUe+9KtuZv3ldUd1plOfvu4oSk8T2+G+L5x+XiA7RK3NlbwIf
        UiK7QiBdkTghlNqC+J1eNncldB1io4GaeiFeHohyonYpB8S3d/WRPhzWWMxthZQWfoPvnH
        7VKWubFxdB6GhbSxZ8kaU4HLxEmOaSY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-7dGMAjz7NwawUSJsEoBfHw-1; Fri, 06 Oct 2023 04:19:05 -0400
X-MC-Unique: 7dGMAjz7NwawUSJsEoBfHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A0F6803498;
        Fri,  6 Oct 2023 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.111])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E819140E950;
        Fri,  6 Oct 2023 08:19:04 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/2] HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe() restarts IO
Date:   Fri,  6 Oct 2023 10:18:56 +0200
Message-ID: <20231006081858.17677-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin, et al.,

Here are 2 follow-up patches to my logitech-hidpp fix from yesterday:
https://lore.kernel.org/linux-input/20231005182638.3776-1-hdegoede@redhat.com/

The first patch is another race bugfix and should ideally go to stable
assuming you agree,

The second patch is just some code cleanup.

Regards,

Hans


Hans de Goede (2):
  HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe()
    restarts IO
  HID: logitech-hidpp: Drop delayed_work_cb()

 drivers/hid/hid-logitech-hidpp.c | 49 ++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 22 deletions(-)

-- 
2.41.0

