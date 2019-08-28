Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4415A0536
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 16:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbfH1Onl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 10:43:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44831 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbfH1Onk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 10:43:40 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1i2zAg-0007sd-Cv
        for linux-input@vger.kernel.org; Wed, 28 Aug 2019 14:43:38 +0000
Received: by mail-pl1-f200.google.com with SMTP id f5so99350plr.0
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 07:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=72loJw2E4prnYu2bHnqkOxrbxvpeYzeWqqougV4V12o=;
        b=aRjLG1HqpTYn0yhjuV/E5ZApf/QnSCaYMQzuEWgxh0NFp8kFGevYSx1eH1WskjZTKR
         mZsVucu5Asdg5S3TnUn0KNvdZXQ69Evf2OouTsqeb8j1KW39bryWqdjyRqOwO3IxwZuc
         rTWL1swz2AQEAgGVv71o2nymXPDvzueIPVt/mnQFpIttQU6j3vrFXcqM7LWpAQbo9k4N
         RMZfwgyjF8JwfMcarpfA29U06fPDcD6PVGwVUMsa9mXSVHYluVVRrDtkLD+duW3s2g/l
         mtHX+eiFkR0mn7jwplm638k2h438Qpjl7VyDaARkJUAu3vefkVTD4pQyPjkgDNBQQR4c
         dyOg==
X-Gm-Message-State: APjAAAUppOyJQLEh8Fqgt+wn9kiQ7c7ott3O4uqhh++1lbdH6P2UmLPb
        cEUjIgvvoTWEscUO08GWfZDZCWNK0/i2Vd14S1gvpE0wz6NS71fv0skRAzrc93Va8wcuDJnsGfA
        cpXUT482XFGTegCwwWHYwUPPXgaf9kAWSZkqsAt60
X-Received: by 2002:a17:90a:5d0d:: with SMTP id s13mr4582563pji.133.1567003417014;
        Wed, 28 Aug 2019 07:43:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxL3rfIbXwPyv0+NNICU20lJfi4k7SBT61KY+ctfFExjZnGrr1gvd06tr2Bm/DtSiHV9tmc/w==
X-Received: by 2002:a17:90a:5d0d:: with SMTP id s13mr4582519pji.133.1567003416579;
        Wed, 28 Aug 2019 07:43:36 -0700 (PDT)
Received: from 2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net (2001-b011-380f-3c42-f8f8-a260-49a8-d1ed.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:f8f8:a260:49a8:d1ed])
        by smtp.gmail.com with ESMTPSA id y194sm3121815pfg.116.2019.08.28.07.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 07:43:36 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Alps touchpad generates IRQ storm after S3
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <39b2e63e339447e8b09b2601abf3d1ba@AUSX13MPC101.AMER.DELL.COM>
Date:   Wed, 28 Aug 2019 22:43:33 +0800
Cc:     xiaojian.cao@cn.alps.com, masaki.ota@alpsalpine.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        naoki.saito@alpsalpine.com
Content-Transfer-Encoding: 8bit
Message-Id: <BFBB1DB9-00B6-497E-80D1-5168CF16B889@canonical.com>
References: <44F93018-5F13-4932-A5AC-9D288CDF68DD@canonical.com>
 <TYAPR01MB30223CB8A576C7809F6382C1ECA30@TYAPR01MB3022.jpnprd01.prod.outlook.com>
 <TYXPR01MB1470902D804A47EE72013006C8A30@TYXPR01MB1470.jpnprd01.prod.outlook.com>
 <A118551C-A0D9-485F-91F7-44A5BE228B99@canonical.com>
 <39b2e63e339447e8b09b2601abf3d1ba@AUSX13MPC101.AMER.DELL.COM>
To:     Mario.Limonciello@dell.com
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mario,

at 21:25, <Mario.Limonciello@dell.com> <Mario.Limonciello@dell.com> wrote:

> KH,
>
> Just make sure I understand details.
>
>> Commit "HID: i2c-hid: Don't reset device upon system resume
>
> If you revert this it's fixed on this system?

Yes. Once reset is used instead of  the issue is gone.

>
> In that commit you had mentioned if this causes problems it might be worth
> quirking just Raydium but commit afbb1169ed5b58cfca017e368b53e019cf285853
> confirmed that it helped several other systems too.
>
> If the conclusion from this investigation this is only fixable via  
> touchpad FW update
> it might be worth quirking this touchpad/touchpad FW/system combination.

Hopefully there’s a better solution from ALPS :)

>
>> Also Cc Mario because this could relate to BIOS.
>
> Also I assume this is on current stable BIOS/EC release, right?

Yes. The BIOS version is 1.10.1.

The IRQ storm stops as soon as the touchpad gets touched.

Kai-Heng

>
> Thanks,
>
>> -----Original Message-----
>> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> Sent: Wednesday, August 28, 2019 1:58 AM
>> To: Xiaojian Cao
>> Cc: Masaki Ota; Limonciello, Mario; open list:HID CORE LAYER; Linux Kernel
>> Mailing List; Naoki Saito
>> Subject: Re: Alps touchpad generates IRQ storm after S3
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi Xiaojian,
>>
>> at 14:51, Xiaojian Cao <xiaojian.cao@cn.alps.com> wrote:
>>
>>> Hi Ota-san,
>>>
>>> OK, we will look into it.
>>>
>>>
>>> Hi Kai-Heng,
>>>
>>> We will try to reproduce this issue first, could you please tell me the
>>> target Ubuntu version?
>>
>> It’s distro-agnostic, any distro with mainline Linux can reproduce the  
>> issue.
>>
>> Kai-Heng
>>
>>> Best regards,
>>> Jason
>>>
>>> -----Original Message-----
>>> From: 太田 真喜 Masaki Ota <masaki.ota@alpsalpine.com>
>>> Sent: Wednesday, August 28, 2019 2:35 PM
>>> To: 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; Kai-Heng Feng
>>> <kai.heng.feng@canonical.com>
>>> Cc: Mario Limonciello <mario.limonciello@dell.com>; open list:HID CORE
>>> LAYER <linux-input@vger.kernel.org>; Linux Kernel Mailing List
>>> <linux-kernel@vger.kernel.org>; 斉藤 直樹 Naoki Saito
>>> <naoki.saito@alpsalpine.com>
>>> Subject: RE: Alps touchpad generates IRQ storm after S3
>>>
>>> Hi, Kai-Heng,
>>>
>>> Sorry, I'm not in charge of Linux task now.
>>>
>>> Hi, XiaoJian,
>>>
>>> Please check the following mail.
>>> If you have any question, please ask Kai-Heng.
>>>
>>> Best Regards,
>>> Masaki Ota
>>> -----Original Message-----
>>> From: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> Sent: Wednesday, August 28, 2019 3:22 PM
>>> To: 太田 真喜 Masaki Ota <masaki.ota@alpsalpine.com>
>>> Cc: Mario Limonciello <mario.limonciello@dell.com>; open list:HID CORE
>>> LAYER <linux-input@vger.kernel.org>; Linux Kernel Mailing List
>>> <linux-kernel@vger.kernel.org>
>>> Subject: Alps touchpad generates IRQ storm after S3
>>>
>>> Hi Masaki,
>>>
>>> The Alps touchpad (044E:1220) on Dell Precision 7530 causes IRQ storm
>>> after system suspend (S3).
>>> Commit "HID: i2c-hid: Don't reset device upon system resume” which solves
>>> the same issue for other vendors, cause the issue on Alps touchpad.
>>> So I’d like to know the correct command Alps touchpad expects after
>>> system resume.
>>>
>>> Also Cc Mario because this could relate to BIOS.
>>>
>>> Kai-Heng


