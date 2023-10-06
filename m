Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6077BB2F9
	for <lists+linux-input@lfdr.de>; Fri,  6 Oct 2023 10:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjJFIWa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Oct 2023 04:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjJFIW3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Oct 2023 04:22:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254FFCA
        for <linux-input@vger.kernel.org>; Fri,  6 Oct 2023 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696580499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ypTburfFJAL1DnwQRl3brOTo3sc9Cg5xzdDYMVHkflY=;
        b=dsy4vkgqGt+kBMcOsm3qWBKLNjFT7kuIsFW/WiW7NBRE6eqYIVXJ+mGDlIvIUeEoPuDkO1
        A1VtWYY58bc8R95oG0Eopuweo84cr5sB/XiEwqtcvHUvnYoDjpuhcwmq0fIL6QCEkmQ4hy
        63ZoCCMF59NIB1eK9wuA6lLq+H+MLSw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-_R4UDnlUO2C_-juc45ScGg-1; Fri, 06 Oct 2023 04:21:33 -0400
X-MC-Unique: _R4UDnlUO2C_-juc45ScGg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bca0b9234so154540466b.2
        for <linux-input@vger.kernel.org>; Fri, 06 Oct 2023 01:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696580492; x=1697185292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypTburfFJAL1DnwQRl3brOTo3sc9Cg5xzdDYMVHkflY=;
        b=uWVsi/NtJ+BTYLkATtHPxn/a5pMtrpRbGpzNHv1xf7t5uYfTElWOr71omiwVBOgpXj
         2sfgKbtIRD0i6odTtJAi+Tv62mLqj7K60rjOTH88QJ/z/J7sFeWEsd3OfMnx8PzMufrT
         naE+Sz+6X1ZUHWHI9aeaBC7YWeEKk2PTOeW6fEvTsCooXBgP2+LC9UCWTdbIqFgNjZ8n
         6VAvODdTvCX55cI84VWbShbkBAGGNvn53oQvyL+VlG1bPN1Rt9UW0A2tVUatR6pAVYWq
         YfoQORhr/vgXMzYyB2XTsESGazBFzRRPGV9BULxR7I7wEPjSHD07Z9AedLzk4sXfDWNS
         KVlw==
X-Gm-Message-State: AOJu0Yzu7TpPtnmKHUOv8VwsZe7T1Mtkz6V/DjKySOKLh9yn+krHbZdd
        URZLQuug6jgxw1QxtGak6jFe/8MFLWHvF7KSH6lkw1QTI8J87H5YXDDD9+DdeqY+0pSC+sZ+vDO
        e55Zl/c6gRZ+ML4Wwm3nk2Gk=
X-Received: by 2002:a17:907:75f4:b0:9ae:7d2d:f2b1 with SMTP id jz20-20020a17090775f400b009ae7d2df2b1mr6631060ejc.73.1696580492046;
        Fri, 06 Oct 2023 01:21:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC3IME3zE0i2O1UXEU5G+rT3IY4vZL/xICaCVAhEC2NQMSmUpohwBu1mApqKMKp4/Xt1oEYA==
X-Received: by 2002:a17:907:75f4:b0:9ae:7d2d:f2b1 with SMTP id jz20-20020a17090775f400b009ae7d2df2b1mr6631048ejc.73.1696580491754;
        Fri, 06 Oct 2023 01:21:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id by8-20020a170906a2c800b009b913aa7cdasm2472010ejb.92.2023.10.06.01.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 01:21:31 -0700 (PDT)
Message-ID: <d7f0bce7-7ada-c128-fab7-9049c0ec3f04@redhat.com>
Date:   Fri, 6 Oct 2023 10:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] HID: logitech-hidpp: Drop delayed_work_cb()
Content-Language: en-US, nl
To:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20231006081858.17677-1-hdegoede@redhat.com>
 <20231006081858.17677-3-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231006081858.17677-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/6/23 10:18, Hans de Goede wrote:
> Drop delayed_work_cb() instead make hidpp_connect_event() the workqueue
> function itself.
> 
> Besides resulting in a small cleanup this will hopefully also make
> it clearer that going forward hidpp_connect_event() should only
> be run from a workqueue and not be directly involved.

Typo: s/involved/invoked/

Regards,

Hans



> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 33f9cd98485a..15c36112902b 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -236,8 +236,6 @@ struct hidpp_device {
>  #define HIDPP20_ERROR_UNSUPPORTED		0x09
>  #define HIDPP20_ERROR				0xff
>  
> -static void hidpp_connect_event(struct hidpp_device *hidpp_dev);
> -
>  static int __hidpp_send_report(struct hid_device *hdev,
>  				struct hidpp_report *hidpp_report)
>  {
> @@ -451,13 +449,6 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
>  	return ret;
>  }
>  
> -static void delayed_work_cb(struct work_struct *work)
> -{
> -	struct hidpp_device *hidpp = container_of(work, struct hidpp_device,
> -							work);
> -	hidpp_connect_event(hidpp);
> -}
> -
>  static inline bool hidpp_match_answer(struct hidpp_report *question,
>  		struct hidpp_report *answer)
>  {
> @@ -4190,8 +4181,9 @@ static struct input_dev *hidpp_allocate_input(struct hid_device *hdev)
>  	return input_dev;
>  }
>  
> -static void hidpp_connect_event(struct hidpp_device *hidpp)
> +static void hidpp_connect_event(struct work_struct *work)
>  {
> +	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, work);
>  	struct hid_device *hdev = hidpp->hid_dev;
>  	int ret = 0;
>  	bool connected = atomic_read(&hidpp->connected);
> @@ -4455,7 +4447,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	    hidpp->quirks & HIDPP_QUIRK_UNIFYING)
>  		will_restart = true;
>  
> -	INIT_WORK(&hidpp->work, delayed_work_cb);
> +	INIT_WORK(&hidpp->work, hidpp_connect_event);
>  	mutex_init(&hidpp->io_mutex);
>  	mutex_init(&hidpp->send_mutex);
>  	init_waitqueue_head(&hidpp->wait);

