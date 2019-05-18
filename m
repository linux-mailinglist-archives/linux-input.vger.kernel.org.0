Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C62722425
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2019 18:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfERQzO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 May 2019 12:55:14 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39023 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727073AbfERQzO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 May 2019 12:55:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id w8so10149236wrl.6;
        Sat, 18 May 2019 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rV8ABIAchy9CLucgg2Ek8ITZNk8aguYJQCC0nexNA+I=;
        b=CNVrJOHv4HNuA9ajswY3zLEC7X5nOxwVN5Pyz9T+FszSPC/gpvZ+YR7K/TzQ5zdBqw
         HcSNGxcIQiVftmt/wpEWX7p8byXYvOyalKh3Gq+sOJLro3J0/dvmTvRCKT7NooE3RtRt
         e1zZ7cPlzUCkpHqKDekvueevkFkrqOQ0hnCGcMfGWYMJSGngl42mOG0bjxRFHId93xdN
         QrtQNnMMDk+p7QuxAjfNAtDkrrwigoA5h5QHQ4uvkcUpRdC4X1/UZ7MxWcAut6fG3u2A
         xlJLqWMDEjxaAwwSMUEZ6evh2BnKjDmCZBa9o4S/OHk9Poim7lAYut8d7ZfYXeB3RXp0
         nybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rV8ABIAchy9CLucgg2Ek8ITZNk8aguYJQCC0nexNA+I=;
        b=HeapDW/0CXUkqXNva1ziz+bp32QjecvtpKXtW6oowIFH/x4V3aHF3zE7AsDEollI+l
         QpvG4j50+Twp813Z9/IBczAaER3oMo+NgiuHBJXpfUqUlgoza89a8NY668nuHMimRa2A
         NzOq9J1/fq2NQgxJtOzO+i2x9FDuc5mFfTo4tUP6ff3DTuQnIXxd+sHFzaFefAxU1GI9
         aelOmOQbSw1toRYJ05qEqLgu+T1esN/xZoia+MbkWX0R6BtVf0qq01o7ZNVVg/1Vjnqs
         kFmtWKuUP/w2lPcv3SeipEPWWZL/PMYIZk8cwWXPc7OkOi9DqaHSoTT93hvH/TGj8tHV
         YoCA==
X-Gm-Message-State: APjAAAUbgAhcoU2IbZpgIxtBLKQtyBcOc+HYcNmxEdKEsz57JE06U3Tv
        ulO/aeSN3Gp+w0I0dolyEAY=
X-Google-Smtp-Source: APXvYqxphR9Zt3/VcA+PUwS9pAn1tAjbKeUnVsuJy6XwlYRg2sH1ngPtltNLDWYebg7Tt6bje3BWyQ==
X-Received: by 2002:adf:ce07:: with SMTP id p7mr25294978wrn.241.1558198512669;
        Sat, 18 May 2019 09:55:12 -0700 (PDT)
Received: from vaio.lan ([93.55.208.142])
        by smtp.gmail.com with ESMTPSA id u7sm7349940wmg.25.2019.05.18.09.55.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 18 May 2019 09:55:11 -0700 (PDT)
Message-ID: <6f94097bb9192424f92e055e8af8062b2ae3e19f.camel@gmail.com>
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts - add wakeup support
From:   stefano.manni@gmail.com
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     nick@shmanahar.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Sat, 18 May 2019 18:55:10 +0200
In-Reply-To: <20190517213016.GA93581@dtor-ws>
References: <20190517211741.8906-1-stefano.manni@gmail.com>
         <20190517213016.GA93581@dtor-ws>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, 2019-05-17 at 14:30 -0700, Dmitry Torokhov wrote:
> Hi Sefano,
> 
> On Fri, May 17, 2019 at 11:17:40PM +0200, Stefano Manni wrote:
> > Add wakeup support to the maxtouch driver.
> > The device can wake up the system from suspend,
> > mark the IRQ as wakeup capable, so that device
> > irq is not disabled during system suspend.
> 
> This should already be handled by I2C core, see lines after "if
> (client->flags & I2C_CLIENT_WAKE)" in drivers/i2c/i2c-core-base.c.
> 
> Unless there is dedicated wakeup interrupt we configure main
> interrupt
> as wake source.
> 

what's about the other drivers (e.g. ili210x.c) doing like this?
Shall they be purged?

Thank you.

