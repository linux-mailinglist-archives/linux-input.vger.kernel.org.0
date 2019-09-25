Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A044CBE442
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 20:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731986AbfIYSIL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Wed, 25 Sep 2019 14:08:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51942 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbfIYSIK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 14:08:10 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iDBhw-0002N6-L2
        for linux-input@vger.kernel.org; Wed, 25 Sep 2019 18:08:08 +0000
Received: by mail-pg1-f198.google.com with SMTP id t19so256832pgh.6
        for <linux-input@vger.kernel.org>; Wed, 25 Sep 2019 11:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=LTE6ukLRY62zw9s4mqWBrGRA9IrbiQ+BchfDnbXKuho=;
        b=s5c0E9GBY7/xKAEtDbO7eine0nuxgZ7SwIO5lk3vLYA1YInrJUs12i+zNlvATF3Jw+
         d03kPfZXRC6keAFBN4E7tOW3HBntZR0H3+TLNNIvEt8g0H1eYTii5gsbOiqIWWJI3jqS
         cmwEVGx16I5oTHJoJ2DTJ41aBP4JehBv/PIOLvqz1wK4qKvNDVWLSrMeal2Dtdeh8cAz
         gLWph3E4FUJHCSf6Uo2TgTMonUIhJ5XnaIgtplx0tFman1Xkxd238sZpqT3+ckRYnzsv
         2t8vlni58o2uHbpOYM6yLGLU9hZH2dz0aEuFfPSeUlPxKhswd1FPBPrRvRJhiSO43Suk
         zX3w==
X-Gm-Message-State: APjAAAXmEFuafx2uh9kGjYtUAzNKq81aardy25TnLtfvN6DCER+zDenG
        fxQXo32zOEXobxto/v+HvXFFSzsXzBc9Y1JIiuqMR02DZig0TXkUak/5OTprMMKlCAK/Kt2cIKA
        ESxPEbqoML8/hPJhYASpCdZdEXWQE0vQhibPOgRBC
X-Received: by 2002:a17:902:654a:: with SMTP id d10mr10486234pln.199.1569434887122;
        Wed, 25 Sep 2019 11:08:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyo3pYxjMyN+Spwtzd2qD71uxB81qe4pmE/mjg7sQiZL0sJLK69f5DdoRQEZ3m7yEYanAZI3w==
X-Received: by 2002:a17:902:654a:: with SMTP id d10mr10486194pln.199.1569434886683;
        Wed, 25 Sep 2019 11:08:06 -0700 (PDT)
Received: from 2001-b011-380f-3c42-54e4-e181-beb0-1245.dynamic-ip6.hinet.net (2001-b011-380f-3c42-54e4-e181-beb0-1245.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:54e4:e181:beb0:1245])
        by smtp.gmail.com with ESMTPSA id r24sm239977pgg.53.2019.09.25.11.08.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 11:08:05 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.13\))
Subject: Re: Elantech touchpad breaks with older HP model
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
Date:   Thu, 26 Sep 2019 02:08:02 +0800
Cc:     rility <rility3@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <56C50F68-7DD6-443D-9034-5FEA19C373B7@canonical.com>
References: <fe524920-8476-540c-1b58-52c3b8b6a92d@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
X-Mailer: Apple Mail (2.3594.4.13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[+cc Benjamin, linux-input] 

Hi Benjamin,

> On Sep 26, 2019, at 00:00, rility <rility3@gmail.com> wrote:
> 
> Hi Dmitry and Feng,
> 
> I'm seeming to have some problem using my ELAN touchpad with later kernel with this commit [Input: elantech - enable SMBus on new (2018+) systems](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/input/mouse?id=883a2a80f79ca5c0c105605fafabd1f3df99b34c). 
> 
> This ELAN touchpad fails to be detected. It's on a 2016 HP laptop model 340 G3, though I did update the BIOS this year.

So using dmi_get_bios_year() as manufacturing date is inaccurate.

> 
> I don't really have the first knowledge of kernel development, and am wondering if you can help out. 
> 
> ```
> 
> With the latest 5.4.rc0
> 
> 
> 
> ~ sudo dmesg | grep elan -i
> 
> [    4.127896] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5e0f01)
> [    4.142887] psmouse serio1: elantech: Synaptics capabilities query result 0x70, 0x16, 0x0a.
> [    4.158366] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
> [    4.191200] psmouse serio1: elantech: Trying to set up SMBus access
> [    4.198630] elan_i2c 0-0015: 0-0015 supply vcc not found, using dummy regulator
> [    4.202104] elan_i2c 0-0015: failed to get product ID: -6
> [    4.243786] elan_i2c 0-0015: failed to get product ID: -71
> [    4.287117] elan_i2c 0-0015: failed to get product ID: -71
> [    4.322734] elan_i2c: probe of 0-0015 failed with error -71

Do you think it’s a bug we should work on, or we should simply blacklist affected touchpad?

Kai-Heng

> 
> 
> 
> 
> While with the previous version of kernel.
> 
> 
> ~ sudo dmesg | grep elan -i
> [    4.193067] psmouse serio1: elantech: assuming hardware version 4 (with firmware version 0x5e0f01)
> [    4.208056] psmouse serio1: elantech: Synaptics capabilities query result 0x70, 0x16, 0x0a.
> [    4.223009] psmouse serio1: elantech: Elan sample query result 0b, 01, a7
> [    4.302361] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input27
> 
> 
> 
> ~ lspci
> 00:00.0 Host bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Host Bridge/DRAM Registers (rev 08)
> 00:02.0 VGA compatible controller: Intel Corporation Skylake GT2 [HD Graphics 520] (rev 07)
> 00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 08)
> 00:14.0 USB controller: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller (rev 21)
> 00:14.2 Signal processing controller: Intel Corporation Sunrise Point-LP Thermal subsystem (rev 21)
> 00:16.0 Communication controller: Intel Corporation Sunrise Point-LP CSME HECI #1 (rev 21)
> 00:17.0 SATA controller: Intel Corporation Sunrise Point-LP SATA Controller [AHCI mode] (rev 21)
> 00:1c.0 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #1 (rev f1)
> 00:1c.4 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #5 (rev f1)
> 00:1c.5 PCI bridge: Intel Corporation Sunrise Point-LP PCI Express Root Port #6 (rev f1)
> 00:1f.0 ISA bridge: Intel Corporation Sunrise Point-LP LPC Controller (rev 21)
> 00:1f.2 Memory controller: Intel Corporation Sunrise Point-LP PMC (rev 21)
> 00:1f.3 Audio device: Intel Corporation Sunrise Point-LP HD Audio (rev 21)
> 00:1f.4 SMBus: Intel Corporation Sunrise Point-LP SMBus (rev 21)
> 
> 
> ```
> 
> 
> 
> Grateful,
> 
> Rility
> 

