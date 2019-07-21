Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22BDC6F46C
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 19:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbfGURsP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 13:48:15 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46488 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfGURsP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 13:48:15 -0400
Received: by mail-lj1-f196.google.com with SMTP id v24so35314745ljg.13
        for <linux-input@vger.kernel.org>; Sun, 21 Jul 2019 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jawyZUS84GUZg0jBNU79KpV8toMovLYP0VVjbdmHjn4=;
        b=LotOOnbUD7ooetI3Vg4I/qTiKXq1KAAiNsbkMce3KPPqHu4R5fexonbcuiYeA++eAf
         vWxQ7mtg1IuGPcFjgIMJKhpEki05SGifcpKK4l24sefMuuGzITaZ7ODr/zhkfWmk7b+u
         0wFzJTVn8Fj/haYQoeJAPVYgX0ukLrTSIX8fofwEEJAwR1dXxARffhtU8bKKHdQi83N7
         1PK736L+lJ1LwAB+TFxuvS8BO7IVlOsdLFaZUfxBsDaI3LwM87SGxcMJKkyfhqUidZ0L
         tpZHgEWfPfGE7LPF+Zj37HYoFuYVHEgygsOkRTpcQv2J5kWJ4PJN6cY1k+26im3v6LZK
         Gs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jawyZUS84GUZg0jBNU79KpV8toMovLYP0VVjbdmHjn4=;
        b=B65ZJknptO80aBrh2eZkNIxV7XNn+Mp5sqnR1ugnH05JU6816hDmcs3daVt6qe6w6C
         3Hjdquhl84KL2k2sLM4TnVqM0XTxqbMH1EE1vN/DAac9AsSdYK0GuNi69Fy3lkd1INNW
         6NZ1RUasQnxjqXrQg7cGA3FzwS3IY3nG40KWIb1gRqy9SiyyWSamHvrwj0ziqZzF2EGm
         i2pmzkpRLIgjT+b+4I4EsawjPhier8mCGVv4YXkDCKATGKiqTDg//lutCPdXB2j40+FS
         nn24JhstYGrCOln2c8Bo+yqEpkQKmivIj2QgJpGM+C4mQ/vPQlEuT36v0WZImY2ZEpwM
         mj1A==
X-Gm-Message-State: APjAAAUeXcY5G2EDLnxovAnetrpIr80Xqdze3oxDOFU5N8QKs9U18JeI
        m7Wu3kdiGCPa8f/yNcYh1yDCdjsOuA8=
X-Google-Smtp-Source: APXvYqxZ1j9Vspv1HPDFPVcWEYQ7NRN/2gNMX6z3d4RVKLIPXcQGgH5nLpSaX2cycRAF/b0jftD2eg==
X-Received: by 2002:a2e:5548:: with SMTP id j69mr34042927ljb.48.1563731292777;
        Sun, 21 Jul 2019 10:48:12 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id f10sm5684247lfh.82.2019.07.21.10.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2019 10:48:11 -0700 (PDT)
Date:   Sun, 21 Jul 2019 20:48:06 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Markus Koch <markus@notsyncing.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: add support for the FlySky FS-iA6B RC receiver
Message-ID: <20190721174806.GA824@penguin>
References: <20190721072303.GA607@penguin>
 <20190721123756.10046-1-markus@notsyncing.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190721123756.10046-1-markus@notsyncing.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Markus,

On Sun, Jul 21, 2019 at 02:37:59PM +0200, Markus Koch wrote:
> +static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
> +{
> +	struct fsia6b *fsia6b;
> +	struct input_dev *input_dev;
> +	int err;
> +	int i, j;
> +	int sw_id = 0;
> +
> +	fsia6b = kzalloc(sizeof(*fsia6b), GFP_KERNEL);
> +	if (!fsia6b)
> +		return -ENOMEM;
> +
> +	fsia6b->packet.ibuf = 0;
> +	fsia6b->packet.offset = 0;
> +	fsia6b->packet.state = SYNC;
> +
> +	serio_set_drvdata(serio, fsia6b);
> +
> +	err = serio_open(serio, drv);
> +	if (err)
> +		goto fail1;
> +

I just noticed this: we should allocate the input device before opening
the serio port, otherwise interrupt may come in earlier and you will end
up with a null pointer dereference.

No need to resubmit, I can adjust on my side.

> +
> +	input_dev = input_allocate_device();
> +	if (!input_dev) {
> +		err = -ENOMEM;
> +		goto fail2;
> +	}
> +	fsia6b->dev = input_dev;
> +
> +	snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
> +
> +	input_dev->name = DRIVER_DESC;
> +	input_dev->phys = fsia6b->phys;
> +	input_dev->id.bustype = BUS_RS232;
> +	input_dev->id.vendor = SERIO_FSIA6B;
> +	input_dev->id.product = serio->id.id;
> +	input_dev->id.version = 0x0100;
> +	input_dev->dev.parent = &serio->dev;
> +
> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
> +		input_set_abs_params(input_dev, fsia6b_axes[i],
> +				     1000, 2000, 2, 2);
> +	}
> +
> +	// Register switch configuration
> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
> +		if (((switch_config[i] == '\0') && (i != IBUS_SERVO_COUNT)) ||

I believe this condition is not needed, as you will never get here with
i >= IBUS_SERVO_COUNT, and premature end of string will trip the
check below as well.

I will remove it.

> +				(switch_config[i] < '0') ||
> +				(switch_config[i] > '3')) {
> +			dev_err(&fsia6b->dev->dev,
> +				"Invalid switch configuration supplied for fsia6b.\n");
> +			err = -EINVAL;
> +			goto fail3;
> +		}
> +

Thanks.

-- 
Dmitry
