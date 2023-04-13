Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F80C6E0A58
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 11:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjDMJhR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 05:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjDMJhO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 05:37:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81FD5FF7
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681378591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=oDKp2Xyyw5rHxzcbbfIs0OX+Ff8kvK/t4Gbctzff9+Y=;
        b=iI7KouE+aWs+O1AfDi01GJPEm63Is9lrtufzB4f89ytiyw3Ho1NRsAZs0baWKaU64Sevpv
        8fp5N1dvWhhSp3yrDY6h3tR+jJm4EIs/BNgM2KUZzw3XUnNUYJzcK+NxbPx2NZ0fId9d/i
        Hscrhk6rth0/EZVvbxDcKUefG5kqfkk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-w1dyJE2iMKiI3WOcgH1GaQ-1; Thu, 13 Apr 2023 05:36:27 -0400
X-MC-Unique: w1dyJE2iMKiI3WOcgH1GaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B30D3C0F22E;
        Thu, 13 Apr 2023 09:36:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 827F2C1602A;
        Thu, 13 Apr 2023 09:36:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v2 0/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
Date:   Thu, 13 Apr 2023 11:36:22 +0200
Message-Id: <20230413093625.71146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

Here is a v2 of my series to allow using i2c-hid-of on non OF platforms
to allow I2C-HID devices which are not enumerated by ACPI to work on ACPI
platforms (by manual i2c_client instantiation using i2c_client_id matching).

Changes in v2:
- As discussed Drop the patches to consolidate all the i2c-hid-of*
  drivers into one
- Add a comment to the "post-reset-deassert-delay-ms" property reading,
  that it is a kernel internal (non public) property used between x86
  platform code and the i2c-hid driver.

Regards,

Hans


Hans de Goede (3):
  HID: i2c-hid-of: Consistenly use dev local variable in probe()
  HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
  HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of

 drivers/hid/i2c-hid/Kconfig      |  6 +++--
 drivers/hid/i2c-hid/i2c-hid-of.c | 38 ++++++++++++++++++++++++--------
 2 files changed, 33 insertions(+), 11 deletions(-)

-- 
2.39.1

