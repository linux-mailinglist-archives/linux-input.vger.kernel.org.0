Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1717843069F
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 06:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244947AbhJQEbY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 00:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244957AbhJQEbU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 00:31:20 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8D1C061768;
        Sat, 16 Oct 2021 21:28:45 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id c4so5563639pgv.11;
        Sat, 16 Oct 2021 21:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1mJGeEhQ+9ahr5mEnDWeWdSF7wiEGin+JNfbDsFkQfc=;
        b=opjPJR/a8ugwCsoATSXoRCwfm9g5umLN4B379tz+LzLdh0S+eK/n7WiS5YEPP0B4VV
         x2u+69k2SaiEA0IK7RSTBhlcAdQtbcAqheAYyEnoc0Rha1Q6e1pxJMRieU/8fdBpL6n3
         tUQjWAwJRJdiYCwYq9t1OJxhRXEr9dfFT+PPcRmWiZTOFp0T4MYRPtMr/bH6O9yx7VNY
         3/kWc4gfhvnV8rjAKINAoggXUh4pzBJ6xlfpL9ZFfeMTc1qKkBvd5LvAHqzqrLjMRaIi
         tgUsR5QjRFCDKozgB8yIeIOK51z2ks6saDaA0GgXkrjs/Kut4bDOxzuaDVlxV884i6Wc
         29yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1mJGeEhQ+9ahr5mEnDWeWdSF7wiEGin+JNfbDsFkQfc=;
        b=2unMv7bn2JHKhD3MNqNaldV1qZiN5os7LgNtH82Td6k0Plz+xgs6sdCmLSPC030DpS
         u2+xAEMtVLuB3mlp+tT6rgXF9aNWvOMP7NRiusdOn3YYqQ6d09kWf1vO3IHxXbKWI7U+
         OFWuVLm2wWAHhAhWFaLldGzXJvtZRi7hnN/88r/nTa1Yz687p3TRrHztysyDijqKjDQr
         YQIXgStIb9ZsWjvW9OHdjaeZdNIgUnsllfpVN2+/7oDZbSUZ/dOSRxoRtJMVHwp24pD9
         txz+rHEyBS+rnbQVFu6aRSZAvPwAtb6d+8g87awuHQoEwvsSA03hUj4+xGWyoZCVwhNc
         OfZg==
X-Gm-Message-State: AOAM5303M3ROQzq4lC434dCtcYoYmFjszb+e/GqLucM9wY93ys3Ndzmj
        3Yv6ikcNQmTh6wzLcoB6Gqs=
X-Google-Smtp-Source: ABdhPJw4jYcAcVkkMy0+oCgqt9Cw5ZVbDVVL7i/2GQB92xPmk3bZaXfLR5EfD3wOzhNMWKqYWfe67A==
X-Received: by 2002:a63:e216:: with SMTP id q22mr16235879pgh.3.1634444924494;
        Sat, 16 Oct 2021 21:28:44 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id nu16sm9641615pjb.56.2021.10.16.21.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 21:28:43 -0700 (PDT)
Date:   Sat, 16 Oct 2021 21:28:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: pm8941-pwrkey - Respect reboot_mode for
 warm reset
Message-ID: <YWumeS0nAGwCck2e@google.com>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
 <20210714095850.27185-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714095850.27185-3-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 14, 2021 at 05:58:49PM +0800, Shawn Guo wrote:
> On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
> device into bootloader and recovery mode.  Instead of always doing hard
> reset, add a check on reboot_mode for possible warm reset.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Applied, thank you.

-- 
Dmitry
