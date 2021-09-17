Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECFD40EF32
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 04:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242720AbhIQCaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 22:30:39 -0400
Received: from mx24.baidu.com ([111.206.215.185]:32822 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235118AbhIQCai (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 22:30:38 -0400
Received: from Bc-Mail-Ex13.internal.baidu.com (unknown [172.31.51.53])
        by Forcepoint Email with ESMTPS id E47576738562BF827643;
        Fri, 17 Sep 2021 10:29:10 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 Bc-Mail-Ex13.internal.baidu.com (172.31.51.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Fri, 17 Sep 2021 10:29:10 +0800
Received: from localhost (172.31.63.8) by BJHW-MAIL-EX27.internal.baidu.com
 (10.127.64.42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 10:29:10 +0800
Date:   Fri, 17 Sep 2021 10:29:10 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: ads7846 - Make use of the helper function
 dev_err_probe()
Message-ID: <20210917022910.GA17584@LAPTOP-UKSR4ENP.internal.baidu.com>
References: <20210916153104.13727-1-caihuoqing@baidu.com>
 <922265b2-bed7-8daa-3132-8cfc3b5e50fd@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <922265b2-bed7-8daa-3132-8cfc3b5e50fd@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16 9月 21 21:34:26, Krzysztof Kozlowski wrote:
> On 16/09/2021 17:31, Cai Huoqing wrote:
> > When possible use dev_err_probe help to properly deal with the
> > PROBE_DEFER error, the benefit is that DEFER issue will be logged
> > in the devices_deferred debugfs file.
> > Using dev_err_probe() can reduce code size, and the error value
> > gets printed.
> > 
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> > ---
> >  drivers/input/touchscreen/ads7846.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> You sent 32 independent patches. Do you expect us to copy-paste similar
> feedback on each of them? This would not make any sense. Please organize
> all your submissions in a series with:
> 
>   git format-patch -32
>   git send-email ..... 00*
Ok, I'll try. but there are different owners for touchscreen/xxx,
is it ok to send them the whole series?
> 
> The patches you sent were already sent before:
> https://lore.kernel.org/lkml/20200827185829.30096-1-krzk@kernel.org/
> 
> Best regards,
> Krzysztof
