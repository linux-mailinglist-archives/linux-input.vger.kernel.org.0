Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DF6419B2
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 02:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405872AbfFLAvY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 20:51:24 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41839 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405015AbfFLAvX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 20:51:23 -0400
Received: by mail-pl1-f194.google.com with SMTP id s24so5840650plr.8;
        Tue, 11 Jun 2019 17:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cO1aoOgamWKzIBPutERy4+vShJ7ff0SjV7iwgqOmOxU=;
        b=bjVRjE0AIuXeVIkRPq5d1Q0m6f/ChSKt7gvzCfbsz28S9ZzhVQDoKcXtAbRw1ACu7m
         7kp5ZXFytWCzXikbqIWU3/EvpxFMQfB2WIIUqTOSaJMIVSVV+Dhm+q2vF1nsxPL0ZQZN
         Xr4PWhZzFjjKM8olQlI+MNryiceHMLT2yhZwrxNEe+PPQiJHcsAN3gqc/Mj1eyT37wpG
         c97pPNrG3ML1GaEN+kj4zNEVcoHq9wcOmaqbjGvpzCgZTLuyoJtUrBdZ/iSO7t17EGrG
         4euwRIk+oYorOyunXr8AfmtpioQuylyPP3xvwk0CbS+/E00uzYIB370WOdBdaH6J7lDA
         PWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cO1aoOgamWKzIBPutERy4+vShJ7ff0SjV7iwgqOmOxU=;
        b=DWHzqi77Honw22GNNGKJzjDVztRrpEDpOJN5MPQ81TQJOo7LHKh/cc+G84ZMw8DkKp
         Re1wzNCtbLHlqgtrUaDvpXVGCxuf14elkTVvDBgwGzzbko145AbCYrEPDAxf/IIqDPib
         Jt9ReXI60Bks+QfCXw6cj9toj2bYAqiGFYqWV4QBsZoOK8uTk6vcn+3v8hS2YXyBbUHw
         gPI5JWgjDAU9qV/G164RE2uvsoI/0N/0RX4KFnw0GCyNiiupYpe134uKfnSAr+Qs/MCz
         mpv448I3LadB4Ux9q+zQmGzC/KzS8sEa44i1XiRiBFImnl6AVm3nwohIJ2r97XShFHG/
         5PxQ==
X-Gm-Message-State: APjAAAUfealE+WXDh4NNevwFORAZjwLc+3Rzw+5DTot2W3xOJiM5y5JD
        Vdw9MiZKG0I7wtIyntw+Yan0o03iM2Q=
X-Google-Smtp-Source: APXvYqyv4mJyfH+lo6mByyMGtaJjJbLmgLMkrNCaA8Qe4uCJ+nryDBS0GuP0K4qXtHGMM5kn8Y9Izg==
X-Received: by 2002:a17:902:28:: with SMTP id 37mr15273311pla.188.1560300682592;
        Tue, 11 Jun 2019 17:51:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y5sm14480199pgv.12.2019.06.11.17.51.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:51:21 -0700 (PDT)
Date:   Tue, 11 Jun 2019 17:51:20 -0700
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [RESEND] input: keyboard: imx: make sure keyboard can always
 wake up system
Message-ID: <20190612005120.GI143729@dtor-ws>
References: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554341727-16084-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 04, 2019 at 01:40:16AM +0000, Anson Huang wrote:
> There are several scenarios that keyboard can NOT wake up system
> from suspend, e.g., if a keyboard is depressed between system
> device suspend phase and device noirq suspend phase, the keyboard
> ISR will be called and both keyboard depress and release interrupts
> will be disabled, then keyboard will no longer be able to wake up
> system. Another scenario would be, if a keyboard is kept depressed,
> and then system goes into suspend, the expected behavior would be
> when keyboard is released, system will be waked up, but current
> implementation can NOT achieve that, because both depress and release
> interrupts are disabled in ISR, and the event check is still in
> progress.
> 
> To fix these issues, need to make sure keyboard's depress or release
> interrupt is enabled after noirq device suspend phase, this patch
> moves the suspend/resume callback to noirq suspend/resume phase, and
> enable the corresponding interrupt according to current keyboard status.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/imx_keypad.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
> index cf08f4a..97500a2 100644
> --- a/drivers/input/keyboard/imx_keypad.c
> +++ b/drivers/input/keyboard/imx_keypad.c
> @@ -524,11 +524,12 @@ static int imx_keypad_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int __maybe_unused imx_kbd_suspend(struct device *dev)
> +static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct imx_keypad *kbd = platform_get_drvdata(pdev);
>  	struct input_dev *input_dev = kbd->input_dev;
> +	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
>  
>  	/* imx kbd can wake up system even clock is disabled */
>  	mutex_lock(&input_dev->mutex);
> @@ -538,13 +539,20 @@ static int __maybe_unused imx_kbd_suspend(struct device *dev)
>  
>  	mutex_unlock(&input_dev->mutex);
>  
> -	if (device_may_wakeup(&pdev->dev))
> +	if (device_may_wakeup(&pdev->dev)) {
> +		if (reg_val & KBD_STAT_KPKD)
> +			reg_val |= KBD_STAT_KRIE;
> +		if (reg_val & KBD_STAT_KPKR)
> +			reg_val |= KBD_STAT_KDIE;
> +		writew(reg_val, kbd->mmio_base + KPSR);
> +
>  		enable_irq_wake(kbd->irq);
> +	}
>  
>  	return 0;
>  }
>  
> -static int __maybe_unused imx_kbd_resume(struct device *dev)
> +static int __maybe_unused imx_kbd_noirq_resume(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct imx_keypad *kbd = platform_get_drvdata(pdev);
> @@ -568,7 +576,9 @@ static int __maybe_unused imx_kbd_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(imx_kbd_pm_ops, imx_kbd_suspend, imx_kbd_resume);
> +static const struct dev_pm_ops imx_kbd_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(imx_kbd_noirq_suspend, imx_kbd_noirq_resume)
> +};
>  
>  static struct platform_driver imx_keypad_driver = {
>  	.driver		= {
> -- 
> 2.7.4
> 

-- 
Dmitry
