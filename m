Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E210D5E5DE6
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 10:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbiIVItH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 04:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230309AbiIVIsu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 04:48:50 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA090D01FA
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:48:42 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id c11so14309917wrp.11
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date;
        bh=114+dNXNYT178Y8PzHoarT07zEpMoHwMnwMSpMyqkpI=;
        b=IjMirB3YLTKwC1vg7vaR4VDPCxDu1avdWLt68F8fXPiBl4AIzKvTW2r7DiqjbvDt1H
         /O5t9/vJ3TxOr8fwhejyscZBP3MtRCdORQpSobtqBYx4VU4HaOpdwgFv1pGSoCtaQ6sI
         xJqtTsK9bfJpr6dS2sQn+Xbk1nYGmFxP6bVJ1dQa1I0i5sqvr1oIdjazSJQ+ryOSKDD4
         XzusU8/vCDPGmCAB289NOj7NV1yw7mY8JwYx2pBhrLH47eJfnYR9ZbU8MVcoKHbhKOrv
         +Z3pUErrbV/Fl4L1KvR9a0TExg+ZLGJteQV6RcWHtuSrspwpxcx2YnIlX0qFaDqRrxgo
         aWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=114+dNXNYT178Y8PzHoarT07zEpMoHwMnwMSpMyqkpI=;
        b=4zuvHnT0L/WfwyerUyu/wXkpdT69UphPbqFxl0k0AmazL3NN0R3OmXe+6Kl/fD6F5X
         k970kVu3uyK9FjAeLKpbvxCyr7zucNQrcmwJveujImZ3LOPe9FO+bcjbPBT45WflgKHc
         xQ+mabN295V2HnSL6r6RC9F0BtBITaRhFtKtCd4bqhXnl/V0QJW0GLJatXvSO1ynQgF4
         QD9OfSZid03j8FWruGMT08bqrPVPI+bz1CeaZY4GobXCL+Ep7L5+2LjgcwEd2sPEfTwV
         7Bb/mVAg59cDLv2kHz+GrnrCPXjzbU3mU2ps4fy8RFrrVTMDWD9AedzjsT8HdcXBHw1z
         SElg==
X-Gm-Message-State: ACrzQf2Pci2cicJDhqwYMbjSxfWSOzOeRlSuPlSgDmNVAm/TtW1YBJK5
        rVzMyVWX4rvmmrPP08D1M/Jcmw==
X-Google-Smtp-Source: AMsMyM6W8/4CI0mNX9R1OQ3e7mDmd4yjCRFUe7CJvfOOGRFYDN7efKi0aZEsD7DZkdfWk7mYVRAeHA==
X-Received: by 2002:a5d:598a:0:b0:22a:f5f9:1fa0 with SMTP id n10-20020a5d598a000000b0022af5f91fa0mr1311234wri.711.1663836520647;
        Thu, 22 Sep 2022 01:48:40 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c354a00b003b47b80cec3sm5964028wmq.42.2022.09.22.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:48:40 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com
Subject: Re: [PATCH -next 3/4] Input: gpio_keys - Switch to use
 dev_err_probe() helper
In-Reply-To: <20220920153055.3465115-3-yangyingliang@huawei.com>
References: <20220920153055.3465115-1-yangyingliang@huawei.com>
 <20220920153055.3465115-3-yangyingliang@huawei.com>
Date:   Thu, 22 Sep 2022 10:48:39 +0200
Message-ID: <87zgerg5g8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yang,

Thank you for your patch,

On Tue, Sep 20, 2022 at 23:30, Yang Yingliang <yangyingliang@huawei.com> wrote:

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/input/keyboard/gpio_keys.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
> index a5dc4ab87fa1..ac74e85006a8 100644
> --- a/drivers/input/keyboard/gpio_keys.c
> +++ b/drivers/input/keyboard/gpio_keys.c
> @@ -530,10 +530,8 @@ static int gpio_keys_setup_key(struct platform_device *pdev,
>  				 */
>  				bdata->gpiod = NULL;
>  			} else {
> -				if (error != -EPROBE_DEFER)
> -					dev_err(dev, "failed to get gpio: %d\n",
> -						error);
> -				return error;
> +				return dev_err_probe(dev, error,
> +						     "failed to get gpio\n");

If we look at the input tree, we can see that there is no occurence of
dev_err_probe():

$ ~/src/linux/drivers/input/ 483fed3b5dc8 grep -rsn dev_err_probe
$ ~/src/linux/drivers/input/ 483fed3b5dc8

The reason for this is that the input maintainer (Dmitry) dislikes
dev_err_probe() as he stated in [1]

So I don't think he will apply this.

Regards,
Mattijs

>  			}
>  		}
>  	} else if (gpio_is_valid(button->gpio)) {
> -- 
> 2.25.1
