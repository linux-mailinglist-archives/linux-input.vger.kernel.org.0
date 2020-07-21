Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C112B228B6E
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 23:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731101AbgGUVdV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 17:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731054AbgGUVdV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 17:33:21 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC85EC061794;
        Tue, 21 Jul 2020 14:33:20 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d1so10827082plr.8;
        Tue, 21 Jul 2020 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IPEybiNCuxG16IwnjZkyTnI2Sy+pMglvmwaDIAOCXDQ=;
        b=gVYAvDc6+4klrU8P7Av0M6X7DVvVtxfywvP1ZsXCsYDfwpDx8DpLxCOWyni3xoqj+X
         HvgoNr0vLS4kR7yz68TT49b3Ab/e8rXT4Gf0BEUYodAAfqlfwfoa4nTFFYNxGXC87IQx
         2DNAwmKENj4JX3vjUlcYev0pO2xm0EEHnRP1w4gOREy0tgjQ2V5jPmSKouinOElTFzxQ
         cDtWpCJOf7Mc0mbi56VQMoLYdEQ107Az9AY+Vtgu7YtVr5S8S1vJujvDrUagoh2UVu1l
         RGtC2x3XIRXkZ3T+ZQxxjdjSUF5wQ/M/HL1uODPcUxLGJgZzZDWT3NgZGt24LEmXLXpf
         weRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IPEybiNCuxG16IwnjZkyTnI2Sy+pMglvmwaDIAOCXDQ=;
        b=MJPEMNbceShvB6WgPIutBMv09tH03xGq6xo909b6lRfZXYn/jg+vGQ+VfunA5dxa6V
         3tUq4C07BI4LnLyWUQQxdiy6uP7qWCRUAXObsgyVum9RtYhKnYpgWmMN9dy7m5jhGNwk
         7dl+Gu3wBLmnYIklaUq7L+tTF+BF8raeVBxNf0WPoQnamOZ8DKiEWy4+7WRE3XWCKz43
         jCoUUQGvFp/WbisvN5wd68ParxHcXO+ki0ruwutRQ/BWDZ2V7hZzD7RtXY0DqLPpZAQ1
         bSXZP6WD/NJt7+3kBtRYgEdcCHeaJV4NOD+XaYGJ/KD4Sq5ITl1w31ur3tY8sBFYmkt2
         grEQ==
X-Gm-Message-State: AOAM532bE5qnV3BtJduMMmdMQ3f5YSMJTW8s4VrxIE7LEbMU49AbT0kA
        cxXYaqQjU9iaTJUvl+kHeCc=
X-Google-Smtp-Source: ABdhPJwIXh9Yscbb9MZD7PeQLNXIVmQOtDemt/Dy5peJTGG6lp21zfwwdGniynlCs+ClwT5eXrH5Qw==
X-Received: by 2002:a17:902:fe0d:: with SMTP id g13mr24548261plj.326.1595367200272;
        Tue, 21 Jul 2020 14:33:20 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q29sm21617224pfl.77.2020.07.21.14.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 14:33:19 -0700 (PDT)
Date:   Tue, 21 Jul 2020 14:33:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com, digetx@gmail.com
Subject: Re: [PATCH 1/1] Input: atmel_mxt_ts - only read messages in
 mxt_acquire_irq() when necessary
Message-ID: <20200721213317.GK1665100@dtor-ws>
References: <20200720073612.6252-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200720073612.6252-1-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

On Mon, Jul 20, 2020 at 04:36:12PM +0900, Jiada Wang wrote:
> +static int mxt_check_retrigen(struct mxt_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int error;
> +	int val;
> +
> +	data->use_retrigen_workaround = false;
> +
> +	if (irq_get_trigger_type(data->irq) & IRQF_TRIGGER_LOW)
> +		return 0;

Do you think we could change this to:

	irq_data = irq_get_irq_data(data->irq);
	if (!irq_data) {
		... invalid IRQ
		retrun -EINVAL;
	}

	if (irqd_is_level_type(irq_data))
		return 0;

as we should not really be concerned about polarity (there could be an
inverter between the controller and AP), but rather whether it is level
or edge interrupt.

Thanks.

-- 
Dmitry
