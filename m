Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A206592DF1
	for <lists+linux-input@lfdr.de>; Mon, 15 Aug 2022 13:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiHOLMs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Aug 2022 07:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231407AbiHOLMr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Aug 2022 07:12:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2D0FD186D2
        for <linux-input@vger.kernel.org>; Mon, 15 Aug 2022 04:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660561965;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gFp3W6BL3fPIATzoaIDjNSxNeokQf5MfvJg+UMifmfQ=;
        b=DAyg6OtzFg7jtTpwmRH8ixPfXLE085mLqmGzS6LBFbOcbEecavOtJnnWTNPyI59DmGjuCi
        nE+fu7q2QjN2lpVM4x2MtRDKctwYYWl7XCRRzAxq5ALDy9+NgXm+DunAavcn9XYneomKPG
        cpGKkjV4Ax9uzv86vuvK53re/khP8dM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-On6xH5vVOaa0hghalFBmtw-1; Mon, 15 Aug 2022 07:12:44 -0400
X-MC-Unique: On6xH5vVOaa0hghalFBmtw-1
Received: by mail-ed1-f71.google.com with SMTP id m22-20020a056402431600b0043d6a88130aso4534902edc.18
        for <linux-input@vger.kernel.org>; Mon, 15 Aug 2022 04:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gFp3W6BL3fPIATzoaIDjNSxNeokQf5MfvJg+UMifmfQ=;
        b=RWI7OgXaKl7yO3thwnovvSFqpPZc2SOQoFh7Sa7AHQBxtQs6cW7RgUDocmPdHPtjtr
         SqyrdmUEeoKwE6U+W+1tKtmAiAAtyyjbsaS0s/AN9jqJPE6UeLstF0G2mSFBdmXh/loi
         bl8L/RxTjBqzSjfBytJFRoUOMN5hExBbqp9h3qFOQFnVPvmFVieo/0sBMASlIANHyk6j
         e4mKOdQGm3iq4kzWvsfi4R10cmFIQ5xHPhA5nM4EM5XTks35RABdRnEaCOn0L+D++Rxb
         0maauqL2hFUUTzinV4/6FvoaT8acb8Tnhl4o3J3K2Dvg3fz3wEXw2Hg2gwRl/qMnLoVF
         DP6Q==
X-Gm-Message-State: ACgBeo3uqNB7ieM4GGTdp+UY65hxTTFDzPQhA+cESaqvFvJ0Se4SnG00
        5+j1kFe4HstMG+y7z+RSCaUrqyyJGhAr84eIa0VObLJ8LLpjCkXkf4wsvq3vuiOJGnsKJC/GnSX
        8/7VeCfEG40/nNTCMeAOjnbw=
X-Received: by 2002:a17:907:2724:b0:730:da23:5b60 with SMTP id d4-20020a170907272400b00730da235b60mr10219808ejl.43.1660561962974;
        Mon, 15 Aug 2022 04:12:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5wZ7w5+r9IApeEYMQulov2duZeNpGHgEyZKKfi0eNrzl7Psi9BgvjiUBlPBvjIdR6JoMDqBw==
X-Received: by 2002:a17:907:2724:b0:730:da23:5b60 with SMTP id d4-20020a170907272400b00730da235b60mr10219800ejl.43.1660561962813;
        Mon, 15 Aug 2022 04:12:42 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s9-20020a056402014900b0043b7917b1a4sm6435934edu.43.2022.08.15.04.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 04:12:42 -0700 (PDT)
Message-ID: <6b983378-a9f6-0514-89b1-7e79d58dc613@redhat.com>
Date:   Mon, 15 Aug 2022 13:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V4] HID: HID-rmi - ignore to rmi_hid_read_block after
 system resumes.
Content-Language: en-US
To:     margeyang <marge.yang@synaptics.corp-partner.google.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, benjamin.tissoires@redhat.com,
        dancarpenter@oracle.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com
References: <1660559178-5323-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1660559178-5323-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/15/22 12:26, margeyang wrote:
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
>  drivers/hid/hid-rmi.c | 14 +++++++++++++-
>  include/linux/rmi.h   |  2 ++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
> index 311eee599ce9..45eacb0b8dae 100644
> --- a/drivers/hid/hid-rmi.c
> +++ b/drivers/hid/hid-rmi.c
> @@ -190,7 +190,7 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
>  {
>  	struct rmi_data *data = container_of(xport, struct rmi_data, xport);
>  	struct hid_device *hdev = data->hdev;
> -	int ret;
> +	int ret = 0;
>  	int bytes_read;
>  	int bytes_needed;
>  	int retries;
> @@ -204,6 +204,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
>  			goto exit;
>  	}
>  
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
> @@ -469,7 +476,12 @@ static int rmi_post_resume(struct hid_device *hdev)
>  	if (ret)
>  		return ret;
>  
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

