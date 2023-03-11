Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0296B5B4F
	for <lists+linux-input@lfdr.de>; Sat, 11 Mar 2023 12:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjCKLsV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Mar 2023 06:48:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjCKLsT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Mar 2023 06:48:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 641EB1091CE
        for <linux-input@vger.kernel.org>; Sat, 11 Mar 2023 03:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678535251;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8KsyNw5uTyQNuI+GiYX9DB5i9VOm1B6ZWhWgGJemc6Q=;
        b=Ij7DqRXne4I7akHUnL4RuKxtTMf+WsewbtIdhKjGrWzM7u4Y9NVObNBD+QRrL9MvaiERF8
        RCn6/avdmibskrO1QbUBdfXU4FVFhlDfVjhiJnVJISMerD1ntxZdPyYTe9QnbLA/AfRXV7
        EAzW0YTl54reUjhtVQmWbl43361ofQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-hHQUn1_HOBuQUwy3Wph5Tw-1; Sat, 11 Mar 2023 06:47:28 -0500
X-MC-Unique: hHQUn1_HOBuQUwy3Wph5Tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91FD7185A794;
        Sat, 11 Mar 2023 11:47:27 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E5C75C16028;
        Sat, 11 Mar 2023 11:47:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-input@vger.kernel.org
Subject: [PATCH v5 0/2] Input: hideep - 2 HiDeep touchscreen patches
Date:   Sat, 11 Mar 2023 12:47:24 +0100
Message-Id: <20230311114726.182789-1-hdegoede@redhat.com>
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

Hi Dmitry,

Here are 2 patches for the HiDeep touchscreen driver.

Changes in v5:
- Rename the property to "hideep,force-native-protocol"
- Add a comment to the property checking code that this property
  should not be used in devicetree without first adding it to
  the devicetree-bindings.

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

