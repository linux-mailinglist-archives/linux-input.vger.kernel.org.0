Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D60401ABF0D
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 13:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633077AbgDPLZN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 07:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633069AbgDPLYr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 07:24:47 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A3BC061A0C
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 04:24:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l11so5316500lfc.5
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=91IoQt8MKAEQHzNhIomKMTipSgMe5lSxVgD3BjRS3II=;
        b=pUm/dCpD1e2p3xp5gP2FxIaTOJYH0dKsBte/U1WzRr/sqJJwTvU48GZ1Hka/i50iXd
         qtjfcbVtvHLKx1XrN94vL42DhN/4djLHGAUiQ5poHDIcSowJ443iu7reqIKF+ON22+gS
         Y2NWQ06wB3tcXZq7wXxv8j6UfTyqFg3Ar5jehrqa1s0ETPFwDt4DA6rXO3d3p5W2yh5s
         gSl/BFbmFQAJSUmGZd4GHYpEh869jkZu7qzgqocMT1j15y9uHq9Hfr2K1ZO69FmFxPFp
         oxAyzQs5QM5P4B4ak5prGL/jnsvIWWmJE4hd7EEfjVMUtMwd1GH6SW70YOJSrqloA4gF
         M0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=91IoQt8MKAEQHzNhIomKMTipSgMe5lSxVgD3BjRS3II=;
        b=YFuukoU2LugFXxEPqKODqJrfilWFvIwt1sYCwibhUEcy8Tkm42+k3sNw1zNHuKP7KO
         qSo+j5xdXVsSxb7haGlvvEUIG/KDO3QTUa+29McJ6IkTde9OqEXCPnPQacKNwynfm1Dn
         chlzI28VXt1Om/OIvROAhZCVQaCaXCtGE8xNvJxC39GMbgDB2m0YDJ++Uu8wtn4bned6
         vjYxQYuKbv2VwYbtRdA8s69MHonUmq9MI7asBABH09RYYWySbCV3B+4W1ZNxo2mHd6D2
         9ocvRyoCCOf4bzV6lPCRdGHImg6qjMy1B3jIX0CZJzHArUMdxprxUtD3zBgZ1TJLfxci
         q1yA==
X-Gm-Message-State: AGi0PuYQ9F+Undw9qqvSntUHmrcIs59z5q4iFL4pM7Apzg1cjJE9V5M1
        jOK0cZAY7e3gCz3ws314oaN3sJP1u8aBgPg3nOcaJg==
X-Google-Smtp-Source: APiQypKER/2EB8Z5ELqVAMozkqwK3O4AQM7q+civrEIeHemg21DnYBd8b8x4Owji7jfW3OIAelN4bep/jvanKBdDm+A=
X-Received: by 2002:a19:48c3:: with SMTP id v186mr5679216lfa.194.1587036284149;
 Thu, 16 Apr 2020 04:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
In-Reply-To: <1586882894-19905-1-git-send-email-gupt21@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:24:33 +0200
Message-ID: <CACRpkdYZ1_EzPPFaiEUihnxuMB=9EquVPnRxf3pVeJfxn8AbcA@mail.gmail.com>
Subject: Re: [PATCH 1/1] HID: mcp2221: add GPIO functionality support
To:     Rishi Gupta <gupt21@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 14, 2020 at 6:48 PM Rishi Gupta <gupt21@gmail.com> wrote:

> MCP2221 has 4 pins that can be used as GPIO or configured
> for alternate functionality such as clock generation and
> IRQ detection. This patch adds support for GPIO functionality.
>
> To set direction of a pin or to toggle its state after it
> has been configured as GPIO, driver sends command to mcp2221
> and parses response received from mcp2221. Based on this
> response either 0 or appropriate error code is returned to
> GPIO framework.
>
> To get the direction or current state of a pin, driver
> sends command and read response from the device. Based on
> the response received from device direction or value
> is sent to the GPIO framework.
>
> Command from driver to mcp2221 device are output report.
> Response received from mcp2221 is input report.
>
> Datasheet (page 45-48) contains details about how to decode
> the response received from device:
> http://ww1.microchip.com/downloads/en/DeviceDoc/20005565B.pdf
>
> Signed-off-by: Rishi Gupta <gupt21@gmail.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
