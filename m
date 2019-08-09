Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874CB88559
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 23:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfHIV4o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 17:56:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43856 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfHIV4o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 17:56:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id r26so10531091pgl.10;
        Fri, 09 Aug 2019 14:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TkhkuYocFQx4r10h5LVo05sOmWJOoVgVxvygkJFqCbI=;
        b=uWyO76NQtb/243rX9MvyOifP6epm6MJEwfhZNSvRPyIOJvxhJcmUW711cSIS6gKtdR
         NlfzHZXmDAeRsebIFMuvuRXu/KWDg93/liQaok2JiF/6LBGoIFHZhqf+jwVMQiPBjA/j
         523eXk98iZ0ggOIBjpncX+jqDdODHCySdoH1nmCiQovh2IhOX/XSuaKxu4608dMLeiD/
         RIDNajwxyvcr5f8A96p2DPTj7czf0AKmYdnlgrvHto/of/FJva3mzIw4sZspfdf7OJWt
         cZsgJC/JNkavElwOvSvkuXSyX3fyBgfuxtP/+nKw/w+musi/kYLQidNWMUJ2+zOFqhqt
         eSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TkhkuYocFQx4r10h5LVo05sOmWJOoVgVxvygkJFqCbI=;
        b=aCkizoMxrnMYy/9V7eOwfD3+5v+hXfMDJWNWRRESWOhjxK6VSsggat9wdgY2fgupFX
         IVM5JG4Ki7B5laBcDVUv4ZTMGl0fKOZatII06Pvz1PHOzzin8tkIodNc31ohzNXSFQVH
         wMwTgAX2cmajfr8gFGIDqlD1m/4lN7Ru1ksfjO+AL4Hn8FSl/vwIXagR1kiskpxqap/i
         hNH0/jbIBF5bJqDqOlnTRqlCvg2fYHAbkgZlEgkPdbFvPJdCFk1edbu7B/l3+/nUDOeJ
         4R5a2zTC4YwpvMfFqI00Ai9snTYJDPYcHjqMEhbvbBgc+EusyiJS6U9IasPFG1FfFifi
         +yOw==
X-Gm-Message-State: APjAAAV2OPnpqES0uUk6SmD4Q3RNIAq9yiAouyB34e9JrczDVtAUG9Dv
        W1QrQVI2Sfu2NkKgh5KojzM=
X-Google-Smtp-Source: APXvYqyRdBqKI+PUhdUT9lferiaosZ+l8B5OOZDuitm8HmLVLy9pbyPChin3nBcrObPbIbKBkKwbUA==
X-Received: by 2002:a17:90a:26a1:: with SMTP id m30mr11752087pje.59.1565387802911;
        Fri, 09 Aug 2019 14:56:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id h1sm129702231pfg.55.2019.08.09.14.56.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 14:56:42 -0700 (PDT)
Date:   Fri, 9 Aug 2019 14:56:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     soc@kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 11/16] Input: remove w90x900 touchscreen driver
Message-ID: <20190809215640.GO178933@dtor-ws>
References: <20190809202749.742267-1-arnd@arndb.de>
 <20190809202749.742267-12-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-12-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 09, 2019 at 10:27:39PM +0200, Arnd Bergmann wrote:
> The ARM w90x900 platform is getting removed, so this driver is obsolete.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

> ---
>  drivers/input/touchscreen/Kconfig      |   9 -
>  drivers/input/touchscreen/Makefile     |   1 -
>  drivers/input/touchscreen/w90p910_ts.c | 331 -------------------------
>  3 files changed, 341 deletions(-)
>  delete mode 100644 drivers/input/touchscreen/w90p910_ts.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index fb91f2d4049e..46ad9090493b 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -1112,15 +1112,6 @@ config TOUCHSCREEN_TSC2007_IIO
>  	  or ambient light monitoring), temperature and raw input
>  	  values.
>  
> -config TOUCHSCREEN_W90X900
> -	tristate "W90P910 touchscreen driver"
> -	depends on ARCH_W90X900
> -	help
> -	  Say Y here if you have a W90P910 based touchscreen.
> -
> -	  To compile this driver as a module, choose M here: the
> -	  module will be called w90p910_ts.
> -
>  config TOUCHSCREEN_PCAP
>  	tristate "Motorola PCAP touchscreen"
>  	depends on EZX_PCAP
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index 084a596a0c8b..94c6162409b3 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -102,7 +102,6 @@ wm97xx-ts-$(CONFIG_TOUCHSCREEN_WM9712)	+= wm9712.o
>  wm97xx-ts-$(CONFIG_TOUCHSCREEN_WM9713)	+= wm9713.o
>  obj-$(CONFIG_TOUCHSCREEN_WM97XX_MAINSTONE)	+= mainstone-wm97xx.o
>  obj-$(CONFIG_TOUCHSCREEN_WM97XX_ZYLONITE)	+= zylonite-wm97xx.o
> -obj-$(CONFIG_TOUCHSCREEN_W90X900)	+= w90p910_ts.o
>  obj-$(CONFIG_TOUCHSCREEN_SX8654)	+= sx8654.o
>  obj-$(CONFIG_TOUCHSCREEN_TPS6507X)	+= tps6507x-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_ZET6223)	+= zet6223.o
> diff --git a/drivers/input/touchscreen/w90p910_ts.c b/drivers/input/touchscreen/w90p910_ts.c
> deleted file mode 100644
> index 7893d7fa398c..000000000000
> --- a/drivers/input/touchscreen/w90p910_ts.c
> +++ /dev/null
> @@ -1,331 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-only
> -/*
> - * Copyright (c) 2008 Nuvoton technology corporation.
> - *
> - * Wan ZongShun <mcuos.com@gmail.com>
> - */
> -
> -#include <linux/delay.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
> -#include <linux/io.h>
> -#include <linux/clk.h>
> -#include <linux/input.h>
> -#include <linux/interrupt.h>
> -#include <linux/slab.h>
> -
> -/* ADC controller bit defines */
> -#define ADC_DELAY	0xf00
> -#define ADC_DOWN	0x01
> -#define ADC_TSC_Y	(0x01 << 8)
> -#define ADC_TSC_X	(0x00 << 8)
> -#define TSC_FOURWIRE	(~(0x03 << 1))
> -#define ADC_CLK_EN	(0x01 << 28)	/* ADC clock enable */
> -#define ADC_READ_CON	(0x01 << 12)
> -#define ADC_CONV	(0x01 << 13)
> -#define ADC_SEMIAUTO	(0x01 << 14)
> -#define ADC_WAITTRIG	(0x03 << 14)
> -#define ADC_RST1	(0x01 << 16)
> -#define ADC_RST0	(0x00 << 16)
> -#define ADC_EN		(0x01 << 17)
> -#define ADC_INT		(0x01 << 18)
> -#define WT_INT		(0x01 << 20)
> -#define ADC_INT_EN	(0x01 << 21)
> -#define LVD_INT_EN	(0x01 << 22)
> -#define WT_INT_EN	(0x01 << 23)
> -#define ADC_DIV		(0x04 << 1)	/* div = 6 */
> -
> -enum ts_state {
> -	TS_WAIT_NEW_PACKET,	/* We are waiting next touch report */
> -	TS_WAIT_X_COORD,	/* We are waiting for ADC to report X coord */
> -	TS_WAIT_Y_COORD,	/* We are waiting for ADC to report Y coord */
> -	TS_IDLE,		/* Input device is closed, don't do anything */
> -};
> -
> -struct w90p910_ts {
> -	struct input_dev *input;
> -	struct timer_list timer;
> -	struct clk *clk;
> -	int irq_num;
> -	void __iomem *ts_reg;
> -	spinlock_t lock;
> -	enum ts_state state;
> -};
> -
> -static void w90p910_report_event(struct w90p910_ts *w90p910_ts, bool down)
> -{
> -	struct input_dev *dev = w90p910_ts->input;
> -
> -	if (down) {
> -		input_report_abs(dev, ABS_X,
> -				 __raw_readl(w90p910_ts->ts_reg + 0x0c));
> -		input_report_abs(dev, ABS_Y,
> -				 __raw_readl(w90p910_ts->ts_reg + 0x10));
> -	}
> -
> -	input_report_key(dev, BTN_TOUCH, down);
> -	input_sync(dev);
> -}
> -
> -static void w90p910_prepare_x_reading(struct w90p910_ts *w90p910_ts)
> -{
> -	unsigned long ctlreg;
> -
> -	__raw_writel(ADC_TSC_X, w90p910_ts->ts_reg + 0x04);
> -	ctlreg = __raw_readl(w90p910_ts->ts_reg);
> -	ctlreg &= ~(ADC_WAITTRIG | WT_INT | WT_INT_EN);
> -	ctlreg |= ADC_SEMIAUTO | ADC_INT_EN | ADC_CONV;
> -	__raw_writel(ctlreg, w90p910_ts->ts_reg);
> -
> -	w90p910_ts->state = TS_WAIT_X_COORD;
> -}
> -
> -static void w90p910_prepare_y_reading(struct w90p910_ts *w90p910_ts)
> -{
> -	unsigned long ctlreg;
> -
> -	__raw_writel(ADC_TSC_Y, w90p910_ts->ts_reg + 0x04);
> -	ctlreg = __raw_readl(w90p910_ts->ts_reg);
> -	ctlreg &= ~(ADC_WAITTRIG | ADC_INT | WT_INT_EN);
> -	ctlreg |= ADC_SEMIAUTO | ADC_INT_EN | ADC_CONV;
> -	__raw_writel(ctlreg, w90p910_ts->ts_reg);
> -
> -	w90p910_ts->state = TS_WAIT_Y_COORD;
> -}
> -
> -static void w90p910_prepare_next_packet(struct w90p910_ts *w90p910_ts)
> -{
> -	unsigned long ctlreg;
> -
> -	ctlreg = __raw_readl(w90p910_ts->ts_reg);
> -	ctlreg &= ~(ADC_INT | ADC_INT_EN | ADC_SEMIAUTO | ADC_CONV);
> -	ctlreg |= ADC_WAITTRIG | WT_INT_EN;
> -	__raw_writel(ctlreg, w90p910_ts->ts_reg);
> -
> -	w90p910_ts->state = TS_WAIT_NEW_PACKET;
> -}
> -
> -static irqreturn_t w90p910_ts_interrupt(int irq, void *dev_id)
> -{
> -	struct w90p910_ts *w90p910_ts = dev_id;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&w90p910_ts->lock, flags);
> -
> -	switch (w90p910_ts->state) {
> -	case TS_WAIT_NEW_PACKET:
> -		/*
> -		 * The controller only generates interrupts when pen
> -		 * is down.
> -		 */
> -		del_timer(&w90p910_ts->timer);
> -		w90p910_prepare_x_reading(w90p910_ts);
> -		break;
> -
> -
> -	case TS_WAIT_X_COORD:
> -		w90p910_prepare_y_reading(w90p910_ts);
> -		break;
> -
> -	case TS_WAIT_Y_COORD:
> -		w90p910_report_event(w90p910_ts, true);
> -		w90p910_prepare_next_packet(w90p910_ts);
> -		mod_timer(&w90p910_ts->timer, jiffies + msecs_to_jiffies(100));
> -		break;
> -
> -	case TS_IDLE:
> -		break;
> -	}
> -
> -	spin_unlock_irqrestore(&w90p910_ts->lock, flags);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static void w90p910_check_pen_up(struct timer_list *t)
> -{
> -	struct w90p910_ts *w90p910_ts = from_timer(w90p910_ts, t, timer);
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&w90p910_ts->lock, flags);
> -
> -	if (w90p910_ts->state == TS_WAIT_NEW_PACKET &&
> -	    !(__raw_readl(w90p910_ts->ts_reg + 0x04) & ADC_DOWN)) {
> -
> -		w90p910_report_event(w90p910_ts, false);
> -	}
> -
> -	spin_unlock_irqrestore(&w90p910_ts->lock, flags);
> -}
> -
> -static int w90p910_open(struct input_dev *dev)
> -{
> -	struct w90p910_ts *w90p910_ts = input_get_drvdata(dev);
> -	unsigned long val;
> -
> -	/* enable the ADC clock */
> -	clk_enable(w90p910_ts->clk);
> -
> -	__raw_writel(ADC_RST1, w90p910_ts->ts_reg);
> -	msleep(1);
> -	__raw_writel(ADC_RST0, w90p910_ts->ts_reg);
> -	msleep(1);
> -
> -	/* set delay and screen type */
> -	val = __raw_readl(w90p910_ts->ts_reg + 0x04);
> -	__raw_writel(val & TSC_FOURWIRE, w90p910_ts->ts_reg + 0x04);
> -	__raw_writel(ADC_DELAY, w90p910_ts->ts_reg + 0x08);
> -
> -	w90p910_ts->state = TS_WAIT_NEW_PACKET;
> -	wmb();
> -
> -	/* set trigger mode */
> -	val = __raw_readl(w90p910_ts->ts_reg);
> -	val |= ADC_WAITTRIG | ADC_DIV | ADC_EN | WT_INT_EN;
> -	__raw_writel(val, w90p910_ts->ts_reg);
> -
> -	return 0;
> -}
> -
> -static void w90p910_close(struct input_dev *dev)
> -{
> -	struct w90p910_ts *w90p910_ts = input_get_drvdata(dev);
> -	unsigned long val;
> -
> -	/* disable trigger mode */
> -
> -	spin_lock_irq(&w90p910_ts->lock);
> -
> -	w90p910_ts->state = TS_IDLE;
> -
> -	val = __raw_readl(w90p910_ts->ts_reg);
> -	val &= ~(ADC_WAITTRIG | ADC_DIV | ADC_EN | WT_INT_EN | ADC_INT_EN);
> -	__raw_writel(val, w90p910_ts->ts_reg);
> -
> -	spin_unlock_irq(&w90p910_ts->lock);
> -
> -	/* Now that interrupts are shut off we can safely delete timer */
> -	del_timer_sync(&w90p910_ts->timer);
> -
> -	/* stop the ADC clock */
> -	clk_disable(w90p910_ts->clk);
> -}
> -
> -static int w90x900ts_probe(struct platform_device *pdev)
> -{
> -	struct w90p910_ts *w90p910_ts;
> -	struct input_dev *input_dev;
> -	struct resource *res;
> -	int err;
> -
> -	w90p910_ts = kzalloc(sizeof(struct w90p910_ts), GFP_KERNEL);
> -	input_dev = input_allocate_device();
> -	if (!w90p910_ts || !input_dev) {
> -		err = -ENOMEM;
> -		goto fail1;
> -	}
> -
> -	w90p910_ts->input = input_dev;
> -	w90p910_ts->state = TS_IDLE;
> -	spin_lock_init(&w90p910_ts->lock);
> -	timer_setup(&w90p910_ts->timer, w90p910_check_pen_up, 0);
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		err = -ENXIO;
> -		goto fail1;
> -	}
> -
> -	if (!request_mem_region(res->start, resource_size(res),
> -				pdev->name)) {
> -		err = -EBUSY;
> -		goto fail1;
> -	}
> -
> -	w90p910_ts->ts_reg = ioremap(res->start, resource_size(res));
> -	if (!w90p910_ts->ts_reg) {
> -		err = -ENOMEM;
> -		goto fail2;
> -	}
> -
> -	w90p910_ts->clk = clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(w90p910_ts->clk)) {
> -		err = PTR_ERR(w90p910_ts->clk);
> -		goto fail3;
> -	}
> -
> -	input_dev->name = "W90P910 TouchScreen";
> -	input_dev->phys = "w90p910ts/event0";
> -	input_dev->id.bustype = BUS_HOST;
> -	input_dev->id.vendor  = 0x0005;
> -	input_dev->id.product = 0x0001;
> -	input_dev->id.version = 0x0100;
> -	input_dev->dev.parent = &pdev->dev;
> -	input_dev->open = w90p910_open;
> -	input_dev->close = w90p910_close;
> -
> -	input_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
> -	input_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
> -
> -	input_set_abs_params(input_dev, ABS_X, 0, 0x400, 0, 0);
> -	input_set_abs_params(input_dev, ABS_Y, 0, 0x400, 0, 0);
> -
> -	input_set_drvdata(input_dev, w90p910_ts);
> -
> -	w90p910_ts->irq_num = platform_get_irq(pdev, 0);
> -	if (request_irq(w90p910_ts->irq_num, w90p910_ts_interrupt,
> -			0, "w90p910ts", w90p910_ts)) {
> -		err = -EBUSY;
> -		goto fail4;
> -	}
> -
> -	err = input_register_device(w90p910_ts->input);
> -	if (err)
> -		goto fail5;
> -
> -	platform_set_drvdata(pdev, w90p910_ts);
> -
> -	return 0;
> -
> -fail5:	free_irq(w90p910_ts->irq_num, w90p910_ts);
> -fail4:	clk_put(w90p910_ts->clk);
> -fail3:	iounmap(w90p910_ts->ts_reg);
> -fail2:	release_mem_region(res->start, resource_size(res));
> -fail1:	input_free_device(input_dev);
> -	kfree(w90p910_ts);
> -	return err;
> -}
> -
> -static int w90x900ts_remove(struct platform_device *pdev)
> -{
> -	struct w90p910_ts *w90p910_ts = platform_get_drvdata(pdev);
> -	struct resource *res;
> -
> -	free_irq(w90p910_ts->irq_num, w90p910_ts);
> -	del_timer_sync(&w90p910_ts->timer);
> -	iounmap(w90p910_ts->ts_reg);
> -
> -	clk_put(w90p910_ts->clk);
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	release_mem_region(res->start, resource_size(res));
> -
> -	input_unregister_device(w90p910_ts->input);
> -	kfree(w90p910_ts);
> -
> -	return 0;
> -}
> -
> -static struct platform_driver w90x900ts_driver = {
> -	.probe		= w90x900ts_probe,
> -	.remove		= w90x900ts_remove,
> -	.driver		= {
> -		.name	= "nuc900-ts",
> -	},
> -};
> -module_platform_driver(w90x900ts_driver);
> -
> -MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
> -MODULE_DESCRIPTION("w90p910 touch screen driver!");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS("platform:nuc900-ts");
> -- 
> 2.20.0
> 

-- 
Dmitry
