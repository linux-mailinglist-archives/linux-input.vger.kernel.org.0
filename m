Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6696A2BFFA
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 09:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbfE1HSa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 May 2019 03:18:30 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40860 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbfE1HS3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 May 2019 03:18:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id 15so1534443wmg.5;
        Tue, 28 May 2019 00:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=hsG2/zYumWx3hY65ej4oXZediJF1qu78qDJMfDhrSGM=;
        b=ABzrEBdweesg7BndzuAEo0nRLZOwj9lrM8O2hMPb5IyDAUcr5cI47/l4dpwMOUH9RP
         bAun4ymYEC4R44X4AtZKm1T/W31PqbaUBsgrxMBKADhYOI/m7491GD+/fcBM4atMBbtX
         293wyUp+c9wpzcRbj+g5hGbjI7sn9hhMLk+DNrBrk8H6Q5XhrvML0BIPygVlxQUv7Sv0
         oSf6Ntgs9YfYWBagnLgfF6mUBTtrYjkTW823DZJgcvM/5vQRj73RYk/XkH0Jpw+fC2L2
         JOxsbbWzkCrRGvKreMOUljtEXWp04YvUNoufxVLio4+lfQ7ok213KAmJ/FX0caJeNJPu
         dzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hsG2/zYumWx3hY65ej4oXZediJF1qu78qDJMfDhrSGM=;
        b=l/V6VjawoNQ2vesOMX7TEXhbyQwZrUNgDg829M3NtgIgb9tfOMstSmX4l7CW95f0Pc
         TK9qwUw5HK5e9Sd4XtCShlr1U45ZNOU5/zzLH/Yzhj3+Y00GVlWWeaN35IhIYnvkRKqW
         ob7d8h0CZwQ2S4B3uVhJvjWyjE3wtDobAkeJDBy7FDCP65BQfmsk+CmX2AnzyMsVUAmS
         SXUTu9FQQJon9EUGcdk6afFpcsCur4n7yTpL33YIcX+D8kpns/bN0+dHOAZFBoU03OQm
         l2rrLbSKnvZAWCXrNeO0rFY0coxlABFDZbpXEOnYNlWK6722UEor8NDO6fPFHgFqjS1Q
         45pw==
X-Gm-Message-State: APjAAAUKHeBmO2Dd0lqbfXfvFAFFgqNfRJlEOfLxp/djOUEELPVVxBSm
        NXlPT5WvVfhDJMiitkzhcaQ=
X-Google-Smtp-Source: APXvYqwcijxLmR34ejs007LYXyjQMcx72BLEgwp53GTb5X+Liw4tP86uPu+aLBOoYHfwCZqd7XT+Xw==
X-Received: by 2002:a1c:f102:: with SMTP id p2mr1901471wmh.126.1559027907362;
        Tue, 28 May 2019 00:18:27 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id b18sm11810751wrx.75.2019.05.28.00.18.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 00:18:25 -0700 (PDT)
Date:   Tue, 28 May 2019 09:18:24 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
Cc:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "hui.wang@canonical.com" <hui.wang@canonical.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= input: alps-fix
 the issue alps cs19 trackstick do not work.
Message-ID: <20190528071824.jimhixhtsynzwixe@pali>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday 28 May 2019 01:37:14 Xiaoxiao Liu wrote:
> Add Saito-san.
> 
> Hi Hui,
> Does it mean that your device (reported to kernel) sends only trackstick packets and not touchpad?
>    	-> Yes.

Ok, I think this answers all questions.

So your patch is not correct as it registers "fake" touchpad device even
there is no touchpad at all.

You should fix your patch to not register touchpad input device, in your
case it should register only trackstick device. I suggest to add some
flag which would indicate such device (e.g. ALPS_ONLY_TRACKSTICK).

Also currently kernel exports following names when device has both
trackstick and touchpad: "DualPoint Stick" and "DualPoint TouchPad".
And it exports name "GlidePoint" for touchpad-only device. So to be
consistent you need to also modify this code for trackstick-only device.

-- 
Pali Rohár
pali.rohar@gmail.com
