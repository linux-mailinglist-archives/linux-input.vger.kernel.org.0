Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB5113C185
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2019 05:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390974AbfFKDXx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 23:23:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33388 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390972AbfFKDXx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 23:23:53 -0400
Received: from [125.35.49.90] (helo=[10.0.0.22])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1haXNy-0006e7-Mf; Tue, 11 Jun 2019 03:23:47 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6?=
 =?UTF-8?Q?_alps-fix_the_issue_alps_cs19_trackstick_do_not_work=2e?=
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
 <20190527100913.sgxrjrmphsjfmcdb@pali>
 <OSBPR01MB4855F61AE28B883CDD87F781DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190528071824.jimhixhtsynzwixe@pali>
 <OSBPR01MB48556FD88D7F7D5F91CB5579DA1E0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855707AC8ABB7CFBE5BBBD5DA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <OSBPR01MB4855A2A30A4F5E6BDCFE715FDA130@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
Date:   Tue, 11 Jun 2019 11:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2019/6/11 上午11:05, Xiaoxiao Liu wrote:
> Hi Pali,
>
> I discussed with our FW team about this problem.
> We think the V8 method means a touchpad feature  and does not fit the CS19 trackpoint device.
> CS19 TrackPoint needn't  use any Absolute (Raw) mode and is usually use standard mouse data.
> CS19 TrackPoint device is a completely different device with DualPoint device of Dell/HP.
> CS19 TrackPoint device is independent  of Touchpad. (Touchpad is connecting by I2C, TrackPoint is directly connecting with PS2 port.)
> And it has completely another FW.
>
> So we think it is better to use the mouse mode for CS19 trackpoint.

Maybe here is some mis-understanding,  the mouse mode here doesn't mean 
we use psmouse-base.c for cs19 (bare ps/2 mouse), we plan to use 
trackpoint.c to drive this HW, so this trackpoint has all features a 
trackpoint should have.

Regards,

Hui.

>
> Best Regards
> Shona
> -----邮件原件-----
> 发件人: Pali Rohár <pali.rohar@gmail.com>
> 发送时间: Monday, June 10, 2019 6:43 PM
> 收件人: 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
> 抄送: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>; dmitry.torokhov@gmail.com; peter.hutterer@who-t.net; hui.wang@canonical.com; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; 斉藤 直樹 Naoki Saito <naoki.saito@alpsalpine.com>; 川瀬 英夫 Hideo Kawase <hideo.kawase@alpsalpine.com>
> 主题: Re: 答复: 答复: [PATCH] input: alps-fix the issue alps cs19 trackstick do not work.
>
> On Monday 10 June 2019 10:03:51 Xiaoxiao Liu wrote:
>> Hi Pali,
> Hi!
>
>> We register our CS19 device as ALPS_ONLY_TRACKSTICK device.
>> And let the V8 protocol function support the process of ALPS_ONLY_TRACKSTICK device.
>>
>> I want to confirm if this solution OK?
> Yes, it is fine. Just make sure that touchapad input device is not registered when this ALPS_ONLY_TRACKSTICK flag is set. So userspace would not see any fake/unavailable touchpad input device.
>
>> Xiaoxiao.Liu
> --
> Pali Rohár
> pali.rohar@gmail.com
