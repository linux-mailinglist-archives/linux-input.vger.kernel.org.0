Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6758327EE3A
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 18:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgI3QFc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 12:05:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32200 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725893AbgI3QFc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 12:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601481930;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NfBU6j8IEojpJBd5+sqw+eCL/YeG6g7omaok5w3RhSg=;
        b=N6oigUm92kkaY1J2qCWyqwWSK5s5RrTtTmMXxCkZzKgVkOxDNb0CHDRntnX2ye1fdAqj2T
        EJYZT6OstcKBUWLMkgI+W3UWukyhavkH5EkVE4dc9zvpSsJsZjexJhGOKvqD4h3A5HWJLb
        KXPOBAQ3OtGtHnZ1DX4PL2LQjXAHwKo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-P2VSOCBuMdmvu7-oEhVsCQ-1; Wed, 30 Sep 2020 12:05:29 -0400
X-MC-Unique: P2VSOCBuMdmvu7-oEhVsCQ-1
Received: by mail-qv1-f70.google.com with SMTP id o14so1298100qve.7
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 09:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=NfBU6j8IEojpJBd5+sqw+eCL/YeG6g7omaok5w3RhSg=;
        b=iGpvDlv0dvMzvk/mqhrBU5O3rFvZWUDC3Z/mvLj+6LWKPb2PJeLVY26mrl87RdL5M1
         HgeMH0xdKe8fN57Sq4+WR70wizAFO3+dmzg0b9oXO04n3EB5SlnK3Hzoc+CvwtKyFZHz
         HKI+t58dN7CK0ef99A9nHDuHvXdiz2gJ530kE/dMSgnmnVtGBfBlsZgvG0C0yWTjuJ8p
         sSdeiqVxyT/43OhrCC/dqd9cvzn97AnraodHX8epuPkyjYpmuZfopqNNdC4CFNKuMqhh
         PhfD7w0gI4Gm/4Vyzx4Y6h5/l/g6xonULpA6ALo0RdNotAvnDYfiT9eF0ay1zUdt8Mwp
         wfGw==
X-Gm-Message-State: AOAM530w3WJpC8EfwFVowwmU5OMGJvOgx3qTBbzoPMeijm/W6AWdRTHy
        hGUopsHus3V5y4Sf5w4/fNrmN5OO5DOrJIuQABd51L7pR3R4V8prr5LQFxKbVUxbjbeQZUo5Ush
        qeztlabaeZLNlXjjd/C8Aoy4=
X-Received: by 2002:ac8:1ab3:: with SMTP id x48mr2924874qtj.153.1601481927591;
        Wed, 30 Sep 2020 09:05:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycnvjhbY+bDcP08koSkowZT8GcY1IRVGUibZXDluJX0XH0bj9/o2ftRDD2wo2mjCIzeBP9KQ==
X-Received: by 2002:ac8:1ab3:: with SMTP id x48mr2924736qtj.153.1601481925864;
        Wed, 30 Sep 2020 09:05:25 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id z131sm2648312qkb.59.2020.09.30.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:05:25 -0700 (PDT)
Message-ID: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
Subject: Re: [PATCH v2] Input: synaptics - enable InterTouch for ThinkPad
 X1E/P1 2nd gen
From:   Lyude Paul <lyude@redhat.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Date:   Wed, 30 Sep 2020 12:05:22 -0400
In-Reply-To: <20200930112437.13705-1-Jason@zx2c4.com>
References: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
         <20200930112437.13705-1-Jason@zx2c4.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Maybe correct the comment in smbus_pnp_ids to reflect this handles both the X1
Extreme and P2 2nd Gen. Then I'd probably split the bootloader change into a
commit that comes before adding the new PnP IDs.

Otherwise though:

Acked-by: Lyude Paul <lyude@redhat.com>

Let's see what the folks from synaptics say

On Wed, 2020-09-30 at 13:24 +0200, Jason A. Donenfeld wrote:
> With the new RMI4 F3A support posted yesterday, this appears to maybe
> work, but requires us to add support for the newer bootloader, which
> this commit does.
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  drivers/input/rmi4/rmi_f34v7.c  | 7 +++++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c
> b/drivers/input/mouse/synaptics.c
> index 8a54efd6eb95..9d6fec84047b 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
>  	"LEN0096", /* X280 */
>  	"LEN0097", /* X280 -> ALPS trackpoint */
>  	"LEN0099", /* X1 Extreme 1st */
> +	"LEN0402", /* X1 Extreme 2nd */
>  	"LEN009b", /* T580 */
>  	"LEN200f", /* T450s */
>  	"LEN2044", /* L470  */
> diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
> index 74f7c6f214ff..8cfaa2f19ed5 100644
> --- a/drivers/input/rmi4/rmi_f34v7.c
> +++ b/drivers/input/rmi4/rmi_f34v7.c
> @@ -1364,9 +1364,12 @@ int rmi_f34v7_probe(struct f34_data *f34)
>  		f34->bl_version = 6;
>  	} else if (f34->bootloader_id[1] == 7) {
>  		f34->bl_version = 7;
> +	} else if (f34->bootloader_id[1] == 8) {
> +		f34->bl_version = 8;
>  	} else {
> -		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader
> version\n",
> -				__func__);
> +		dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version:
> %d (%c) %d (%c)\n",
> +				__func__, f34->bootloader_id[0], f34-
> >bootloader_id[0],
> +				f34->bootloader_id[1], f34->bootloader_id[1]);
>  		return -EINVAL;
>  	}
>  
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

