Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23C52144C2C
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 07:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgAVG5l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 01:57:41 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45315 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgAVG5l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 01:57:41 -0500
Received: by mail-pf1-f196.google.com with SMTP id 2so2863628pfg.12;
        Tue, 21 Jan 2020 22:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MYul01GCq37ayThShJ9dZaDN18M/FwlRxDl1QupNebU=;
        b=dnzCF34eyTR4XHrGflmfk99UgHH1ncq0JXUlqVGa8SKI91xQirSGUn6f8ydQYdA6rQ
         bvAJBjhSG/qAbH4AZQQ6RyvwPBjVPAKjDn+i9XeeCiSdbWYLMp1lOtwKY2fYxZz21nKI
         vF+lhMIQs6wHMe6KytTDLuJn/Li32hZUniHyCBqpyzXtKfI49xMqCxpJXhZVTOhyb9Ff
         gjmlDu95gKdkd7MRcBeSEGBrr0H4DPQY4QgrjLwgl3fYem3tzEatpmB2ojgzxvs9rOhE
         UnhRcjHzSigUZapD1Y/cOnyCzoF6VNvfDkKGZI8RBwXZ/2GdIv5cTKyBspdTMfTsDQoh
         8YNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MYul01GCq37ayThShJ9dZaDN18M/FwlRxDl1QupNebU=;
        b=lrxE0HZgaaZ4dwTAVsVXb537ARRh6diSEyHlgrHtDqwGwRmYE8JTElymayTOm04tY9
         VNetj3eOawC4fgF809PGimK+YSaxUY+lAxzuYDpcOuMTD0rqSHQSRkA+VpRa2mhCh54f
         JU3VgRe1Vmuu9PxKf7ZreSoreJ0WABY4NuuKMRFs0QmHVjPa+XV0Jiw3yQTZBCki/rMh
         yujSdQC4UDP8K8iBf3DxOb60GQcJWc7oQ+YaZn62R0DRJZUrIMmp1V47+ZH0gjibAuMf
         4HKoM0E+1yLA5rpJlyU6DZifl2KRhOTifBuc3SMHTLrOSxBiQKM2UfqiMrcb5tdB4p1m
         2kFA==
X-Gm-Message-State: APjAAAVrqmdXWjrlS74TCBnpwI9ZSszVLwdvjjLh+iXrY9GdP0cA3tAC
        02y5q0oq54qL/1RcV7SPgwE=
X-Google-Smtp-Source: APXvYqxjCexWKOScgRfZfKpFHyxyq43XkgznyZRFleu5ixWogr/GkiFAO/vChUmU23ICbwPFVTBGXg==
X-Received: by 2002:a63:590e:: with SMTP id n14mr9404729pgb.10.1579676260432;
        Tue, 21 Jan 2020 22:57:40 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b19sm44632997pfo.56.2020.01.21.22.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:57:39 -0800 (PST)
Date:   Tue, 21 Jan 2020 22:57:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: add IOC3 serio driver
Message-ID: <20200122065737.GG110084@dtor-ws>
References: <20200115125951.3677-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115125951.3677-1-tbogendoerfer@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thomas,

On Wed, Jan 15, 2020 at 01:59:50PM +0100, Thomas Bogendoerfer wrote:
> +
> +	platform_set_drvdata(pdev, d);
> +	serio_register_port(d->kbd);
> +	serio_register_port(d->aux);
> +
> +	ret = request_irq(irq, ioc3kbd_intr, IRQF_SHARED, "ioc3-kbd", d);

I just realized something - serio ports are registered asynchronously,
and therefore may not be ready when you request IRQ which may fire
immediately. To solve this issue serio core allows to specify start()
method that is called after serio port has been registered. In this
method you can set "exist" flag associated with either kbd or aux port,
and check these flags in your interrupt routine before deciding whether
you can forward the received data to appropriate port via
serio_interrupt().

Please see i8042_start() for example of use.

Thanks.

-- 
Dmitry
