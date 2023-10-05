Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12EE77BAB57
	for <lists+linux-input@lfdr.de>; Thu,  5 Oct 2023 22:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjJEUQy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Oct 2023 16:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbjJEUQx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Oct 2023 16:16:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E7783
        for <linux-input@vger.kernel.org>; Thu,  5 Oct 2023 13:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696536972;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cuYiOqNB42Ue6vuCLEx2BgpaifwQfJcsRvaIXxZ40zw=;
        b=d5+JERNjUTOtVup0QtVII2S264u3Xfr2e22ETac/qQUn4z+8pW88VISQWaYiKCb/qE2ehC
        ftq4fWYsh3CDvuivOwGZjoasge7oKxyqBOf4055G/+9hPjvJUPfKnWcMCvjg7ea5SYMVFN
        ExJL9f1DbdDQtkrb9D4gZ5+/biNQVzs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-_Azg54ivP6-K3P4SEcn_ug-1; Thu, 05 Oct 2023 16:15:54 -0400
X-MC-Unique: _Azg54ivP6-K3P4SEcn_ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFB23803D6A;
        Thu,  5 Oct 2023 20:15:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 49304111CD23;
        Thu,  5 Oct 2023 20:15:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/3] Input: atkbd - add skip_commands module parameter
Date:   Thu,  5 Oct 2023 22:15:41 +0200
Message-ID: <20231005201544.26983-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

While debugging a keyboard issue on some HP laptops adding i8042.dumbkbd
helped to avoid the issue. So one of the commands send by atkbd.c seemed
to be the culprit.

This series a skip_commands option to help debug cases like this by adding
a bit-field which allows disabling a subset of the ps2_command()
calls the atkbd driver makes.

It also replaces the existing atkbd_skip_deactivate flag
with the new parameter and adds a DMI quirk for the HP laptops
to avoid the keyboard issue there.

Regards,

Hans


Hans de Goede (3):
  Input: atkbd - add skip_commands module parameter
  Input: atkbd - drop atkbd_skip_deactivate flag
  Input: atkbd - set skip_commands = ATKBD_SKIP_GETID for HP laptop
    15s-fq* laptops

 drivers/input/keyboard/atkbd.c | 88 ++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 19 deletions(-)

-- 
2.41.0

