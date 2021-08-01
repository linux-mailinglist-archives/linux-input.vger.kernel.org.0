Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DEA3DCC2F
	for <lists+linux-input@lfdr.de>; Sun,  1 Aug 2021 17:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbhHAPAV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Aug 2021 11:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhHAPAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Aug 2021 11:00:20 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5479AC06175F;
        Sun,  1 Aug 2021 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=AOECMWGb6nlNA2AbjBlqi2+81wz9/r/lBwa4HJp9G3Y=; b=bGoZWtrP0uQrkKF82Ut6ZEpqW
        x/kicol0i5zLftC4zx1Qg1ZZi16OVdGHPYh/0ar0hmeKmbZXrpiDDH4nvH9f6p2ZvjUE/+8vloYZT
        BIJ2XIhTD+7BAhDnpjsLf9M+XtYElOiazkDwd5vOG+QeL5Pzv+jZsJvwY/y3fy6xxKfR+Bc3YA4qq
        ZDuFvisLm0k5pxWXyXRMEArkKJYCoNhInfZsR/Aa4CE+doAt4EMsbu9plXiHwPCX4+ztOilVozK8e
        iRnVC0scjuqGTQiSFIxFVPs9Ad3lTzCLW1Wwn8ZxvowZzcD0r1FW8+D9P4nOM/OGL9k0haKXxTbww
        ry5z2W/TQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46824)
        by pandora.armlinux.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mACwb-0004bS-JR; Sun, 01 Aug 2021 16:00:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mACwa-00021N-1N; Sun, 01 Aug 2021 16:00:00 +0100
Date:   Sun, 1 Aug 2021 16:00:00 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Len Baker <len.baker@gmx.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-hardening@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/input: Remove all strcpy() uses in favor of
 strscpy()
Message-ID: <20210801145959.GI22278@shell.armlinux.org.uk>
References: <20210801144316.12841-1-len.baker@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210801144316.12841-1-len.baker@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Aug 01, 2021 at 04:43:16PM +0200, Len Baker wrote:
> strcpy() performs no bounds checking on the destination buffer. This
> could result in linear overflows beyond the end of the buffer, leading
> to all kinds of misbehaviors. The safe replacement is strscpy().
> 
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
> This is a task of the KSPP [1]
> 
> [1] https://github.com/KSPP/linux/issues/88
> 
>  drivers/input/keyboard/locomokbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
> index dae053596572..dbb3dc48df12 100644
> --- a/drivers/input/keyboard/locomokbd.c
> +++ b/drivers/input/keyboard/locomokbd.c
> @@ -254,7 +254,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
>  	locomokbd->suspend_jiffies = jiffies;
> 
>  	locomokbd->input = input_dev;
> -	strcpy(locomokbd->phys, "locomokbd/input0");
> +	strscpy(locomokbd->phys, "locomokbd/input0", sizeof(locomokbd->phys));

So if the string doesn't fit, it's fine to silently truncate it?

Rather than converting every single strcpy() in the kernel to
strscpy(), maybe there should be some consideration given to how the
issue of a strcpy() that overflows the buffer should be handled.
E.g. in the case of a known string such as the above, if it's longer
than the destination, should we find a way to make the compiler issue
a warning at compile time?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
