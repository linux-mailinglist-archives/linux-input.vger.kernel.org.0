Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9206A2C0046
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgKWGsf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgKWGsf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:48:35 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A2DC0613CF;
        Sun, 22 Nov 2020 22:48:34 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id l1so126266pld.5;
        Sun, 22 Nov 2020 22:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PJ6JaHRxor/ka0JdqIrqxbD/WGFaxB9On6PE/7mwuFQ=;
        b=XYMS5tzYB1db+4HRLPGMZ6FL5f1juIfSv/FApljURg0meQvGkiDEuFZ54vN5rtTgEj
         rKKcf25pAoLQEKlcFKjsYOpw21tUMZgdY/WqxMyiDNf0wfDyjHju0OMSm56n4Sfq6pA/
         nt1BmRy2l5WXG5fmjeaBP80o8M4/dz29UbJn6atWupWnL+lZGVbd6cgfF3NUfYbRGuMD
         G2cYiAUh1mK/WxX9PW8VZD5SOmE5MCWhji+AYddIo9aeOpR5pls5YyOoVyWPpTgU1R5f
         1kSOmRSEGs8TW6Wojj6NS13uktjjbeWPfjNzDOqZdM1v6n8yLhgeKj6ebdT8rvQp8wag
         HpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PJ6JaHRxor/ka0JdqIrqxbD/WGFaxB9On6PE/7mwuFQ=;
        b=XVU5SdrLC/yWBlCTVD4Em60lglUQICdPZnGSICQv/xVdeaiLmwEkVVS7RN2em9GnWV
         uRDCtRLW1RLiBELzc8wIBQ2n7IybUo41lus85KA7fU534ppz9EdH6Hc+ZzFgB2A7x2wW
         HLAqPvuWFdduwgfwUAN5jDQHcPIcrCmsSv34fau1qNciPCY9L8VBXYCSmJTixSP+gBpH
         aANR07NuDJcGFmwNB/KiiSR+Wvrqg6LNHdk+Cc/lM2EJVPR73SRLToQBu0HZJKim9DCv
         xJWqMPFtmmx1z+CRaDuOQz2GXzetuqYtoRPR7I3cAAbGnCNv5bbYjD1+njVTxHHZx/BX
         9SJA==
X-Gm-Message-State: AOAM530fzXbPpyW8z0IL/09wZ6nQnoerJrmxmL5NxBziFyku4Oj71WY+
        tfZgCEJ0mjn1n8t4Jmr5Cx1Fit6Fe1M=
X-Google-Smtp-Source: ABdhPJy/4jDe0Ku9Pn49P4SSO2HrfayI73kSBKrChviAZvZl4QhUhlWxRpjvJa9Ahc8AwXb0XUbvDQ==
X-Received: by 2002:a17:902:a9c7:b029:d6:da66:253c with SMTP id b7-20020a170902a9c7b02900d6da66253cmr22954681plr.19.1606114114340;
        Sun, 22 Nov 2020 22:48:34 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b29sm9660730pgn.87.2020.11.22.22.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:48:33 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:48:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/3 v2] Input: atmel_mxt_ts - Fix up inverted RESET
 handler
Message-ID: <20201123064831.GZ2034289@dtor-ws>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104153032.1387747-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:30:30PM +0100, Linus Walleij wrote:
> This driver uses GPIO descriptors to drive the touchscreen
> RESET line. In the existing device trees this has in
> conflict with intution been flagged as GPIO_ACTIVE_HIGH
> and the driver then applies the reverse action by
> driving the line low (setting to 0) to enter
> reset state and driving the line high (setting to 1) to
> get out of reset state.
> 
> The correct way to handle active low GPIO lines is to
> provide the GPIO_ACTIVE_LOW in the device tree (thus
> properly describing the hardware) and letting the GPIO
> framework invert the assertion (driving high) to a low
> level and vice versa.
> 
> This is considered a bug since the device trees are
> incorrectly mis-specifying the line as active high.
> 
> Fix the driver and all device trees specifying a reset
> line.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-tegra@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
