Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E235B49BE7
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2019 10:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfFRITe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 04:19:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43648 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfFRITd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 04:19:33 -0400
Received: from [125.35.49.90] (helo=[10.0.0.24])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hd9Kw-0001Eh-DH; Tue, 18 Jun 2019 08:19:26 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IOetlOWkjTogW1BBVENI?=
 =?UTF-8?Q?=5d_input=3a_alps-fix_the_issue_alps_cs19_trackstick_do_not_work?=
 =?UTF-8?Q?=2e?=
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
Cc:     "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "peter.hutterer@who-t.net" <peter.hutterer@who-t.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
References: <20190610104310.qa5snt7jpcljodfv@pali>
 <OSBPR01MB485504868362073ED434F82FDAED0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <ed65f8af-fefb-3c40-e7b1-dde3605f30e3@canonical.com>
 <5587ddb9-fb5f-03db-ac11-a696c85c5f2f@canonical.com>
 <20190611072333.nd4va4q2m5epmukc@pali> <20190611170707.GA143729@dtor-ws>
 <20190611171707.tydk7rsmtzmjohky@pali> <20190611173228.GD143729@dtor-ws>
 <20190611173856.jjwoagud6doxvpy3@pali>
 <OSBPR01MB4855BD8471A591BD75BDECA0DAEB0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190617074902.bg2emodbmjkkfldd@pali>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <953ee9de-bb94-1311-8130-cd991949a069@canonical.com>
Date:   Tue, 18 Jun 2019 16:19:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617074902.bg2emodbmjkkfldd@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/6/17 下午3:49, Pali Rohár wrote:
> On Monday 17 June 2019 01:29:17 Xiaoxiao Liu wrote:
>> Hi Pali,
>>
>> Since design architecture change of CS19, input device connection has been changed to below architecture,
>> Touchpad has been moved to I2C connection.
>>
>>    kernel/host  <--PS/2-->  EC  <--PS/2-->  external PS/2 mouse
>>             |                 |
>>             |                <--PS/2-->  trackstick
>>                 |
>>                  <--I2C-->  Touchpad
> Hi, thank you for explanation!
>
> So in our case, ALPS device should not be put into passthrough mode as
> there is no device after it.
>
>> In the past TrackPoint does not show in the device list because of TrackPoint was hidden device of Touchpad.
>> But from CS19, TrackPoint is directly connecting with PS2 port,
>> 3 bytes packet does not need to take affect by other vendors Touchpad format.
>> So alps.c is no need for CS19 device.
> So if trackpoint.c driver is working fine with this configuration, it is
> just needed to instruct alps.c to not take this device.

Hello Pali,

When you have time, could you take a look at the patch of v4? It is 
implemented according to our discussion.

Thanks,

Hui.


>> Best Regards
>> Shona
>> -----邮件原件-----
>> 发件人: Pali Rohár <pali.rohar@gmail.com>
>> 发送时间: Wednesday, June 12, 2019 1:39 AM
>> 收件人: dmitry.torokhov@gmail.com
>> 抄送: Hui Wang <hui.wang@canonical.com>; 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>; XiaoXiao Liu <sliuuxiaonxiao@gmail.com>; peter.hutterer@who-t.net; linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; zhangfp1@lenovo.com; 斉藤 直樹 Naoki Saito <naoki.saito@alpsalpine.com>; 川瀬 英夫 Hideo Kawase <hideo.kawase@alpsalpine.com>
>
