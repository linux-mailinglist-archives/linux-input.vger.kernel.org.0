Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB5840EED0
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 03:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242364AbhIQBgu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 21:36:50 -0400
Received: from mx22.baidu.com ([220.181.50.185]:40214 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235487AbhIQBgt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 21:36:49 -0400
Received: from BC-Mail-Ex14.internal.baidu.com (unknown [172.31.51.54])
        by Forcepoint Email with ESMTPS id 50E32F29DCA3ED843432;
        Fri, 17 Sep 2021 09:35:26 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex14.internal.baidu.com (172.31.51.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 09:35:26 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 09:35:25 +0800
Date:   Fri, 17 Sep 2021 09:35:25 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: cyttsp - Make use of the helper function
 dev_err_probe()
Message-ID: <20210917013525.GA17348@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210916153156.14098-1-caihuoqing@baidu.com>
 <CACRpkdau6wCjmeQeFuadsyhi_XZQ6AATYw1okSBMOYbCoGkmCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdau6wCjmeQeFuadsyhi_XZQ6AATYw1okSBMOYbCoGkmCA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi
thanks for your feedback.

On 17 9月 21 00:30:32, Linus Walleij wrote:
> Hi Cai,
> 
> On Thu, Sep 16, 2021 at 5:32 PM Cai Huoqing <caihuoqing@baidu.com> wrote:
> 
> >         if (IS_ERR(ts->reset_gpio)) {
> >                 error = PTR_ERR(ts->reset_gpio);
> > -               dev_err(dev, "Failed to request reset gpio, error %d\n", error);
> > +               dev_err_probe(dev, error, "Failed to request reset gpio\n");
> >                 return ERR_PTR(error);
> 
> In this case you're supposed to do
> 
> return dev_err_probe(dev, error, "Failed to request reset gpio\n");
the probe function is defined:
"struct cyttsp *cyttsp_probe("

so it is required to return a PTR:cyttsp *.
Thanks
Cai

> 
> Yours,
> Linus Walleij


