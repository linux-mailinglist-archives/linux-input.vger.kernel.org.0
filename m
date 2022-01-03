Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63A3B48368B
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 19:04:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbiACSEX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 13:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbiACSEX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jan 2022 13:04:23 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073CBC061761
        for <linux-input@vger.kernel.org>; Mon,  3 Jan 2022 10:04:23 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id k66-20020a1ca145000000b00345fa984108so269405wme.2
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=R7k3fFd8jxoi9DJm9Wb7aWejZDrJUYcIQizYpbIBGO4=;
        b=UJoClefYd8aoSk3vCeGWfvQS3W/fF6kPAR2DtjvRLKzrin1DZBLHhKZaqMub4cRY7W
         4eXu9P8Tgv7TqOyHgjCJGHv6lQKcP6+jAwJxAF0nXKl/hTS5cK8f2MTEGVCiZpjwvwfr
         RPk27IDoSB/mJfGJndPbpEtwDXZtrw2tU0JvWjz0W8yu8bw19wyC6G23MtG/sQNNJuoe
         Ni3lp51y9xVCLi+b+zdejicfx8Z66PKocNJKzMuMA/X05KAApS+yScJzV5MY0YXKPwHc
         vzKSCjRlfoZGnROw+VyW+6N2VV4kLwW53e2LPLVcEXjLa5G3Pzn2opP5lzNJyRd0BGp8
         kY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=R7k3fFd8jxoi9DJm9Wb7aWejZDrJUYcIQizYpbIBGO4=;
        b=Gg/XjpynyKHRvqekPdpIpxxnxCU6eo8L0pte40Q2Q11Rjtl75dbrkxyarhRGIskVF6
         dbpC65x0E6pm4kEUxL6Upn1veHE50XtVrVAHxnF9aBDBHbQOH3pw5a3qsGRYiodAhBSs
         aJs1eEXC+oqf2mDlBZgBbDwvd9M7SN0VsSjHTMJo8BOaMe7+AX/rZUqjhreUlaAHMIdn
         OI9NUWQq54D0E4pGYaF+P2e+tiCYKYijhRYY/xr3vyX1rDT3MrUrfuFBMHC5iLH/HIAp
         a7bkq7+KI44lfSa62eM1DosBH8pH5d5bqrOoUPYfe1YuQl281iUrOyP6blKI5W+H9Am/
         lFDQ==
X-Gm-Message-State: AOAM532Oi88rEWroxOXTZuQWyC5pP9qwHPt78LCAzIZ05O7TmEpVNpMw
        pIqOC4R+bibE7Uu8ta0v151D2Y92vOr6ew==
X-Google-Smtp-Source: ABdhPJwKZvhvc3LZDa2sbXeU/WDSreEnYdl+JghobAERxDhEPfYVLWmia88FW0UnM1g+xAheD26eBA==
X-Received: by 2002:a1c:f01a:: with SMTP id a26mr37596493wmb.175.1641233061585;
        Mon, 03 Jan 2022 10:04:21 -0800 (PST)
Received: from elementary ([217.113.240.86])
        by smtp.gmail.com with ESMTPSA id n14sm18645001wrf.107.2022.01.03.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 10:04:21 -0800 (PST)
Date:   Mon, 3 Jan 2022 19:04:18 +0100
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     benjamin@sipsolutions.net
Cc:     alexhenrie24@gmail.com, bberg@redhat.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: apple: Add 2021 magic keyboard FN key mapping
Message-ID: <20220103180418.GA17596@elementary>
References: <20211108125038.125579-1-benjamin@sipsolutions.net>
 <20220102175438.175359-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220102175438.175359-1-jose.exposito89@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 02, 2022 at 06:54:39PM +0100, José Expósito wrote: 
> Works as expected a code looks good to me.

Actually, just a little comment on the code, sorry for the extra email:

> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 2c9c5faa74a9..61dfe983828f 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -70,6 +70,28 @@ struct apple_key_translation {
>  	u8 flags;
> };
>
> +static const struct apple_key_translation apple2021_fn_keys[] = {

Since this driver handles many devices, I think that renaming this
struct to "magic_keyboard_2021_fn_keys" would help to quickly
understand which is the target device.
