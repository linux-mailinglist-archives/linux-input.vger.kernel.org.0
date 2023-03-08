Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A66716B0B27
	for <lists+linux-input@lfdr.de>; Wed,  8 Mar 2023 15:30:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjCHOaG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Mar 2023 09:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbjCHO37 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Mar 2023 09:29:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5EDC1C3E
        for <linux-input@vger.kernel.org>; Wed,  8 Mar 2023 06:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678285688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1jF1GjRTL8FPI0q5EeKWxdPfx21ACt9fYJMZ058zNE4=;
        b=PkNyAoQlPDV+yJ9anXveMWnHpzBFbQOdO7TqPILOb/NXgAdxl1UHwZNr0bJwIwo89VXRAL
        LMH+QRehkS4vT4/qKRBoMX2Obw1dekmB7Yn/7Mjmr8eT/KHzd1y8wkxGTehMTEBQvH8OzO
        pZVtB8Uflrcw44IvOMp2KE9ZPr1Sm/Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-JVxizVj8O22HCPbGE1rPNg-1; Wed, 08 Mar 2023 09:27:59 -0500
X-MC-Unique: JVxizVj8O22HCPbGE1rPNg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E2572805586;
        Wed,  8 Mar 2023 14:27:59 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.179])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 92931492B04;
        Wed,  8 Mar 2023 14:27:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v4 0/2] Input: hideep - 2 HiDeep touchscreen patches
Date:   Wed,  8 Mar 2023 15:27:48 +0100
Message-Id: <20230308142750.52870-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Sorry about the quick version bump / spam, this is just
a rebase to fix a conflict and I really should have rebased
before sending out v3 yesterday.

Changes in v4:
- Rebase on v6.3-rc1

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

