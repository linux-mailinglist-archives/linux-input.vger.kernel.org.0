Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59B634356C
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230403AbhCUWkt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhCUWkV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:40:21 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71698C061574;
        Sun, 21 Mar 2021 15:40:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id k24so7403288pgl.6;
        Sun, 21 Mar 2021 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OzhQarW1x783j1gbv/2k7Jj3aLy0HFjmN2um4/lPCow=;
        b=M59iy5lsGoyLtEfzGXBVZev1BJ9xZ70mAiPEjn8gsRSRFupXNhMsl2Ccj9AHEKPVhe
         e9d3qigh7AS50kbQ5Mu+mqgXh52oBvPn5hAXqsH1yeox0XwqSKRxkm4i+OQBkfKXFpFO
         x9grgZiGk+UbIDIsVGSjoRixwCol+fX3G0NRFqoG1SuBlzKN8PixxCVARd4X2suAgJT+
         DBs81R4p9f2skoLi4QYnFeSiDGFC7Czzs4bRp1Ymim3jGDgz+pewQ+TbBfRxygSMvnlj
         U8aVI7+gcPiIYO7t4Xn7Sw4fZxxs90x6uMWWMkN+j2HK3A/VH9Y5VggD1QPutNT9Mkqm
         fG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OzhQarW1x783j1gbv/2k7Jj3aLy0HFjmN2um4/lPCow=;
        b=qirObH9sNEEznEogcOn1v5JTxooYwLahOPMAMrlYgnF20+pmQRrjHMkr3p3swfm4MP
         xkrg2M0ASew/5d+X5HcloaT4fQSHVau7Vt79yysF9dpEPtkClr7MzpUoeQ/aKzY3Y6AC
         VnbgAXWoK3aylfbu0cRFjF9v5HMgNHiOGTM/2snvz3QdMPHwSf1dhEs7iirOy4E3Lklt
         R/fOml8RIBhcWxmpbsN53yLm8TetofVoj4hb4IDSCInECaoP3+JsaCQgvuk5OMJjkxYK
         kc7zvrlwf24Oue2tyBuqwcowF8Ntud9m/6Pbuk93PMyjAFZcJDr0JcuZqh2jB3OtPW6H
         Tlew==
X-Gm-Message-State: AOAM533cISbmQs3gurq35Spb+BdaxF9quPsdBoSvb34CWb3Mh5GdQivd
        6VZwcPpMuV0FGpnVT1IGjN0=
X-Google-Smtp-Source: ABdhPJx1rsly1PMlooANnFqbypaFRrwf67r4ScI7vhB0qamwcTuhuZ3L0JaMfOi+/rshl7ZqpTdzcQ==
X-Received: by 2002:a63:4d4e:: with SMTP id n14mr20155930pgl.37.1616366421020;
        Sun, 21 Mar 2021 15:40:21 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id k21sm6873105pfi.28.2021.03.21.15.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:40:20 -0700 (PDT)
Date:   Sun, 21 Mar 2021 15:40:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] Input: atmel_mxt_ts - support wakeup methods
Message-ID: <YFfLUWxbfXvjYQgh@google.com>
References: <20210302102158.10533-1-digetx@gmail.com>
 <20210302102158.10533-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302102158.10533-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 02, 2021 at 01:21:57PM +0300, Dmitry Osipenko wrote:
> According to datasheets, chips like mXT1386 have a WAKE line, it is used
> to wake the chip up from deep sleep mode before communicating with it via
> the I2C-compatible interface.
> 
> If the WAKE line is connected to a GPIO line, the line must be asserted
> 25 ms before the host attempts to communicate with the controller. If the
> WAKE line is connected to the SCL pin, the controller will send a NACK on
> the first attempt to address it, the host must then retry 25 ms later.
> 
> Implement the wake-up methods in the driver. Touchscreen now works
> properly on devices like Acer A500 tablet, fixing problems like this:
> 
>  atmel_mxt_ts 0-004c: __mxt_read_reg: i2c transfer failed (-121)
>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>  atmel_mxt_ts 0-004c: Trying alternate bootloader address
>  atmel_mxt_ts 0-004c: mxt_bootloader_read: i2c recv failed (-121)
>  atmel_mxt_ts: probe of 0-004c failed with error -121
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied, thank you.

-- 
Dmitry
