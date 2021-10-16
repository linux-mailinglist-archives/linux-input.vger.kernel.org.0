Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6ED843006B
	for <lists+linux-input@lfdr.de>; Sat, 16 Oct 2021 07:29:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhJPFbK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 16 Oct 2021 01:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230261AbhJPFbK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 16 Oct 2021 01:31:10 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6D4C061570
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 22:29:02 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so8813568pjb.4
        for <linux-input@vger.kernel.org>; Fri, 15 Oct 2021 22:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZHwsjw4DY3VH5suqI+Y8NsIxfQ1c35rhbIXp5U/RddY=;
        b=c5d2iEedB+4vUVGEJncPlEprL+jSx9QuTA7/qoNHLe0COG2gfWoJb6v2nMnyHmr6wH
         vdoRwBM4rKtmxvUD8eDLRNzv2XqBMJkynpjkurv8KWQm4vXQNZBiXNxXIDNLKQdCb0wI
         bzTtIgCANzZaXdi9yKvhKSr+OPl7LE9e9AaNVonc0NZ3ambE1Pxzwxwuy+qxsnevW0nt
         gFJHDO4NLyTkC3Bb5KU+aV+6nHXA0wUg+sQi2LfN0y+Jj2WNqxpkeOwnowWBRG6rLpJH
         qAW9eoQsipq1tnFxxbb8UwxGQb0qHkkh2Rb9NfsyQd9qEN3HK5GPIxpD5jM/RuvERWmt
         QwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZHwsjw4DY3VH5suqI+Y8NsIxfQ1c35rhbIXp5U/RddY=;
        b=bYI6v0evcrwfUUuLAJfrN6IStxvXVjk3HJ3xwJDQuuvt8vyloAeWhH2cW+GzioD+o9
         xbg3lUafNAB4XvWg+Wrar6LRD3zAZtUsEmq0NmkgPxhAL5kjSVbOAi01XPh0RKWPeXqL
         kdE5iGIJm8dWOLI1JblhCvTRmxYyXAqDV2c5RfSt4mhHdbWmiXdvQZcV+n/gkrKtB3ed
         RsJVc78iFdx2y9rYzXpi83qpMnUqKi3gOfUkItY0Kzo9jNzvtwTfhZJt7Xls79oN4WRg
         0tCkTb4QomBqBCUosVHUWd7Gxr//++2fz7XK9aKtjFNl8ktlxo7oGscr3G3bZAYUAOah
         bJCA==
X-Gm-Message-State: AOAM531swSA6DB6lbxEdfpPJ3wrQQ536ts1VJTPyyHxDfcYqeENfH0HX
        j6iZ3o1BLbM3gpLgI/8tcQ4=
X-Google-Smtp-Source: ABdhPJxCZMicwigFXkQGaqeTTzpOU5fBJhj4XFmzhv9sMrfjHdPLGU2zz9eWkHMNaQgZRPtoljcorQ==
X-Received: by 2002:a17:90b:782:: with SMTP id l2mr18486557pjz.190.1634362142441;
        Fri, 15 Oct 2021 22:29:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id ip10sm6459746pjb.40.2021.10.15.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 22:29:01 -0700 (PDT)
Date:   Fri, 15 Oct 2021 22:28:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     =?iso-8859-1?Q?Andr=E9?= Draszik <git@andred.net>,
        Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: snvs_pwrkey - Add clk handling
Message-ID: <YWpjG3s1CeO19xiG@google.com>
References: <YWZNOoL2cCeuswwo@google.com>
 <20211013062848.2667192-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211013062848.2667192-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 08:28:48AM +0200, Uwe Kleine-König wrote:
> On i.MX7S and i.MX8M* (but not i.MX6*) the pwrkey device has an
> associated clock. Accessing the registers requires that this clock is
> enabled. Binding the driver on at least i.MX7S and i.MX8MP while not
> having the clock enabled results in a complete hang of the machine.
> (This usually only happens if snvs_pwrkey is built as a module and the
> rtc-snvs driver isn't already bound because at bootup the required clk
> is on and only gets disabled when the clk framework disables unused clks
> late during boot.)
> 
> This completes the fix in commit 135be16d3505 ("ARM: dts: imx7s: add
> snvs clock to pwrkey").
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry
