Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E802A58F89A
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 09:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbiHKHvx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Aug 2022 03:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234470AbiHKHvk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Aug 2022 03:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F4456261
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 00:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660204297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MRRDPmaXaOI7KYfth4LauhUxcMLLOLTg9h0zPP92dWo=;
        b=d9UcXrJbbYOjN2Q+3H8ab0RpO2x29LfuFhrhtadFWKkDafMbwvAtQPqc9plor+DfbrBTJ2
        2tXmGL1Kmxk/HfkKAdJ8Cf5RFWS6LUefNzvMcn/s+FU9XP0vQHnYQLfi4gPZ6T6tqGf1db
        I9QKyM6d28I7H6D6p6VxxtBjk0paaZw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-yoDFSEhEPqGUaGdZFDBA3g-1; Thu, 11 Aug 2022 03:51:36 -0400
X-MC-Unique: yoDFSEhEPqGUaGdZFDBA3g-1
Received: by mail-ed1-f70.google.com with SMTP id l19-20020a056402255300b0043df64f9a0fso10469863edb.16
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 00:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=MRRDPmaXaOI7KYfth4LauhUxcMLLOLTg9h0zPP92dWo=;
        b=dxHDQa0QkXr66EN7kZ3BHA8XObp1Sc6D0qGEg2ipu/XH7TbDBucA+SL/Wc9gbSlwNi
         SldzSN6J7i95d+1kkQIZZOds7iRQEuLjvq9Pn6p+p6iIYsflSsJFVjI4K7ozGj21VuTJ
         7Wg+izEIeg8bzGKXeL+7fQdp/dJqsMlgoi2EIkOJEBx+5kg1wkZhEp/Hd/Qw/jEjQxkz
         5UHBhayxQ2VYUBQsd02cAY2j8D4DOQFi4H/Qi7RVDZU1lmeYdqF0enwT9eXr5aX2dOga
         qXfZZarlV0JSOvtJ4E8TxKlVkFQPFIDmiTQTYwsshMZ56WGFljnc6LHVz/Dc1hGQCM6K
         c6/A==
X-Gm-Message-State: ACgBeo00Ah1waRunygMDvTt303S3zXnn42Mmutw1ZRIKSxoL44fLeo0o
        LNLoKzl9eyhKKoMHjF2Ipqyo2nKUYph04fI6OmosztL771jn9/UAlmKJWFhsAMDyCoD5LSS1M7R
        MhYkp3nDSdT1/FWJOEn6r1HQ=
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id q6-20020aa7cc06000000b004407258ad16mr19589120edt.74.1660204295160;
        Thu, 11 Aug 2022 00:51:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6BY45a1yXinu+X4F4KpPFoeHanngbL0sqYvpsvDnQEGErO7y45y403n7xviOctxM1amRberQ==
X-Received: by 2002:aa7:cc06:0:b0:440:7258:ad16 with SMTP id q6-20020aa7cc06000000b004407258ad16mr19589107edt.74.1660204294944;
        Thu, 11 Aug 2022 00:51:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k11-20020a170906578b00b00730b933410csm3264178ejq.145.2022.08.11.00.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 00:51:34 -0700 (PDT)
Message-ID: <4d585a6a-adc5-0799-596b-d2bdea8529f3@redhat.com>
Date:   Thu, 11 Aug 2022 09:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3] HID: HID-rmi - ignore to rmi_hid_read_block after
 system resumes.
Content-Language: en-US
To:     margeyang <marge.yang@synaptics.corp-partner.google.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com
References: <1660186712-2598-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1660186712-2598-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/11/22 04:58, margeyang wrote:
> From: Marge Yang <marge.yang@synaptics.corp-partner.google.com>
> 
> The interrupt GPIO will be pulled down once
> after RMI driver reads this command(Report ID:0x0A).
> It will cause "Dark resume test fail" for chromebook device.
> Hence, TP driver will ignore rmi_hid_read_block function once
> after system resumes.
> 
> Signed-off-by: Marge Yang<marge.yang@synaptics.corp-partner.google.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/hid/hid-rmi.c | 14 ++++++++++++--
>  include/linux/rmi.h   |  2 ++
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 311eee599ce9..fdaf2c4ce181 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -203,7 +203,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
>  		if (ret < 0)
>  			goto exit;
>  	}
> -
> +	if (xport->ignoreonce == 1) {
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

