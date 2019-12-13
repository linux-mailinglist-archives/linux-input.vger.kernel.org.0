Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D297C11ED5D
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 23:03:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725747AbfLMWD0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 17:03:26 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45424 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725554AbfLMWDZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 17:03:25 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so2164986pfg.12;
        Fri, 13 Dec 2019 14:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tC9e56OkB9iMx5UogC2mae0NvXUXXZ3j9VUfeJ/X5wk=;
        b=tRoNRQRh+sJGD73mI4PDIDyRvkzBaNEx53l8oRH/Sn6LiwA5jhvcsHTHKt0UYjOfKD
         hI8+MAPu3GAvso6itHVboQN17c5NMohOaIdXDa6aP8XILG0jThspeOMRlB1IUC3yIWCZ
         swEyhbgSOV49JTywMJrODnCc7u4bYKMNWk/ZTtAn4jlE/qSBoeS6gnQhmOISmdYhsicT
         hv+UQszp8avxtmsIrnninBVWrvPdjhm37eQU53sSaxYhTcKtZ0QgecyWFxjbi9uOTD96
         HCfXiVXAKR3OXOiwCQKS/hI0lN37hSjKxmU3aTbHAd2fk7aMPw55CqanJVLyHSFl5OxB
         QQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tC9e56OkB9iMx5UogC2mae0NvXUXXZ3j9VUfeJ/X5wk=;
        b=axSnpFdcwMnUGm0hdnk7jdQaxBbNdQiz1kV+aS64ztk/JAHpAGKHpPU4DN1CVNvznv
         vLijLiPbhhpVZYfUwkBcSReq2Tu+jrOsRvPG0vklBusQ7wyLUhOb8+LD/EyH130xasV/
         Nzy8Uhuw1i2sRe+zsqe2vqxuBnS6GutdNetS+cMSZrPM3RnP099UHwivXPEBKV2/ejuk
         A4A7pC21HNhSzaGKx4Xwf3CCfW9yzwjO4Kugb2vX4Z6TnyNQk9n29UEBiwd1Cc8m6Aju
         bE7xbPqaRvpHNcseB8/ADNQKPHXukadwE68UIlKbpTwGFYS0OdzXn9pDHi/IWXberkRm
         Cirg==
X-Gm-Message-State: APjAAAV4kQ8T2OYNeGOM9kmtB5RQ0UCI0zlCWf6lyF2B1yDF1OQroqQt
        rv8U6eNoOJ8u5S9+MSf6d9A=
X-Google-Smtp-Source: APXvYqzBpAfl1hUow2NLUi+eXe/GatKLhViFfkqNuiWd45s78/xW4KFQIoMtOkjNEpVCqNgoFHYxSw==
X-Received: by 2002:a63:d358:: with SMTP id u24mr1975871pgi.218.1576274604884;
        Fri, 13 Dec 2019 14:03:24 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h7sm13693878pfq.36.2019.12.13.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 14:03:24 -0800 (PST)
Date:   Fri, 13 Dec 2019 14:03:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] input: keyboard: imx_sc_key: Only take the valid data
 from SCU firmware as key state
Message-ID: <20191213220321.GJ101194@dtor-ws>
References: <1576202909-1661-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576202909-1661-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 13, 2019 at 10:08:29AM +0800, Anson Huang wrote:
> When reading key state from SCU, the response data from SCU firmware
> is 4 bytes due to MU message protocol, but ONLY the first byte is the
> key state, other 3 bytes could be some dirty data, so we should ONLY
> take the first byte as key state to avoid reporting incorrect state.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/imx_sc_key.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
> index 5379952..9f809ae 100644
> --- a/drivers/input/keyboard/imx_sc_key.c
> +++ b/drivers/input/keyboard/imx_sc_key.c
> @@ -78,7 +78,13 @@ static void imx_sc_check_for_events(struct work_struct *work)
>  		return;
>  	}
>  
> -	state = (bool)msg.state;
> +	/*
> +	 * The response data from SCU firmware is 4 bytes,
> +	 * but ONLY the first byte is the key state, other
> +	 * 3 bytes could be some dirty data, so we should
> +	 * ONLY take the first byte as key state.
> +	 */
> +	state = (bool)(msg.state & 0xff);
>  
>  	if (state ^ priv->keystate) {
>  		priv->keystate = state;
> -- 
> 2.7.4
> 

-- 
Dmitry
