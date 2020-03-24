Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 418BB191C15
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 22:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbgCXVpG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 17:45:06 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38653 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727023AbgCXVpG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 17:45:06 -0400
Received: by mail-pl1-f196.google.com with SMTP id w3so7967543plz.5
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=j2m5yAbUnvaKLuj7XdXgDLywb6uOiKn78PlUbLQRrYE=;
        b=A1a/1soMMsXYB6FrmkOTMyifi2wLQ2aGmswwcBe438gGjMnIJwCE68xjc5RfrqXhnJ
         5zYnsLxI2I52UCtzsGZmKzbGszK2L5WH6LpxG676YzRVsd2RLmjrDu5y93eFQfiI+bPY
         j+IgmrNkcqyVgQrSOKDFfWMrAD7fZN98si7EBTWhy16VCfwasumsH5egS/yBz5jRWV0w
         UduxbOfhuO3qqulJS9l/Id1HdLJ6i3Nnz+TzmLqWBoT7apNr+/AUCsx+b4JjWHjaElsm
         aCCnjyyqruWl45DVHu5uETeBqi+UKy7xGonq2lQNds81BplLQrW0bldY2dtJJDRIRsOi
         zYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=j2m5yAbUnvaKLuj7XdXgDLywb6uOiKn78PlUbLQRrYE=;
        b=q7Q5Z3vGO7/lydLHVhulwYx1rBLRySzK1fi1Q3mZ/k0PmIf9hVZUBTL5wsdWo5yaDR
         EZN3Q7cOz/b/+gImOk8SII6MGEyqNtzcTcwqHtSPpH/ImQG0S7Y5KMboaYQI4q4VZ01m
         bfE4FzXAuVTn8Cnof9dOi7N7ju56gzG8eFyD2RnHu3Yx7AlBhnxdfZtFzxm5HBa6gKx4
         zFlFt3K0uj6/UOEMSP6CS0nXOaKufkT0Ljhm+8/Weuet41sFMJPtJ0JrBezgCEttXnhY
         IZjn3qh1ex3V/cnnYyxFvdv+P76lYl5e0zpUqesgjEzphaAHDDnO29b8JTXPmCGEosZS
         hK9w==
X-Gm-Message-State: ANhLgQ3hcv7aCWVuNXSBgXHGDq/ADAY5HhqxxsRX+ATfqgLFSjx3rV6m
        dvhu8Gppu/7ZYzWEb4755nE=
X-Google-Smtp-Source: ADFU+vtWXS2bbh0ySWNruwoMkgO3HyIOBbanPFa7hBYa9d5f4JXtp29DBUFr2ULB63/UddDG+RnCKg==
X-Received: by 2002:a17:902:7585:: with SMTP id j5mr40459pll.273.1585086304796;
        Tue, 24 Mar 2020 14:45:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id k14sm2898246pje.3.2020.03.24.14.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 14:45:04 -0700 (PDT)
Date:   Tue, 24 Mar 2020 14:45:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/2] Input: goodix - Add support for more then one
 touch-key
Message-ID: <20200324214502.GE75430@dtor-ws>
References: <20200316075302.3759-1-dmastykin@astralinux.ru>
 <20200324185121.GA75430@dtor-ws>
 <4c0be7d7-4d88-5adf-bbb3-5af036115e7a@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c0be7d7-4d88-5adf-bbb3-5af036115e7a@astralinux.ru>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 24, 2020 at 10:38:10PM +0300, Dmitry Mastykin wrote:
> Hi Dmitry,
> we had discussed earlier this point with Hans:
> 
> Hans:
> >>> 3) In goodix_ts_report_key you do:
> >>>
> >>>                   for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> >>>                           if (key_value & (1 << i))
> >>>                                   input_report_key(ts->input_dev,
> ts->keymap[i], 1
> >>>
> >>> But if the user then jumps his finger from say touch_key 0 to touch_key
> 1
> >>> without us receiving a "packet" in between with GOODIX_HAVE_KEY set,
> >>> then we never release touch_key 0. So instead this really should be:
> >>>
> >>>                   for (i = 0; i < GOODIX_MAX_KEYS; ++i)
> >>>                           input_report_key(ts->input_dev, ts->keymap[i],
> >>>                                            key_value & (1 << i));
> >>>
> 
> Me:
> >> It seems, that this problem never happens. When user moves finger from
> >> button to button, we stably receive 2-3 packets without
> >> GOODIX_HAVE_KEY in between, that release all previous touches. From
> >> other hand, your change will not work when the same keycode is
> >> assigned to several buttons - it will be immediately released.
> 
> Hans:
> >
> > Hmm, interesting point I did not think of that. That would be a bit
> > weird thing to do, but it is not impossible...
> >
> > I'm afraid Dmitry (the input maintainer) will likely make the same
> > remark as I do though (when you submit this upstream). But we'll see.
> >
> > Keeping this as is is fine with me.
> 
> So I'm impressed about your mutual understanding) And waiting for your
> decision.

OK, I'll apply as is then. Thank you.

-- 
Dmitry
