Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9E8A254178
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 11:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgH0JHE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 05:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726851AbgH0JHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 05:07:03 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B840C061264;
        Thu, 27 Aug 2020 02:07:03 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so2915561pgf.0;
        Thu, 27 Aug 2020 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1SqMiZqMaOe1mRdk0rA+I1I+FHGsKWMOqzi6hxFBD8Y=;
        b=PhWFIlq3hP6h7f5C7jolRqV1vnglQVpEwtXcXpfVlzd1mMENiS22ZaKjAPps3ux3Yq
         foLUKTa4eE259AJmfn+70h7GIIoqGtPqyFAblvsluHQVIwoUz5UOyHopDyS8/J7UgeG/
         6dZQG5poPgElla+DFIJvXYqZOcr2IbCV1J6hfPaa8RNLKXjlTE3VnZVvOhuPxVtggfuI
         4blJ+xI0GVBK2ohIdQa1/zZMqu5dWPLbjnWT04Eb6wF9ZcyjqTnSbIubzvQF14GTRiNa
         5Arp9gnnAwLsUczw3tbpz8K4ksz0Hq+aOLh4FNk6J6lSUXkP/kkLj2ZpmWUZJ4zV+2bI
         FgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1SqMiZqMaOe1mRdk0rA+I1I+FHGsKWMOqzi6hxFBD8Y=;
        b=C5U7xNe0Y2Ejz98pZ+wSuBurD8NDf8yBEYJc3TuhSJe2mb//WP+SQOxz6lzQu1w4yP
         razm1e4+Tvhbe+945QDXakWUSfpxGEWhqbbT93p+Rb1tzerrtVmXE6CjErBVPwVht0FA
         BxWUBpzqpTkn1P1H+5M+KWxPXHIL7SvRtvIKPogRCyh+jhIKyja8lLqxD8QVIgV3OdEf
         QFmDQk1XDevsaquqKSWerTysnWrdVJGtToaVcuj2n3bj3J0c2bNNDQd4QK8HB8SqP3N6
         +ix800Du0kHOceA3A07gg9lfgGJCzBsHLUhZnM7SI0+MaSlNul2L7W7i1Dn7m4bAUm33
         ZEOQ==
X-Gm-Message-State: AOAM5321K/l8qykl0t+I5Ruq5r3iIoO/G2aRhTO4Ou2rWfDAgPvQvSUn
        yATSpPsZzdTL7v/okJqki/APQ4X6Eci+lU4W4nY=
X-Google-Smtp-Source: ABdhPJy+w8De9nNowZOXZzetDBy742K91KZqVEsDuL+kfw+cv5zLHShsfIh94GpLk6Jlk+4hTuCj8JqS6N+zkKHL6ks=
X-Received: by 2002:a17:902:8208:: with SMTP id x8mr4091390pln.65.1598519223198;
 Thu, 27 Aug 2020 02:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200826181706.11098-1-krzk@kernel.org> <20200826181706.11098-6-krzk@kernel.org>
In-Reply-To: <20200826181706.11098-6-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 27 Aug 2020 12:06:46 +0300
Message-ID: <CAHp75VdKubv7ydjgwq+xVfCPKTFxfhxhc4Hp7T0CRG6owd+KJg@mail.gmail.com>
Subject: Re: [PATCH 06/24] Input: pwm-vibra - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.

>         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> +       if (err)
> +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");

Same comment, no need to have additional PTR_ERR_OZR_ZERO().

-- 
With Best Regards,
Andy Shevchenko
