Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C03C4CA3D0
	for <lists+linux-input@lfdr.de>; Wed,  2 Mar 2022 12:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239603AbiCBLev (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Mar 2022 06:34:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238899AbiCBLeu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Mar 2022 06:34:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 494EA90CE5
        for <linux-input@vger.kernel.org>; Wed,  2 Mar 2022 03:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646220846;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nmyc3zis9Vidz4GdVoKiVRejQJ36tv67RKx82YlH4RU=;
        b=ej2ESpNbWwCC5bnSDHbKMVejmI5FsHWJ2rVPh7bTxcSymVf7KRv4kiXsHAAHQVTFdmr3bF
        uvihxTFKchiQkRxCo7LLVR31zzU6YCj5FxcABs3slgmgkp8ujN6yShMZO8S/9q1ShwZ/Ao
        ufauqPt4NFITLzgbI6Nn4mZz+qKs9V4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-XoxiP0FXOn-EmKlqgMuxMw-1; Wed, 02 Mar 2022 06:34:05 -0500
X-MC-Unique: XoxiP0FXOn-EmKlqgMuxMw-1
Received: by mail-ed1-f71.google.com with SMTP id bq19-20020a056402215300b0040f276105a4so840396edb.2
        for <linux-input@vger.kernel.org>; Wed, 02 Mar 2022 03:34:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nmyc3zis9Vidz4GdVoKiVRejQJ36tv67RKx82YlH4RU=;
        b=Fo56VlMEtqrIatBlrEeEs7PyDdPUAIgeoI4Ujj3o+AjkFieC02Vmu1XAeBYtGfoFfz
         Ai/5dzLMmeaYVUPYTmWJzsKADutJVPlsevT0FQBKmZr+rPg0+TYaCE5/j9GwiedzrA/1
         gDV8qgzdCLuWQtHRVRH3govGCrbdtLE+pFS76JNUGS9TpvBGLqIRXiH6FsTdiVS9QWgH
         cG86/h47j8LQrJCTK/02SFeKh0r39hiKsmeS5ZKtGTSPCYW3ChcWCTT4jNxYYBqlP3oz
         WWcm8F0BjTD9kxr+4rz8SBm6HQNaHRJvO09FNZ9yqvSOvxe+aN9FdmGN/2sEwiS4qzab
         GuoA==
X-Gm-Message-State: AOAM531ePF2/oE47AHZe/YuKqlTcZhFTcqRBO7XcJeXbsjXOYissDLaC
        VhAEcBSqvqjfUOaJniPurkz2iSiAWHhYJyFg/ZS2g7U+/uJ6sXKT7/bZmRJ1GNTdTjCMBRr+DZj
        jCAS9qe0jo3r9PXdycVCyE3Y=
X-Received: by 2002:a05:6402:520c:b0:412:7f7d:b06b with SMTP id s12-20020a056402520c00b004127f7db06bmr29408279edd.91.1646220844220;
        Wed, 02 Mar 2022 03:34:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJySJdp+mFQPWwzc0cLmL1j+t5F7jCz+Z7l+8o8joICmPOdI6f1xoQQsFTpP3NrgbCXq68BjwQ==
X-Received: by 2002:a05:6402:520c:b0:412:7f7d:b06b with SMTP id s12-20020a056402520c00b004127f7db06bmr29408260edd.91.1646220844017;
        Wed, 02 Mar 2022 03:34:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id l4-20020a170907914400b006d9e0b46fabsm595792ejs.193.2022.03.02.03.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 03:34:03 -0800 (PST)
Message-ID: <13d3e8cd-6ae5-02c7-1489-8dd61a988709@redhat.com>
Date:   Wed, 2 Mar 2022 12:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/2] Input: Replace surface3_button code with
 soc_button_array
Content-Language: en-US
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220224110241.9613-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220224110241.9613-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

On 2/24/22 12:02, Hans de Goede wrote:
> Hi All,
> 
> I noticed that the surface3_button code was pretty much a 1:1 copy of
> soc_button_array. This series adds support to soc_button_array for the
> MSHW0028 device on the Microsoft Surface 3 (non pro) and removes the
> now no longer needed surface3_button driver.
> 
> Rafael, this includes an addition to ignore_serial_bus_ids[] in
> drivers/apci/scan.c, may we have your ack for merging this through
> the input or pdx86 tree please ?
> 
> Dmitry, I believe it would be best to keep these 2 patches together
> and merge both through either the input or the pdx86 tree. If you
> are ok with me merging this through the pdx86 tree may I have your
> Ack for that ?
> 
> If you prefer merging this through the input tree please consider
> this my ack for also merge 2/2 through the input tree.
> 
> Note both patches can also be merged through separate trees without
> issues but keeping them together seems better to me.

Thank you all for the reviews + acks,

I've added this series to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> Hans de Goede (2):
>   Input: soc_button_array - add support for Microsoft Surface 3
>     (MSHW0028) buttons
>   platform/surface: Remove Surface 3 Button driver
> 
>  drivers/acpi/scan.c                        |   5 +
>  drivers/input/misc/soc_button_array.c      |  24 +-
>  drivers/platform/surface/Kconfig           |   7 -
>  drivers/platform/surface/Makefile          |   1 -
>  drivers/platform/surface/surface3_button.c | 247 ---------------------
>  5 files changed, 28 insertions(+), 256 deletions(-)
>  delete mode 100644 drivers/platform/surface/surface3_button.c
> 

