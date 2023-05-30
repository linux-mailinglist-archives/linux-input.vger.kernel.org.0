Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC257160E9
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 15:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbjE3NAj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 09:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbjE3NAf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 09:00:35 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D57188
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 06:00:14 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso46984355e9.0
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685451609; x=1688043609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AeVUrfWlkR/1514M7PbzEAhYnPL8N4FACbZvL96212Q=;
        b=ZPS8GnO+6xZ4DxXSihlKlS/q/vuVxrf0A8Z/RuOMuBv7ixKyDycU/EbRdKw9ZgPWdD
         lhKzWXVW5sF048df5b904G2p45TjgqyPuepCNu+rjG61NluxuithR5QowyByk8DYlrmN
         9U3DA5JJ02ydON6UdlK8QaLpgChohxbzPP2Llw4y9lX/6fXuWSsRrYxIiKPuEn0Yg8wt
         PrElzK7t+TMDLzpiYTQL2dLlP4UBeSsetSwc2lHGW2L9xfIUvlp1EpO/YxiDBvmV2kBG
         kIxTpdvZvP0s85V9OdjlRYK+QdRnq9DCptDaT6JYH64ORQ/ihKP2VluA3X1bPuEqYwWG
         MlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685451609; x=1688043609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AeVUrfWlkR/1514M7PbzEAhYnPL8N4FACbZvL96212Q=;
        b=FGoMY0Ne5Hsrs4WpZ9uTnrZm2EdDpxkIDHbTptWNjeUAUNe8CUUQUcqdKojEzcJVUn
         BpJcicxGhx5GR3AKnpG/ZUCZhcP4t9LEUlgI3ekHo2yC3SXgNQJItrQ60Bl77wci/UV8
         /lCDrWjAu+GoWfiaSEZ0vVLqEFcrZl5Gm/8rOQazjGamH+0GFc0KuxsAPSWOFy7OFMK6
         mRUEUK04c5syYp1WlGhiSvkVUd6e+Rbf8VUNny8k6npH5ZRgSg4HpXrEB0JdQ68jTL28
         H82CmJHIki0PYl+SpCi0d4mxJ3qc/H70YxJdOu0/qI0Kl4ByCs2LUjju+8cAbhxEQOpp
         LjZA==
X-Gm-Message-State: AC+VfDxDZlytDY0y7jk/KJFOP68Cf5VDC1BvuIYex96LcYdGaPpIhTLM
        wfBM//oCXAK8/+peAcIIPcAyaw==
X-Google-Smtp-Source: ACHHUZ4+g3KxbEjPI64Xl/LfZCqIoCK3vNyDti6ChgamkfoNnzd/+kwe4R7OXrcxGoslfaj0QRjI7g==
X-Received: by 2002:a1c:cc17:0:b0:3f4:27ff:7d52 with SMTP id h23-20020a1ccc17000000b003f427ff7d52mr1648423wmb.2.1685451609134;
        Tue, 30 May 2023 06:00:09 -0700 (PDT)
Received: from [192.168.0.84] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c294b00b003f6129d2e30sm20962862wmd.1.2023.05.30.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:00:08 -0700 (PDT)
Message-ID: <f3582004-6732-8a3b-aedb-4a25f71c0cb6@linaro.org>
Date:   Tue, 30 May 2023 14:00:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] Input: pm8941-powerkey - fix debounce on gen2+ PMICs
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
 <20230529-pm8941-pwrkey-debounce-v1-2-c043a6d5c814@linaro.org>
 <d3e6a788-ecab-dd12-f091-279157ea3ad5@linaro.org>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <d3e6a788-ecab-dd12-f091-279157ea3ad5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 30/05/2023 10:36, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 21:55, Caleb Connolly wrote:
>> Since PM8998/PM660, the power key debounce register was redefined to
>> support shorter debounce times. On PM8941 the shortest debounce time
>> (represented by register value 0) was 15625us, on PM8998 the shortest
>> debounce time is 62us, with the default being 2ms.
>>
>> Adjust the bit shift to correctly program debounce on PM8998 and newer.
>>
>> Fixes: 68c581d5e7d8 ("Input: add Qualcomm PM8941 power key driver")
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>> This patch shouldn't be backported earlier then 5.4, as that is the
>> first kernel with support for PM8998.
>> ---
>>  drivers/input/misc/pm8941-pwrkey.c | 19 +++++++++++++++----
>>  1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
>> index b6a27ebae977..74d77d8aaeff 100644
>> --- a/drivers/input/misc/pm8941-pwrkey.c
>> +++ b/drivers/input/misc/pm8941-pwrkey.c
>> @@ -50,7 +50,10 @@
>>  #define  PON_RESIN_PULL_UP		BIT(0)
>>  
>>  #define PON_DBC_CTL			0x71
>> -#define  PON_DBC_DELAY_MASK		0x7
>> +#define  PON_DBC_DELAY_MASK_GEN1	0x7
>> +#define  PON_DBC_DELAY_MASK_GEN2	0xf
>> +#define  PON_DBC_SHIFT_GEN1		6
>> +#define  PON_DBC_SHIFT_GEN2		14
> mask+shift -> field_prep/get?

I figured it was better to keep it consistent and try to minimise the
diff so that backporting is easier.

Migrating over to bitfield helpers probably makes sense to do as a
separate change - maybe if a new platform comes along and requires even
more additional complexity?
> 
> Nice find!
> 
> Konrad
>>  
>>  struct pm8941_data {
>>  	unsigned int	pull_up_bit;
>> @@ -247,7 +250,7 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>>  	struct device *parent;
>>  	struct device_node *regmap_node;
>>  	const __be32 *addr;
>> -	u32 req_delay;
>> +	u32 req_delay, mask, delay_shift;
>>  	int error;
>>  
>>  	if (of_property_read_u32(pdev->dev.of_node, "debounce", &req_delay))
>> @@ -336,12 +339,20 @@ static int pm8941_pwrkey_probe(struct platform_device *pdev)
>>  	pwrkey->input->phys = pwrkey->data->phys;
>>  
>>  	if (pwrkey->data->supports_debounce_config) {
>> -		req_delay = (req_delay << 6) / USEC_PER_SEC;
>> +		if (pwrkey->subtype >= PON_SUBTYPE_GEN2_PRIMARY) {
>> +			mask = PON_DBC_DELAY_MASK_GEN2;
>> +			delay_shift = PON_DBC_SHIFT_GEN2;
>> +		} else {
>> +			mask = PON_DBC_DELAY_MASK_GEN1;
>> +			delay_shift = PON_DBC_SHIFT_GEN1;
>> +		}
>> +
>> +		req_delay = (req_delay << delay_shift) / USEC_PER_SEC;
>>  		req_delay = ilog2(req_delay);
>>  
>>  		error = regmap_update_bits(pwrkey->regmap,
>>  					   pwrkey->baseaddr + PON_DBC_CTL,
>> -					   PON_DBC_DELAY_MASK,
>> +					   mask,
>>  					   req_delay);
>>  		if (error) {
>>  			dev_err(&pdev->dev, "failed to set debounce: %d\n",
>>

-- 
// Caleb (they/them)
