Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6773C8B6B
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 21:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhGNTNk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 15:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhGNTNk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 15:13:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B57C06175F;
        Wed, 14 Jul 2021 12:10:47 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id jx7-20020a17090b46c7b02901757deaf2c8so2109276pjb.0;
        Wed, 14 Jul 2021 12:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eVOzCA9vN/udrQW0niM+HIJJjScNVs7pEzEmnaK2AoU=;
        b=MfCzVFFQbyqCkUh6OWrlqZbhKM+oSI+ugm1EHunw/uuJRnLfg0i795y5NHo09ZBNcW
         Hy4e4DdJF9KmXHfO4RotuThrZ0iZciN8imCIPA/No0ZSwAGbk9A3xQpK/ZN2xf62hJ1q
         4Pg+A44kEBnF/tvbEZSWzBu0G35YJR+K/PZxxrZGlvxXlbpYRRZqbWRyjCIXs4zEH/dA
         KOoSZUFadY9/6Aiz2mo8T8CYYAZtcnELWmr49CJVh25/Z4EvVeYM037EOd9ie6ZOPwai
         ptAoLtZaqYAv2SzDkkkKgCzb9SIPGBaUdYMPQFRMLtN1DROH5j297R3ty/npzGRnltBh
         hHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eVOzCA9vN/udrQW0niM+HIJJjScNVs7pEzEmnaK2AoU=;
        b=odOPWYb1+AX4dH6+IklNmvU+UcjJNVcfbKtO/2tcBkhPIoU1paAosGkFyZ8dSXxFDy
         b7ykbSbAHy5TYq9IxfRmYON4EPV03iekx3r6zNS6Vg/G48F+JKwX9b0xhymgkvZJ2ZH6
         +fldJuIg8rLVirSnEhopMoXz+26W1/ATNbZ5YXzSe62izSvD/7jQFbZFKd/UH5GwttqV
         Cyu8WzM+Y3CD28xv35HIZNirOiWBZd1SeDIMEoMtmQZUbeh/dyScoS6WHcYfZvfuVnLF
         l30GBbn4ZFkijlBotTxrQy6FuLckDm/q90o18IuwXeKoCiE53Op5oZOPHRcSMkmv2X6o
         7DXA==
X-Gm-Message-State: AOAM531/UF6hnE9ULY+2NGSarAqSGUTvELI0ENGRJ9nLttyNmQ9gChFd
        lrETxr5MKc04xZVM5Hrnv/4=
X-Google-Smtp-Source: ABdhPJzP67ZWRLI7GmmRAITDoykQKNyfLMCsD4TWHd1AF7NTmZ+6ZneWGx6mX7S++nw3drnoK2JHSA==
X-Received: by 2002:a17:902:6bcb:b029:127:9c65:f1fb with SMTP id m11-20020a1709026bcbb02901279c65f1fbmr8658316plt.64.1626289846990;
        Wed, 14 Jul 2021 12:10:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a7d1:b34b:7f4a:849b])
        by smtp.gmail.com with ESMTPSA id p3sm4058304pgi.20.2021.07.14.12.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 12:10:45 -0700 (PDT)
Date:   Wed, 14 Jul 2021 12:10:43 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] bus: Make remove callback return void
Message-ID: <YO82s5MC6HA8mL2Q@google.com>
References: <20210713193522.1770306-1-u.kleine-koenig@pengutronix.de>
 <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210713193522.1770306-6-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 13, 2021 at 09:35:22PM +0200, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 

...

>  drivers/input/gameport/gameport.c         | 3 +--
>  drivers/input/serio/serio.c               | 3 +--

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
