Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB077487EB1
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 22:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbiAGV6f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 16:58:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiAGV6e (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 16:58:34 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6683CC061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 13:58:34 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id t32so6598166pgm.7
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 13:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MDu58HdqyL2YnEiUoWrd3J7O0WkwmS2OQxPSSVABKuE=;
        b=bxzi/rF1wuA/r1a8uFNZjJbIWqd9Dm96SG161jBPa0dbbcckyyoHFDNbW072vasTSc
         VMzjvrLG4mjlbdla7Glzn5ZkPANBk4HVgGbkyREMoWmSo9Kx2nUNG2KOsS9iVHAxyMOz
         R1sDKG3EAnegK4ACClVlqLQljqYAz9s8hNNvPUAjwZj40gcZvajXPMnleCpHohFMLo0O
         kEWz3OQ11ChF7DU/gk6VSyN+OMaO9bjNR+1E4IPe+7lAHxedZlV3Vx0an24B86bwYUyk
         7WU/Gy99t6/4980WtqzD9IKz//4JasBBEJk3vk4ew8D4Lw+/M1C4l4p0gwI69c8DrDAW
         acOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MDu58HdqyL2YnEiUoWrd3J7O0WkwmS2OQxPSSVABKuE=;
        b=orzQDRBtVe1ZX/i3ySvaWMQVjoEeZ1PBTsm2ADzDjdQfjYJQaQO9t9qasOhGhbtsbo
         LnrgEXcArGWKOWa221LO/Zqg11ibXaxr//fWSz+OoHEruaMyYl9EbhFEsr4jVxfYKCP8
         k9D/HdMMMHsVOKJa5yhX/UHiRfvBhQxGPyL2A3SiZOyWZXOMyrJmIFO3EdBd3R/mUhe6
         YmlfXnPXV2zXG0gKvVfMyiREMCZvjy/Y6asv5g6xmg9cTBVRrlj8DUG1BxPQ0fo8l3lt
         tsLCqDsBMOnBr9JJ/KxFnuMT0rXR59a5ZTxkPtSr/McXI9XXlh9YXRr+iXj8daOd0Cil
         Q6QQ==
X-Gm-Message-State: AOAM533ZIoz7cdUFIfNcwfy5Gw/2spOvygaS+mEGnmlS96DHHnjRrFis
        FAZAkQT17pO2y7b4wv0hPuk=
X-Google-Smtp-Source: ABdhPJyrvNoImJR1dCJ5+DOWiNntbQR2pWKw7XLrPvnJSADmKSQmrDf+ygkuQiWSmSa+FO5exC1xnA==
X-Received: by 2002:aa7:9f09:0:b0:4bc:683b:439 with SMTP id g9-20020aa79f09000000b004bc683b0439mr36517090pfr.86.1641592713805;
        Fri, 07 Jan 2022 13:58:33 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id t10sm7087708pfg.105.2022.01.07.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:58:32 -0800 (PST)
Date:   Fri, 7 Jan 2022 13:58:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 07/18] HID: input: allow mapping of haptic output
Message-ID: <Ydi3hiY5kkc2RJFj@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-8-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-8-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 07:17:32PM +0000, Angela Czubak wrote:
> This change makes it possible to parse output reports by input mapping
> functions by HID drivers.
> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>

Please send to Jiri/Benjamin.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/hid/hid-input.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 03f994541981..81eb277dee91 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -599,9 +599,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>  	if (field->report_count < 1)
>  		goto ignore;
>  
> -	/* only LED usages are supported in output fields */
> +	/* only LED and HAPTIC usages are supported in output fields */
>  	if (field->report_type == HID_OUTPUT_REPORT &&
> -			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
> +	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
> +	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
>  		goto ignore;
>  	}
>  
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

-- 
Dmitry
