Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8234254D34
	for <lists+linux-input@lfdr.de>; Thu, 27 Aug 2020 20:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgH0Sk4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Aug 2020 14:40:56 -0400
Received: from mail-ej1-f65.google.com ([209.85.218.65]:46740 "EHLO
        mail-ej1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgH0Skz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Aug 2020 14:40:55 -0400
Received: by mail-ej1-f65.google.com with SMTP id d11so8972585ejt.13;
        Thu, 27 Aug 2020 11:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CAr+mRrbgTGZEamKVhd90B6QdxQDO+efGVqFuNcGQHU=;
        b=CzGU6vWZqTzrzJvaG6veRVVxsaYquA3UcXBJP4qpZQKGCai+GIpV/4YWjULFmSLhFb
         GCsDpMHQrxcQPjR+4DDvQhjx3cVymXoAvZlVCFsdaINm5Rzd78aEr0aIhR/139GoxRUi
         /+zRBVHJg3RKfGocMRYJUDkUVgeGKtcMIgZhMnrFlE6n25PQZEU687rj6jxE8UMztpgy
         ubnlxM3Lpwg0r4X9rCDCmeUKzQL5F2cxYtnSBMO51nsHnRiu6bLAa5dWaIeaFhaNGu9e
         vQRy0OcTevird4ap0kkWYefvK8RODJPSW/IIiVHCMTYq/4M/vfgnOOAFK/Dx8C0Yd7Qi
         HQ3w==
X-Gm-Message-State: AOAM533ILZueIRQNurnGGCvjRdlrS7CjhHN8x6iyJAeafbH71jQC0qez
        54nnqJ8d0JO3nY4GUgGCPcQ=
X-Google-Smtp-Source: ABdhPJxVCXSZM2SklLh6c8EwgeUSYmO2/3/sFwt+09l0UVXfVfUFTaNIB1mRDFYd0swJY1updkKJlg==
X-Received: by 2002:a17:907:2044:: with SMTP id pg4mr23392213ejb.276.1598553653554;
        Thu, 27 Aug 2020 11:40:53 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id v13sm2488027ejq.59.2020.08.27.11.40.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 11:40:52 -0700 (PDT)
Date:   Thu, 27 Aug 2020 20:40:50 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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
Subject: Re: [PATCH 06/24] Input: pwm-vibra - Simplify with dev_err_probe()
Message-ID: <20200827184050.GB6196@kozik-lap>
References: <20200826181706.11098-1-krzk@kernel.org>
 <20200826181706.11098-6-krzk@kernel.org>
 <CAHp75VdKubv7ydjgwq+xVfCPKTFxfhxhc4Hp7T0CRG6owd+KJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VdKubv7ydjgwq+xVfCPKTFxfhxhc4Hp7T0CRG6owd+KJg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 27, 2020 at 12:06:46PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 26, 2020 at 9:18 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Common pattern of handling deferred probe can be simplified with
> > dev_err_probe().  Less code and also it prints the error value.
> 
> >         err = PTR_ERR_OR_ZERO(vibrator->vcc);
> > +       if (err)
> > +               return dev_err_probe(&pdev->dev, err, "Failed to request regulator\n");
> 
> Same comment, no need to have additional PTR_ERR_OZR_ZERO().

Yes.

Best regards,
Krzysztof

