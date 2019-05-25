Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4292A24B
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2019 03:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfEYBd6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 21:33:58 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33549 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726220AbfEYBd6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 21:33:58 -0400
Received: from [111.196.77.193] (helo=[192.168.1.104])
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <hui.wang@canonical.com>)
        id 1hULZK-00018K-06; Sat, 25 May 2019 01:33:54 +0000
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiDnrZTlpI06IFtQQVRDSF0gaW5wdXQ6?=
 =?UTF-8?Q?_alps-fix_the_issue_the_special_alps_trackpoint_do_not_work=2e?=
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>,
        dmitry.torokhov@gmail.com, XiaoXiao Liu <sliuuxiaonxiao@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        "zhangfp1@lenovo.com" <zhangfp1@lenovo.com>
References: <OSBPR01MB48550B43F78BBFBDC20D414DDA000@OSBPR01MB4855.jpnprd01.prod.outlook.com>
 <20190522074030.64sy7xt3wnomtxjb@pali> <20190523060154.GA10526@jelly>
 <38ec4a40-d51a-aeb1-a5e8-dbaed1142298@canonical.com>
 <20190524053648.GA16379@jelly>
 <d1fd207d-68e1-0b57-f0dc-c254bfc9352c@canonical.com>
 <20190524072648.6zqgz7rpwpcv22pb@pali>
 <d0b659bf-e6ed-bbbb-a3ab-17daf525a577@canonical.com>
 <20190524093729.GB1119@jelly>
 <f0c2dff9-519e-d54d-4cd0-2be666656dc2@canonical.com>
 <20190524105822.GA3358@jelly>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <721b91b0-f231-5f7d-a438-09dd85f63513@canonical.com>
Date:   Sat, 25 May 2019 09:33:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190524105822.GA3358@jelly>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2019/5/24 下午6:58, Peter Hutterer wrote:
> On Fri, May 24, 2019 at 06:43:58PM +0800, Hui Wang wrote:
>> On 2019/5/24 下午5:37, Peter Hutterer wrote:
>>> On Fri, May 24, 2019 at 03:37:57PM +0800, Hui Wang wrote:
>>>>
>> OK, that is sth we need to do.  But anyway it is a bit risky to backport
>> that much code and the whole folder of quirks to libinput 1.10.4,  we need
>> to do lots of test to make sure there is no regression on other machines.
>>
>> Probably we only need to keep the quirks/30-vendor-alps.quirks to 1.10.4 and
>> drop other quirks, that will be better for our testing effort.
> might be worth looking at what is in 1.10.7, e.g.  a3b3e85c0e looks like it
> may be of interest. That one suggests the range on some ALPS devices is over
> 100, so testing with 5-25 may really not have had any effect.

Oh, looks exactly the same as our issue, will have a try with it.

Thanks,

Hui.


>
> Cheers,
>     Peter
>
