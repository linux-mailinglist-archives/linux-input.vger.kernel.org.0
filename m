Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3220395E4A
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 14:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfHTMVq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 08:21:46 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:50187 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729409AbfHTMVq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 08:21:46 -0400
Received: from [192.168.1.110] ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M9nAB-1hwUEe3tHp-005rTd; Tue, 20 Aug 2019 14:21:38 +0200
Subject: Re: [PATCH 2/2] drivers: input: mouse: alps: drop unneeded likely()
 call around IS_ERR()
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net
References: <1566298572-12409-1-git-send-email-info@metux.net>
 <1566298572-12409-2-git-send-email-info@metux.net>
 <20190820111719.7blyk5jstgwde2ae@pali>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <02f5b546-5c30-4998-19b2-76b816a35371@metux.net>
Date:   Tue, 20 Aug 2019 14:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820111719.7blyk5jstgwde2ae@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w2EFLBTJ6lqCF1cRxaNsgtU4Ayhs7iamqxZJGE8EtE5RjwoNC4t
 1wMHvKMvxJH7423duGgD6HfvMlQ5fOv9CxInJuDzD8b6Foay2URD9yM9ELRgAIiaqJ+RAlw
 3WZwlZ7Q2wnBdNZYvV8CtXbfSGpG1jO5ArUonHAYhqaFB5/k8Kpe6AxVlKldbotTp3Z8sjL
 a2YGl877B7l4bGQbSgKHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:q+pbJQtMiq8=:Htz0JavxsTOY8vnc9v0Lm5
 OdgzGccyeXqXgjZf3yuQdVvnhcJsIPWu4CbYJLEdX2AjKwAFsCobEV9s+EmkLqmd1uBIkf33B
 +gQOdZxLEEmuf5e93AdRd437V3pEH0B59PVQtPC3LFvbd1xYUoCow+nCRzjD1oPkddoXhcryb
 Yx1/Kc1vProXPxGkA+U6KIYu3pntb2Em62zrsoS4VsWBRsv/oAknqN+zs/DOOiBEleN/g5Ovm
 lpDuzANXb+24QcBmAV3hIzlh6jlBUve7eJpKp/qBDPin8fieHAo91eE22YpkLckH9GCK5f/Nr
 /l2qpLDZaN++SvkVJhPHU/WFURGDAIimwOEhPzZu5TL0oXadOwfoZ+paOTSx0B5phPTjs2GHU
 tiY6km7tEwSB0KD5EBaRxL2dWrHNt748Oex3YOWMAJcv3rUSAZgvZ24viA5Vj9A1sbe5h/DM4
 rC2cBM1qeIxgu7z4HstQ1OgsOgb5OaF3UgYaYBWJikDW/wWfmugs8wuTPk+XAvx2EflPGBcfz
 CdCKs6M4rCrVWwGgpHx0WqlJIAiQStg/0V/Yr1rOrxVvw1UEp7s/FBsLmzK/wq6CvXshUTPgX
 9Sh9T6FveDv/RZvEghHejPMQrT6GUlxS46mdB94Dpqxc92rO7K8wXqsROUo7qrY/CpipHZbcN
 BD5Bc1khMsEGH17+CWJI37OGeCDth88l6g+Y0sYWwvDDSYIZ4CCWg6i81DZuilyCLWQEqJrss
 IVvVKEDSqjAVwHF8Oj0SFsmM7VyW6n1L/HdtfDNXbR+3pZwVihUwZ6PW/+tJDLv4HzI8oTTBc
 SGA3fLE/zLs0QKODQf2dSDVvP71kw==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20.08.19 13:17, Pali Rohár wrote:
> On Tuesday 20 August 2019 12:56:12 Enrico Weigelt, metux IT consult wrote:
>> From: Enrico Weigelt <info@metux.net>
>>
>> IS_ERR() already calls unlikely(), so this extra unlikely() call
>> around IS_ERR() is not needed.
>>
>> Signed-off-by: Enrico Weigelt <info@metux.net>
>> ---
>>   drivers/input/mouse/alps.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
>> index 34700ed..ed16614 100644
>> --- a/drivers/input/mouse/alps.c
>> +++ b/drivers/input/mouse/alps.c
>> @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
>>   		/* On V2 devices the DualPoint Stick reports bare packets */
>>   		dev = priv->dev2;
>>   		dev2 = psmouse->dev;
>> -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
>> +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
>>   		/* Register dev3 mouse if we received PS/2 packet first time */
>>   		if (!IS_ERR(priv->dev3))
>>   			psmouse_queue_work(psmouse, &priv->dev3_register_work,
> 
> Hello! Two months ago I already saw this patch. See discussion:
> https://patchwork.kernel.org/patch/10977099/

phuh, that's long chain of links to folow ;-)

So, your primary argument is just *documenting* that this supposed to
be a rare condition ?

In that case, wouldn't a comment be more suitable for that ?

It seems that this issue is coming up again and again ... when people
run cocci scans (like I didn't), I'd suspect this to happen even more
in the future.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
