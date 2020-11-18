Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9A282B7323
	for <lists+linux-input@lfdr.de>; Wed, 18 Nov 2020 01:33:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgKRAcp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 19:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgKRAcp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 19:32:45 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CB3C0613CF;
        Tue, 17 Nov 2020 16:32:45 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 62so17142878pgg.12;
        Tue, 17 Nov 2020 16:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ITkylofkTnKCttMpfYe2p+d8np5whLu0Pk9eE30l4wQ=;
        b=IFcF64mNCWsknC9yTYHfwyJDHGmvEVvamwsYDbNUGdLblb2by/NeNHX7lbw2/S9HQg
         RAX/aqTdXYCoUIqPu2usaSlvrUt1N6xqZ8MAYp8JBTd18b1Lx8EDTtmBGWeXV7FgZZo0
         S+gEddgyuMT44F+MdZ57M6ZcWAqucU0RMe/xcVyWNdpVHNoFjt1xXmyVfwWkVMLjJpZ6
         dCcabEHjtHVbTqbpi+J01ZjzTeWubqVh0Kqn8Xenv9DYG30qEJEXBxH64yc+SMIEOPqD
         GS5h1utuz08CtEuzg8IKfTL43FtvJdL1osKOceyDdGU57dGwjIDTSum4Yl51Gz6G8eAW
         /KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ITkylofkTnKCttMpfYe2p+d8np5whLu0Pk9eE30l4wQ=;
        b=VNXeg8l99hmHSJ/M2WDlfw4tZPaUL4MZDX6mkDuvARCNDpBIBmAmMzPCP86QJ9c+sU
         pbbu5+jZcTtM3BQysA0EKVeRlgKTGf7mXOhw4ls5FdPtg1bgG6jqEaV3qx9SGc/gbK6s
         6uioTyqa9083u4ykxU617r7/dObXlvELoua++8C7r6OP2T9fljkrpQL4ga4oTDFIFTge
         a0jn9kTEuRC3J6YE/JqCdZ8P9aTPgm7lCEJr42IeK+BGwvTiaMcv87Y52nwREw/my/o4
         74SCilMiyNb97o4u7CMLZUf70doluLWwaHzCBWQ+juPH4/mo6AoyeXPHum4zWEzONIU+
         6O9w==
X-Gm-Message-State: AOAM531KuP40WWisK2QKY+IBpct08Cwjrbn+hQsgUEiIXYOnPnLTdK2X
        T7RxVL+4fi6TDOZoGn3HAh4=
X-Google-Smtp-Source: ABdhPJwRY+DH4YW7v+Sb7Wp8lwT3/MZeCcuj3px8fgqzG1apTirOUwPp8FXJPQvVO2RUnbEiCXX3RQ==
X-Received: by 2002:a63:f318:: with SMTP id l24mr5717770pgh.193.1605659565084;
        Tue, 17 Nov 2020 16:32:45 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id a23sm22960637pfl.29.2020.11.17.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 16:32:44 -0800 (PST)
Date:   Tue, 17 Nov 2020 16:32:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleksij Rempel <linux@rempel-privat.de>
Cc:     linux-input@vger.kernel.org, Anatolij Gustschin <agust@denx.de>,
        linux-kernel@vger.kernel.org,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH] Input: ads7846 - fix unaligned access on 7845
Message-ID: <20201118003242.GF2009714@dtor-ws>
References: <20201112012742.GA3608551@dtor-ws>
 <de67681c-b392-198c-f73e-4c9073d8f1e3@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de67681c-b392-198c-f73e-4c9073d8f1e3@rempel-privat.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 09:04:23AM +0100, Oleksij Rempel wrote:
> Hello Dmitry,
> 
> Am 12.11.20 um 02:27 schrieb Dmitry Torokhov:
> > req->sample[1] is not naturally aligned at word boundary, and therefore
> > we should use get_unaligned_be16() when accessing it.
> >
> > Fixes: 3eac5c7e44f3 ("Input: ads7846 - extend the driver for ads7845 controller support")
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> I do not have ads7845, but i  assume i need to resend my patch with the same fix. Correct?

I do not think your patches are affected, so I just applied it together
with yours.

Thanks.

-- 
Dmitry
