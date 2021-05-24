Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52C6438F1A9
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 18:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233215AbhEXQg1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 12:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbhEXQgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 12:36:21 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A93EC061574
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 09:34:53 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so11301029wmg.3
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=noV22cisnLk07vVNIJIa5BtKYzJUzQslSHcaJ2kRp5k=;
        b=gF8DNDQtZB6u3k7x9CCEXRPAKUkzfHChAA6nVGoUA+krBIloOfkArNlBzbp1jaNfTK
         9gM3ZUURH1qtWCzDP2hlhHMsa0fcz0FfVrZ+MsdUKcZI9LiiPnrzW2+5AZsTrS4vzUjG
         Mm4cd7ygs47w788JO+46XluADigt6ZdQ9QeEw4WET1aPMnK1WKK1nzxQvVcQxsIkSRYU
         cBs5aTQtFWH34Z/3b9c1b9vpoHs5QQ+XoH3DUI+QboYrGVVgIlD2+b9fsds7uxlxDB5i
         AVCjVvNKc7kq+hQBYdByouYB/fvqHm/0C5A3l0WvIxKlX1jLQnefpfREW4Tv9IS//64t
         XQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=noV22cisnLk07vVNIJIa5BtKYzJUzQslSHcaJ2kRp5k=;
        b=nlOczXG9Rv/HjO0xiBD5TAsYK8/7jvqwkA3ZvaCbcYs88RXLviBH3D1XoaR9TSTueW
         VbOz8HYz11SRPaS/ia7Q9TuIhRCcepfm93N+QwPpJ9sWTgm27/iaGt0EviDFANuyskS6
         qv8gwPNRRFSLAwqeamahw0UykohmUR7eQ7NiEoC+zZKmKsJAPZrmbxx7cWmJKxx0EeUw
         NhmHLZdsVETxcB6Q3npA3sBxWUeJ0sNVjiTwjGfXPZF0OFKmAEPcQ1OCPSxBULm0PC0d
         VebAU4jJyqjKrRolLcVHgSKkSNag7B5P0xvXv1tCicqT0x/qoWuWQEkNsWws2XbZgmm0
         Koow==
X-Gm-Message-State: AOAM5326gimNWiXGaUuEIR350B/3QkzeZw8P11OZFhbEe/IcjANF+c0X
        0wTGyEX2aLmyHBKQY+rGk/5R8w==
X-Google-Smtp-Source: ABdhPJw348snexNxt6xDV4TXKmAgNLOZDpWnI3jydMC3du3ynBPTTovBImcaYEB/yM+7dCRBeoK2yQ==
X-Received: by 2002:a1c:1f4f:: with SMTP id f76mr20168340wmf.62.1621874091567;
        Mon, 24 May 2021 09:34:51 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id g5sm8578285wmi.8.2021.05.24.09.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:34:50 -0700 (PDT)
Date:   Mon, 24 May 2021 17:34:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com
Subject: Re: [PATCH v10 01/12] HID: nintendo: add nintendo switch controller
 driver
Message-ID: <20210524163449.GA4153557@dell>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
 <20191230012720.2368987-2-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191230012720.2368987-2-djogorchock@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 29 Dec 2019, Daniel J. Ogorchock wrote:

> The hid-nintendo driver supports the Nintendo Switch Pro Controllers and
> the Joy-Cons. The Pro Controllers can be used over USB or Bluetooth.
> 
> The Joy-Cons each create their own, independent input devices, so it is
> up to userspace to combine them if desired.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  MAINTAINERS                |   6 +
>  drivers/hid/Kconfig        |  11 +
>  drivers/hid/Makefile       |   1 +
>  drivers/hid/hid-ids.h      |   3 +
>  drivers/hid/hid-nintendo.c | 822 +++++++++++++++++++++++++++++++++++++
>  5 files changed, 843 insertions(+)
>  create mode 100644 drivers/hid/hid-nintendo.c

Looks like a lot of effort was put into this.

What is the current status?  Are you still pursuing?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
