Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C832D5077
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 02:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgLJBqy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 20:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgLJBqp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 20:46:45 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A864EC0613D6;
        Wed,  9 Dec 2020 17:46:05 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id v29so2668293pgk.12;
        Wed, 09 Dec 2020 17:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ztmnh0EotlJttn1QeQFN2zJgVITimkDmBGBjGSBjZ2E=;
        b=qrgcU70Pg/Bo9et1vbm1iOtyUfr69ZMXauI4D7uTh02o+yCmC4KEtQg5udVwkdD+y4
         pJUXOQXYaDnbcjrSWFA0KK0rpDWMjgGHrPT+gJK//6RTjMpM1hKwi1ejLAY1W2vBdfb+
         OSOvjOizkXq6XK9RwCMqNjh8nBuu9LRwvgP0nUYQ7u9je9mB8xAJVl0UZmbd2VAp35GW
         TQT3rOuvINv6cqQzEn27enjclzP6dZkbfG8vDrorpXQdEVQNvGR2u3zgFfIZcF4FmnJI
         1nRCcj33P/WlEZgg7dVUBUQKrutPwJWgLN6Q0M8YI9mBj3nIOiEeeCFuAR1swPkNoiwB
         P3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ztmnh0EotlJttn1QeQFN2zJgVITimkDmBGBjGSBjZ2E=;
        b=sQ95M1MBEulYXuMKaD1U3R5PR55IDSdbLIFVeXrpabMMKTGIGs6yOipE3AYH89uLXG
         BklNXTjVwg+HzbOtZvSbD95gRz00zqLjH2He2khh6pZLX8jeBUAyLBzRg5UrqMHyMsiZ
         8Cl3x2eqR1U/M2I/a6ynKf2wvl9nIkViYwhhABgj1AAhxYW2ecRIg5eg7mCfoXQhAkUf
         XJGVyEkw0rGa5gP4HEf4bq1wmISsWBGQeCnlTb1ovfmprujXT/XCcNdN2oxv7BcggVGa
         ol6tSFx3iWhkbhLW1vyRWp0fr9efcUCFDHZbt6OD6a9wArxlbptb7QD8mCN3D3wUkxN4
         SnJg==
X-Gm-Message-State: AOAM531MBe/mDP1u5f8ar93zrY1IqF8Yh81JGwf0P9FXXd+xGlNqsWDs
        oTfV1jaGvzKkFo1oTJpKqw4=
X-Google-Smtp-Source: ABdhPJw64bOpmjMTq7/OZIk/yI3gRHvWvAZ3P5WiyhJ/OnLYX/2BYseVJTASwF+vhEoKbURdwqAwHw==
X-Received: by 2002:a17:90b:3907:: with SMTP id ob7mr4907565pjb.70.1607564765257;
        Wed, 09 Dec 2020 17:46:05 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t9sm580233pjo.53.2020.12.09.17.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 17:46:04 -0800 (PST)
Date:   Wed, 9 Dec 2020 17:46:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] Input: add driver for power button on Dell Wyse
 3020
Message-ID: <X9F92jMvEGi4ULU5@google.com>
References: <20201201083533.1724287-1-lkundrak@v3.sk>
 <20201201083533.1724287-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201083533.1724287-3-lkundrak@v3.sk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 01, 2020 at 09:35:33AM +0100, Lubomir Rintel wrote:
> This adds support for the power button attached to the Embedded Controller
> on a Dell Wyse 3020 "Ariel" board.
> 
> The Embedded Controller's SPI interface is actually capable sending and
> receiving the PS/2 keyboard and mouse protocol data, which looks like
> a good fit for a serio driver. Howerver, I don't know of any machines where
> this is actually used.
> 
> My board only has a single power button and no way to connect an actual
> keyboard or a mouse. Using the atkbd driver with serio would be an overkill
> and would be inconvenient for the userspace. Therefore this driver
> registers an input device that is only capable of reporting the power
> button presses and releases.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> 

Applied, thank you.

-- 
Dmitry
