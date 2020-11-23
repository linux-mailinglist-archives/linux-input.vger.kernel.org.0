Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C872C0070
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 08:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgKWHDK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 02:03:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgKWHDK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 02:03:10 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B41AC0613CF;
        Sun, 22 Nov 2020 23:03:10 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f17so4845679pge.6;
        Sun, 22 Nov 2020 23:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9RBH4CEQeKv3QQ2HowNcvZ0JGxEgVaoKmmZTSuJy1QQ=;
        b=WVfBAt80F77wLfpKpqTA0EI+AH6/fq8BBay621LCAqiaIu0QMmeCMSBZM6wF/xtly2
         QeSCsYyj2/mjuV5f9ADNrXAvaJY/APjrrI5SFRw58MiQk6P+LKOP1hd7LgjCpvGYR5/J
         Uem1bRtB9yKHRRx2E4Z4cpTnzC6xVrnHqecNIvDSd9ZzlCtroTAbJmt973Fes+D2Ry1E
         cDMSQLnl6n6q//mWv7QDJAvkUmFoItKUkelidjhJD/b4OTynV+5edJiUsZZTg0IJTxwz
         bIsGuAhFdNxpsRJXis/pbk0gB3KAomH89HOlF4nOn399bAGOQ9H7fmckv40mlfeEQy6q
         9yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9RBH4CEQeKv3QQ2HowNcvZ0JGxEgVaoKmmZTSuJy1QQ=;
        b=bQF/rhThmWFkZv44Y+fCehMNitOPw51OVvKdCRKJfV9y2n7rL6BBHUYv1XlFjCn8CX
         4TvRUQYAvN0sQUYeFLho27VTe353OxeskxuJg4UQKGrWWoMa3bxnIthaupYwb4r2nWbl
         syDfs89IFBJBDFazoepmAzy+aONBis6LpkT93IhYMikYs6qYp/f7T+BtKPssZgl1bnLz
         QD7HaaTBgIwPTlnaGprU8M62XY1LNoDtZGWDTFjn8hz2LxcIqkBFekmtXibq7e9DkKNb
         iZ7BTzdPOcwHDBsfESnSguv8jUoXEBwJ/KJR4rgiwuubghSYO1Zee6Zr8HYDFXUeIPgx
         rKGA==
X-Gm-Message-State: AOAM530yUtYi02/vHrNpoaNhJyyfSJHeSzV2TCtf3/IfKgwFlyE59x+1
        qJ1whySazyn79XlLBl2GjtI=
X-Google-Smtp-Source: ABdhPJwmn7BBwhWYfnHUNPTPvyDJSt14oEqGxBLiJiRLY/cgCJulwWWkKBDb+NbLH4P94zFSN96/7Q==
X-Received: by 2002:a63:1107:: with SMTP id g7mr417736pgl.432.1606114989977;
        Sun, 22 Nov 2020 23:03:09 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id r7sm4855891pjd.8.2020.11.22.23.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 23:03:09 -0800 (PST)
Date:   Sun, 22 Nov 2020 23:03:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: Add support for Azoteq IQS626A
Message-ID: <20201123070307.GE2034289@dtor-ws>
References: <1606084748-4097-1-git-send-email-jeff@labundy.com>
 <1606084748-4097-3-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606084748-4097-3-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

On Sun, Nov 22, 2020 at 04:39:08PM -0600, Jeff LaBundy wrote:
> +
> +		if ((sys_reg->active & tp_mask) == tp_mask)
> +			input_set_abs_params(iqs626->trackpad,
> +					     ABS_X, 0, 255, 0, 0);
> +		else
> +			input_set_abs_params(iqs626->trackpad,
> +					     ABS_X, 0, 128, 0, 0);
> +#ifdef CONFIG_TOUCHSCREEN_PROPERTIES
> +		touchscreen_parse_properties(iqs626->trackpad, false,
> +					     &iqs626->prop);
> +#endif /* CONFIG_TOUCHSCREEN_PROPERTIES */

This should not be separately selectable from CONFIG_INPUT, so there is
not need to have this guard.

The reason it is a separate symbol is historical - it used to depend on
OF in addition to INPUT. I suppose I can drop it now.

Thanks.

-- 
Dmitry
