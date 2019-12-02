Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48CE10E41B
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 02:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbfLBBC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Dec 2019 20:02:58 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38978 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfLBBC6 (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Sun, 1 Dec 2019 20:02:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id b137so15187084pga.6;
        Sun, 01 Dec 2019 17:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=t9N/uAwtbF2+FDxkTf7EKMdLt9cv2AJy0yo2Qfrx9KU=;
        b=o7PqfqeXkXGZyy4gViWQhZFDYkp2aITBqYpseDfJrsJPTRnayZanfVH9s4aIhTWJJ2
         /wzzq7nlb7agWoTTlFH6AB270Pq7zf0xBgC1CUPcqiyUPctOO+jkNzuNIGu8IeQu6RUT
         aAY4rPGOITBf5/pkqo73C7Ps6whnV+mxuRNKTklSQh8K2vPB5TFDOwV8+8Nk4jpnKYrS
         EVafoe3bVf7j0hyFp8dVJGo6I24Xd0tnF2xBFygOtcNVtJ3c0XieJNprnC6FBvnDA1ww
         h+VF8gn1ooguGyUYUE+AKSZzKUOPb2agJn/c/I5j95r2nkMxb9ODeH+DeBdfqYSIX6y3
         g56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=t9N/uAwtbF2+FDxkTf7EKMdLt9cv2AJy0yo2Qfrx9KU=;
        b=U92bFf08AvxNZtvb/oJABkt5QMGa1kgf8Ex2WUcE7s6dkIQjKRELCf3ilaD5f9gedt
         /EcB1aC4RRgwbwFQRLmlpYdk7RsoRuRQsEV2iYR/nauit9oX7j0Ggpk29hy3CzBDUH1n
         Gim3hmqBToFW3/9I5GlhtntzwVGwPU4SnWHckuXBanUZ0ElM2qJdArMVtu0b6zfRxRqn
         F9dId8yDK1DSEJcbdUn6mHq3PI63V40aVzJDKLC/6xcRwkFzmuT02D00nghcj6x/aZ41
         lkEZdxfztm9KatfcCpoiKChbyQcXehBlCEocCnNLpwSaobOJIuJB9dLSEC6p2MSycKdt
         Nxew==
X-Gm-Message-State: APjAAAVaGG+PCWKFpP0SKw9YCC3wwUUoTZsxl+DH6gXHmIdet4DODMOE
        pK9jt8g0rPftnrNPcOstI18=
X-Google-Smtp-Source: APXvYqxUzBD6IcfeYezD9LJyFbnDqhtRQVbi12aO0N4zYKaqs6MUtmxjTho10pw6khZIZf7SuQ3Yzg==
X-Received: by 2002:a63:510e:: with SMTP id f14mr10251627pgb.35.1575248577127;
        Sun, 01 Dec 2019 17:02:57 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b7sm22308763pjo.3.2019.12.01.17.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 17:02:56 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <Dmitry.torokhov@gmail.com>
Date:   Sun, 1 Dec 2019 17:02:53 -0800
To:     "Dave.Wang" <dave.wang@emc.com.tw>
Cc:     Linux-kernel@vger.kernel.org, Linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] Input: elan_i2c - Add more hardware ID for Lenovo laptop
Message-ID: <20191202010253.GO248138@dtor-ws>
References: <001e01d5a368$24946950$6dbd3bf0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <001e01d5a368$24946950$6dbd3bf0$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dave,

On Mon, Nov 25, 2019 at 04:12:56PM +0800, Dave.Wang wrote:
> Add more hardware ID for Lenovo laptop.

Any chance you could also list what devices use which hardware ID?

Thanks!

> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  include/linux/input/elan-i2c-ids.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/input/elan-i2c-ids.h
> b/include/linux/input/elan-i2c-ids.h
> index 1ecb6b45812c..247e3f75bae7 100644
> --- a/include/linux/input/elan-i2c-ids.h
> +++ b/include/linux/input/elan-i2c-ids.h
> @@ -67,8 +67,15 @@ static const struct acpi_device_id elan_acpi_id[] = {
>  	{ "ELAN062B", 0 },
>  	{ "ELAN062C", 0 },
>  	{ "ELAN062D", 0 },
> +	{ "ELAN062E", 0 },
> +	{ "ELAN062F", 0 },
>  	{ "ELAN0631", 0 },
>  	{ "ELAN0632", 0 },
> +	{ "ELAN0633", 0 },
> +	{ "ELAN0634", 0 },
> +	{ "ELAN0635", 0 },
> +	{ "ELAN0636", 0 },
> +	{ "ELAN0637", 0 },
>  	{ "ELAN1000", 0 },
>  	{ }
>  };
> -- 
> 2.17.1
> 

-- 
Dmitry
