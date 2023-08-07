Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0458C772C16
	for <lists+linux-input@lfdr.de>; Mon,  7 Aug 2023 19:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjHGRJB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Aug 2023 13:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231648AbjHGRJA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Aug 2023 13:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D72E6F
        for <linux-input@vger.kernel.org>; Mon,  7 Aug 2023 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691428094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PaUoN6jEp6bScPFRDpbhbjlwtESgFZLJBJ4BEap2ll4=;
        b=cW75MOLqP2ZgKVXCcpKDeLpDLJ5SyCnUcTcDinK2MHSQ18iysEX58xpg8yPbFXIW5gCUaC
        oAGx49Snn8uG1Uxm1X8xNhDLsVVL6Pt7SRvDCvFuW4NSlRoFHSoztYr3BgooTVegxZkxDG
        t8ufmfoEQ+AUrnDtFtUoVq844iK235Y=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-OvcrXwRQMtuiB1_fzL8xtw-1; Mon, 07 Aug 2023 13:08:12 -0400
X-MC-Unique: OvcrXwRQMtuiB1_fzL8xtw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bc8f1290eso321489766b.3
        for <linux-input@vger.kernel.org>; Mon, 07 Aug 2023 10:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691428091; x=1692032891;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PaUoN6jEp6bScPFRDpbhbjlwtESgFZLJBJ4BEap2ll4=;
        b=azdeaLS3i8JiivhS+xdW9xM8xLFAXR/3BIVzv6VHltyVzH8P9gqDf1mNNttiWrKZED
         7T7+B4ngax8Ak/uFly23pa9OahScUpSJoKz3B/pHy3sj5gb7et1AMClD5+cAQE2336bG
         sh2ATJRlfF2AtKRzEGafIiOnM4ICWJbLCoZmmbtPClGPSzKKOU/mqcs+XxpKLJTb4pTV
         IW77UxJdpryz0mbotwvOfPVKyi1Y4uKBEqB02CU0JEK9GpO+xP7Ucte7AVRz0uvABZk3
         WZKp40yiM4sLBR9+Pcmb2ktlV7lHghp1K2LrPmxHdT60N526YLkZF5yT3rXxRtlsNkIz
         I3ug==
X-Gm-Message-State: AOJu0Yyaghs7yOx1o1aQEajZeQq+XD1CVG/ibAzf8/pqvhHOofKoQrZa
        qPyh36JOPtzK32gmSh3j6MwULmW6KX+EwBT4kQwamWvpA1hxvOVN3dGabudvjDuodSrITUMUxox
        xuMTLbf81BsPKgcpjP5XncXNCT8R1avs=
X-Received: by 2002:a17:907:a068:b0:99c:20f0:dec0 with SMTP id ia8-20020a170907a06800b0099c20f0dec0mr7398270ejc.43.1691428091251;
        Mon, 07 Aug 2023 10:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdRWArae2xjTleGNCnyKN3zPJYqQ7yEgmEAbjdVbwFTs5hltjWWTGAXlxt5oOp8DbgHNlFdw==
X-Received: by 2002:a17:907:a068:b0:99c:20f0:dec0 with SMTP id ia8-20020a170907a06800b0099c20f0dec0mr7398260ejc.43.1691428091012;
        Mon, 07 Aug 2023 10:08:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k2-20020a1709063fc200b00993470682e5sm5474991ejj.32.2023.08.07.10.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 10:08:10 -0700 (PDT)
Message-ID: <79004399-65df-01ed-faa7-5dd6c3cbb75d@redhat.com>
Date:   Mon, 7 Aug 2023 19:08:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drivers/input/touchscreen/goodix.c: Add support for ACPI
 ID GDX9110
Content-Language: en-US, nl
To:     Felix Engelhardt <felix.engelhardt@eidu.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230807124723.382899-1-felix.engelhardt@eidu.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230807124723.382899-1-felix.engelhardt@eidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/7/23 14:47, Felix Engelhardt wrote:
> The Goodix touchscreen controller with ACPI ID GDX9110 was not recognized
> by the goodix driver. This patch adds this ID to the list of supported IDs,
> allowing the driver to be used with this device. The change will allow
> Linux to be used on ~1 million tablet devices used in Kenyan primary
> schools.
> 
> Signed-off-by: Felix Engelhardt <felix.engelhardt@eidu.com>
> ---
>  drivers/input/touchscreen/goodix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 4f53d3c57e69..9cdc01eb00c9 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1379,6 +1379,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
>  static const struct acpi_device_id goodix_acpi_match[] = {
>  	{ "GDIX1001", 0 },
>  	{ "GDIX1002", 0 },
> +	{ "GDX9110", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, goodix_acpi_match);

Hmm, GDX without the 'I' does look like an official ACPI vendor prefix. But if this is used in the wild, then I guess we'll just need to live with it:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



