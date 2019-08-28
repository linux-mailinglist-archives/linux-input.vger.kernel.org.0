Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1269FA76
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 08:22:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfH1GWZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 02:22:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59760 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726234AbfH1GWZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 02:22:25 -0400
Received: from mail-pg1-f198.google.com ([209.85.215.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i2rLb-0006PA-Cx
        for linux-input@vger.kernel.org; Wed, 28 Aug 2019 06:22:23 +0000
Received: by mail-pg1-f198.google.com with SMTP id h5so1024969pgq.23
        for <linux-input@vger.kernel.org>; Tue, 27 Aug 2019 23:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=eErmgvLWpTvw79t37fqW5by++pBkMN7PzJVZAaJiWBc=;
        b=sbvzRbGiE+n57nI4Se7T5MWa2B+H8WZDtknDPk4nhuOp57ptZxi/wGq4BgSPvlFTHk
         ZyzOJrcGce+hPpdBSik551ghg24euSRGDWOgXOYClb5o6i5OkxPDZvN3SrPwJMP5djFB
         KpIaLqNPfq5BfQq3dTBYdPjAHALev7ZhU6tJSrZAKPP4Hz5Wp7Res37HFhOqWr1nYPPR
         HaGljWWUfA55iPfurQkwVKEJzJENNCjk8/Uspif31Dul2xdmCiPsHzLzZa38YR3pIwxK
         2Z58O4ds+xCz/2yMZkgHmhScgodlKeLswXx9MZiihaw84qgVQrHnKd9s4osPOFbWGigg
         UG9Q==
X-Gm-Message-State: APjAAAWCdxMl3l7jYXvcTNu0WoMf3VEGWg1ET3OuP5OtoRadZ/ENiuOe
        fCnV5lCF4gWZCvOi67UjffgxNZrV86h62EdmC9+rYoug3waJ27fAIO3lrQZIJtAHh/nndUjnGEC
        DZ+HGiraIIG+wo8OgQYVWeTuQ6R9G+9xDfJ3xZfV8
X-Received: by 2002:a65:464d:: with SMTP id k13mr1846282pgr.99.1566973341974;
        Tue, 27 Aug 2019 23:22:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwzeZJ2AZhXpkhXpayJAnLK5l71RX5LcrFzSIL3dvryq9eP2qoVpnsbjyIl6xOIA9bblIN0nA==
X-Received: by 2002:a65:464d:: with SMTP id k13mr1846256pgr.99.1566973341602;
        Tue, 27 Aug 2019 23:22:21 -0700 (PDT)
Received: from 2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net (2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:f8f8:a260:49a8:d1ed])
        by smtp.gmail.com with ESMTPSA id r75sm1524386pfc.18.2019.08.27.23.22.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 23:22:21 -0700 (PDT)
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Content-Transfer-Encoding: 8bit
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Alps touchpad generates IRQ storm after S3
Message-Id: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
Date:   Wed, 28 Aug 2019 14:22:18 +0800
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     masaki.ota@jp.alps.com
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Masaki,

The Alps touchpad (044E:1220) on Dell Precision 7530 causes IRQ storm after  
system suspend (S3).
Commit "HID: i2c-hid: Don't reset device upon system resume” which solves  
the same issue for other vendors, cause the issue on Alps touchpad.
So I’d like to know the correct command Alps touchpad expects after system  
resume.

Also Cc Mario because this could relate to BIOS.

Kai-Heng
