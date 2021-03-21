Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCAC343488
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 21:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhCUULH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 16:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCUUKu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 16:10:50 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC44C061574;
        Sun, 21 Mar 2021 13:10:50 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y200so9566172pfb.5;
        Sun, 21 Mar 2021 13:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6jkE3GW+zmrbdeafxlOqDAK2uMZScW09eW3YyFwBAsk=;
        b=pXvEUpyStJx2rs81Ah6H5dKK3uMSsxtQtR4qMLlSQcPMd18S6cxXB9WgUsw+Mk3lBi
         qO4cs/HBDGUYcE9kMfIEnSiaV0xlmkhYetCUp9FLzzgSNrdVkAh2CUmjWIerDMDOotBa
         2nk7anX02tcx3bxSiY3wzkmAZcJrTOSvi/bq+V9q1w1m8qfTho0ctxFJjPTklTDNRZol
         OJ4K9CsiPl2HxjCBYxt5e3vk2j/7NlVn3SV+9eYxiZglvHApZH/dzDQldaSw4s1uPxaK
         tsSya5Ap7pBG6XM4kxb4Jws6CZlIh5DCYwcILEDZxAU7s1FVbfwLzTkb2gpc4Hw6hMvo
         jN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6jkE3GW+zmrbdeafxlOqDAK2uMZScW09eW3YyFwBAsk=;
        b=tbmeUjLsXQ1GIw3SY0jNtm2obk71srmc2AOz2cSkvfXNTrHn3s0nk9pChddfWVEzpE
         ryv//xOCMZYKeGNl6Pb7vubCkd4RHY0zYZaOFf+/HNT7NhkY7uVDCJhBi20NYHaZa7fV
         p8576JOKcuMMuA2iVG9J9IKgUp1WpCTixAAiM0YqoDPWOyB1EaLNXE8wJOUcH9Cee0Gg
         Qs0iGZY4B5TOCEmeqFVexNPZrbCGmCeLjMEUZfbREu72yus5AD7v2vEIrWqK5HNnuDix
         qovDk03dqP2L2BQsGk74sYWEfThA+ZHULA4/bYYkWj6VgCkUna+I1JnRxcqVB45re9IE
         BB4g==
X-Gm-Message-State: AOAM5306b2OHZVqTwpahXXvrYgzVwmQhFyGh7pnJRxrvQu6stuVnpw19
        1HWMhmxyPQIiCv5ft0KDK9E=
X-Google-Smtp-Source: ABdhPJy6GwcEFTJaz9fyeqh3ikf5oOsaP6Tzt5bzGK+i7yfeRob1pAGffriw5Ov5FmTY/U6/RbyV3A==
X-Received: by 2002:a62:ac1a:0:b029:1f9:5ca4:dd4d with SMTP id v26-20020a62ac1a0000b02901f95ca4dd4dmr18660209pfe.68.1616357449842;
        Sun, 21 Mar 2021 13:10:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id 25sm11317292pfh.199.2021.03.21.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 13:10:48 -0700 (PDT)
Date:   Sun, 21 Mar 2021 13:10:45 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v3 6/9] Input: wacom_i2c - Clean up the query device
 fields
Message-ID: <YFeoRagM0pub+Whd@google.com>
References: <20210321141049.148-1-alistair@alistair23.me>
 <20210321141049.148-7-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210321141049.148-7-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 21, 2021 at 10:10:46AM -0400, Alistair Francis wrote:
> Improve the query device fields to be more verbose.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 71 +++++++++++++++++++--------
...
>  
> +	rstc = devm_reset_control_get_optional_exclusive(&client->dev, NULL);
> +	if (IS_ERR(rstc))
> +		dev_err(&client->dev, "Failed to get reset control before init\n");
> +	else
> +		reset_control_reset(rstc);

This seems misplaced. Also, reset controls are typically for resetting
the system, for resetting peripherals we expose reset GPIO lines.

Thanks.

-- 
Dmitry
