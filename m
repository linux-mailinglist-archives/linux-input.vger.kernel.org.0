Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2575A3ADC68
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 05:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFTDZY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Jun 2021 23:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhFTDZY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Jun 2021 23:25:24 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A483EC061574;
        Sat, 19 Jun 2021 20:23:11 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id u190so7376634pgd.8;
        Sat, 19 Jun 2021 20:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uFxh1ZGIK/+pJPgILY3Q3wxUIQmjqsKGWessG1EhcPw=;
        b=fDieeDzaVdYRo0NYMemRxsE44dHc3XwycBmYAdUkUtJUgzgCfU1L3nEBQUplkzV6LC
         6j/iDs0R/xkVjZjG8LsOgN9hFTwvHwO8+C1i3aOSOgjEFfnHvT9wlZpk4/iTjIWfFRuN
         /ZmVT/shiaAahnoEDKuhRZ1tMmTGs/nURpDoiyoL/hrZG7XjSh53lHcSaaIZsEdCB8YA
         D08H54W9P14CaT0Y+2jJ597xiVXo9HMqZ5tTgODebYHHWkFCwSjKxxcQg79isJLJIvgK
         gvppR8PYidOBdCJGQ4zL3TboF7Gvtl9P1mR4F8r+QTj/eVkI72MfXIiW9MKAiZSJeuk/
         UFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uFxh1ZGIK/+pJPgILY3Q3wxUIQmjqsKGWessG1EhcPw=;
        b=Uu9jSC2Y9g0ML1zlu6YSLtf+T8vi5vARQm6krT4g+m4JQcOBdmQpZywuIIqGlQUoVB
         7+yBDGdmLSaYgAtQvQ52xWcAjI009FJ6px5vXjfTvz6zDCL1b63DNEaow7m07U/vq00u
         crc7vvDNv6h12M+D7WgZVjkexQangFxb99P04NTa9GhuAAEUMvI6PdpQnV1/gi1cyQZw
         DuljTARbAJsSVtkRj9qnEiXdZNwtPQL7drDvUU8Wdmn956rx1fQyskZjFsRJ4b3XKHkr
         1FkDUiEysr9GAd3R/4uO5oBR4qqzvdWoNisNRE92i2VDMYtNiKNbgOhgaMOszWL0ABDl
         G3iw==
X-Gm-Message-State: AOAM532pM126ybPZSrVENyn29f3rJnalVA3f9SEOEsc7w7IbOEnUILJb
        3NE6h8oyi2Wnc9xlTSOb/w0=
X-Google-Smtp-Source: ABdhPJxwbd6RYHB6D8mAbxJAXfrEB19aNDpFT5x8W8YZyIHTAGxYFyvmCefbn9cmwu3FRrOay6RzjA==
X-Received: by 2002:a63:d815:: with SMTP id b21mr17508601pgh.321.1624159390797;
        Sat, 19 Jun 2021 20:23:10 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:b83e:d8b6:9f4f:2be2])
        by smtp.gmail.com with ESMTPSA id j13sm12573163pgp.29.2021.06.19.20.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 20:23:09 -0700 (PDT)
Date:   Sat, 19 Jun 2021 20:23:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
Message-ID: <YM60mjew2mqMAMRO@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
 <20210613233041.128961-4-alexander.sverdlin@gmail.com>
 <YMfQR8iM9be5Qg8+@google.com>
 <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 15, 2021 at 09:46:51AM +0200, Alexander Sverdlin wrote:
> Hello Dmitry!
> 
> On Mon, 2021-06-14 at 14:55 -0700, Dmitry Torokhov wrote:
> > > Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> > > to Common Clock Framework.
> > 
> > Can this be merged standalone?
> 
> In principle, yes, but I thought it would be easier if the patches
> would go via the same path as CCF conversion.

OK, in this case:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
