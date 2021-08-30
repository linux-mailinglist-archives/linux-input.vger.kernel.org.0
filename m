Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88573FBD8A
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 22:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235319AbhH3UpJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 16:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbhH3UpI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 16:45:08 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E218FC061575;
        Mon, 30 Aug 2021 13:44:14 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so670977pje.0;
        Mon, 30 Aug 2021 13:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eGh7cTPum9ArbjWj3aWoT5S5YnpgVCZnC19NWxFTQLk=;
        b=kecjsMdrD2/AjU3DPAqosecIEsW67GUtCIDIqtWjAa2c1qkHVuyhfc0qVpc927erO3
         bu1d6En1rJnU+BK0LCWqspfjQzCy3hSPOmFIcAlAdaJLUjRgxGlDWvYxsLD/82Q8DvmS
         N1mqkujoZljIDY7GNsE6xWNtVfUUj69ySY9oTBw/Kcn2KF1IKOAZHJy1OmTP6avKtqFy
         YYAqut3MtiKmHIGXeD0br7za7M4+bNBhCBUUUC3QJ+O+ofeRd7IHYhDKlDRdZIOMpvkB
         Hmni5Br7Wy70uDXgFwZybYerIkhAYpJlmJFNQviQM2Y9UiI49TGviGmv9EzM8O6LNhXB
         goJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eGh7cTPum9ArbjWj3aWoT5S5YnpgVCZnC19NWxFTQLk=;
        b=EDC/SixpibvUjW2hU5PcROu2IWX2EadoCA411cTjtJWklCSstSUWtd+FhN5xOOi/30
         LN7mxUhUsoLFt7qwG3MR/rEhhWZNd/NFxUVe3QtIn9gghdltQfpG/vA9nO3YKJk/o93p
         PEWMCQHl0rZhjMTywCYYTkdIoQGwiywmRjj2YKJy3f3TRRaBtSvApiXI94hnX9lHzKiH
         blz55X/K1i2czRu2NECP1Q638q0hhFA2wxiEFO9ZoHRI24QAPbzzlsnSfo16zqeSkdVA
         r4YLAssRIodjcmR8rtAcqKc61F3xcg0vv3lUZ4HO9pVzBTr1wGUl/1lsnAgzKb4L5oqk
         3Vmg==
X-Gm-Message-State: AOAM5321p/lfw39tWPiQYtapg6AkpXsJeJ9qooO7PDUfIWhO6ljQaZxC
        XgGpWntX52Qw3hB7+G5uAUg=
X-Google-Smtp-Source: ABdhPJx8ULqhhNMPgZHMuYaLMOjcgZe/T5ABiFmftMeO3GlTbOp+F6jT41DXnzXs6qJ6PgfZbjyFhw==
X-Received: by 2002:a17:902:f541:b0:138:e3e0:a5f8 with SMTP id h1-20020a170902f54100b00138e3e0a5f8mr1328091plf.60.1630356254242;
        Mon, 30 Aug 2021 13:44:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:771a:afc8:2e96:23dd])
        by smtp.gmail.com with ESMTPSA id gg22sm338481pjb.19.2021.08.30.13.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 13:44:13 -0700 (PDT)
Date:   Mon, 30 Aug 2021 13:44:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>, ping.cheng@wacom.com,
        tatsunosuke.tobita@wacom.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, pinglinux@gmail.com, junkpainting@gmail.com,
        linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Message-ID: <YS1DGuTTAEKAd2Yr@google.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829091925.190-7-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Aug 29, 2021 at 07:19:18PM +1000, Alistair Francis wrote:
> When we query the device let's also read the descriptor from the device.
> This tells us useful information, including the version, which we use to
> determine a generation.
> 
> This is based on the driver from Wacom.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 64 +++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index 28255c77d426..72ba4a36459b 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -16,6 +16,7 @@
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
>  
> +#define WACOM_DESC_REG	0x01
>  #define WACOM_CMD_QUERY0	0x04
>  #define WACOM_CMD_QUERY1	0x00
>  #define WACOM_CMD_QUERY2	0x33
> @@ -24,11 +25,46 @@
>  #define WACOM_CMD_THROW1	0x00
>  #define WACOM_QUERY_SIZE	19
>  
> +#define WACOM_MAX_DATA_SIZE_BG9     10
> +#define WACOM_MAX_DATA_SIZE_G12     15
> +#define WACOM_MAX_DATA_SIZE_AG14    17
> +#define WACOM_MAX_DATA_SIZE         22
> +
> +/* Generation selction */
> +/* Before and at G9 generation */
> +#define WACOM_BG9	0
> +/* G12 generation the IC supports "height"*/
> +#define WACOM_G12	1
> +/* After and at G14 generation the IC supports "height" and
> + * it is defined as "Z" axis
> + */
> +#define WACOM_AG14	2
> +
> +struct wacom_desc {
> +	u16 descLen;
> +	u16 version;
> +	u16 reportLen;
> +	u16 reportReg;
> +	u16 inputReg;
> +	u16 maxInputLen;
> +	u16 outputReg;
> +	u16 maxOutputLen;
> +	u16 commReg;
> +	u16 dataReg;
> +	u16 vendorID;
> +	u16 productID;
> +	u16 fwVersion;
> +	u16 misc_high;
> +	u16 misc_low;
> +};

This looks like I2C HID descriptor. Is the device actually I2C HID
compatible? If so we should use that and abandon this driver.

Ping, Tatsunosuke, please advise.

Thanks.

-- 
Dmitry
