Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF95D3A7634
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 06:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFOE75 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 00:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhFOE74 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 00:59:56 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B793C061574;
        Mon, 14 Jun 2021 21:57:52 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id o88-20020a17090a0a61b029016eeb2adf66so828128pjo.4;
        Mon, 14 Jun 2021 21:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=w59JjuzuqUTD0+HNEEQ9W6FgI5MwsLGU6SFCtN9fgKE=;
        b=AlJHVINvpXl/63CgtK/AN/bKNc0MKdD9QBrCgXIIC4K5X/NSFHhRC8qpmdL2FEcXje
         Nk9Fh1tkYSMOK8OInulpEXB463O5KhXlTSuF1QyUDckxDJi2EzM3MIC1CWrAH1LskeMI
         SRnp/Y5HdroTmPetMeQQjygc4f3XQA6Hh+PS6AJWp/9XEAiuIPk72+xVj6OAKSrLbQGz
         QAM5mvSogP11DxMInlQ9uX5bAXGcGOLD5rOI9ZwGrdUbn7756oVYWLWupfiTur7gzt+R
         +1+7773ZzEkb4oGk78m2P25M2DzSdkcq7EikVc3miQQ3whdF14W3VmOWlKGzTS9krGHE
         uEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=w59JjuzuqUTD0+HNEEQ9W6FgI5MwsLGU6SFCtN9fgKE=;
        b=FV3Mh78it+MR8eKtAqYL0VDqNn700IUNFsi2Ltd79j24vTQ99oGjwN50MIXG8Pa8kq
         Ew721U3VKPmgsEDM7eCb2tjbyp+1QfVNbK62PBxM78Xpi2L73UwJ7386OoqTR0Ltmlq5
         6R2v2zyuAoE9UAM9g4Vp1fnZwHbyjKzNKZq+6RGwcXJGS06SEBRk1a6Wk81JyGFskvZt
         H1D21fUXykxAHwbfmf1OUy10RLyb6FwyJhPoCneKGG2OXHMZXBxwIQRA9jliUW5CqlIa
         CUnM5PMtmovGSz3ch/wlMsinwaChL/+DPvxAVO+9ZjpPHUa2/uv3/Blp8cnbE6oGSbvt
         hz2A==
X-Gm-Message-State: AOAM531HKxfiAQFNB7L6Qsj0eIy6NcKos75YhnfH315oyPf0B3D2o/Dz
        5SsCmnprqJ5EqDHKQRlPKRk=
X-Google-Smtp-Source: ABdhPJzF59upPOJIhNKQNDqOWZzNQZF7W4jqeBruRos9KBBlqVnsy826wLzJPQaLygK0MPFu8uwLnA==
X-Received: by 2002:a17:90a:c397:: with SMTP id h23mr2977837pjt.101.1623733071476;
        Mon, 14 Jun 2021 21:57:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id d23sm1004515pjz.15.2021.06.14.21.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 21:57:50 -0700 (PDT)
Date:   Mon, 14 Jun 2021 21:57:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH 2/2 v4] input: add SparkFun Qwiic Joystick driver
Message-ID: <YMgzS6FIh/byG8Q5@google.com>
References: <20210608223130.16830-1-oleg@kaa.org.ua>
 <20210608223130.16830-2-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210608223130.16830-2-oleg@kaa.org.ua>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

On Wed, Jun 09, 2021 at 01:31:32AM +0300, Oleh Kravchenko wrote:
> A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> Directional movements are measured with two 10 kΩ potentiometers
> connected with a gimbal mechanism that separates the horizontal and
> vertical movements. This joystick also has a select button that is actuated
> when the joystick is pressed down.
> 
> Input events polled over the I2C bus.
> 
> Product page:
> https://www.sparkfun.com/products/15168
> Firmware and hardware sources:
> https://github.com/sparkfun/Qwiic_Joystick
> 
> Tested on RPi4B and O4-iMX-NANO boards.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
> ---
> 
> Changes for v4:
> - alphabetize include headers.
> 
> Changes for v3:
> - rebase patch for device tree before code.
> 
> Changes for v2:
> - Separate patch for device tree bindings.
> 
>  drivers/input/joystick/Kconfig          |   9 ++
>  drivers/input/joystick/Makefile         |   1 +
>  drivers/input/joystick/qwiic-joystick.c | 147 ++++++++++++++++++++++++
>  3 files changed, 157 insertions(+)
>  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> 
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 5e38899058c1..7dfe8ea90923 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -372,6 +372,15 @@ config JOYSTICK_PXRC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pxrc.
>  
> +config JOYSTICK_QWIIC
> +	tristate "SparkFun Qwiic Joystick"
> +	depends on I2C
> +	help
> +	  Say Y here if you want to use the SparkFun Qwiic Joystick.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qwiic-joystick.
> +
>  config JOYSTICK_FSIA6B
>  	tristate "FlySky FS-iA6B RC Receiver"
>  	select SERIO
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 31d720c9e493..5174b8aba2dd 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
>  obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
> +obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
>  obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
> diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
> new file mode 100644
> index 000000000000..557708e9e756
> --- /dev/null
> +++ b/drivers/input/joystick/qwiic-joystick.c
> @@ -0,0 +1,147 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
> + *
> + * SparkFun Qwiic Joystick
> + * Product page:https://www.sparkfun.com/products/15168
> + * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#define DRV_NAME "qwiic-joystick"
> +
> +#define QWIIC_JSK_REG_VERS	1
> +#define QWIIC_JSK_REG_DATA	3
> +
> +#define QWIIC_JSK_MAX_AXIS	GENMASK(9, 0)
> +#define QWIIC_JSK_FUZZ		2
> +#define QWIIC_JSK_FLAT		2
> +#define QWIIC_JSK_POLL_INTERVAL	16
> +#define QWIIC_JSK_POLL_MIN	8
> +#define QWIIC_JSK_POLL_MAX	32
> +
> +struct qwiic_jsk {
> +	char phys[32];
> +	struct input_dev *dev;
> +	struct i2c_client *client;
> +};
> +
> +struct qwiic_ver {
> +	u8 major;
> +	u8 minor;
> +};
> +
> +struct qwiic_data {
> +	__be16 x;
> +	__be16 y;
> +	u8 thumb;
> +} __packed;

The members of this structure are naturally aligned, so there is no need
to declare it as __packed.

> +
> +static void qwiic_poll(struct input_dev *input)
> +{
> +	struct qwiic_jsk *priv;
> +	struct qwiic_data data;
> +	int err;
> +
> +	priv = input_get_drvdata(input);
> +
> +	err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
> +					    sizeof(data), (u8 *)&data);
> +	if (err != sizeof(data))
> +		return;
> +
> +	input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
> +	input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
> +	input_report_key(input, BTN_THUMBL, !data.thumb);
> +	input_sync(input);
> +}
> +
> +static int qwiic_probe(struct i2c_client *client,
> +		       const struct i2c_device_id *id)

The probe() does not use the i2c_device_id parameter, so I will switch
it to probe_new() to avoid the temptation of using it in the future.

Please let me know if you disagree, otherwise I will go and apply (no
need to resubmit).

Thanks.

-- 
Dmitry
