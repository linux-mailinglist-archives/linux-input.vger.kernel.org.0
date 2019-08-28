Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 309C19FAF1
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 08:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfH1G6T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 02:58:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60197 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbfH1G6T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 02:58:19 -0400
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i2ruL-0001cj-Nd
        for linux-input@vger.kernel.org; Wed, 28 Aug 2019 06:58:17 +0000
Received: by mail-pf1-f200.google.com with SMTP id 191so1331890pfy.20
        for <linux-input@vger.kernel.org>; Tue, 27 Aug 2019 23:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=lDeIrAUIfVo2Ua+qxn8ksD32RlhqrBouuBivl44BnRs=;
        b=rluGtHyfsEN6SyqVcJ4CI/NUITXc6aq1M0HXPigtXKTcBpJIyUTv4pkKVXgNVwZP4C
         HONZXqCV/Oxk5zGg2YrGi5L+AbH+nKdgdXeaAG7cI1cN0W1QqknrbJ1xh2aznDdc/VwZ
         0NuntZdrpNS9/93VkMn4av07eQx9zq1tfk/sBAAxHuClOT8mK0lPRRQZCzY+nHudW2By
         L1SKoVOakFc8LXjaEbEnXhZ6GeKUcsTfcDx5w360O2jJuHqDusoLJYsG5AVqXi3753tL
         jCcbKok4n9kZPCLv1zmk52vDO/HOosFvRH78N9FHA/tUJCCr1f4yqM5AYdrMTDu4SK2n
         /IGg==
X-Gm-Message-State: APjAAAUFJIVOi3lzGd11aOFYoqoQqBse9AD1ijK0D0Z6rGv1p6q6aQZ/
        AAnI/Kh8OwRhL6wJfaMF7Q1sRoSzM+wu2dtINamh9JWIg4bTbW/gxQwYFgP8n98QBMqble9RH38
        UJF+gm4RCle3aQCm5Zu7i8JSqLkJuD2L02mc8/3Rk
X-Received: by 2002:aa7:9d07:: with SMTP id k7mr2913094pfp.94.1566975496477;
        Tue, 27 Aug 2019 23:58:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqykCOEs8kS8VQJdo5slAh1IdyDPUUB+YNVh1Kyy11Sk17bBpLbObwVJjU8oH1EfkmArl+qP1Q==
X-Received: by 2002:aa7:9d07:: with SMTP id k7mr2913079pfp.94.1566975496228;
        Tue, 27 Aug 2019 23:58:16 -0700 (PDT)
Received: from 2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net (2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:f8f8:a260:49a8:d1ed])
        by smtp.gmail.com with ESMTPSA id p90sm2909164pjp.7.2019.08.27.23.58.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 23:58:15 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Alps touchpad generates IRQ storm after S3
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <TYXPR01MB1470902D804A47EE72013006C8A30@TYXPR01MB1470.jpnprd01.prod.outlook.com>
Date:   Wed, 28 Aug 2019 14:58:12 +0800
Cc:     Masaki Ota <masaki.ota@alpsalpine.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naoki Saito <naoki.saito@alpsalpine.com>
Content-Transfer-Encoding: 8bit
Message-Id: <A118551C-A0D9-485F-91F7-44A5BE228B99@canonical.com>
References: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
 <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
 <TYXPR01MB1470902D804A47EE72013006C8A30@TYXPR01MB1470.jpnprd01.prod.outlook.com>
To:     Xiaojian Cao <xiaojian.cao@cn.alps.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Xiaojian,

at 14:51, Xiaojian Cao <xiaojian.cao@cn.alps.com> wrote:

> Hi Ota-san,
>
> OK, we will look into it.
>
>
> Hi Kai-Heng,
>
> We will try to reproduce this issue first, could you please tell me the  
> target Ubuntu version?

It’s distro-agnostic, any distro with mainline Linux can reproduce the issue.

Kai-Heng

>
> Best regards,
> Jason
>
> -----Original Message-----
> From: 太田 真喜 Masaki Ota <masaki.ota@alpsalpine.com>
> Sent: Wednesday, August 28, 2019 2:35 PM
> To: 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; Kai-Heng Feng  
> <kai.heng.feng@canonical.com>
> Cc: Mario Limonciello <mario.limonciello@dell.com>; open list:HID CORE  
> LAYER <linux-input@vger.kernel.org>; Linux Kernel Mailing List  
> <linux-kernel@vger.kernel.org>; 斉藤 直樹 Naoki Saito  
> <naoki.saito@alpsalpine.com>
> Subject: RE: Alps touchpad generates IRQ storm after S3
>
> Hi, Kai-Heng,
>
> Sorry, I'm not in charge of Linux task now.
>
> Hi, XiaoJian,
>
> Please check the following mail.
> If you have any question, please ask Kai-Heng.
>
> Best Regards,
> Masaki Ota
> -----Original Message-----
> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
> Sent: Wednesday, August 28, 2019 3:22 PM
> To: 太田 真喜 Masaki Ota <masaki.ota@alpsalpine.com>
> Cc: Mario Limonciello <mario.limonciello@dell.com>; open list:HID CORE  
> LAYER <linux-input@vger.kernel.org>; Linux Kernel Mailing List  
> <linux-kernel@vger.kernel.org>
> Subject: Alps touchpad generates IRQ storm after S3
>
> Hi Masaki,
>
> The Alps touchpad (044E:1220) on Dell Precision 7530 causes IRQ storm  
> after system suspend (S3).
> Commit "HID: i2c-hid: Don't reset device upon system resume” which solves  
> the same issue for other vendors, cause the issue on Alps touchpad.
> So I’d like to know the correct command Alps touchpad expects after  
> system resume.
>
> Also Cc Mario because this could relate to BIOS.
>
> Kai-Heng


