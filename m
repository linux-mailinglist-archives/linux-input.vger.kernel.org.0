Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6A86ABD97
	for <lists+linux-input@lfdr.de>; Mon,  6 Mar 2023 12:01:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbjCFLBj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Mar 2023 06:01:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjCFLBi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Mar 2023 06:01:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E14025E10
        for <linux-input@vger.kernel.org>; Mon,  6 Mar 2023 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678100452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j/uyFRnZOVBleK7HwqPlNsmqQb5QIuiDIm33dv9xHSE=;
        b=WnQB64llvS5lKKESffSnS3dtAdLq57dFWfs7iJwE/d+nR6/0ZvT5s045maoCwwZXyyIkFw
        iEO2bcFrLF4K9FmDt+KC2jTwWGwiUwSKoxc3weQsWTPa59FilD6UqwIjEa5EQHm8sBPS/a
        B6YNP/pfNjtJLc5IiDjVaNn3O291LqU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-k41qzaBnOaOiOF7rcdwz_Q-1; Mon, 06 Mar 2023 06:00:51 -0500
X-MC-Unique: k41qzaBnOaOiOF7rcdwz_Q-1
Received: by mail-ed1-f70.google.com with SMTP id g2-20020a056402320200b004e98d45ee7dso1496596eda.0
        for <linux-input@vger.kernel.org>; Mon, 06 Mar 2023 03:00:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678100449;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/uyFRnZOVBleK7HwqPlNsmqQb5QIuiDIm33dv9xHSE=;
        b=PVnoiM6CjnmCIky0hliifFAp2CSl8of9IBNgxr17xuqIbvaPvCAybzTh1oyDDXbkKo
         PeZE/lKzVLQNzILW3IcPfygpdFYDWWAiupQZsEiDv9Qcgc6VnT/bHQOZYZiKqFlBBAt7
         55xCAsHxF8nbcJmsavFBsp8aqigb+6oASpu4VeujSDlVmM+Gl7VrneFRSBOrZ2EAp/MF
         N9Zq+5V8sWGdbmcNW7YjnlEvDZ8Oko0bKilEBAOYv8U0q1SSgar1EO1VR84UsXHObogY
         Og2lqiqSPJsNDs0SjRbk63HBCNSge+0RPg0x86Y5dxvF2ASVV43OFsJjQmMf9L/010Cb
         7QSw==
X-Gm-Message-State: AO0yUKV2dotf5E3pd6CHfAIDcVpzW7HHT8qlSnmdLaElcuD5lOABPt3e
        p26eKmBNCWoloPC/OWJv25J8IH6y2BaGOJaYbmDCzrUTLdv9dEeykM15INlcFaCc2VDDwk6MGdZ
        PS6EoyLbUqYc2BRDoEd3MZJ0=
X-Received: by 2002:a17:907:6ea6:b0:8b1:7dea:cc40 with SMTP id sh38-20020a1709076ea600b008b17deacc40mr12709310ejc.9.1678100448990;
        Mon, 06 Mar 2023 03:00:48 -0800 (PST)
X-Google-Smtp-Source: AK7set9+1CRyeY7/ASMYi2TUCACaO7zSdQk1yMY1jvi+dDmM/fOhWfEDMBgL9KNpItYfajL0Mw/62Q==
X-Received: by 2002:a17:907:6ea6:b0:8b1:7dea:cc40 with SMTP id sh38-20020a1709076ea600b008b17deacc40mr12709294ejc.9.1678100448758;
        Mon, 06 Mar 2023 03:00:48 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id f5-20020a170906390500b008c0b8dd4cbdsm4415232eje.112.2023.03.06.03.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 03:00:48 -0800 (PST)
Message-ID: <e8f5e2aa-d7fa-88ff-6306-4c1ee8feeade@redhat.com>
Date:   Mon, 6 Mar 2023 12:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Input: i8042 - Add quirk for Fujitsu Lifebook A574/H
Content-Language: en-US
To:     Jonathan Denose <jdenose@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jonathan Denose <jdenose@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Takashi Iwai <tiwai@suse.de>,
        Werner Sembach <wse@tuxedocomputers.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
References: <20230303152623.45859-1-jdenose@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230303152623.45859-1-jdenose@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/3/23 16:26, Jonathan Denose wrote:
> Fujitsu Lifebook A574/H requires the nomux option to properly
> probe the touchpad, especially when waking from sleep.
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> 
>  drivers/input/serio/i8042-acpipnpio.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index efc61736099b..fe7ffe30997c 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -610,6 +610,14 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		},
>  		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
>  	},
> +	{
> +		/* Fujitsu Lifebook A574/H */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "FMVA0501PZ"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
> +	},
>  	{
>  		/* Gigabyte M912 */
>  		.matches = {

