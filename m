Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0300240B27
	for <lists+linux-input@lfdr.de>; Mon, 10 Aug 2020 18:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725873AbgHJQ1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 12:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgHJQ13 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 12:27:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053D0C061756
        for <linux-input@vger.kernel.org>; Mon, 10 Aug 2020 09:27:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id x6so5169608pgx.12
        for <linux-input@vger.kernel.org>; Mon, 10 Aug 2020 09:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UcIQNnzHUMRgKRtN0ZtKQSSrToF1kcFEJSkCfzigTuE=;
        b=hes2mS4fwecyFv1yvLY3TcMwZHWV35F0SvEK6tFBjCRWGTR81l0acRsRKcBWX0F+Tp
         KIdz5bmAZ25a+Swui05psafro2M/pTRPewd+MU9C78xFF15xNV/oO9vs8NegTSS+WF1y
         EsS5/gamZar7t1d9x/ehGC+O9hVNlI8BK4t+ap5mJSXDCIcKJoyot1iCFeMHFfUWGu5N
         cMmQ+/mJgvYvFF3pY2vkMMKC0objgAMuKDHKYieR7CYoaVUFlmQ1KNN9X9Fl5jEB3o2t
         0aIEsWHf107J2TzDHax+TBcHxvsUaSwBrUyAgoAdA46gkuNGlF/9VEygJXhGtQ3Wki7O
         Ij0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UcIQNnzHUMRgKRtN0ZtKQSSrToF1kcFEJSkCfzigTuE=;
        b=Y9wm5esUYXT1lS5n92b6kNeLJKWoW8mbGnAO0ZCWxfzjaaDksLPDCt4MWjgTuIzgOc
         8HEmmELLhoQRMXc7K6/g4zcly6gk5VCmzPoaaxG6V6R+KKOqDBCeYME8K/6YDZaHynZc
         1BkDQieSVIXUaFBh8oNengEvuHUPY966jq0PIi3BkqRonZjxot3yv6IipjP5Ou72zSga
         5EM6nfQTLLyhCkPQYA4wCAiw+ZOFH7RTJgDduY0246JcasN2zZ1UIgriFisIFA4+cWav
         pFSOP1JA0x2Yrud80IHHNRllJoGxzdzUg8x0Y1luBX7mY6G/jeq39YN+75HtXZYrYUbr
         RfNQ==
X-Gm-Message-State: AOAM532Gzjn9MKiBVxAiQjHRV6kzY6dX8+Ohc3nBn4Jozjo5gzBMpwIx
        woAz4TyQrhIw/p5q8/jw3jQ=
X-Google-Smtp-Source: ABdhPJwUkfDhUAJu07WhTGwy9Ivgtk61MtTm6qEmEBhk7aTYlUKMmIqlfCxKbmxrALuRO9FJtZ7sUQ==
X-Received: by 2002:a05:6a00:7c8:: with SMTP id n8mr1830327pfu.123.1597076843137;
        Mon, 10 Aug 2020 09:27:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x127sm23990483pfd.86.2020.08.10.09.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 09:27:22 -0700 (PDT)
Date:   Mon, 10 Aug 2020 09:27:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v2 1/4] Input: exc3000: split MT event handling from IRQ
 handler
Message-ID: <20200810162720.GR1665100@dtor-ws>
References: <20200313143345.28565-1-l.stach@pengutronix.de>
 <c0bc260d70b5506da2c4e2dc64176d45e1888a25.camel@pengutronix.de>
 <218ee65d70261a766b8ae490a64f60dabe2eca47.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <218ee65d70261a766b8ae490a64f60dabe2eca47.camel@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

On Mon, Aug 10, 2020 at 02:40:30PM +0200, Lucas Stach wrote:
> Hi Dmitry,
> 
> Am Montag, den 18.05.2020, 15:24 +0200 schrieb Lucas Stach:
> > Hi Dmitry,
> > 
> > any chance you could take a look at this series?
> 
> Are you able to find some time to look at this series? Should I resend
> the series?

Sorry about delays. Could you please resend as I applied another se5ries
to this driver?

Thanks!

-- 
Dmitry
