Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0D4766202D
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 09:40:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236516AbjAIIkP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Jan 2023 03:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236511AbjAIIkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Jan 2023 03:40:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6CAF13F3F
        for <linux-input@vger.kernel.org>; Mon,  9 Jan 2023 00:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673253559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J1F19OootqSJo02/5nq51ccGj2gFAyI3aLRBvhLG6VY=;
        b=Q1O58HtIrS/mkKgLZ3EqHS40Tt85Oxtq6Kcw9HF0bqq7e4sAgM3fFSeqHm9HzLQ1AujGRb
        qXnV4PfPo0LSR50w4mP+ES6ewOdnwTh97UbnK+pPgRf6hnYRSQBS8sWGsjjTcsDjumP8pA
        5C7tCZRDG5T/bW7NZDeVrzB5cErmlM8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-oviWsv8JOR-1NCMQFZ_NlA-1; Mon, 09 Jan 2023 03:39:18 -0500
X-MC-Unique: oviWsv8JOR-1NCMQFZ_NlA-1
Received: by mail-ed1-f69.google.com with SMTP id y21-20020a056402359500b0048123f0f8deso4809921edc.23
        for <linux-input@vger.kernel.org>; Mon, 09 Jan 2023 00:39:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1F19OootqSJo02/5nq51ccGj2gFAyI3aLRBvhLG6VY=;
        b=Hiy0UYPbCB3iA1HXF1TKir8az+bSb775zlrl8/jJZbl0GDqCsXnt4Y0TiYZxnhat9i
         rcD6r/SAQyqQqWHZiAKNe4k2r56xX4+LexZIxbGGBf4xSQgppFW5nRCWbhUOMFtPokK1
         BbtU2ehgPEamoT2rdm3fXOUXyjnGy3KUCB3CThzMxojEXsuC1yeyFGASZhqnDBugAUIp
         NWyOCtoI6eucA5OCfVzgOOSjp90987uFPVS5WWf/felt0jin5fraPydZhEi8d6AMUfbs
         rLrZvAuok+qRJ77VdnY3MTTIljvu0h4AStxUKnHBaiTGPPH1KV54s0S9bKwWDgI2DG/o
         gaoQ==
X-Gm-Message-State: AFqh2koIgXzwWXi0ITjdplDRr44Q6pZuzKgClwNYP3m+JChoLzYNTcGF
        yRwK3bNTJ1+h7YYvJIl/LBkr3Rqn8Z/kig7eywPg7BfrIQvtudhbMh4NbbkTrWiXF3+uhyMOlQt
        ugqkc1RS+r7LNDfpqHCecpAg=
X-Received: by 2002:a05:6402:1cce:b0:472:1b3b:35f1 with SMTP id ds14-20020a0564021cce00b004721b3b35f1mr71459271edb.21.1673253557330;
        Mon, 09 Jan 2023 00:39:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQHoqNFDBv5b+KRfQQPCDn8dbqFoFTle6LxtPDIi5nK+QwX7m5tX1huyDBGiicuZ1OooY54w==
X-Received: by 2002:a05:6402:1cce:b0:472:1b3b:35f1 with SMTP id ds14-20020a0564021cce00b004721b3b35f1mr71459255edb.21.1673253557102;
        Mon, 09 Jan 2023 00:39:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t18-20020aa7d712000000b0046b4e0fae75sm3413735edq.40.2023.01.09.00.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 00:39:16 -0800 (PST)
Message-ID: <101825b0-3d27-28dd-d70b-d4df1321b132@redhat.com>
Date:   Mon, 9 Jan 2023 09:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/8] HID: remove some unneeded exported symbols from hid.h
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        David Rheinsberg <david.rheinsberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org
References: <20221222-hid-v1-0-f4a6c35487a5@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221222-hid-v1-0-f4a6c35487a5@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/22/22 06:10, Thomas Weißschuh wrote:
> Small cleanup to get rid of exports of the lowlevel hid drivers and to make
> them const.

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans


> 
> To: Hans de Goede <hdegoede@redhat.com>
> To: Jiri Kosina <jikos@kernel.org>
> To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> To: David Rheinsberg <david.rheinsberg@gmail.com>
> To: Marcel Holtmann <marcel@holtmann.org>
> To: Johan Hedberg <johan.hedberg@gmail.com>
> To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> To: "David S. Miller" <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: linux-bluetooth@vger.kernel.org
> Cc: netdev@vger.kernel.org
> 
> ---
> Thomas Weißschuh (8):
>       HID: letsketch: Use hid_is_usb()
>       HID: usbhid: Make hid_is_usb() non-inline
>       HID: Remove unused function hid_is_using_ll_driver()
>       HID: Unexport struct usb_hid_driver
>       HID: Unexport struct uhid_hid_driver
>       HID: Unexport struct hidp_hid_driver
>       HID: Unexport struct i2c_hid_ll_driver
>       HID: Make lowlevel driver structs const
> 
>  drivers/hid/hid-letsketch.c        |  2 +-
>  drivers/hid/i2c-hid/i2c-hid-core.c |  3 +--
>  drivers/hid/uhid.c                 |  3 +--
>  drivers/hid/usbhid/hid-core.c      |  9 +++++++--
>  include/linux/hid.h                | 18 ++----------------
>  net/bluetooth/hidp/core.c          |  3 +--
>  6 files changed, 13 insertions(+), 25 deletions(-)
> ---
> base-commit: d264dd3bbbd16b56239e889023fbe49413a58eaf
> change-id: 20221222-hid-b9551f9fa236
> 
> Best regards,

