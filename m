Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA45EDCE74
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 20:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733247AbfJRSlO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 14:41:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41596 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730794AbfJRSlO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 14:41:14 -0400
Received: by mail-pf1-f196.google.com with SMTP id q7so4394967pfh.8;
        Fri, 18 Oct 2019 11:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UinSvkDLfTC+XiP2vKIBGyDn79x/XTvuzm7B+8AYlL8=;
        b=UMH8hxRFJOOJeXzCIZPf/rIFEn6ODOgbq4Lr2sInLLFA23TvGvks6PCg8iFRBBYHjS
         YBzH7x+7vY4NYCJDxaFSgfViupLFZN66oEC3pnGB1a8hFDK59fEBkLeS1usXlgtk5c8m
         VaUNCgsWN2QJGxmzpd+oGw8qkSt8E9pNnWiQBzITyeiAFhe9kaZCEGoXNTWROYTItRB6
         jmSKEQOc2Zb7raMcd0L8VtmJtGowntLNLqniq3GzzS+Eeq9UzZ74V+nydGwfSnS0HoX5
         rtqdjVMQtZnXQ8G785RkuUtZ5fsuwYfIJooUd4glqLIcFxDEzPjEJbhgLi4geAjNxmXO
         44qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UinSvkDLfTC+XiP2vKIBGyDn79x/XTvuzm7B+8AYlL8=;
        b=DyT02vHW/vMAvMmwaJjp8GdAc5q3aDuPTi+sxDZal7B4NLH85Gryx6kfcfCrASaaEp
         HzuW+ui3WXpNkOkeYRX/0PJHKSg0kdwg+c6lJG7H4fxlpOpPEuyrZTMfxHJmOkdqQe6/
         XsA0ysjsk1u5BjX7wWcK+jp4t5xbGLv0Z6ZO5xJmmyvUFwA4kFokW3vS9hlaelu0UYlK
         G3ZK9VFjNXmesa49llQisOydeKveZnKNaV/NglCqczqpi9EFBypZkywURLL4565xmbTy
         vUEM09w54o5FtwZUpKEqayQxLi3cAmfJR08FZ1xYVh9jR+05eO89Oi1G7HmypZFBm9fp
         zGJA==
X-Gm-Message-State: APjAAAW+B/tbP6WEzrsnk9cFn3cyNIKkn9pjD7HdMRyEd3TZQSH6Edrj
        6w62g+6tb2JjGJSKFFky6fzt298a
X-Google-Smtp-Source: APXvYqwKxmO277zrDN1ND2ApV7+ouGwspVhzN4O1aLlYUXNWPVKfzZL3GB1RBcqrzsjNvms1xruaEA==
X-Received: by 2002:a17:90a:bd8e:: with SMTP id z14mr12420751pjr.40.1571424073790;
        Fri, 18 Oct 2019 11:41:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w189sm7451929pfw.101.2019.10.18.11.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:41:12 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:41:09 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 28/46] input: touchscreen: mainstone: sync with zylonite
 driver
Message-ID: <20191018184109.GO35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-28-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-28-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 05:41:43PM +0200, Arnd Bergmann wrote:
> The two drivers are almost identical and can work on a variety
> of hardware in principle. The mainstone driver supports additional
> hardware, and the zylonite driver has a few cleanup patches.
> 
> Sync the two by adding the zylonite changes into the mainstone
> one, and checking for the zylonite board to order to keep the
> default behavior (interrupt enabled) there.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
