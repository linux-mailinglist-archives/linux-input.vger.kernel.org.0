Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B47153D723
	for <lists+linux-input@lfdr.de>; Sat,  4 Jun 2022 16:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235644AbiFDOBy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 Jun 2022 10:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbiFDOBx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 4 Jun 2022 10:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B9BA93617C
        for <linux-input@vger.kernel.org>; Sat,  4 Jun 2022 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654351308;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OfcPj+cwztaLSei0IVYo5rrELt9/llylwn3d2kpTpuU=;
        b=btNou6lVTgWQ2lLFx9ySjW0ndwNAKKIqvUoLPOpRDUStuRgmzc3yKx3gUq4ywiZAjk0IO4
        +RM9NaN/CI2rz/wx59ebkVOjkATMRT8iFM3EDBYKYrxP2vQfBzaZK1FeFMctYs+XhIlkKM
        cAWxgM6M9fvMrG7nGOZXtIxcSjV70XA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-KW_zVfIiPI6vnFOstZgY0w-1; Sat, 04 Jun 2022 10:01:47 -0400
X-MC-Unique: KW_zVfIiPI6vnFOstZgY0w-1
Received: by mail-lf1-f72.google.com with SMTP id a29-20020a194f5d000000b004790a4ba4bdso4462221lfk.11
        for <linux-input@vger.kernel.org>; Sat, 04 Jun 2022 07:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OfcPj+cwztaLSei0IVYo5rrELt9/llylwn3d2kpTpuU=;
        b=zU5HnbqqGJ8o5vWSWwVr3aNWHypLCAoPD11lI0yxnK/fvI2m9zjT9T+RLb9gPjowTX
         pHB6byTCI1eMoT7tMPs3zYgQ2cCBg0YiwdXVbWgru0ynOGTt5SUxCcA6dGWet1vP+Nj3
         vCnyOPo1UotXAyRxotw1Zvcu+zpZrDaXU3N0mKNvlBtTmsQXMggBiIcjNSR4AzFNikPz
         7YFqRrU885Bqr8GuUiKRUhtIcGVdQx7g/TNxFYtyToxZrENYLh4tcPapQuf76eHXpUm0
         Hs213wp4MaVQdo0HAXv38QwSZ4vSCDqKz/o3iWuyhesrRPLOiP5rQ/iOSqCc+ddvfuDz
         ffTQ==
X-Gm-Message-State: AOAM531Ju0xwhvU3D/P2MMQpmpnuK0ltNAjOh/HSPQl7FoPogR74QIKP
        QBGuruKly7QIKiZCZfMjBmvMXDUDqqKBvfTGNF1SfqeT7yZOXr8z04QuTL5pMAj6pCojiev5bY0
        xqS5waFEDsEOJ7UMSLp/V3Ys=
X-Received: by 2002:a05:6512:1092:b0:478:689e:a8dc with SMTP id j18-20020a056512109200b00478689ea8dcmr10185932lfg.33.1654351305869;
        Sat, 04 Jun 2022 07:01:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT3qpmanR4n7brU/292+Dw3t7QHTij6GV5mvwsw5m9yfdSwNADAz3WPl+vnnFOK77YoYVY3g==
X-Received: by 2002:a05:6512:1092:b0:478:689e:a8dc with SMTP id j18-20020a056512109200b00478689ea8dcmr10185915lfg.33.1654351305600;
        Sat, 04 Jun 2022 07:01:45 -0700 (PDT)
Received: from [10.101.1.23] (ip-185-104-137-32.ptr.icomera.net. [185.104.137.32])
        by smtp.gmail.com with ESMTPSA id u26-20020ac248ba000000b00478fa47592asm2102110lfg.141.2022.06.04.07.01.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jun 2022 07:01:44 -0700 (PDT)
Message-ID: <d01f87e0-66fa-e727-f08d-347e0f0853de@redhat.com>
Date:   Sat, 4 Jun 2022 16:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Input: soc_button_array - also add Lenovo Yoga Tablet2
 1051F to dmi_use_low_level_irq
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marius Hoch <mail@mariushoch.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220603120246.3065-1-mail@mariushoch.de>
 <YpqMMmIH6Rr0RbeP@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YpqMMmIH6Rr0RbeP@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 6/4/22 00:33, Dmitry Torokhov wrote:
> On Fri, Jun 03, 2022 at 02:02:46PM +0200, Marius Hoch wrote:
>> Commit 223f61b8c5ad ("Input: soc_button_array - add Lenovo Yoga Tablet2
>> 1051L to the dmi_use_low_level_irq list") added the 1051L to this list
>> already, but the same problem applies to the 1051F. As there are no
>> further 1051 variants (just the F/L), we can just DMI match 1051.
>>
>> Tested on a Lenovo Yoga Tablet2 1051F: Without this patch the
>> home-button stops working after a wakeup from suspend.
>>
>> Signed-off-by: Marius Hoch <mail@mariushoch.de>
> 
> Adding Hans for his input...

This patch is obviously correct the F/L postfix just differs between
wiFi vs LTE, not sure if I already knew this when I wrote this patch
(and did not think things through) or if it is knowledge which I
gathered later, anyway:

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
>> ---
>>  drivers/input/misc/soc_button_array.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
>> index cbb1599a520e..480476121c01 100644
>> --- a/drivers/input/misc/soc_button_array.c
>> +++ b/drivers/input/misc/soc_button_array.c
>> @@ -85,13 +85,13 @@ static const struct dmi_system_id dmi_use_low_level_irq[] = {
>>  	},
>>  	{
>>  		/*
>> -		 * Lenovo Yoga Tab2 1051L, something messes with the home-button
>> +		 * Lenovo Yoga Tab2 1051F/1051L, something messes with the home-button
>>  		 * IRQ settings, leading to a non working home-button.
>>  		 */
>>  		.matches = {
>>  			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>  			DMI_MATCH(DMI_PRODUCT_NAME, "60073"),
>> -			DMI_MATCH(DMI_PRODUCT_VERSION, "1051L"),
>> +			DMI_MATCH(DMI_PRODUCT_VERSION, "1051"),
>>  		},
>>  	},
>>  	{} /* Terminating entry */
>> -- 
>> 2.36.1
>>
> 

