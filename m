Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D784157AF
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 06:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235562AbhIWEuf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 00:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhIWEuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 00:50:35 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41388C061574;
        Wed, 22 Sep 2021 21:49:04 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c4so3214082pls.6;
        Wed, 22 Sep 2021 21:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l0dcEUqzxfeuXFOlnlja26gpPaTP07EM1c8BAWlCuWk=;
        b=eBJQktB5z8hH8DsbSQNmoGarfDOGkvj2NVgiTjT5zxAg/cfUg7/xH+5g+WaaptFcvb
         2y02841NeapSRqaHqn7qUpdj9Pkj1GxBbUyagQUww8wFe7Byw9snXWV19/IzPRT3HvVM
         a5Gvn/nCPoxZ3BfMgJe1wQPLKHfXiyOALwpvgmy1kEQc1tdkPeu65wgQ8FLYWcvfBeq+
         PO3O0xDfCz2TBBnlouC1awNnC5G6WPoib9sDbfJ+PHBR9eE9G+BRqrCECJ2/O6DCKEQU
         NeZvneRifgTE3kWB7ud7Uzldd1+yFgNf0E9qRonBaJcUGGCmRCDcUQaoHwNHK+1Os8Jq
         LzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l0dcEUqzxfeuXFOlnlja26gpPaTP07EM1c8BAWlCuWk=;
        b=yhjypL5kb1PbI4hElz9p5aV/wDcBCs/d8mW5Vqd9PDgzTna9px5Yf/ZpagA/SxvrCB
         kry79xv1tTEzClU2j35Rw1QwX9JiH670DTeujpZrVPiT3WOQFhlIrkinzC2dc0OdJjOe
         xqinDU9zxhjXvjfBdzdUl3vky/2RkKgMHJ7fZTwrwzSmbxdNR2my/dgXbTleJLMwn9mF
         7bXw8gCjLcakeifTUUZgQS/PTaKVoNwDnaflTekPEDDUNfZexT+4iaMaXDe1iyuy2yFQ
         Fqlj/eEku/+vXqLWC5XDh/CXlbVeVDGanbFSgyn/SwLyQDYVwLZONdkcrwfn3XpAgXSp
         yUYA==
X-Gm-Message-State: AOAM533RklB7rthwBmvGJH0V76JQMPIRq6foMst4zxxm74vFvedHQ6z1
        wG0nysGPd+IoJiE/rhgz++s=
X-Google-Smtp-Source: ABdhPJyWeTyIDHg1P1wPlHp2BnSN7jSGxlwKF32xCR77hZcTZmZKXmFHhCeuxEbDH7HtgAzQLOjbJw==
X-Received: by 2002:a17:90a:29a4:: with SMTP id h33mr3146490pjd.88.1632372543538;
        Wed, 22 Sep 2021 21:49:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f198:36ef:2b9e:5c76])
        by smtp.gmail.com with ESMTPSA id i8sm3876684pfo.117.2021.09.22.21.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 21:49:02 -0700 (PDT)
Date:   Wed, 22 Sep 2021 21:49:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: elants_i2c - Make use of the helper function
 devm_add_action_or_reset()
Message-ID: <YUwHPEj8izj53rwp@google.com>
References: <20210922125212.95-1-caihuoqing@baidu.com>
 <20210922125212.95-2-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922125212.95-2-caihuoqing@baidu.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 22, 2021 at 08:52:10PM +0800, Cai Huoqing wrote:
> The helper function devm_add_action_or_reset() will internally
> call devm_add_action(), and if devm_add_action() fails then it will
> execute the action mentioned and return the error code. So
> use devm_add_action_or_reset() instead of devm_add_action()
> to simplify the error handling, reduce the code.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied, thank you.

-- 
Dmitry
