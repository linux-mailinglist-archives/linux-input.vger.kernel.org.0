Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8223D7BCDCE
	for <lists+linux-input@lfdr.de>; Sun,  8 Oct 2023 12:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230412AbjJHKbW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Oct 2023 06:31:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjJHKbV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Oct 2023 06:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38CFC5
        for <linux-input@vger.kernel.org>; Sun,  8 Oct 2023 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696761035;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=V9wjvSnqUj2c8hHYXva2I4nguakPzwi3FEOyIrKfLsA=;
        b=LzRgTapf+iwOcwiUYkcvb6XehXJp/q/yXy/ut4VU+ConG329/G+fCy2D4V+oP1dXarEtrK
        86AmqfChTLC+q14eYeAkCmQYj5CWiSe8elLPaAkqyZc149O3NB0vcydPZPmsMu20OjpFiT
        R8WOWGQOBaFcrWi3xt+bGPV8f2oLEw8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-XrAk8ygYPFSHl-lq_3tCKA-1; Sun, 08 Oct 2023 06:30:33 -0400
X-MC-Unique: XrAk8ygYPFSHl-lq_3tCKA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-537fb536554so3152199a12.2
        for <linux-input@vger.kernel.org>; Sun, 08 Oct 2023 03:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696761032; x=1697365832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9wjvSnqUj2c8hHYXva2I4nguakPzwi3FEOyIrKfLsA=;
        b=RCP3uy2Vff7mTTxUaIJ+GJBEOIa/REA460muVTIBzDdaKQWmFJJTOhuA8gIZ0U4TM2
         NkarQbKdlfC3Hiascx7TIiMmGZW3VoHI4O8iXzGZvPX68PD8hE48/jsusfXm7k/eIeHP
         tcz12dhtEIrGPWIXX78bDgehMEOx/x57El4nTTZmN4LJf18thYia2MDEA9ZGx0cOVSVo
         w9HiYiH07MG7XtEfAzyPfDoaLGl8CkIQ9FFPdov65lBChT1NLJCeVPxaQhSMPdRPAf6m
         5UgY3FmmWEB1PdOcPHiJ/FYXtzKVHvROrO0dzF2PisFkcgrSRG9mdMxZw47YYdwEDwVJ
         8n0Q==
X-Gm-Message-State: AOJu0YybEWGQcgIhASs7EKMvISuDMzjG4jcLP576AiPQnJBH2VZFl6BI
        sRxx0iGYJsOgm6dM2c6FcLsKv9Th1rgpcJ13E49pwRRN6ha7NZaPpunGxhb7dcbc7i/pw1E9Y7A
        Dcp7v7Aeuc2oy/cPmPqLFJrk=
X-Received: by 2002:a17:906:220f:b0:9ba:fb9:d334 with SMTP id s15-20020a170906220f00b009ba0fb9d334mr2762334ejs.13.1696761032363;
        Sun, 08 Oct 2023 03:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDOqpHAobbDQVbYpc0iD2Fiwq33HN56IJEyWj3G//HxFCoPS8jGPJK+6FWUYHrwoOEgDXsJw==
X-Received: by 2002:a17:906:220f:b0:9ba:fb9:d334 with SMTP id s15-20020a170906220f00b009ba0fb9d334mr2762320ejs.13.1696761031904;
        Sun, 08 Oct 2023 03:30:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m15-20020a1709066d0f00b00982a352f078sm5271371ejr.124.2023.10.08.03.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 03:30:30 -0700 (PDT)
Message-ID: <98bc1918-653e-b298-392c-c525d069ea31@redhat.com>
Date:   Sun, 8 Oct 2023 12:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/14] HID: logitech-hidpp: Avoid hidpp_connect_event()
 running while probe() restarts IO
To:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20231008095458.8926-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231008095458.8926-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/8/23 11:54, Hans de Goede wrote:
> Hi Benjamin,
> 
> Here is a v2 of my series to fix issues with hidpp_connect_event() running
> while restarting IO, which now also fixes the issues you mentioned with
> potentially missing connect events.
> 
> This series is best explained by a brief sketch of how probe()
> looks at the end of the series (1):
> 
> Prep work:
> 
> 1. All code depending on a device being in connected state is moved to
>    the hidpp_connect_event() workqueue item
> 
> 2. hidpp_connect_event() now checks the connected state itself by
>    checking that hidpp_root_get_protocol_version() succeeds, instead
>    of relying on possibly stale (racy) data in struct hidpp_device
> 
> With this in place the new probe() sequence looks like this:
> 
> 1. enable_connect_event flag starts at 0, this filters out / ignores any
>    connect-events in hidpp_raw_hidpp_event() avoiding
>    hidpp_connect_event() getting queued before the IO restart
> 
> 2. IO is started with connect-mask = 0
>    this avoids hid-input and hidraw connecting while probe() is setting
>    hdev->name and hdev->uniq
> 
> 3. Name and serialnr are retrieved and stored in hdev
> 
> 4. IO is fully restarted (including hw_open + io_start, not just hw_start)
>    with the actual connect-mask.
> 
> 5. enable_connect_event atomic_t is set to 1 to enable processing of
>    connect events.
> 
> 6. hidpp_connect_event() is queued + flushed to query the connected state
>    and do the connect work if the device is connected.
> 
> 7. probe() now ends with:
> 
>         /*
>          * This relies on logi_dj_ll_close() being a no-op so that
>          * DJ connection events will still be received.
>          */
>         hid_hw_close(hdev);
> 
>    Since on restarting IO it now is fully restarted so the hid_hw_open()
>    there needs to be balanced. 
> 
> This series now obviously is no longer 6.6 material, instead I hope we
> can get this rework (and IMHO nice cleanup) into 6.7 .
> 
> Regards,
> 
> Hans

I forgot to add info on the list of devices I tested this on:

Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
Logitech M720 Triathlon (bluetooth, HID++ 4.5)
Logitech K400 Pro (unifying, HID++ 4.1)
Logitech K270 (eQUAD nano Lite, HID++ 2.0)
Logitech M185 (eQUAD nano Lite, HID++ 4.5)
Logitech Keyboard LX501 (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
Logitech 27Mhz mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)

Regards,

Hans



> 1) For reviewing you may also want to apply the entire series and look
> at the end result to help you understand why various intermediate steps
> are taken.
> 
> 
> Hans de Goede (14):
>   HID: logitech-hidpp: Revert "Don't restart communication if not
>     necessary"
>   HID: logitech-hidpp: Move hidpp_overwrite_name() to before connect
>     check
>   HID: logitech-hidpp: Add hidpp_non_unifying_init() helper
>   HID: logitech-hidpp: Remove connected check for non-unifying devices
>   HID: logitech-hidpp: Move get_wireless_feature_index() check to
>     hidpp_connect_event()
>   HID: logitech-hidpp: Remove wtp_get_config() call from probe()
>   HID: logitech-hidpp: Remove connected check for g920_get_config() call
>   HID: logitech-hidpp: Add a hidpp_connect_and_start() helper
>   HID: logitech-hidpp: Move the connected check to after restarting IO
>   HID: logitech-hidpp: Move g920_get_config() to just before
>     hidpp_ff_init()
>   HID: logitech-hidpp: Remove unused connected param from *_connect()
>   HID: logitech-hidpp: Fix connect event race
>   HID: logitech-hidpp: Avoid hidpp_connect_event() running while probe()
>     restarts IO
>   HID: logitech-hidpp: Drop delayed_work_cb()
> 
>  drivers/hid/hid-logitech-hidpp.c | 211 +++++++++++++------------------
>  1 file changed, 91 insertions(+), 120 deletions(-)
> 

