Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0B852C985F
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728260AbgLAHp5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgLAHp4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:45:56 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90894C0613CF;
        Mon, 30 Nov 2020 23:45:16 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id e5so726549pjt.0;
        Mon, 30 Nov 2020 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ol7jpdvzbCmd0YeKibG0Nqf6Ph3AeJ40wR2hOQq+vH8=;
        b=MuKLxcwY5AQOwIylpNZK7721sCfArY1jz+ONvFTLZySvIP3E0Jy/jgYm2lKfY+oUwS
         cz/h1Snn58jRdikHapmq1u2rrBux3aPd7r1jy2RUbgVYaCsWkN6uuQGY1LRG+Dvb3czp
         Cubunz8zeoPH3AYZTsQ72+x4VyvzbaxnEU4o4GVjVSAyOtivL6iYstChqq76Tt0lAE5m
         k6RpFnUtENWKn6/EQ/skXKQWk3y9wppXYh9Kqx0uYhuuG1nMvspQe3E8siq8OOdJpq46
         dXS9BoMBK2rb8uX0MbKQoKgEnPl2SMXjxVN7hfoZR0rTeztGLwV79oPcmKt87FGWEDsB
         nBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ol7jpdvzbCmd0YeKibG0Nqf6Ph3AeJ40wR2hOQq+vH8=;
        b=pzgxZm5yQ/G5MyjjH/cM2UinWeG0/Rh+bj4dq8oiGymVr6y2ZS+DwSvFp5a4E1y7u+
         rJTCh+GLqW6/rI1smqulz56Xdbrx5VFzVIfk4N3FTi1KVKgmNOAH/JrXmlZ6QeNbP09b
         hFCJW4NzGePo+B8wI7AZnl0Smd1bh5Oz5/C7Oeog7Kqc9WkEkfpqW0ny5wla+1gZFG8n
         SvEHwhv39fQWNPJEEQBNLS5d0W4mW8PTl+YqnOsuXQ2mDm85M7CvxWDKOyJXxrNaX/iC
         Xj/J1Wqi9of/+IQyzmufRf40ldSGND1+twQmDuGSU2q/48JlxHSZdt8J/IPD+xxU1dgE
         U+Tw==
X-Gm-Message-State: AOAM531QXcmWoZET/ybvvnG8PLSQA23BENr5rX/9BvMfZZ27Forn04in
        x9dl0fX+QMcYgVnuem+2dBU=
X-Google-Smtp-Source: ABdhPJwuuSSo1tmFFTvPI8VW3iRIczZH+0YDzvq0GP0D8rvyXJLdBwoPZvhC1ykgaSymJTRXH8WNOw==
X-Received: by 2002:a17:90b:4a10:: with SMTP id kk16mr1499705pjb.30.1606808716049;
        Mon, 30 Nov 2020 23:45:16 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b8sm1446222pgk.7.2020.11.30.23.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:45:15 -0800 (PST)
Date:   Mon, 30 Nov 2020 23:45:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     sanjay.govind9@gmail.com
Cc:     aicommander@gmail.com, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] INPUT: xpad: support Ardwiino Controllers
Message-ID: <20201201074513.GW2034289@dtor-ws>
References: <20201201071922.131666-1-sanjay.govind9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201071922.131666-1-sanjay.govind9@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sanjay,

On Tue, Dec 01, 2020 at 08:19:23PM +1300, sanjay.govind9@gmail.com wrote:
> From: Sanjay Govind <sanjay.govind9@gmail.com>
> 
> This commit adds support for Ardwiino Controllers
> 
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index c77cdb3b62b5..91a5c7e7bdd2 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -245,6 +245,7 @@ static const struct xpad_device {
>  	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
>  	{ 0x12ab, 0x0303, "Mortal Kombat Klassic FightStick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
>  	{ 0x12ab, 0x8809, "Xbox DDR dancepad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
> +	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },

I moved this line above the entries for 12ab vendor and applied, thank
you.

>  	{ 0x1430, 0x4748, "RedOctane Guitar Hero X-plorer", 0, XTYPE_XBOX360 },
>  	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
>  	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
> @@ -418,6 +419,7 @@ static const struct usb_device_id xpad_table[] = {
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
