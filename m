Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C6C58EA53
	for <lists+linux-input@lfdr.de>; Wed, 10 Aug 2022 12:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbiHJKLz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Aug 2022 06:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbiHJKLy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Aug 2022 06:11:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7BCF674E33
        for <linux-input@vger.kernel.org>; Wed, 10 Aug 2022 03:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660126312;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bJR3+9LxDQgeJyy1ey5KsSP45xLXRXAg/fQRp6FI2JM=;
        b=hzwz42UOJ0jMm+1zOi6z6VhORa7t9PRt3VmdWMILLwNlFTqftk9fG/ewvD4fLVDWMYmEyE
        V/EoPXfIMzpjN92z2O57C8uFawZ76uBP7QUKHNT9rCPledZ4gkYoKGoL4qcg/e2qaLXMap
        sc9W1w+6zOzm7fGoMkPjbEUymBXFd0I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-66-MCNF-sNCOryWcqPB55EHuw-1; Wed, 10 Aug 2022 06:11:51 -0400
X-MC-Unique: MCNF-sNCOryWcqPB55EHuw-1
Received: by mail-ej1-f69.google.com with SMTP id qk37-20020a1709077fa500b00730c2d975a0so4023160ejc.13
        for <linux-input@vger.kernel.org>; Wed, 10 Aug 2022 03:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bJR3+9LxDQgeJyy1ey5KsSP45xLXRXAg/fQRp6FI2JM=;
        b=BR5bdNpgxvCTItFhcnbHp7dv1kxXRhD/BmFm4InJ06RkAzJ1UhMQAX94H/SGFk/TvZ
         Gx6aj9AygN5CaoPCudDwwOh6xX3U0Fn5KJy4MVD8Yjd/rWJf3RPt6J0zw9LlEOtobszO
         xzwEsVgBOhvGa0IUl0MTY91zv5BjYevGOaFkIOlE3VxWC4oOgFswVIHVxDdkOaVbtVzb
         zzsYseXnFi3TrHNjCCdVc7EY08uhxWzuuxkusHyDQ+kKhOZet3w8po4eZUsq6wsU20m0
         cH6eKfYhjTwM6w0nGS5LTGCVZVmB47scFn2godio5KH0n5bMmIqPVf/JpcPLWA91a5ju
         5pEg==
X-Gm-Message-State: ACgBeo0G4do3Xpm6KtLdxNRqniEM4KwqTNUNexrdsUSXqUU257SVkHs+
        Iyi8eHpkfCHc7KCC7y0FoGWsGDgU0C2Q8UKACOP/c+klTlFuj8R87J2Yh6F6pk5cXB54Nog0F1+
        9in3WXDCFa7BWRh47aVcAbUA=
X-Received: by 2002:a05:6402:198:b0:442:da5a:6716 with SMTP id r24-20020a056402019800b00442da5a6716mr361487edv.5.1660126309019;
        Wed, 10 Aug 2022 03:11:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4iVzbHIyTI4lT0/CgpP/DkaSi4UT2+vp37B6Xp6E9T5vSHxeAHDqM1j8fP21+RgeEhdniTRw==
X-Received: by 2002:a05:6402:198:b0:442:da5a:6716 with SMTP id r24-20020a056402019800b00442da5a6716mr361467edv.5.1660126308849;
        Wed, 10 Aug 2022 03:11:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063db200b00730f0c19108sm2134691ejh.86.2022.08.10.03.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 03:11:48 -0700 (PDT)
Message-ID: <a68bb582-d916-d5f9-3ed6-401a63f46ce6@redhat.com>
Date:   Wed, 10 Aug 2022 12:11:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V2] HID: HID-rmi - ignore to rmi_hid_read_block after
 system resumes.
Content-Language: en-US
To:     margeyang <marge.yang@synaptics.corp-partner.google.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com
References: <1660014544-1009-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1660014544-1009-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/9/22 05:09, margeyang wrote:
> From: Marge Yang <marge.yang@synaptics.corp-partner.google.com>
> 
> The interrupt GPIO will be pulled down once
> after RMI driver reads this command(Report ID:0x0A).
> It will cause "Dark resume test fail" for chromebook device.
> Hence, TP driver will ignore rmi_hid_read_block function once
> after system resumes.
> 
> Signed-off-by: Marge Yang<marge.yang@synaptics.corp-partner.google.com>
> ---
>  drivers/hid/hid-rmi.c | 14 ++++++++++++--
>  include/linux/rmi.h   |  2 ++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 311eee599ce9..b08b74b0c140 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -203,7 +203,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
>  		if (ret < 0)
>  			goto exit;
>  	}
> -
> +	if ((!!xport) && (xport->ignoreonce == 1)) {

The top of this function has:

       struct rmi_data *data = container_of(xport, struct rmi_data, xport);

and data gets dereferenced unconditionally in various places,
so there is no need for the xport check, please change this to just:

	if (xport->ignoreonce == 1) {

Otherwise this looks good to me now.

Regards,

Hans


> +		dev_err(&hdev->dev,
> +			"ignoreonce (%d)\n",
> +			xport->ignoreonce);
> +		xport->ignoreonce = 0;
> +		goto exit;
> +	}
>  	for (retries = 5; retries > 0; retries--) {
>  		data->writeReport[0] = RMI_READ_ADDR_REPORT_ID;
>  		data->writeReport[1] = 0; /* old 1 byte read count */
> @@ -468,8 +474,12 @@ static int rmi_post_resume(struct hid_device *hdev)
>  	ret = hid_hw_open(hdev);
>  	if (ret)
>  		return ret;
> -
> +	// Avoid to read rmi_hid_read_block once after system resumes.
> +	// The interrupt will be pulled down
> +	// after RMI Read command(Report ID:0x0A).
> +	data->xport.ignoreonce = 1;
>  	ret = rmi_reset_attn_mode(hdev);
> +	data->xport.ignoreonce = 0;
>  	if (ret)
>  		goto out;
>  
> diff --git a/include/linux/rmi.h b/include/linux/rmi.h
> index ab7eea01ab42..24f63ad00970 100644
> --- a/include/linux/rmi.h
> +++ b/include/linux/rmi.h
> @@ -270,6 +270,8 @@ struct rmi_transport_dev {
>  	struct rmi_device_platform_data pdata;
>  
>  	struct input_dev *input;
> +
> +	int ignoreonce;
>  };
>  
>  /**

