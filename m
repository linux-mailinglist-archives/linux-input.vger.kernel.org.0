Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7898F2C0048
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgKWGss (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgKWGss (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:48:48 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0664FC0613CF;
        Sun, 22 Nov 2020 22:48:48 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b6so3557173pfp.7;
        Sun, 22 Nov 2020 22:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=28cYgRsJ7c/Vbf4Q/dW+RnYvZz+VwVBF9wov2zGw7TE=;
        b=Fc+em1gQ79fOpllIdeeIkNliu0Yqb+xf2lsD++YLMwXKFt05l7j8X/31QU8TodglJp
         CPwVpOVM0TahM6DPyDvbo4RxrZMoZhv+xqrqTv3sm5V28U/2Q1an3JsksJ15cJ+6UmP8
         yW3Qb+yWWxesM+G0Z640a8zHi41ujffsMfsrQpeY0KVBBKb4HBqGeFD2sx+5Br0xNzaX
         p4dnXFuCLriADcOYPmZPx85e371jhp7m4skaZxhGU69DzfHP6xTNCP6yfLasU1qyELSw
         Ebs8xfB+8BWXGRWsohCWcfThk5/sjLAbA8TwtnKTGzAZNG2iG/NvxbCcS6lpeW1QIHlt
         QkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=28cYgRsJ7c/Vbf4Q/dW+RnYvZz+VwVBF9wov2zGw7TE=;
        b=LTqZma5QTW+XstUHD0NK7oGgA67JUqeQr4w0KaWou1rpbx3TZK4RpvKYh5kW9/sQkS
         FP67EgqS9VWJn4Xlo/uvsHJDJH19X/PDe4kSUItB29Tfni2kfSQ/ZGs1sZmpdxBrEFxO
         iaRXku4i4znVz1x0NPr6GbYMqC0058hIgzRohgstPQqUblRcrdSxj4V10H0nfUef6hGC
         xIbyPuOsLJ4sFaA6E4NvesYa+fUjWbUKseudJnwjQbWNrpjyEo31brhux5JSOvcrjFK5
         dXqCgx1VX3bs0vaEkNp10bgKp2B4HWHRU1lm31e8a0J4yZPM4mLyomvKHE1fzdYBLbD8
         U/Gg==
X-Gm-Message-State: AOAM532jsxzljylC+8SEoHOu0ujpRBYJrip43FmHzK8P/MoBPxh8AzbG
        5ZrjPnsRAnuhlO4KPrKdEls=
X-Google-Smtp-Source: ABdhPJz5kUMKF0rTcNZOzYCpsu+04H5u8FQrirBTBzc3tiKZjNYg7fsY7iiR81Sjt4NJHNnTe543FQ==
X-Received: by 2002:a17:90a:1bc5:: with SMTP id r5mr24271025pjr.157.1606114127494;
        Sun, 22 Nov 2020 22:48:47 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id d68sm10116096pfd.32.2020.11.22.22.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:48:46 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:48:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3 v2] Input: atmel_mxt_ts - Convert bindings to YAML
 and extend
Message-ID: <20201123064844.GA2034289@dtor-ws>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
 <20201104153032.1387747-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104153032.1387747-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:30:31PM +0100, Linus Walleij wrote:
> This converts the Armel MXT touchscreen bindings to YAML
> format and extends them with the following two properties:
> 
> - vdda-supply: the optional analog supply voltage
> - vdd-supply: the optional digital supply voltage
> 
> I also explained about the reset-gpios property that this
> better be flagged as active high (0) despite actually
> being active low, because all current device trees and
> drivers assume that this is the case and will actively
> drive the line low to assert RESET.
> 
> Tested the schema with all in-tree users and they verify
> fine.
> 
> Cc: Nick Dyer <nick@shmanahar.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
