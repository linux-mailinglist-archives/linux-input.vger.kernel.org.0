Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3EA27920F
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2019 19:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbfG2R0X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Jul 2019 13:26:23 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43724 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfG2R0W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Jul 2019 13:26:22 -0400
Received: by mail-io1-f65.google.com with SMTP id k20so121758338ios.10;
        Mon, 29 Jul 2019 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1gop2WQakw39EVmEG3HQ5R3ia+tj0ahEugcn6D7gzBs=;
        b=RIMq7lbWoqJyQm8c7nRO9/Zk71C3qWZ97+yIYo6C/GaFfvgX68BC+TNK4BgfE37czl
         kpca1j6v8gKHHFwI/ZpDqRm00VtMLV8vvOvCJ8BCaSZZpycocrn7osdEFw0e72CaSZCy
         XOkDTm2D2xzP6P7+k/CbPSPjR9qwE0eatRTzp2oIF88zR2G90oaY7EEtD7oFJOav2WpK
         fUF2i/EbVmtpvEeCagmV8kJUWPXTCTJ9CYP0O+q1/DlnkHu5u9njlUc+6U0XroxpXETm
         78uBfiOFvQqLiTlURK9BwQ3ErOT6uvN0Lcm8izTARFdhvj0W3ArcDah9eZEZ10vG3Io5
         a+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1gop2WQakw39EVmEG3HQ5R3ia+tj0ahEugcn6D7gzBs=;
        b=eaP5we1XMztkH3JUSr+DYmRnhI489glKHf8gxyZpAmBDcR2NIufYbi4arG/E3WNuWr
         UjzW9mZJs025uuUWihptropfJHCAulxo0A/FFrC79KxzRku3nA1MoFi84JHVTE5jI8wL
         usfS56kWyOzJS2ye4Af1CrP+L9gLgDPRDQttorvSEuDVikoH4AbSs6rgy71WvP58vPjC
         JkZlSFnm1mlfQvwk/kLSNr7qV4DHyLW0SrIZDSWWp7fvYcRxTBZRlVLHFtDlpgZmhi+A
         8QWKVK/GTeuLVlBRyDOzL7pfOtUmTKUz3FfTlRaXJm65+b44QjOfsr4EGfPxWZYvfnbc
         s/0A==
X-Gm-Message-State: APjAAAU/IeVfZiUaByl7x23HcLqXuYQ+0Reuv8GUYrrrzxHJQI6m92Ws
        T1kPtxtPQMweNDOerAVUrZ4=
X-Google-Smtp-Source: APXvYqzJNAFmbawPrIKO1SZsPcWwKj0EIBjmHORHpTn7Q31bYs6DiSNdqpCrIblGpQd5dtimgBJRaw==
X-Received: by 2002:a5d:9291:: with SMTP id s17mr16425770iom.10.1564421181746;
        Mon, 29 Jul 2019 10:26:21 -0700 (PDT)
Received: from localhost ([8.46.76.96])
        by smtp.gmail.com with ESMTPSA id p10sm78171880iob.54.2019.07.29.10.26.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 10:26:21 -0700 (PDT)
Date:   Mon, 29 Jul 2019 19:26:07 +0200
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 1/2] input: keyboard: gpio_keys_polled: use gpio lookup
 table
Message-ID: <20190729172607.GB755@penguin>
References: <1564415994-22871-1-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1564415994-22871-1-git-send-email-info@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Enrico,

On Mon, Jul 29, 2019 at 05:59:53PM +0200, Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> Support the recently introduced gpio lookup tables for
> attaching to gpio lines. So, harcoded gpio numbers aren't
> needed anymore.
> 
> changes v3:
>     * fix printf string in gpio_keys_polled_get_gpiod()
>     * fix unused variable 'error' in gpio_keys_polled_get_gpiod()
>     * fix uninitialized variable in gpio_keys_polled_get_gpiod_fwnode()

As I think I mentioned a while back I would prefer to get gpiolob
support swnode-backed properties so that the driver would not need to
know about differences between ACPI, DT and static board files.

I just recently re-posted patches for this, let's see if we can get them
landed in the kernel.

Thanks.

-- 
Dmitry
