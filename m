Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295E123E38A
	for <lists+linux-input@lfdr.de>; Thu,  6 Aug 2020 23:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgHFVeR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Aug 2020 17:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbgHFVeQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Aug 2020 17:34:16 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F71C061575
        for <linux-input@vger.kernel.org>; Thu,  6 Aug 2020 14:34:16 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id a19so17208027qvy.3
        for <linux-input@vger.kernel.org>; Thu, 06 Aug 2020 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+76LXO14aNsx8i1gnsECIsp+iH10M2aik6HmT5GQNM=;
        b=mWogffXazu8aVcQxrtz2BpdyrkCKOBfTzr9EAQaCeetZCb3M0J/y901nI1OnHvRvzS
         Ban/20sVtB3RPaygay2NwTeW7yzd2JJwp4ETi01vtqE5Z7ZS5pxr/9pe8h+n0g2hqiSQ
         6FVcv1v5O9PkmJizhozW8gSa0sSBZH1cuPWzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+76LXO14aNsx8i1gnsECIsp+iH10M2aik6HmT5GQNM=;
        b=ROzfVkSABNirm9Fvl8AdzKSgPfWSt2aD3y3WBWixcFcw1iDmn6dRznoxuhiBuFZQsL
         /21pYfslbMtw1ZV9WBOjxKghsgIwNviyhc0/SVomCHwdToNLQ9RpEX+Kkns6g1x4+Jal
         OwZMKQ0q63WyzdY8VQuWNxjNqcnh3fN9VBMJ+YX4emlxAyTcv+hSSm6JkNtynxo9TH/z
         XdNuyNGMumPUrGz03ZC81z82b60aaTx2W5C9LWIDcMqRV7RqgYgKZtoO09JB8FX8lPPn
         ZlFezzVxChpz9ULhURYQJkCARLrmuFezDE9Eqif9hHrJyZVV6uYVxV6Dtzo9zyGEv5fv
         hW8g==
X-Gm-Message-State: AOAM531F2lk+c6hKAbOqbPScAE095jue61tMSF2eHgK1W761c8mCFg0G
        F2AmGpTYe403Pj/SmYrxseBPRKAKhyY=
X-Google-Smtp-Source: ABdhPJzQTXIoJ2fwhrP/A9gZ9es46zs/BG6JBC0JcN4vAnSqj/DVZNy2M0DUsJljJL+NfhVL5asLbw==
X-Received: by 2002:ad4:560f:: with SMTP id ca15mr6235744qvb.144.1596749654853;
        Thu, 06 Aug 2020 14:34:14 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id o21sm4970732qkk.94.2020.08.06.14.34.11
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 14:34:12 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id p25so5900503qkp.2
        for <linux-input@vger.kernel.org>; Thu, 06 Aug 2020 14:34:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1424:: with SMTP id k4mr10651380qkj.2.1596749651000;
 Thu, 06 Aug 2020 14:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200806153308.204605-1-linux@roeck-us.net> <20200806153308.204605-8-linux@roeck-us.net>
In-Reply-To: <20200806153308.204605-8-linux@roeck-us.net>
From:   Brian Norris <briannorris@chromium.org>
Date:   Thu, 6 Aug 2020 14:33:58 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPkQKfXGzP3kr150VKDE0eGc+2CALEvbU+LGv3zwGyWLQ@mail.gmail.com>
Message-ID: <CA+ASDXPkQKfXGzP3kr150VKDE0eGc+2CALEvbU+LGv3zwGyWLQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] pwm: cros-ec: Simplify EC error handling
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Yu-Hsuan Hsu <yuhsuan@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-pwm <linux-pwm@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 6, 2020 at 8:33 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> With enhanced error reporting from cros_ec_cmd_xfer_status() in place,
> we can fully use it and no longer rely on EC error codes.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Brian Norris <briannorris@chromium.org>
