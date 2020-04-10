Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F881A4C28
	for <lists+linux-input@lfdr.de>; Sat, 11 Apr 2020 00:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDJWiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 18:38:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:41500 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgDJWiO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 18:38:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id n17so3318043lji.8;
        Fri, 10 Apr 2020 15:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LAO+gCgHL5tTHaVD3gJ8zq/eeHn13spJLxGQ7uaKoOM=;
        b=qMHOVxEfYN1XaWkmcDCFbkIq4O53uvNfdUiG/B+GNfY45U/if37tu6zjeNrLnyVFW5
         Q7QNMaPDEBPAggujB0vlILbGUVcPImGQrpVEtWRsNIjs3Q2soITlhTn0+lc/cugALtFT
         i6CAtCgxDDtIvjaq82i8iAygVNKl6fIJHh/jO3WaTYdk2IJjmRanErCrTNmABdj1XCIz
         hoGwwJZcUVvaQWg3lCCWyMAynRaPeM6tdBnBUzDzSdwFwUyVqxnOKVcreAcoUdXpV9ev
         mhfvNbhFvXukO5t3egEX3XTjA7yuW3dmSfhGfoeiOwdwjSXbBEdlP5HSQhvB4tOqCiQY
         atnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LAO+gCgHL5tTHaVD3gJ8zq/eeHn13spJLxGQ7uaKoOM=;
        b=QuRtyRKhTGR9z/mTsSab+tW7vBTC6SZlFAwpo/Nle5kfFvlgybQP84UbdZ60bCwBQw
         W1b4rho/60XLYAov2eBkg1ncJPfzXYHLxy0bapgLixcqnqDQaghI/ldlZ3T/6M58rsVs
         XkX7TX5ng7Wy3XPGgnW8oZ+rMVYytfUQ0n7wv1D23eWzc0XQ/wgLJmHasvSDg7eaaKIv
         MEDP0Iz1Z9AUge77/91IgY7b4xntWXSUWYAChPtB6mS3IT25FEhNNL804AD9Ut+DIA0w
         osU2NxT/gxle9OmXAyw4TT/hH9pewgHns9tjL4Oq8ISuNJnBkHnuPYJKk59BjY2yQohd
         lfrg==
X-Gm-Message-State: AGi0PubtImfl1YdsyZkrTF4HJi69wl246Nm1sYxr/M+5ZRV4UbiWrQk7
        RFf6RnAYluq0ZuaYdSxGpQ0=
X-Google-Smtp-Source: APiQypJ3gmntpSbsD+xUBIc3kPpOQltKKOtIwSqFCuAhjgL+4LyWO8H3eV7t+f4tchX93ZtEWjao5w==
X-Received: by 2002:a2e:b54c:: with SMTP id a12mr4184606ljn.86.1586558291061;
        Fri, 10 Apr 2020 15:38:11 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u19sm1919503lju.83.2020.04.10.15.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2020 15:38:10 -0700 (PDT)
Subject: Re: [PATCH v10 31/55] Input: atmel_mxt_ts - delay enabling IRQ when
 not using regulators
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-32-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <46e0b0cf-63f1-4b46-dc3e-0e6610e72d75@gmail.com>
Date:   Sat, 11 Apr 2020 01:38:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-32-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> The path of enabling the IRQ in the probe function is not safe in level
> triggered operation, if it was already powered up and there is a message
> waiting on the device (eg finger down) because the object table has not yet
> been read. This forces the ISR into a hard loop.
> 
> Delay enabling the interrupt until it is first needed.


> 
> -	if (data->use_retrigen_workaround) {
> +		/* Presence of data->irq means IRQ initialised */
> +		data->irq = data->client->irq;

IIRC, IRQ=0 could be a valid interrupt since this is a "virtual"
interrupt number.

...
>  	init_completion(&data->chg_completion);
> @@ -3826,26 +3842,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return error;
>  	}

What about just to tell the IRQ core not to enable the interrupt
handling during of the devm_request_threaded_irq()?

To achieve that, add this line here:

	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);

> -	error = devm_request_threaded_irq(&client->dev, client->irq,
> -					  NULL, mxt_interrupt, IRQF_ONESHOT,
> -					  client->name, data);
...

Then the interrupt will be requested in the disabled state and it will
be enabled only after the first enable_irq() invocation.
