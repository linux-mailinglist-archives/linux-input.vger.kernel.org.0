Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CAA67CA4A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 19:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfGaR0y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 13:26:54 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:44783 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbfGaR0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 13:26:53 -0400
Received: from [192.168.1.110] ([95.117.90.94]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N2V8Z-1iMf4e3zw7-013yoL; Wed, 31 Jul 2019 19:26:52 +0200
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/2] input: keyboard: gpio_keys_polled: use gpio lookup
 table
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <1564415994-22871-1-git-send-email-info@metux.net>
 <20190729172607.GB755@penguin>
 <b2912c1d-a6d8-ad2a-3e37-19e4d3d1bd3b@metux.net>
 <20190729184306.GA767@penguin>
Organization: metux IT consult
Message-ID: <af12954c-2f14-1655-70b1-928f4f20bfe2@metux.net>
Date:   Wed, 31 Jul 2019 19:26:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190729184306.GA767@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:ykRc3wSod4pWbnrnL85Q3rRMJt3UnjBi7GhNTRbaMYEJ9Y40FBJ
 RgmxUnj5sFhyK1p5/eWXSst3yXW45y92R1PKe8HIZmkt4u30ADdWCOgeB34yGK/UktaAJcI
 hJubBsR48aM7XNPmCpk1X9iqa0dKDkFRb6qzfcWsJV0nBppWegLVYREnM1+Jw2S+aKdjzSV
 w5bQXjw+20jn93HBuxihg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OyUyBz7B3Ug=:DWrfjh5nOFlWRPhRX4VjzY
 wEPwAhyXYSYPx9GRlcFe3At/s9Gey85CgawWlQDfADHkobVtIAvihnrbLXrchVnyGOgJdz+eC
 Rx1RnWx1X43LJgFCfdVm3NRcpUSl19mGLDGEMDUUDFuTjf3UBPnNZ3R4fMn/aztqekhLLAnoe
 iwhIABeX3JEnxX5mNZURNftdxu7Qd1x9ucHieYnvYfhBINj8IYnpTFfj7FZAh4pnN8jts7EZs
 TDaWJ2ZpXpvlqjXR7auxru/arfk6Y/TVZYNdifKUSYh9BptTcIXirLP5rIAEjhgp4gSZdUZyu
 0B/TZRvjUzp43LOnMawBQ+tT7Za/kVCryuSWJGzHIKOEQJBlLw9IM1LMgsUqcVG96fqV1hza8
 wEQB7fq5Fw4mGkqE84bpEh7H5dnlmI8hoXYxqR40LiFqQjOmC1Ym1iE6T0KBPGCB9XmPN2181
 Oqw3/54Zv+Voa0mvzO3w8kxrzX6cXYCikyq/+rrYnsbDy7bjfyVnaI4Yd3NXFNZXXWN18N5ZN
 HbXYyzeDsxem2lyJ+Uao0Y68/orV7FV+lCUXjkKNcBoGqymwyDsayc1DrNZHpYBG5NcPo2y36
 eCEMZHby0sO17AVBTc1NYTGo94OWxr0a4Vh6slabV1XAYVh/WHKvepM/Quf0DALWGeKBAuYik
 TFrZzobEMu29Xim/REg7+OcKv9m1hfcxHPqhXP3NpFmoQ7Jkwa+FIIbkWRngiADvoMsCSRIn2
 WKTsJuVnHQPo7X84sAVRD3kSQa6oopI9JO7iN+W/o/x2fU4rw19woEXVbQo=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29.07.19 20:43, Dmitry Torokhov wrote:

Hi,

> https://patchwork.kernel.org/cover/11042915/

Thanks.

> I tried putting you on CC list there, did you not get them?

hmm, maybe it went to one of the dozens of mailboxes where I didn't
look at careful enough ... I'm currently just sorting by mailing list,
but don't separate out stuff that's directly addressed to me - guess
I'll have to fix up my mail filter rules :o

Regarding your patch:

How should I now setup a proper swnode object and pass it to the
driver ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
