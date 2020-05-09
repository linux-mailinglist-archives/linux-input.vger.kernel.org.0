Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63BD1CC3E4
	for <lists+linux-input@lfdr.de>; Sat,  9 May 2020 21:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgEITFa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 May 2020 15:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727938AbgEITF3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 May 2020 15:05:29 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75423C061A0C
        for <linux-input@vger.kernel.org>; Sat,  9 May 2020 12:05:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id q124so2474872pgq.13
        for <linux-input@vger.kernel.org>; Sat, 09 May 2020 12:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7JSAk5lLytho2rIm81FRn2D9S911gwcbvUJv2xb2Bg0=;
        b=Kfbv/vLCLc4d3czV455ZMdmDaMzXSybH9HEFAUQzxKTFfbfdP/FcgKtN9NxTJacGpF
         2ANvbcvRbBazE5nJV9tX+doTc3VuSpdZLAZarbB15mkkqvrjKt1N61iAzRyF9BCt6btL
         K13A+mo1EFjOHxOernwAMGtgu63xDaRLf9wRIraCFuKF7CSWRy8DulQT6TwznwQgdyEB
         z+r9Lp8LQqGBN1Wjuu6CKbhxej7l3n7TbVL7JFXWzTDRDVFL8qUO9tAjsK4s7P8vT7L6
         Uuvr/jHLTT7/CUA1+UwVQheC8/oMUioXuLr6CQPJCJHrHncDd8xiI+7EzUNosivPtl5m
         4tBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7JSAk5lLytho2rIm81FRn2D9S911gwcbvUJv2xb2Bg0=;
        b=Ev7BAfWEIwueJpo8RjpPQBADW6XLyF6ACyS2yUa2os6ndisCbtuN63QKhbQI9WG5G+
         ovfrwihs7Q2CqLqCmsxerV/h2o4PhDLNZVewrYclaWLkn3hURpPUa+H25qRPIXjL+Y5Z
         6Kh87roHDn4BwtN4dUwDLUEdVptbgA7m74ZZhbgtYTvHuMo9/hXiaBxhODw2k6Xoxg9r
         RjSmNf4pGqN4W0AXaOo9bnNr/cvwc2KhcQxIe9L9YaoFgX9WnipF4tQqkJh8hDIn0RJu
         bEZHs05pZ65fehleYy31/gy13QEEHHCTdAWjX8vPzXan1rPDD9dmhs8JvTRuun/SbOj6
         pHVQ==
X-Gm-Message-State: AGi0PuagoBP4qabEhmpsBhz0nhJtGv3ZkJOPW7qnFFZ8BLfbsarAfJ1r
        g3WOwFyZWYmHtTf0Ab/PIok=
X-Google-Smtp-Source: APiQypLz24kLzPbRbGQ0iadOD+qLEe6VKHefTUcK7T9FJHHcoPVA6C2Us6ZC2FktggQG1iajgHbF0w==
X-Received: by 2002:aa7:8509:: with SMTP id v9mr9414127pfn.110.1589051127632;
        Sat, 09 May 2020 12:05:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id s27sm4137527pgo.42.2020.05.09.12.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 12:05:26 -0700 (PDT)
Date:   Sat, 9 May 2020 12:05:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/4] Input: edt-ft5x06 - fix get_default register write
 access
Message-ID: <20200509190524.GN89269@dtor-ws>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-2-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227112819.16754-2-m.felsch@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Macro,

On Thu, Feb 27, 2020 at 12:28:16PM +0100, Marco Felsch wrote:
> Since commit b6eba86030bf ("Input: edt-ft5x06 - add offset support for
> ev-ft5726") offset-x and offset-y is supported. Devices using those
> offset parameters don't support the offset parameter so we need to add
> the NO_REGISTER check for edt_ft5x06_ts_get_defaults().
> 
> Fixes: b6eba86030bf ("Input: edt-ft5x06 - add offset support for ev-ft5726")
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I'll apply this, but I wonder if we should not move this check into
edt_ft5x06_register_write(), and also have edt_ft5x06_register_read()
return error if address is "NO_REGISTER"?

Thanks.

-- 
Dmitry
