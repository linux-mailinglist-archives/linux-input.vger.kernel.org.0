Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1829166CF0
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 03:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgBUChO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Feb 2020 21:37:14 -0500
Received: from mail-eopbgr680080.outbound.protection.outlook.com ([40.107.68.80]:12164
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729259AbgBUChN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Feb 2020 21:37:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9tRUevqXJyvS8W6FO8EXMJ+j1pNe94ZlMcONY1k5NI6VwbC0ixbWBerj3GxTTCvOjjC6a4WhQESSsWemytkW4qRw/N5AdxEs8ZIvdgK6Wg76lwDlMsSwOTeQfASdWN1uo/RDt5O58tR2WFy5eR5mlnQGOVx7ro5z3LHS0xuSc8jNMpvOHLrs/dThq4Nm3w/sxpgBVk+MTgPNKWzCgREcMGniWUxoFbi+4o2+NJHOhSrUNJvkJ0faLJkSS6iw7AaiTWiD6geNuh4s6ZSKNLIh7ayXcSJNADts6CTWFu+TjekSEW1wDBYS8ucMC7Sq/6GkIg2edUstvjFGA0V8CKrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+U07Fr7LlnF1RF5rIBS/ZY3WoyDWehaHM1uMWLw5CM=;
 b=YUTu9EBldD8Kp86AMtwJYEtejeVvu/tU7WajGhBvNMWsXJvoTdVKnpxUjUcS4707StDAmgThyTXurGiyNIxJWT4vLIJSKY6vGuRyRflzJRxJkWFXIAcb0c5pXhrj2Cco7/7mNtZY3BtIr+VBZkvJxzxwL1IMbJ7dMiwoectb8sVMLHUDvrYc+QMRii4E6zcUO/kq3/DlFnfZfI9ifskzBr9e9VhAyHfJAztGxyonAhNxqj5my93SxIQjKALwG/M1SvVNiNS3GWSlyWyQHT1+eXRGy4N5SZNiq9jxJWEyrpRRKnybYGn2ZfAa/IZruB3gaF/YhKjMciW8ddEPQnfUJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+U07Fr7LlnF1RF5rIBS/ZY3WoyDWehaHM1uMWLw5CM=;
 b=ao1hk5Ei+W/phX7GkO2yGkU3qgR2IZkf9mWINQ9BGNeD5xOf7qFeTJIXQUA4eHmEUzNyor/xTdtId3l1BvsUv7fLjDSMwZ8kFxArA+jruq6QmqE/5a+kRk32xVfc+lsyxoDJaQ+XiArZn7brA03mLJTGrPpjHxU6tfs6IUMDh3o=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4088.namprd03.prod.outlook.com (20.177.184.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Fri, 21 Feb 2020 02:37:07 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d%5]) with mapi id 15.20.2729.032; Fri, 21 Feb 2020
 02:37:07 +0000
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
To:     Paul Hollinsky <phollinsky@holtechnik.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
 <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
 <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
 <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
 <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
 <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
 <20200201013852.GG184237@dtor-ws>
 <1f6b0b96-d6fb-7e76-afdd-0ff405e3e84a@holtechnik.com>
From:   Andrew Duggan <aduggan@synaptics.com>
Message-ID: <2d54859d-ee5a-97ec-fe62-79fc1f9e3122@synaptics.com>
Date:   Thu, 20 Feb 2020 18:36:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <1f6b0b96-d6fb-7e76-afdd-0ff405e3e84a@holtechnik.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::35) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
MIME-Version: 1.0
Received: from [10.1.10.74] (192.147.44.15) by BYAPR07CA0022.namprd07.prod.outlook.com (2603:10b6:a02:bc::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.27 via Frontend Transport; Fri, 21 Feb 2020 02:37:06 +0000
X-Originating-IP: [192.147.44.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d039b124-bf00-4f6d-5462-08d7b676f17e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4088:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4088A7796E4E6DC26E741236B2120@BYAPR03MB4088.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(39850400004)(346002)(366004)(136003)(376002)(396003)(189003)(199004)(8676002)(81156014)(81166006)(66476007)(66556008)(4326008)(6666004)(8936002)(36756003)(956004)(2616005)(2906002)(6486002)(26005)(5660300002)(52116002)(478600001)(16526019)(86362001)(110136005)(53546011)(66946007)(31696002)(316002)(54906003)(16576012)(31686004)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4088;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
Received-SPF: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QQ5jc2oyGDb2oX4BoNN+VrHl+les8SUmPoaQXaq3nc88dnJHndHK5jFv/Q3RCGtFoYTUT1e9YfNDtkSdFI4482RgxQRz9+MwNyTf9KxyxZvmpEYwxd6FVRKkDBxksirXw88VGC3mAs/R2wA50IjrOFDs6F60UoVVgQ3wFmObMnogvYPPwdSkQxvJGLFhVPW5ipRE119OZ9Y0pQGH1pwJnXedZ1bdkStgd+KCm7EW5h9dmruxoJ8G7QDrSTYoBQA1QOEDVksou6g9bJz3h5pbRpk71oS7F2aksWZJoSxsqoXguzHiZbEDwJLu9fjaXKmYMCuU1beuQy1E1CUZUUdAjb6v0NrfNwSjpEyqCJJBFdw2dPGkdcQL3piCni0eFo9qX0UHmQsVEiFi/y7B7ryoXbGv+m/Pkte4rrwKpa2s3s93NffR4180dJIAoAhfOAs
X-MS-Exchange-AntiSpam-MessageData: 8Y3S3R9/3QpXChBHwVoQDeuOUw8ZqC1hRBGMugzBThUy1v4BDy4jFNbE1mPJCe3svMm3BhqD88yduuMsP1AksAOWUgG+UmDYP1ZUF6T6SPB/tNgZE21TBBMBIhYhqEZ9tyWJFgGvtMAcJeVwelc+wA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d039b124-bf00-4f6d-5462-08d7b676f17e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 02:37:07.3846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTq304k3PzLAxuYgTPhF1FQVBAyjkV/op+NPFAh+tba3+hgJ6WkscGKbVFwcR+3U+HkhebFr/Tg9ABu9SlM6oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4088
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 2/18/20 7:01 PM, Paul Hollinsky wrote:
>
>
> On 1/31/2020 8:38 PM, Dmitry Torokhov wrote:
>> On Fri, Jan 31, 2020 at 10:28:23AM -0800, Andrew Duggan wrote:
>>> On 1/28/20 9:22 AM, Christopher Heiny wrote:
>>>> On Tue, 2020-01-28 at 10:41 +0100, Lucas Stach wrote:
>>>>> CAUTION: Email originated externally, do not click links or open
>>>>> attachments unless you recognize the sender and know the content is
>>>>> safe.
>>>>>
>>>>>
>>>>> Hi Christopher,
>>>>>
>>>>> On Di, 2020-01-28 at 07:02 +0000, Christopher Heiny wrote:
>>>>>> On Mon, 2020-01-27 at 11:21 -0800, Andrew Duggan wrote:
>>>>>>> Hi Dmitry,
>>>>>>>
>>>>>>> On 1/26/20 6:24 PM, Dmitry Torokhov wrote:
>>>>>>>> On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
>>>>>>>>> When the distance thresholds are set the controller must be
>>>>>>>>> in
>>>>>>>>> reduced
>>>>>>>>> reporting mode for them to have any effect on the interrupt
>>>>>>>>> generation.
>>>>>>>>> This has a potentially large impact on the number of events
>>>>>>>>> the
>>>>>>>>> host
>>>>>>>>> needs to process.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>>>>>> ---
>>>>>>>>> I'm not sure if we want a separate DT property to allow the
>>>>>>>>> use
>>>>>>>>> of
>>>>>>>>> reduced reporting mode, as this change might lead to problems
>>>>>>>>> for
>>>>>>>>> controllers with unreasonably large threshold values. I'm not
>>>>>>>>> sure if
>>>>>>>>> any controller with bogus threshold values exist in the wild.
>>>>>>>>> ---
>>>>>>>> Andrew, any feedback on this patch?
>>>>>>>>
>>>>>>>> Thanks!
>>>>>>> The RMI4 spec does say that delta X/Y thresholds are only used in
>>>>>>> reduced reporting mode, so this patch is needed for the threshold
>>>>>>> values
>>>>>>> to have an effect.
>>>>>>>
>>>>>>> Reviewed-by: Andrew Duggan <aduggan@synaptics.com>
>>>>>>>
>>>>>>> Because reduced reporting mode is so dependent on these
>>>>>>> thresholds,
>>>>>>> my
>>>>>>> opinion is that it is better not to add a separate DT property,
>>>>>>> but
>>>>>>> to
>>>>>>> instead control reduced reporting mode through the setting of
>>>>>>> these
>>>>>>> thresholds. My guess is that the if reduced reporting is not
>>>>>>> enabled
>>>>>>> in
>>>>>>> the firmware by default, then the thresholds may not be valid.
>>>>>>> Setting
>>>>>>> the thresholds to 0 will essentially disable reduced reporting
>>>>>>> mode.
>>>>>>> So
>>>>>>> that would be how a user could disable reduced reporting mode
>>>>>>> without
>>>>>>> a
>>>>>>> separate DT property. Chris, do you have an opinion on this?
>>>>>>> Anything
>>>>>>> I
>>>>>>> overlooked?
>>>>>> Hi Dmitry, Andrew, Lucas,
>>>>>>
>>>>>> I'm in agreement with Andrew on this.  Having two ways to
>>>>>> enable/disable reduced reporting (that is, both the DT property and
>>>>>> the
>>>>>> thresholds) could lead to confusion and unexpected
>>>>>> behavior.  Simpler
>>>>>> is better, in my opinion.
>>>>>>
>>>>>> However, in that case I'm a little concerned about the logic in the
>>>>>> patch below.  When either of the thresholds are set to non-zero, we
>>>>>> clear the report mask and then enable the reduced reporting bit.
>>>>>> Subsequently setting both thresholds to zero will disable reduced
>>>>>> reporting, but will not enable another report mode. Unless there
>>>>>> is
>>>>>> code elsewhere to catch this case (and if there is, it seems like a
>>>>>> bad
>>>>>> idea to be handling this in two different places), it could result
>>>>>> in
>>>>>> the touchpad being disabled.
>>>>>>
>>>>>> As a hypothetical instance of this, imagine a user using the
>>>>>> touchpad
>>>>>> to manipulate report threshold sliders in a GUI. Setting both
>>>>>> sliders
>>>>>> to zero would disable the touch sensor reporting, potentially
>>>>>> leaving
>>>>>> the user with a dead touch sensor and no easy way to recover from
>>>>>> that.
>>>>> I can see how this would be a problem, but then I see no interface in
>>>>> the driver to actually change the threshold values on the fly. They
>>>>> are
>>>>> either set by firmware or specified via DT properties. So I don't see
>>>>> how the threshold values would change on an active device. Anything
>>>>> i'm
>>>>> overlooking?
>>>> Hi Lucas,
>>>>
>>>> You're not overlooking anything.  Mainly it's me being a worry-wart,
>>>> and assuming that if something can be adjusted, someone will 
>>>> eventually
>>>> come along and add a sysfs interface to adjust it, and then someone
>>>> else will create a userspace tool to adjust it, and things will break.
>>>>
>>>> If you guys are OK with Andrew's original evaluation, then you can
>>>> ignore my worry (which is, as admitted, entirely a hypothetical).
>>>>
>>>>                                     Cheers,
>>>>                                             Chris
>>> Currently, the driver only sets the thresholds in 
>>> rmi_f11_initialize(). If
>>> someone were to decide to add another method for setting the 
>>> thresholds they
>>> would probably remove the logic from rmi_f11_initialize() and put it 
>>> in a
>>> new function so that the code can be called from multiple places. In 
>>> that
>>> case, they should also include the code in this patch in the new 
>>> function. I
>>> think the comment above the new code makes it clear that setting the
>>> reporting mode to reduced reporting is needed for the threshold 
>>> values to be
>>> used by the firmware. I don't see a way to handle potential future 
>>> changes
>>> without adding what may be unnecessary complexity. I reaffirm my 
>>> review sign
>>> off.
>> Applied, thank you everyone.
>>
>
> Hi everyone,
>
> I believe there may be an issue with the reduced reporting mode, at
> least on my machine. I have a Lenovo ThinkPad X250 with the Synaptics
> TM3075-002 trackpad.
>
> With this patch, the trackpad becomes unusable. On a reboot, my control
> register values are [38 00 19 19 00 10 90 06 ea 03 0f 01]. This
> corresponds to a delta X/Y threshold of 25 and a palm rejection value of
> 0. The protocol documentation mentions that the palm rejection value
> becomes active when in reduced reporting mode, hence its inclusion here.
>
Hmm, it looks like the firmware was configured with non-zero Delta X/Y 
Position thresholds. But, the firmware does not enable reduced reporting 
mode by default so those thresholds have no effect. However, this patch 
will now enable reduced reporting mode since it sees the non-zero 
threshold which were read from the firmware. I did not consider the case 
where the firmware would have thresholds set, but not enabled when I 
reviewed this patch initially. Based on this new info I would suggest we 
change the if statement to check sensor->axis_align.delta_x_threshold || 
sensor->axis_align.delta_y_threshold. Then we would only change the 
reporting mode if the driver is explicitly setting the thresholds.


> Sometimes I could get the mouse to move very sporadically if I used my
> entire hand on the trackpad. I instrumented the f11_attention IRQ
> handler and found that it was not being called except for these sporadic
> movements. I tried a few different combinations of these three values,
> but they had no effect. This included setting all three values to 0,
> which in theory will yield the same behavior as continuous reporting
> mode, but it did not on my machine.
>
> This leads me to suspect a hardware/firmware bug.
>
> I believe the idea was that the platform/configuration could set
> sensor->axis_align.delta_x(/y)_threshold to 0 in order to disable the
> reduced reporting mode. This is the case on my laptop, but only a
> nonzero value will override the value from the firmware, so the reduced
> reporting mode still gets enabled.
>
The patch is meant to enable reduced reporting mode if the driver sets 
the delta thresholds. Otherwise, the newly set thresholds will have no 
effect. Generally, I don't think reduced reporting mode is enabled by 
default. At least not on the various touchpads I looked at. I think the 
issue you are seeing is that reduced reporting mode is being enabled 
when it should not be.

Andrew


> All the best,
> Paul
