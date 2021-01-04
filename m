Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F852E8F43
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 02:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbhADBqn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 20:46:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbhADBqn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 20:46:43 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136DAC061574;
        Sun,  3 Jan 2021 17:46:03 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id m5so9520749pjv.5;
        Sun, 03 Jan 2021 17:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bHLuXqrZPUxKHtPV4CHNz02ZJ26j8UftHg+8MB5Uf84=;
        b=fLZyKRei3jXHzAolgOumqcwb1M/nn+E7Ii0axn5v/Af/bOMtvJQ1Id5Gwc4iEFxvf4
         zKM+F2w8BsERV+12FaXLe1l4g7WnzV/GLJmpy6aY56TTzwyn7R0q3Sqgqe4N7ydr/1lO
         uNTZ+hKAOzD3Drhscb71e23L5C1HLSrzbYSQfJbbV8x2Tyyv4NosAuvesHUV8rdrPSzc
         yWewBOJf6ySQFf5XB/vpYjIadsmfwzF6XszqjFDZRi6FX7tWsZ2o5GQN6NFZmP+uWyt8
         1d204XsTnobtCUr58ojDH0X46j3no8zrWXFdpe5qpnr8VemtTnTaRdMYQt2s+lXMfVz2
         +Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bHLuXqrZPUxKHtPV4CHNz02ZJ26j8UftHg+8MB5Uf84=;
        b=WcyLWOztLOvUdzOi+Eoj2/yypwDNNjKawWNVfAQ3EplK156AKZrWy9x96ibSAG8Z5v
         p02TwqAB1MQ5OxR2XRKkFPGlB09Ylacg568tazX3l8yhE7nVX5J/A4KrBlbaO3Lcrkps
         R2NUvrVp4g/pb0N2aPCNyWM0i6Praje3xWYZXDdRfvxRTrNxIn+7k4Vyw4UbDzOruuxq
         T/HqVe2ma1H7yV1l1xR0uGLOu8IcK7Dj6C4Zq/8qq7xpBYAdyoBIAmfFZ2V0SUKlby4I
         em8EcWjTCddrZHwuxUzxeF8zI+k48vbAdpgkH3wpKbFS/7wSEOcTycJr3AjhHYgJI4gQ
         b2rw==
X-Gm-Message-State: AOAM533mGhzQJPQGfFiOdEcdlaEweFkJmcf64UigXYYgPvH2c7S15YNh
        oK+TguXEpOvKMnNI7+voJy8=
X-Google-Smtp-Source: ABdhPJw5+9zo4AP/JRSAkC7/o7XjbQOdWGMltkNCMPa0Qo5/tGL5ZC5AA/+GmhXrIhtUKd1Jb07tDw==
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr26763168pjb.153.1609724762615;
        Sun, 03 Jan 2021 17:46:02 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w1sm53726597pfn.151.2021.01.03.17.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 17:46:01 -0800 (PST)
Date:   Sun, 3 Jan 2021 17:45:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andrej Valek <andrej.valek@siemens.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: st1232 - wait until device is ready before
 reading resolution
Message-ID: <X/JzV6+EF58kysci@google.com>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
 <20201229162601.2154566-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229162601.2154566-4-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 29, 2020 at 05:26:01PM +0100, Geert Uytterhoeven wrote:
> According to the st1232 datasheet, the host has to wait for the device
> to change into Normal state before accessing registers other than the
> Status Register.
> 
> If the reset GPIO is wired, the device is powered on during driver
> probe, just before reading the resolution.  However, the latter may
> happen before the device is ready, leading to a probe failure:
> 
>     st1232-ts 1-0055: Failed to read resolution: -6
> 
> Fix this by waiting until the device is ready, by trying to read the
> Status Register until it indicates so, or until timeout.
> 
> On Armadillo 800 EVA, typically the first read fails with an I2C
> transfer error, while the second read indicates the device is ready.
> 
> Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
