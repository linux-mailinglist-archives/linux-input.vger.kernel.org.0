Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C97864014F6
	for <lists+linux-input@lfdr.de>; Mon,  6 Sep 2021 04:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbhIFCKp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Sep 2021 22:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhIFCKp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Sep 2021 22:10:45 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F63AC061575;
        Sun,  5 Sep 2021 19:09:41 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id x19so4454064pfu.4;
        Sun, 05 Sep 2021 19:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ifFj4pZ6evsoGAp/XwMstOmoTXXWCfiutqkkVp1hPno=;
        b=hPk+Oaq/vaYgQ4K6c3VtmdL4sIMvO931A4/niwhM3KVpK/HMjAAzMvdK1oz4JJQuyz
         jQ3uc0lGS1CtmKJ6P1VAgQIHI2d49FtMs6xZA75/DMUa8NnnFYmB7NzfJFSvmStvU52n
         vwWiIejWmina4WrrWb/81qyPHTmKKSYyrIEJvyMW0qDImu0eErzSQPlV/JYSQqgZzUV0
         xF0AMzOMkFuiza4LmLijwZBVqYro2S4AZ40TGaSYmdbsPjek/+A/Ux9j6T4ep3MYD+Ls
         fED+Y+lAp6UQTzMDBtdrAK2KQDEkQ+XZq8EOpq711S9J8yNNBuNFoVztwMKd6iiRnsv8
         VrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifFj4pZ6evsoGAp/XwMstOmoTXXWCfiutqkkVp1hPno=;
        b=FlXJYxSsl0k3CB8pqKeLIX3iXI1AYaPBSG1bSWxWdJp0V5o0STqcZPrQFpnD7dpVnT
         gXY4zmSb6s7moZEa+BSEfb9AyBP7qC+KoxYBA8z/85DDKTMlTaMZMUqtAY9b8penKXLn
         2Be9EZSHulbewpuMjjo0XRosMsKzeutJc3W5qzzhMU4NcRNLXNs+Tl/WwafU661sc3c8
         B67kXnwvpdxQKzyj9cvIO10hxaDn4HIv9rBrT2PcQp48jUav1fwDe2nnJw8BW+hCHwcC
         IjSmK8YzMI4F0Z4ERJwrukxzss7VnyXZhdLF62I43dRvkjSXpmKEdFmPIdBEaQr6O446
         qnjg==
X-Gm-Message-State: AOAM532xXSZJWarOxFNH1c0bJrXwT60kCB3nAAriUfYmCE3m8ztbHBKl
        lXyTq2XokVmahzzk5TO0G8BrmqkI6Wg=
X-Google-Smtp-Source: ABdhPJwiZrurRSUdu0kLUzO7D1EUxpl0rnXzT6XhKCP+KT3Ay2IhJM1BxrD/jwKugRcxsFHOTzPrlA==
X-Received: by 2002:a63:78c5:: with SMTP id t188mr9921040pgc.386.1630894180854;
        Sun, 05 Sep 2021 19:09:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4bc3:62de:220d:cd94])
        by smtp.gmail.com with ESMTPSA id 11sm5588444pfl.41.2021.09.05.19.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 19:09:39 -0700 (PDT)
Date:   Sun, 5 Sep 2021 19:09:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oliver Graute <oliver.graute@kococonnector.com>
Cc:     oliver.graute@gmail.com, Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Simon Budig <simon.budig@kernelconcepts.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v1] Input: edt-ft5x06 - added case for EDT
 EP0110M09
Message-ID: <YTV4YY9NS1Ic871z@google.com>
References: <20210813062110.13950-1-oliver.graute@kococonnector.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210813062110.13950-1-oliver.graute@kococonnector.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 13, 2021 at 08:21:09AM +0200, Oliver Graute wrote:
> Add Support for EP011M09 Firmware
> 
> Signed-off-by: Oliver Graute <oliver.graute@kococonnector.com>

Applied, thank you.

-- 
Dmitry
