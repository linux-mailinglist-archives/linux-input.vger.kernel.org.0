Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 220346E1007
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 16:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjDMOac (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 10:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjDMOab (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 10:30:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3276944B6
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681396180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bqJSGLKy6o3GOj3JsEFeY//ZGTix1RNCCIA2Hz81slk=;
        b=MHDWJha0/7dpWuJ1OWzgmJ3PbvcBysswoLsCELQGqcjlVy1MzrBvmKjT5cL4O4tGp2WXyV
        PsT3rsVXFqh0vQC06RG7ye06dumvRQqBkC3IDPFtfWu21lf4ezhrOFK51vgDBDNNdhBpVG
        X/q555sJ/4a8idgN3fapkVIYGTQ5cgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-fYP2_p6-P4mPXhp2sPHSvQ-1; Thu, 13 Apr 2023 10:29:37 -0400
X-MC-Unique: fYP2_p6-P4mPXhp2sPHSvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E552B1C05156;
        Thu, 13 Apr 2023 14:29:36 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2220440C845F;
        Thu, 13 Apr 2023 14:29:35 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
In-Reply-To: <20230413093625.71146-1-hdegoede@redhat.com>
References: <20230413093625.71146-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/3] HID: i2c-hid-of: Allow using i2c-hid-of on non
 OF platforms
Message-Id: <168139617574.828510.12533536649722821097.b4-ty@redhat.com>
Date:   Thu, 13 Apr 2023 16:29:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 13 Apr 2023 11:36:22 +0200, Hans de Goede wrote:
> Here is a v2 of my series to allow using i2c-hid-of on non OF platforms
> to allow I2C-HID devices which are not enumerated by ACPI to work on ACPI
> platforms (by manual i2c_client instantiation using i2c_client_id matching).
> 
> Changes in v2:
> - As discussed Drop the patches to consolidate all the i2c-hid-of*
>   drivers into one
> - Add a comment to the "post-reset-deassert-delay-ms" property reading,
>   that it is a kernel internal (non public) property used between x86
>   platform code and the i2c-hid driver.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.4/i2c-hid), thanks!

[1/3] HID: i2c-hid-of: Consistenly use dev local variable in probe()
      https://git.kernel.org/hid/hid/c/9d793e7c1f88
[2/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
      https://git.kernel.org/hid/hid/c/728ec8b6eda8
[3/3] HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
      https://git.kernel.org/hid/hid/c/2be404486c05

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

