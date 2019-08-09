Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA2C8848F
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 23:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbfHIVW1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 17:22:27 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45131 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHIVW0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 17:22:26 -0400
Received: by mail-qt1-f194.google.com with SMTP id f7so4342587qtq.12
        for <linux-input@vger.kernel.org>; Fri, 09 Aug 2019 14:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:content-transfer-encoding;
        bh=Ug4MTgi2ueZfqMA4+FWSQr133wSyuN+mgZsk4RxY5I8=;
        b=T0xdr3m2vk1dRABuDHdagNOsvCUEuquJMDDxB4gyWa18mibI8q1Vl2M6UddZGZuoWW
         bVUPPg4jkfLa01tuKqceOyPnbi9/T9qyxZo8eXdnZjta40CecwXDLsVLjSwlIwd8TnCx
         aSKa6IzN3mnKHnng1qTOazZiG7hYxV8s5NDQ5gg57ii+DIvjBI4EAo8h2D1ctIrW7Ogy
         wb3138VaA4Hi8b6nhh8BQ8xYtUBvPhH2REMBZQlFJw+frygxw/RvqwrnBeusxiEt/6gG
         V0YnG6ULca5e8RNwu3ogTlbKFOwvOjbG6CzJrOvQ4VB0+sSAdwpat07fvTDXm//+YTms
         RyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=Ug4MTgi2ueZfqMA4+FWSQr133wSyuN+mgZsk4RxY5I8=;
        b=s2cXJpVm4AFXeUOjOJ8Dkj4KiiiR7dbdcD2gkEux/y07zc77LY24DqIAye8LvGjiwd
         G8XKj2MhBvBE1JuUi0zrmaHvUDFz4tMO0hm5NOrJXZIYEk0kjv1T/aRUr4wWuD6tIMAn
         sh+L/Uiu1sAkwjLu+LHwMEQeIaPx7Lj/mZggIIsU0Ch2/i9K4dzS6v5nK49ZQP/lvu6Y
         1LK5QxvyQwUoFDXcHHl6DhMCMDpq/MSQGdNyji75wMACXO3fnLTt53a27A6A2bfjlc7J
         pMDA3UgSX8YOoYXVC8BOrCcVcLfH11zVWLrirNIFAXML8FtyOGSOMOwNCE5xvRA4GVdW
         CJNw==
X-Gm-Message-State: APjAAAVSxXPgGRTLei8GE0RQov1WJ6AkFFdWne7nUO+3ih3sDfzmSdR0
        ZCtwkK1a3d8xkQeURI6YxXzoFw==
X-Google-Smtp-Source: APXvYqxHJ16TPbArOOObvex2qGMXiPYuuTyPvcouM0eg7EGKkUFhFNbpUw6MquRPUl6SIdbH5N+5zQ==
X-Received: by 2002:ac8:252e:: with SMTP id 43mr19908152qtm.61.1565385745973;
        Fri, 09 Aug 2019 14:22:25 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
        by smtp.gmail.com with ESMTPSA id p3sm63655473qta.12.2019.08.09.14.22.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 14:22:25 -0700 (PDT)
Date:   Fri, 9 Aug 2019 14:22:22 -0700
From:   Jakub Kicinski <jakub.kicinski@netronome.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 7/9] mfd: ioc3: Add driver for SGI IOC3 chip
Message-ID: <20190809142222.4558691e@cakuba.netronome.com>
In-Reply-To: <20190809103235.16338-8-tbogendoerfer@suse.de>
References: <20190809103235.16338-1-tbogendoerfer@suse.de>
        <20190809103235.16338-8-tbogendoerfer@suse.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri,  9 Aug 2019 12:32:29 +0200, Thomas Bogendoerfer wrote:
> SGI IOC3 chip has integrated ethernet, keyboard and mouse interface.
> It also supports connecting a SuperIO chip for serial and parallel
> interfaces. IOC3 is used inside various SGI systemboards and add-on
> cards with different equipped external interfaces.
> 
> Support for ethernet and serial interfaces were implemented inside
> the network driver. This patchset moves out the not network related
> parts to a new MFD driver, which takes care of card detection,
> setup of platform devices and interrupt distribution for the subdevices.
> 
> Serial portion: Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

There are a lot of changes in the ethernet part which are not easy to
explain by the introduction of the other MFD parts.. Could you possibly
break this change up into smaller chunks?

Also please don't use stdint types in the kernel, please try checkpatch
to catch coding style issues.
