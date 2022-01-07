Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEAE487EE6
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 23:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiAGWXy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 17:23:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiAGWXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 17:23:53 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68D3C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 14:23:52 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so13368938pjf.3
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pDCymwx8Omad7zdyAEK0ypzRZXkTchT6a4PkPrHqPTo=;
        b=jueF4apKS6Z9ICRlqJCpWJBHZCJseuciDWA0huUGrSTczDQrPLCtPVtbthB8tp0Um0
         wb/Cla6kn6WjGPSEBdI5lQl8550dws8iosmxpy4czM8OrJ4+r0t29bPGx+m8d858hHJd
         QabMi/6t8Oich/UmuwULlXcNho6PQzxqOdtRs3Y9wIdwSa8WGiieDdE26GMTfhuFHhjo
         6XMVA4vhvnc5VV519MPTDyLeaq3IlcQHthMiyG1/LrShYAK9tgJGEVsy0Qz8h0Xu3I8W
         FrB9RterzYJ9i0AKTrIHPGqc/6jq+FvJQeRzOkNc5jcwIZVacsZ2VyeHqjSbg1x7h760
         jywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pDCymwx8Omad7zdyAEK0ypzRZXkTchT6a4PkPrHqPTo=;
        b=Tn7Llzel2zPv5QudwKkAycI/tjpf9f0M5V4THUpoGMbqV0gkTDVdgLT4cQkuFweUuh
         p/hxapaP+MxNZE/GQqCG3j5QQ2J5eofS+aCkv9h71qbZtLaD0Rd2nlBRENIT1osAPNvL
         kDBnEkkBtKlNSgxiDSyY/IDyQT/agKRLmLfxJncHEwwfsS4yIgAEgmZPxsiWdpL3gLr9
         EaYwRXk5DMGR7q57H8msKyJwcFjnhjXdgqMnwFGPQHYm6MD72Tgz19c3hdK3/gcOI0Qj
         AxrsWXTgczP5HZZjz7y/NT2DAXbqOddYKuN1LsO33Wcrjt3jPao5XngimMpOHstiYndp
         q5MQ==
X-Gm-Message-State: AOAM533COhA+mfzztEVqLglScsTArUOipuumaKJS8TIMAuwK2zE6tIuE
        Phh++QZFl6ZJfxTSDBMP6FRqcaIak2A=
X-Google-Smtp-Source: ABdhPJyhXApAPwOZiIUEpLongfn2XoOViYujQPD/Nvsc0lBvlnlZJgqka/FdnpOmnKLQWaWcM5sTbw==
X-Received: by 2002:a17:90a:c917:: with SMTP id v23mr1698876pjt.32.1641594232346;
        Fri, 07 Jan 2022 14:23:52 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id h7sm7024926pfc.152.2022.01.07.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 14:23:51 -0800 (PST)
Date:   Fri, 7 Jan 2022 14:23:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 11/18] HID: input: calculate resolution for pressure
Message-ID: <Ydi9dULolfUyygzB@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-12-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-12-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 07:17:36PM +0000, Angela Czubak wrote:
> Assume that if the pressure is given in newtons it should be normalized
> to grams. If the pressure has no unit do not calculate resolution.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>  drivers/hid/hid-input.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 81eb277dee91..b680641a30c0 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -257,6 +257,19 @@ __s32 hidinput_calc_abs_res(const struct hid_field *field, __u16 code)
>  		}
>  		break;
>  
> +	case ABS_PRESSURE:
> +	case ABS_MT_PRESSURE:
> +		if (field->unit == 0xe111) {		/* If newtons */

Using a named constant would be great.

> +			/* Convert to grams */

If you could add to the comment that 1 newton is 101.97 grams that would
be great.

> +			prev = physical_extents;
> +			physical_extents *= 10197;
> +			if (physical_extents < prev)
> +				return 0;
> +			unit_exponent -= 2;
> +		} else if (field->unit != 0x101) {	/* If not grams */
> +			return 0;
> +		}
> +		break;
>  	default:
>  		return 0;
>  	}
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

Thanks.

-- 
Dmitry
