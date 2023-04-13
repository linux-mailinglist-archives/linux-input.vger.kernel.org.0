Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85396E0F7F
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 16:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjDMOCj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 10:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjDMOCj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 10:02:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DB3DAD09
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681394516;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=aQsmpnIXQTcvCnNwbGyNbGYt1uvVN0qGzH/bCQs5eRc=;
        b=MInqm72dpK8o1a2tSXrmriBSoqsyGmMWxkjGHS10tLLrce3xMHIafeK9K3aWQwrd+azJpH
        WjoQ4Lu8jql8T7EWhp0x5hOQr8vSnps88eTXxNDsaPeOXnmFeVg1breLjSEmccZRIvzAqH
        g9PICnmQanSLCrDxlT8FKlffNH3nHn8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-Ulz6kndlNPWvLDIE4mx7Sg-1; Thu, 13 Apr 2023 10:01:54 -0400
X-MC-Unique: Ulz6kndlNPWvLDIE4mx7Sg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ED521C0513E;
        Thu, 13 Apr 2023 14:01:52 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 497FD2166B26;
        Thu, 13 Apr 2023 14:01:51 +0000 (UTC)
Date:   Thu, 13 Apr 2023 16:01:48 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms
Message-ID: <20230413140148.3cqpylpfwpna5vj5@mail.corp.redhat.com>
References: <20230413093625.71146-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413093625.71146-1-hdegoede@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Apr 13 2023, Hans de Goede wrote:
> Hi Benjamin,
> 
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

The series is:
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

I'd rather have at least Doug test this one before we merge it, but I'll
be out next week, so you'll have to rely on Jiri to merge it (or wait
for one week).

Cheers,
Benjamin

> 
> Regards,
> 
> Hans
> 
> 
> Hans de Goede (3):
>   HID: i2c-hid-of: Consistenly use dev local variable in probe()
>   HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
>   HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
> 
>  drivers/hid/i2c-hid/Kconfig      |  6 +++--
>  drivers/hid/i2c-hid/i2c-hid-of.c | 38 ++++++++++++++++++++++++--------
>  2 files changed, 33 insertions(+), 11 deletions(-)
> 
> -- 
> 2.39.1
> 

