Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5DC6DD61F
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 11:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjDKJDE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Apr 2023 05:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjDKJDD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Apr 2023 05:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC153F2
        for <linux-input@vger.kernel.org>; Tue, 11 Apr 2023 02:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681203737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fXw1DjQnb0zShy7HRrG6rjrMseykEUnCt/9xPQRr9Y4=;
        b=Y/NGYytgpkya+mpcYEIQQxAZWpyZu7AV3WvYPOiopEtRyLWjLwdVk0Rc1E0/hTfi5VGlpB
        jLspZhpgMA/j5kKGo4c3BKmNTZvnf/+JvQETFU1/iAqjYDmRVcsccXrFpsv40ucJ07r8JW
        gHZ8uPYgmVRf2Z72W6He6CipKWFNwDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-mwaQVybVMl2JMOm50Vz6oQ-1; Tue, 11 Apr 2023 05:02:14 -0400
X-MC-Unique: mwaQVybVMl2JMOm50Vz6oQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A32FC858289;
        Tue, 11 Apr 2023 09:02:13 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 798BE492C13;
        Tue, 11 Apr 2023 09:02:12 +0000 (UTC)
Date:   Tue, 11 Apr 2023 11:02:09 +0200
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: i2c-hid-of: Allow using i2c-hid-of on non OF
 platforms + remove specialized drivers
Message-ID: <20230411090209.gartwrkq56syerwk@mail.corp.redhat.com>
References: <20230409144243.25360-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409144243.25360-1-hdegoede@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Apr 09 2023, Hans de Goede wrote:
> Hi All,
> 
> This series consist of 2 parts:
> 
> 1. Patches 1-3. Allow using i2c-hid-of on non OF platforms to allow I2C-HID
>    devices which are not enumerated by ACPI to work on ACPI platforms
>    (by manual i2c_client instantiation using i2c_client_id matching).

Patches 1 and 2 are looking good, but I wonder if you can not achieve the
same result by relying on an ACPI SSDT override. I got something similar
working on this thread[0].

I understand the "post-reset-deassert-delay-ms" might be something hard
to express with an SSDT, but we should already have all the bits in
place, no?

Also, the problem of "post-reset-deassert-delay-ms" is that you are not
documenting it, because the OF folks do not want this in device tree,
and I tend to agree with them. So this basically creates a brand new
undocumented property, which is less than ideal.

> 
> 2. Patches 4-6. Remove the special i2c-hid-of-elan and i2c-hid-of-goodix
>    driver, folding the functionality into the generic i2c-hid-of driver.
>    Since 1. requires adding reset-gpio support to i2c-hid-of there was
>    very little difference left between the generic i2c-hid-of code and
>    the specialized drivers. So I decided to merge them into the generic
>    driver instead of having duplicate code.

I understand the spirit, but I am not a big fan of this. The reason is
just detailed your following statements: getting tests on those is hard.

So there is code duplication, yes, but OTOH this guarantees that we do
not break those devices while working on something else.

I can always be convinced otherwise, but I still think the approach of
the devicetree-bindings maintainers works better: if you need a new
property that isn't available in the core of i2c-hid-of, and which is
device specific (even if it's just a msleep for a line to be ready),
make this a separate driver. Trying to parametrize everything with
properties will just end up in a situation where one "meaningless"
property will break another device, and it's going to be a pain to
trace, because those drivers are not tested every single kernel release.

> 
> Note patches 4-6 have not been actually tested with an "elan,ekth6915"
> touchscreen nor with a "goodix,gt7375p" touchscreen.
> 
> Douglas, can you perhaps test this patch-set with an "elan,ekth6915"
> touchscreen and with a "goodix,gt7375p" touchscreen ?
> 
> Regards,
> 
> Hans
> 

Cheers,
Benjamin


[0] https://lore.kernel.org/linux-input/20230308155527.jnrsowubvnk22ica@mail.corp.redhat.com/

> 
> Hans de Goede (6):
>   HID: i2c-hid-of: Consistenly use dev local variable in probe()
>   HID: i2c-hid-of: Allow using i2c-hid-of on non OF platforms
>   HID: i2c-hid-of: Add reset GPIO support to i2c-hid-of
>   HID: i2c-hid-of: Add chip_data struct
>   HID: i2c-hid-of: Consolidate Elan support into generic i2c-hid-of
>     driver
>   HID: i2c-hid-of: Consolidate Goodix support into generic i2c-hid-of
>     driver
> 
>  drivers/hid/i2c-hid/Kconfig             |  36 +------
>  drivers/hid/i2c-hid/Makefile            |   2 -
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c   | 129 ------------------------
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 125 -----------------------
>  drivers/hid/i2c-hid/i2c-hid-of.c        | 124 +++++++++++++++++++----
>  5 files changed, 106 insertions(+), 310 deletions(-)
>  delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-elan.c
>  delete mode 100644 drivers/hid/i2c-hid/i2c-hid-of-goodix.c
> 
> -- 
> 2.39.1
> 

