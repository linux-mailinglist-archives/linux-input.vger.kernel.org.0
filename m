Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 650BE2C97F7
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgLAHSU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:18:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727285AbgLAHST (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:18:19 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965A0C0613D3;
        Mon, 30 Nov 2020 23:17:39 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id bj5so645836plb.4;
        Mon, 30 Nov 2020 23:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ktm76yhVPRRk+kZ212ryTQ2DswODQ+X+jLoY6aWcEQ8=;
        b=bElAwsJvMMp8Rqsn4PHtBA7mFwjQJnaYaHOlE5aDseHYqFu+owKK9sbbHKoMEutnEQ
         I1P4Bx2WN1fwf6RUiO62kB57YkzxTahCVveuoEE6zW/ib0YwIrs4JiD1fEDeKlwrVOj2
         Ju9obMppx2wg5m076kGydsNQX4OpZWyABDX91vZYQmB2vz7M3vr3uyIWHIcYXicZFXGY
         ml1I+8OWKmsAi2w/gP85rN84/zoL6wOHRJGA7ZBsyo4UNx+Kws7vD6r4w5wmc+bjA3zT
         QbKhO3VWETxzp/4YJyNax5ZZt7bbCALAryoJMy3pm3F2oKpaOw2nA3ZfR8pnfU6sJwN9
         M79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ktm76yhVPRRk+kZ212ryTQ2DswODQ+X+jLoY6aWcEQ8=;
        b=i8edGEmqhFhupdvsmRLiYNideMhzCyik+GwAZS898/Jy/qHFXyD2SLoX+UT/jPIJoZ
         Hx5vFaElQ90KvImaA0hDuOBQogWL/d/23TTCSY+OkGxzvHzgu2J37UXb7f2MRFp0ywT3
         K5JA+VVRZiWZ3Su5i3r3Q2t9XCqC5E4vxSZVIjIPJ9fwn5vYuvGkZaoVBlBtJifGBsOb
         ElXSqSHTMkzoX+fRrPFWHzbLPUquuKyr0vUmksZdmyXVVNaVPWjUhvV26lrv9Z+n3XXb
         HNZES3NUCzDFHtN76d5nZq5J1kxIQHbhvCZ702zErya4Duq2RcY6QHPtEKP8xss5rTuL
         lhpQ==
X-Gm-Message-State: AOAM532gk+dEcZqUlOA7Or6KVZmMjWxVUP1pN9SetwLeMuDuw4TWIzng
        3MpAYSfsN7RCH4mP4WNfXwM=
X-Google-Smtp-Source: ABdhPJwj2Y/a/ZN1RJbJTAS1G7GLEN+b2J+fETjoeomYvg8AT1LXsPxXeeKQPtbEWoUGkD3KNECz/Q==
X-Received: by 2002:a17:902:9891:b029:d8:fdf6:7c04 with SMTP id s17-20020a1709029891b02900d8fdf67c04mr1654859plp.54.1606807059045;
        Mon, 30 Nov 2020 23:17:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g9sm1273504pgk.73.2020.11.30.23.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:17:38 -0800 (PST)
Date:   Mon, 30 Nov 2020 23:17:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     sanjay.govind9@gmail.com
Cc:     aicommander@gmail.com, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] INPUT: xpad: support Ardwiino Controllers
Message-ID: <20201201071735.GU2034289@dtor-ws>
References: <20201201064844.128122-1-sanjay.govind9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201064844.128122-1-sanjay.govind9@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sanjay,

On Tue, Dec 01, 2020 at 07:48:45PM +1300, sanjay.govind9@gmail.com wrote:
> From: Sanjay Govind <sanjay.govind9@gmail.com>
> 
> This commit adds support for Ardwiino Controllers

Thank you for resending the patch, it now is formatted properly. However
I believe you need to also add information about Ardwiino controllers to
xpad_device table so that they are properly identified by the kernel.

Thanks.

> 
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c77cdb3b62b5..c9d78e2acb38 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -418,6 +418,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
>  	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
>  	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
> +	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */
>  	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
>  	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
>  	XPAD_XBOX360_VENDOR(0x146b),		/* BigBen Interactive Controllers */
> -- 
> 2.29.2
> 

-- 
Dmitry
