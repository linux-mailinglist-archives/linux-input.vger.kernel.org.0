Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBAA26AE5BB
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 17:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbjCGQBq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 11:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbjCGQBY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 11:01:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8808EA12
        for <linux-input@vger.kernel.org>; Tue,  7 Mar 2023 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678204679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9Jc//D7Lit3zOJ3qsH978jAmR+VZUoUvTJm1KoiL4sE=;
        b=aRTid5a2hH8j0rzmeFnCLAQNnXr4v3uKqr+ycuccAOamcEfIn1U/rI7wNt/CmxFd/IOpxc
        ya94eFw/DSfdgfULTIP1UgElIr/198uyeOzOoa9HUsS47HTZ2O1vkQHsZmN71NjYpPwEqW
        RW3+XRjXl/RCp0mB5sA1gtQzUEc1yzc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-9to1x5egOyqFd_mdiTf9nQ-1; Tue, 07 Mar 2023 10:57:57 -0500
X-MC-Unique: 9to1x5egOyqFd_mdiTf9nQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E12A1C0878D;
        Tue,  7 Mar 2023 15:57:57 +0000 (UTC)
Received: from x1.nl (unknown [10.39.193.18])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB481121314;
        Tue,  7 Mar 2023 15:57:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v3 0/2] Input: hideep - 2 HiDeep touchscreen patches
Date:   Tue,  7 Mar 2023 16:57:53 +0100
Message-Id: <20230307155755.136968-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Here are 2 patches for the HiDeep touchscreen driver.

Changes in v3:
- Do not add the x86/acpi only "hideep,reset-work-mode" property to
  the dt-bindings doc

Changes in v2:
- Add "Optionally reset controller work mode to native HiDeep protocol"
  patch

Regards,

Hans


Hans de Goede (2):
  Input: hideep - Silence error in SW_RESET()
  Input: hideep - Optionally reset controller work mode to native HiDeep
    protocol

 drivers/input/touchscreen/hideep.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.39.1

