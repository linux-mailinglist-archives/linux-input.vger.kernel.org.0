Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E872BCF2
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 03:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbfE1Bqa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 21:46:30 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38057 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727271AbfE1Bqa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 21:46:30 -0400
Received: by mail-pf1-f196.google.com with SMTP id b76so10421889pfb.5;
        Mon, 27 May 2019 18:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=D2rFQ9Zn6Sfvpd4VvHl4DIwDnQ+7eEVa+yVBHImykSU=;
        b=G+O60kLd8YSi7cKOOqV9I0jGI+lt6eDsuLRDZ0D78YJjIrsR36IZ900jxnl+29KlDX
         JI3xoutFdjqNBBJuoJFiORIaSU2tKcpTpgWGyOcG5bSuo2TJQaNy56Jg2gWf+1ctJ6qi
         qK5LtZjRN6ZWaRGf5f6Q5ZP1RWZEm8t1HWKPpqNYnKk0WG4bRd/ZIiti1hpuVXB4xPuY
         AwM3rvAd/rLVfbDgj4XreRloZ3NgPz4moCLJ4SMrlpBfEl/X+MBPjdClyukRcJGnGIQz
         cO5mFnrwr6Y+HtKbWt3Ii5eQ6Aqw7S/WdAqY07OiumuHnacG/IqwMjuvwlpPLNR61Jja
         iGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D2rFQ9Zn6Sfvpd4VvHl4DIwDnQ+7eEVa+yVBHImykSU=;
        b=kaRUpUeQoZQWz9sqDxQnanMYPVAu326fPuEXbmghB3qyh0gpX1d4fPaXgJv8POvOjF
         nMlEJqjq69TqCdn5KWoLd5OVByKUNnmcOmkBOvqdXiopGHwqXP3gGqVi92jhF6kceVD0
         ythaXJACMwTCzUxRxHInbT8zzGsxt6Q2YV5t8aH7109KlnnimTKbpx5UiqpiGYndmnPa
         RO78z5QBrnq+QgqnvvE8OkLgnypHDpdFvQAwERbR/uXBr3XWI6/uI+Wzn/oCMXOr2lP5
         ZNKmAZa/I7BlLszVtbnjiSBnAL9QIctrZO3jrkyiiM0j9Hk7Fm9UFKztntmj6LKT4609
         2/Dg==
X-Gm-Message-State: APjAAAV9cNNlt//O5Jw4tClC3XmrNYvEGQgLKKI20SzExcBvBQteRt1W
        CTckD5wH43RMgFUw15E+AYs=
X-Google-Smtp-Source: APXvYqwaUI8LjoO6n4nZaTh0GQa+WbshW4PAeOWZTV2ETgI4mg9Cd5WfjPhqg1LtXsP7a4ZLMYe6eA==
X-Received: by 2002:a17:90a:364b:: with SMTP id s69mr2211108pjb.15.1559007989594;
        Mon, 27 May 2019 18:46:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id d5sm8354611pgi.86.2019.05.27.18.46.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 18:46:28 -0700 (PDT)
Date:   Mon, 27 May 2019 18:46:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Fix Elan I2C touchpads in latest generation from
 Lenovo
Message-ID: <20190528014626.GB193221@dtor-ws>
References: <20190524135046.17710-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190524135046.17710-1-benjamin.tissoires@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 24, 2019 at 03:50:38PM +0200, Benjamin Tissoires wrote:
> Here comes the v3.
> 
> Very few changes from v2:
> - dropped the last 2 patches where I tried to be smart, and it turns out
>   that it was not very a good idea
> - also removed the only other blacklisted model, as it has been tested with
>   the v2 and it is also now working properly

Applied the lot, thank you.

> 
> Cheers,
> Benjamin
> 
> Benjamin Tissoires (8):
>   Input: elantech - query the min/max information beforehand too
>   Input: elantech - add helper function elantech_is_buttonpad()
>   Input: elantech - detect middle button based on firmware version
>   dt-bindings: add more optional properties for elan_i2c touchpads
>   Input: elan_i2c - do not query the info if they are provided
>   Input: elantech/SMBus - export all capabilities from the PS/2 node
>   Input: elan_i2c - handle physical middle button
>   Input: elantech: remove P52 and P72 from SMBus blacklist
> 
>  .../devicetree/bindings/input/elan_i2c.txt    |  11 +
>  drivers/input/mouse/elan_i2c_core.c           |  72 +++-
>  drivers/input/mouse/elantech.c                | 320 ++++++++++--------
>  drivers/input/mouse/elantech.h                |   8 +
>  4 files changed, 246 insertions(+), 165 deletions(-)
> 
> -- 
> 2.21.0
> 

-- 
Dmitry
