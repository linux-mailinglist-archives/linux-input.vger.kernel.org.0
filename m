Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 439B05AF3F7
	for <lists+linux-input@lfdr.de>; Tue,  6 Sep 2022 20:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiIFSxK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Sep 2022 14:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIFSxH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Sep 2022 14:53:07 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D48C183F08
        for <linux-input@vger.kernel.org>; Tue,  6 Sep 2022 11:53:06 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id z9-20020a17090a468900b001ffff693b27so10961166pjf.2
        for <linux-input@vger.kernel.org>; Tue, 06 Sep 2022 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=BNO5ja7t5KTb+ctsZmYI/9V0bwEASRds/Im53jTkop8=;
        b=JAOeF8JP4lph2ZjDfZ/dVTHJeMXrcE59wSIVs7b8GRh5Nk0nzdooGOMFKpwvdSJUNH
         PzfdLlOmoCORDVHRKeHR0lsiqhOeUgCnD6zPjbts6muf43krQ/9oyccSiQx0jr18eOZj
         NzquOsxjsu+76rG/I3+v7oqon+F9n0T0al+9DCgYk/XLADwCiU/OydSI1QwITmlFb8Vb
         /bHtqyNE5Xskkx2Fgv518NNU1Ac2VpQFvHeOve7yohTJv8Vt9qYl0XLN82I+I4tb7VvQ
         Ppa3v9kwK0ReuD0RGhcLz7mI5w0ILEwe7kyTzL5ZEwXCuQIEXxkWQS9dml/sDvyRG+MI
         QpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=BNO5ja7t5KTb+ctsZmYI/9V0bwEASRds/Im53jTkop8=;
        b=XgLOSxBl8ve6k3gNkhae7tmKQjozAM+6S9HJ7jEyYe3WDj/eACUe8TaBtbB0xdNu6C
         D6Q/UpwbTcrhQCWkhm6wj8OMaLt0u4O1DELBx883sFd41KRihVhezpLRskQoGwoZ2mJ2
         85q8LeN5JjuxiKq0YJvZgizrr4wqYknLlgQRtorJ8bSKOKgdpHFEhj7EeU/+YRGO52iJ
         yfe1LblbSrO9Z+DrUsdJ7gFOHDauRB4i8XRKDLsUl/bf6lNYtRy0LWVd9TFOSYJdFTmi
         +yH1oetffyCBgxKOt9Hvcxju3u81rPU2Vg4P9pBk6TxHhz4Fr1aFJ6v69AuAQoIYK+Zv
         jzDw==
X-Gm-Message-State: ACgBeo2My6XA9s0Sg32G/+YnwzcTZYufjdEaKDQogYHRY9TvUDvG6Cln
        LDRqH0yprQM9k+itZwJ7W/g=
X-Google-Smtp-Source: AA6agR7Qw/2sqqjhTdfjpYSQFhc/3NVy5qoApF2QT1PBwygmz2l0vxKkBdsQfa+g24dUwVBzUTu1iw==
X-Received: by 2002:a17:902:76cb:b0:170:9f15:b9a1 with SMTP id j11-20020a17090276cb00b001709f15b9a1mr55353718plt.95.1662490386259;
        Tue, 06 Sep 2022 11:53:06 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id o20-20020aa79794000000b0052c7ff2ac74sm10918815pfp.17.2022.09.06.11.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 11:53:05 -0700 (PDT)
Date:   Tue, 6 Sep 2022 11:53:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anvin Paul <anvmisc@fastmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for ThrustMaster eSwap PRO
 Controller Xbox for Xbox One
Message-ID: <YxeXD8J46c/5rJaS@google.com>
References: <20220722182818.663816a8@msipc.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722182818.663816a8@msipc.lan>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 22, 2022 at 06:28:18PM -0400, Anvin Paul wrote:
> 
> From: Anvin Paul <anvmisc@fastmail.com>
> 
> Signed-off-by: Anvin Paul <anvmisc@fastmail.com>
> 

Adding Pavel Rojtber for comment.

> ---
>  drivers/input/joystick/xpad.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 18190b529bca..537ffbd53c56 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -118,6 +118,7 @@ static const struct xpad_device {
>  	{ 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
>  	{ 0x044f, 0x0f10, "Thrustmaster Modena GT Wheel", 0, XTYPE_XBOX },
>  	{ 0x044f, 0xb326, "Thrustmaster Gamepad GP XID", 0, XTYPE_XBOX360 },
> +	{ 0x044f, 0xd012, "Thrustmaster, Inc. eSwap PRO Controller Xbox", 0, XTYPE_XBOXONE },
>  	{ 0x045e, 0x0202, "Microsoft X-Box pad v1 (US)", 0, XTYPE_XBOX },
>  	{ 0x045e, 0x0285, "Microsoft X-Box pad (Japan)", 0, XTYPE_XBOX },
>  	{ 0x045e, 0x0287, "Microsoft Xbox Controller S", 0, XTYPE_XBOX },
> @@ -420,6 +421,7 @@ static const struct usb_device_id xpad_table[] = {
>  	{ USB_INTERFACE_INFO('X', 'B', 0) },	/* X-Box USB-IF not approved class */
>  	XPAD_XBOX360_VENDOR(0x0079),		/* GPD Win 2 Controller */
>  	XPAD_XBOX360_VENDOR(0x044f),		/* Thrustmaster X-Box 360 controllers */
> +	XPAD_XBOXONE_VENDOR(0x044f),            /* Thrustmaster X-Box One controllers */
>  	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
>  	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft X-Box One controllers */
>  	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
> @@ -554,6 +556,8 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
>  	XBOXONE_INIT_PKT(0x045e, 0x0b00, xboxone_s_init),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init1),
>  	XBOXONE_INIT_PKT(0x0e6f, 0x0000, xboxone_pdp_init2),
> +	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init1),
> +	XBOXONE_INIT_PKT(0x044f, 0xd012, xboxone_pdp_init2),
>  	XBOXONE_INIT_PKT(0x24c6, 0x541a, xboxone_rumblebegin_init),
>  	XBOXONE_INIT_PKT(0x24c6, 0x542a, xboxone_rumblebegin_init),
>  	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumblebegin_init),
> -- 
> 2.30.2
> 

Thanks.

-- 
Dmitry

