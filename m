Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2AB64D89F
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 10:32:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiLOJcV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 04:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbiLOJbd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 04:31:33 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1FA262B
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:31:30 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id r83-20020a1c4456000000b003d1e906ca23so607153wma.3
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 01:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=W/yrWwIz+X4XNa4X4E55r8TlVUKYWq6C3gyUpvUfom8=;
        b=shHutoT4qGNYdXCrtBKTJGBt96pmTH6sPDKob9R+hx7YCob2zNk2vwdTefYMHkmee5
         bl8QTlsDbXDSwjfa50cTM/mx1THFgf2//ztwr5rpy4MPDnGKEyGjG22SzpBT0qiMlIKY
         LlhykvpPZBJcte6Q2GWplb7P5MB/xQmxtkB0d8OE4X1Jjd+yMKxw9gQ0cCTTdyKNlUGy
         xVtYbMH+dm3yGe/eMF/EtuoXyw/MtjWed9ElqTviSB6k1GjhowlNFMUOm5kYdN+18xH4
         EFMVK8tyLXZKPsauHRXvb2zBJyPP4R//1jgRT/iNIt036HMnAw7PtvZ/uSUWriw6OzQS
         xrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W/yrWwIz+X4XNa4X4E55r8TlVUKYWq6C3gyUpvUfom8=;
        b=JIuRFBQYEPmXktUu3CEe0LV1vPKWCLoY9h9bFiiWorkgm7rzJiMr2lkJX4HUKs6xRI
         IqOTgHyJOLEa6oY2nRUVvOEM9mmrPrIDFf/RtZ/5N1xEeS6UJkNDntCB4E7YmXpLTICQ
         qmse5gkxZv04zmJmvyEcxJljgQL2JCoI5zc8UjdEof9SmNPSmNRzJNvbrJvvGo1fk74i
         h+crrNqR8SUK8Oqc4DlWw8v3VmEf9LLVCyl2lDPud5IstCLgqZpCMtTXQOtYuZhIpTR8
         xctDBaBP8nwP8etbSL8Wnzd5xp5cAluDFHTy4IkwbxAHfkDTvu7IemP5kT369FsBKejy
         N5kA==
X-Gm-Message-State: ANoB5pkGaU6UMNRS+YOXRSQpGDRmn4xzgXvZta4l+G+KQqohzyglB7pr
        3HrzRA3Tj4wHlzZppVTzzWpb4jxguuggBQYL
X-Google-Smtp-Source: AA0mqf7Ygo7G1PA6MeEuq06su89ecSilupy81n3WsyxmBSU1uNFxz8qq+53mlv0DDzA2zDkrKeQdfg==
X-Received: by 2002:a05:600c:6543:b0:3d1:fcca:ce24 with SMTP id dn3-20020a05600c654300b003d1fccace24mr20115559wmb.32.1671096688943;
        Thu, 15 Dec 2022 01:31:28 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id z11-20020a1c4c0b000000b003c21ba7d7d6sm5398128wmf.44.2022.12.15.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 01:31:28 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 1/5] Input: iqs269a - drop unused device node references
In-Reply-To: <Y4V2OSN35Yio9JN/@nixie71>
References: <Y4V16ey6osEaaZJ/@nixie71> <Y4V2OSN35Yio9JN/@nixie71>
Date:   Thu, 15 Dec 2022 10:31:27 +0100
Message-ID: <87tu1xj9n4.fsf@baylibre.com>
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

On Mon, Nov 28, 2022 at 21:02, Jeff LaBundy <jeff@labundy.com> wrote:

> Each call to device/fwnode_get_named_child_node() must be matched
> with a call to fwnode_handle_put() once the corresponding node is
> no longer in use. This ensures a reference count remains balanced
> in the case of dynamic device tree support.
>
> Currently, the driver does not call fwnode_handle_put() on nested
> event nodes. This patch solves this problem by adding the missing
> instances of fwnode_handle_put().
>
> As part of this change, the logic which parses each channel's key
> code is gently refactored in order to reduce the number of places
> from which fwnode_handle_put() is called.
>
> Fixes: 04e49867fad1 ("Input: add support for Azoteq IQS269A")
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/misc/iqs269a.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index a348247d3d38..5620a009bf55 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -694,7 +694,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u threshold: %u\n",
>  					reg, val);
> -				return -EINVAL;
> +				error = -EINVAL;
> +				break;
>  			}
>  
>  			ch_reg->thresh[iqs269_events[i].th_offs] = val;
> @@ -707,7 +708,8 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u hysteresis: %u\n",
>  					reg, val);
> -				return -EINVAL;
> +				error = -EINVAL;
> +				break;
>  			}
>  
>  			if (i == IQS269_EVENT_DEEP_DN ||
> @@ -721,8 +723,19 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  			}
>  		}
>  
> -		if (fwnode_property_read_u32(ev_node, "linux,code", &val))
> +		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
> +		if (error && error != -EINVAL) {
> +			dev_err(&client->dev,
> +				"Failed to read channel %u code: %d\n", reg,
> +				error);
> +			break;
> +		}
> +
> +		fwnode_handle_put(ev_node);
> +		if (error) {
> +			error = 0;
>  			continue;
> +		}
>  
>  		switch (reg) {
>  		case IQS269_CHx_HALL_ACTIVE:
> @@ -744,7 +757,10 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  		iqs269->sys_reg.event_mask &= ~iqs269_events[i].mask;
>  	}
>  
> -	return 0;
> +	if (error)
> +		fwnode_handle_put(ev_node);
> +
> +	return error;
>  }
>  
>  static int iqs269_parse_prop(struct iqs269_private *iqs269)
> -- 
> 2.34.1
