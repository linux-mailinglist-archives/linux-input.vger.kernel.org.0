Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720771D6F8C
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 06:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgEREDR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 00:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgEREDQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 00:03:16 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24FCC061A0C;
        Sun, 17 May 2020 21:03:16 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ci23so1027340pjb.5;
        Sun, 17 May 2020 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9zIizapK70Q7C5ZziGhhcSXNkGREBFOYV/7c0wfQn1M=;
        b=GKVsL0iVIG1/KSH4bmZpeNlfQWiWZTzuYXCnlyzFCiVFhFTNXYoU4d7BPbkztIRGl7
         4OfeP1Z9j5HqTcPhgEFna6Yqsj7LR3tDUflelsn/2aQbwDIgA1e0UHRc/Teha22pyY88
         JA/FFctraC8cYw/CHCbbD4d4LuJmhV/swdcCkJ/FO01R4irBkxUr+8wSbzmHJy/K5fKP
         XqGjaBFiPKwoVN4cYwQC98C/THCJBmYbOQByos3XlGmx7OREYpQFxzEuBdqnxbwgFhow
         6Jg0Zoy2NxMh6jAWi/pU6876TXBpcVIBWWQY9DjXbJP7WiOSTLruGIwYywbZROZQz7we
         RJcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9zIizapK70Q7C5ZziGhhcSXNkGREBFOYV/7c0wfQn1M=;
        b=cRUqz0Vo2wbS90OBsnL2QqUSRiINDkxORBZniLrZXhF7EyvCk6ZKK02T/VaKdhVOMM
         j/l2aqhzJNaJnbbjueE7sokdZGU9vMA/T/T/qx9WHvaqituP6gshII4BRwCB639JwCzX
         c0dY69uJ7WMFWzpMYzkYRHS8ZM0D++KXcxmnYF2XKjOGBeUlvsFYJD7QrDlK/qWbmmqF
         M2StUScBuKxE8HI2M6U9OMYzsg5mK7zbUaJPbEGrHA/hWwrgqzvJUcz78qvsnXbTzYxK
         LTDl3XldSdNmVvOQSLe9jdvHbvYft9G1C78kEdoXqtMQdDCaeHRDCSHnO3NNsNaGySg/
         +e+A==
X-Gm-Message-State: AOAM533ptUWvKcrmAIV8Cg5VezhNSlgejC1g0VvNT6240miHJgG9WKsr
        fUBIAS2kd+xRF1gR+x+PhRk=
X-Google-Smtp-Source: ABdhPJyZlPLj5STC3au94SrbGcxAqR/o32dI3R+rOZf0P7yyj8gjQA6Y9CIu5tR58cOT40YJvpjtRw==
X-Received: by 2002:a17:90a:ea84:: with SMTP id h4mr17074701pjz.8.1589774596297;
        Sun, 17 May 2020 21:03:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id p5sm2341328pju.7.2020.05.17.21.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 21:03:15 -0700 (PDT)
Date:   Sun, 17 May 2020 21:03:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 05/10] input: elants: refactor
 elants_i2c_execute_command()
Message-ID: <20200518040313.GO89269@dtor-ws>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <6c576f688b385235c65b461410a917080d27e825.1587923061.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6c576f688b385235c65b461410a917080d27e825.1587923061.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:47:51PM +0200, Michał Mirosław wrote:
> Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
> polling and error printk()s into a single function.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Applied, thank you.

-- 
Dmitry
