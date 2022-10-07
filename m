Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7C25F78B1
	for <lists+linux-input@lfdr.de>; Fri,  7 Oct 2022 15:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJGNMW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 09:12:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiJGNMV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 09:12:21 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5CBCBFED
        for <linux-input@vger.kernel.org>; Fri,  7 Oct 2022 06:12:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id n12so7223136wrp.10
        for <linux-input@vger.kernel.org>; Fri, 07 Oct 2022 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EEm6FlglyEw+PwAhNins+2eN0cPVDwBCRDy1asUjVfU=;
        b=xR12Li+sKJSlhiVzwLCB8DvnQ+p2w8iJxeUFMPrBZDR4W6HAssKW+3rJILNuCYFYB3
         yq7Suqiza6CzZnqe0wK2H5eDDsAZ1ENfDEUSSxGzytLMzr/P4Weh7m7dYaWGzh0waJlu
         TNYhmjZpGRXF5M7J5vv0s0+ThjrzqC+tPkKnLvcly9+qWUlPxlQ9Rvx2i1dcOHEdkN+B
         5+Vknlk501oFxtRlhZQMKq48ZVc3ii5iMYHVOhkfQbxj7qKpw5K8NgKNuc+nQCbzdCAs
         pz0jWdUKNQF4nQC8tIqA7yEaxmlpDk5e4Le/0EnZe2nCxj5BloUORfR9U/a1RxTukO8o
         DuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEm6FlglyEw+PwAhNins+2eN0cPVDwBCRDy1asUjVfU=;
        b=M6gV7SkPWLtJJ6UmgJlUO+a5DeqKvJBHqliKXmHPfelijoypoGUVd5IYt7KGxFGuzh
         J2aRzpU4EJRFfcwNf8sXEGwmmzoi20+V7vjf3YBx4z7COxzJ542XuTHceRqH1yb2qA6g
         n/lYAsgvaOe6QpEgengaE7Vgx0Hk17sUzyVooW1UqlzvNZWW8F37bLi604pEUWGwIUak
         sn2KyKHbPr4Dq3W23WyzWEcM1ntRnVEidW05i00GDEeEmGAROC5hBarv+jUUJGQo4ak5
         zI1U+iCnDZM6+G0xWZWCRG7lTXJLIhAzlXLaKgu3Ro7k98++tLRd78GgrktfL+4AJ46d
         v7GQ==
X-Gm-Message-State: ACrzQf2B8H+SFO9/xGvKDAy/BkOrEc9ZcVsUXfkCIniEudnp9Kbvpl/5
        IzXm65ur5VF/KOOkSCBoBu5epw==
X-Google-Smtp-Source: AMsMyM7W0EbkAOpuDIHa4+M4/2LeLrhQH+7E1eHg5/mm75fElKp5+byX0U7C7TLMLGxykVKKodLQSQ==
X-Received: by 2002:adf:a3da:0:b0:22c:d73b:38a5 with SMTP id m26-20020adfa3da000000b0022cd73b38a5mr3086755wrb.541.1665148339078;
        Fri, 07 Oct 2022 06:12:19 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:5f1e:d910:dd1e:5b09])
        by smtp.gmail.com with ESMTPSA id o11-20020a05600c510b00b003a5c244fc13sm8080918wms.2.2022.10.07.06.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 06:12:18 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: Re: [PATCH v2 3/7] Input: iqs7222 - report malformed properties
In-Reply-To: <YyP8GaYqdwVUNzPe@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71> <YyP8GaYqdwVUNzPe@nixie71>
Date:   Fri, 07 Oct 2022 15:12:17 +0200
Message-ID: <87o7un7p72.fsf@mkorpershoek-xps-13-9370.home>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 15, 2022 at 23:31, Jeff LaBundy <jeff@labundy.com> wrote:

> Nonzero return values of several calls to fwnode_property_read_u32()
> are silently ignored, leaving no way to know the properties were not
> applied in the event of an error.
>
> Solve this problem by evaluating fwnode_property_read_u32()'s return
> value, and reporting an error for any nonzero return value not equal
> to -EINVAL which indicates the property was absent altogether.
>
> Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
> Changes in v2:
>  - Used -EINVAL returned by fwnode_property_read_u32() to indicate an absent
>    optional property as opposed to calling fwnode_property_present()
>  - Updated commit message
>
>  drivers/input/misc/iqs7222.c | 43 +++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index d39b3fdfb849..36c3b24e99a3 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -1820,8 +1820,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
>  		chan_setup[4] = val * 42 + 1048;
>  
> -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> -					      &val)) {
> +		error = fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> +						 &val);
> +		if (!error) {
>  			if (val > U16_MAX) {
>  				dev_err(&client->dev,
>  					"Invalid %s reference weight: %u\n",
> @@ -1830,6 +1831,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  			}
>  
>  			chan_setup[5] = val;
> +		} else if (error != -EINVAL) {
> +			dev_err(&client->dev,
> +				"Failed to read %s reference weight: %d\n",
> +				fwnode_get_name(chan_node), error);
> +			return error;
>  		}
>  
>  		/*
> @@ -1902,9 +1908,10 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  		if (!event_node)
>  			continue;
>  
> -		if (!fwnode_property_read_u32(event_node,
> -					      "azoteq,timeout-press-ms",
> -					      &val)) {
> +		error = fwnode_property_read_u32(event_node,
> +						 "azoteq,timeout-press-ms",
> +						 &val);
> +		if (!error) {
>  			/*
>  			 * The IQS7222B employs a global pair of press timeout
>  			 * registers as opposed to channel-specific registers.
> @@ -1924,6 +1931,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  
>  			*setup &= ~(U8_MAX << i * 8);
>  			*setup |= (val / 500 << i * 8);
> +		} else if (error != -EINVAL) {
> +			dev_err(&client->dev,
> +				"Failed to read %s press timeout: %d\n",
> +				fwnode_get_name(event_node), error);

Shouldn't we call fwnode_handle_put(event_node); here?
It's what we do in the error path just above (line 2029)

With that added, feel free to include:

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> +			return error;
>  		}
>  
>  		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
> @@ -2028,7 +2040,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
>  		sldr_setup[4 + reg_offset] -= 2;
>  
> -	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
> +	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
> +	if (!error) {
>  		if (!val || val > dev_desc->sldr_res) {
>  			dev_err(&client->dev, "Invalid %s size: %u\n",
>  				fwnode_get_name(sldr_node), val);
> @@ -2042,9 +2055,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  			sldr_setup[2] |= (val / 16 <<
>  					  IQS7222_SLDR_SETUP_2_RES_SHIFT);
>  		}
> +	} else if (error != -EINVAL) {
> +		dev_err(&client->dev, "Failed to read %s size: %d\n",
> +			fwnode_get_name(sldr_node), error);
> +		return error;
>  	}
>  
> -	if (!fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val)) {
> +	error = fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val);
> +	if (!error) {
>  		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
>  			dev_err(&client->dev, "Invalid %s top speed: %u\n",
>  				fwnode_get_name(sldr_node), val);
> @@ -2057,9 +2075,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  			sldr_setup[2] &= ~IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK;
>  			sldr_setup[2] |= (val / 4);
>  		}
> +	} else if (error != -EINVAL) {
> +		dev_err(&client->dev, "Failed to read %s top speed: %d\n",
> +			fwnode_get_name(sldr_node), error);
> +		return error;
>  	}
>  
> -	if (!fwnode_property_read_u32(sldr_node, "linux,axis", &val)) {
> +	error = fwnode_property_read_u32(sldr_node, "linux,axis", &val);
> +	if (!error) {
>  		u16 sldr_max = sldr_setup[3] - 1;
>  
>  		if (!reg_offset) {
> @@ -2073,6 +2096,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  
>  		input_set_abs_params(iqs7222->keypad, val, 0, sldr_max, 0, 0);
>  		iqs7222->sl_axis[sldr_index] = val;
> +	} else if (error != -EINVAL) {
> +		dev_err(&client->dev, "Failed to read %s axis: %d\n",
> +			fwnode_get_name(sldr_node), error);
> +		return error;
>  	}
>  
>  	if (dev_desc->wheel_enable) {
> -- 
> 2.34.1
