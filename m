Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6517F14F22D
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 19:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgAaSaI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 13:30:08 -0500
Received: from mail-eopbgr700088.outbound.protection.outlook.com ([40.107.70.88]:64736
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725909AbgAaSaI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 13:30:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLmory8R+X67uG/5qyCCaVNz9g5RgGUvQrbHZAXAVZUwK6bzw/LW09QRBd4c3Gv4gDIaXdxSkh2aol4oyorH14HIWPtieDNPVM3JFjfFG5w6ikpReBGsV/4UHg7PBHOUPal2cEMrjmlaNdQ11AlPEuHt8oI9RUjLXQuVFLo927P6T+UXyey3+VcMty6UsaNokG35enkHWyIheuCDb9XIhhNnry5nHlHQ9B4vzk20L0RYziTBy+X+9xv7YLWgT+y/g5VxD/hKB40/r6DqQg4Oll9qYRIlg+ixcm1qQvUmyT2AjmNusQJnVklX86wIfaZKRciCJGg2PhvO8B9Ph7cNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RSlxriBBdORjP99YwWgQgZNvOSfSdWF8ozF1zXVPDs=;
 b=ZKyjAaWfyrlfpsSz9ppJGIfnoqwPPuBTM+F2wZRW5FAXbuy/M0Of+UB0wl/Z2nk+HEcOv/wsY2K6UKMFd+NxNcNLSTlIUsagt03WdURw7FYDxVDR73w+d/iBjNIvpxn/kT8DRNQMSakYT4O/H0wDChQnKYTg1yaEabCJ11dewOOt32whGlvxy127jz5WiAduWYrUQCTgicrcqPGJG1hv74fzPysCK0a380wUboJEP7C786BOC0+H0nWTINIUMhskGoaHt9yxM7mSvJ334WtgdgkZIAqcihelmEhHTYg3g04uAI3S/S65reyy4cV1JjpgMYReUtIsh1+6p+UD7F7RUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RSlxriBBdORjP99YwWgQgZNvOSfSdWF8ozF1zXVPDs=;
 b=OY37d6M1Cy+sdjNGhgJpJ80HJTKeQaK3owGBsXD47GGbZzAmJd0EXZu4MXWrSCTmeyW+czSx8tD9R22wlx0CKT7mBPa25QrnhTq2e3omOXclkhShO57MITbEoUc3nnE+o0whC62UNRN7VSI8BkMchM09QUH6zfWU1jW8XHGSJ7M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=aduggan@synaptics.com; 
Received: from BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) by
 BYAPR03MB4135.namprd03.prod.outlook.com (20.177.127.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Fri, 31 Jan 2020 18:28:25 +0000
Received: from BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d]) by BYAPR03MB4135.namprd03.prod.outlook.com
 ([fe80::64aa:faa8:c503:302d%5]) with mapi id 15.20.2686.025; Fri, 31 Jan 2020
 18:28:25 +0000
Subject: Re: [PATCH] Input: synaptics-rmi4 - switch to reduced reporting mode
To:     Christopher Heiny <Cheiny@synaptics.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
References: <20200120111628.18376-1-l.stach@pengutronix.de>
 <20200127022448.GC184237@dtor-ws>
 <b2ca3006-281a-c991-4c6c-7ae7ce5cc3f7@synaptics.com>
 <23ecff7a48f801fcc18680fb6cb150e32fc3c858.camel@synaptics.com>
 <a46120cfd113a4d016f37270eb92c4fccd00a2ed.camel@pengutronix.de>
 <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
From:   Andrew Duggan <aduggan@synaptics.com>
Message-ID: <0da4c22b-efb0-fccc-fd99-cdb398e1df8c@synaptics.com>
Date:   Fri, 31 Jan 2020 10:28:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <f7b19df4972a7293a701b738426fb63738a771a0.camel@synaptics.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BY5PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::39) To BYAPR03MB4135.namprd03.prod.outlook.com
 (2603:10b6:a03:77::21)
MIME-Version: 1.0
Received: from [10.1.10.74] (192.147.44.15) by BY5PR20CA0026.namprd20.prod.outlook.com (2603:10b6:a03:1f4::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2665.22 via Frontend Transport; Fri, 31 Jan 2020 18:28:24 +0000
X-Originating-IP: [192.147.44.15]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f6a8fb1-feea-4117-725c-08d7a67b5bb8
X-MS-TrafficTypeDiagnostic: BYAPR03MB4135:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4135A7502F96608208144CB9B2070@BYAPR03MB4135.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 029976C540
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10009020)(136003)(366004)(346002)(396003)(39850400004)(376002)(199004)(189003)(478600001)(8676002)(52116002)(16576012)(2616005)(2906002)(31686004)(316002)(5660300002)(53546011)(81166006)(81156014)(956004)(31696002)(36756003)(16526019)(8936002)(186003)(66946007)(86362001)(66556008)(66476007)(54906003)(110136005)(4326008)(6486002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR03MB4135;H:BYAPR03MB4135.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
Received-SPF: None (protection.outlook.com: synaptics.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R5CR8ohcX1O8TeMenlir4Nbv2Yx9wImU9yZQiywPO9h+74JfTechlFpWGhRnPT0LhbqjWMNFRjok8XGErH2rhnSO/mKBtT/Swin1Iu+FfJC92wqfUxeOl7NS8d+273tSjF3I9BO4K/G40asAtL08XFshSJOQiRThPdAcGjdbWpiRlXzHY50J0r/Q+OUDyd0F8aCLgWhDGGK8sALimm6mhrjTjco+5/jGbtWL49tIxcGuMjgNe+BRfkDn5aEEdqQjeCCpQGe9jvD8uBAbP4P1sWD3g8f4FTmqvuSX7ohEX+eZ4Vwm7m9hyx6Am8ue7LIh5RsCifXqAhCsuk3AzSNMWdRxKht8s+tHNPO1yTUttgbXNP0OKihumTP0O1ZVvgYlQuoVRf1Y/mHypOmWu2SfJvXdfrFCcd/1UkpyeVjbTWYoJCm7SY1AB2VV4Mmbp80B
X-MS-Exchange-AntiSpam-MessageData: en7Z8vB5sPxg1IuLP5YWRqOgJmBcIo3wDv5A13M4CawKZPmJPpsffFg/zCI212K98JZSg7hohILj+Q2dyEBKyMxaukS35sR5UiOKxTLo7fhCngN9UETKgUZEpVbJK9Ky7jBQlQuJug4LQwwVH9tgIQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6a8fb1-feea-4117-725c-08d7a67b5bb8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2020 18:28:24.9055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe0i7PsRSMQVxKTq8ptYjrk4nUokw5wo8F2mp+JsjpSshZS2xVSKl8+WmGsrZ5jKgeNf7h2NuttCkP5alnMf/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4135
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 1/28/20 9:22 AM, Christopher Heiny wrote:
> On Tue, 2020-01-28 at 10:41 +0100, Lucas Stach wrote:
>> CAUTION: Email originated externally, do not click links or open
>> attachments unless you recognize the sender and know the content is
>> safe.
>>
>>
>> Hi Christopher,
>>
>> On Di, 2020-01-28 at 07:02 +0000, Christopher Heiny wrote:
>>> On Mon, 2020-01-27 at 11:21 -0800, Andrew Duggan wrote:
>>>> Hi Dmitry,
>>>>
>>>> On 1/26/20 6:24 PM, Dmitry Torokhov wrote:
>>>>> On Mon, Jan 20, 2020 at 12:16:28PM +0100, Lucas Stach wrote:
>>>>>> When the distance thresholds are set the controller must be
>>>>>> in
>>>>>> reduced
>>>>>> reporting mode for them to have any effect on the interrupt
>>>>>> generation.
>>>>>> This has a potentially large impact on the number of events
>>>>>> the
>>>>>> host
>>>>>> needs to process.
>>>>>>
>>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>>> ---
>>>>>> I'm not sure if we want a separate DT property to allow the
>>>>>> use
>>>>>> of
>>>>>> reduced reporting mode, as this change might lead to problems
>>>>>> for
>>>>>> controllers with unreasonably large threshold values. I'm not
>>>>>> sure if
>>>>>> any controller with bogus threshold values exist in the wild.
>>>>>> ---
>>>>> Andrew, any feedback on this patch?
>>>>>
>>>>> Thanks!
>>>> The RMI4 spec does say that delta X/Y thresholds are only used in
>>>> reduced reporting mode, so this patch is needed for the threshold
>>>> values
>>>> to have an effect.
>>>>
>>>> Reviewed-by: Andrew Duggan <aduggan@synaptics.com>
>>>>
>>>> Because reduced reporting mode is so dependent on these
>>>> thresholds,
>>>> my
>>>> opinion is that it is better not to add a separate DT property,
>>>> but
>>>> to
>>>> instead control reduced reporting mode through the setting of
>>>> these
>>>> thresholds. My guess is that the if reduced reporting is not
>>>> enabled
>>>> in
>>>> the firmware by default, then the thresholds may not be valid.
>>>> Setting
>>>> the thresholds to 0 will essentially disable reduced reporting
>>>> mode.
>>>> So
>>>> that would be how a user could disable reduced reporting mode
>>>> without
>>>> a
>>>> separate DT property. Chris, do you have an opinion on this?
>>>> Anything
>>>> I
>>>> overlooked?
>>> Hi Dmitry, Andrew, Lucas,
>>>
>>> I'm in agreement with Andrew on this.  Having two ways to
>>> enable/disable reduced reporting (that is, both the DT property and
>>> the
>>> thresholds) could lead to confusion and unexpected
>>> behavior.  Simpler
>>> is better, in my opinion.
>>>
>>> However, in that case I'm a little concerned about the logic in the
>>> patch below.  When either of the thresholds are set to non-zero, we
>>> clear the report mask and then enable the reduced reporting bit.
>>> Subsequently setting both thresholds to zero will disable reduced
>>> reporting, but will not enable another report mode.  Unless there
>>> is
>>> code elsewhere to catch this case (and if there is, it seems like a
>>> bad
>>> idea to be handling this in two different places), it could result
>>> in
>>> the touchpad being disabled.
>>>
>>> As a hypothetical instance of this, imagine a user using the
>>> touchpad
>>> to manipulate report threshold sliders in a GUI.  Setting both
>>> sliders
>>> to zero would disable the touch sensor reporting, potentially
>>> leaving
>>> the user with a dead touch sensor and no easy way to recover from
>>> that.
>> I can see how this would be a problem, but then I see no interface in
>> the driver to actually change the threshold values on the fly. They
>> are
>> either set by firmware or specified via DT properties. So I don't see
>> how the threshold values would change on an active device. Anything
>> i'm
>> overlooking?
> Hi Lucas,
>
> You're not overlooking anything.  Mainly it's me being a worry-wart,
> and assuming that if something can be adjusted, someone will eventually
> come along and add a sysfs interface to adjust it, and then someone
> else will create a userspace tool to adjust it, and things will break.
>
> If you guys are OK with Andrew's original evaluation, then you can
> ignore my worry (which is, as admitted, entirely a hypothetical).
>
> 					Cheers,
> 						Chris

Currently, the driver only sets the thresholds in rmi_f11_initialize(). 
If someone were to decide to add another method for setting the 
thresholds they would probably remove the logic from 
rmi_f11_initialize() and put it in a new function so that the code can 
be called from multiple places. In that case, they should also include 
the code in this patch in the new function. I think the comment above 
the new code makes it clear that setting the reporting mode to reduced 
reporting is needed for the threshold values to be used by the firmware. 
I don't see a way to handle potential future changes without adding what 
may be unnecessary complexity. I reaffirm my review sign off.

Andrew

>> Regards,
>> Lucas
>>
>>>>>>    drivers/input/rmi4/rmi_f11.c | 14 ++++++++++++++
>>>>>>    1 file changed, 14 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/input/rmi4/rmi_f11.c
>>>>>> b/drivers/input/rmi4/rmi_f11.c
>>>>>> index bbf9ae9f3f0c..6adea8a3e8fb 100644
>>>>>> --- a/drivers/input/rmi4/rmi_f11.c
>>>>>> +++ b/drivers/input/rmi4/rmi_f11.c
>>>>>> @@ -412,6 +412,10 @@ struct f11_2d_sensor_queries {
>>>>>>
>>>>>>    /* Defs for Ctrl0. */
>>>>>>    #define RMI_F11_REPORT_MODE_MASK        0x07
>>>>>> +#define RMI_F11_REPORT_MODE_CONTINUOUS  (0 << 0)
>>>>>> +#define RMI_F11_REPORT_MODE_REDUCED     (1 << 0)
>>>>>> +#define RMI_F11_REPORT_MODE_FS_CHANGE   (2 << 0)
>>>>>> +#define RMI_F11_REPORT_MODE_FP_CHANGE   (3 << 0)
>>>>>>    #define RMI_F11_ABS_POS_FILT            (1 << 3)
>>>>>>    #define RMI_F11_REL_POS_FILT            (1 << 4)
>>>>>>    #define RMI_F11_REL_BALLISTICS          (1 << 5)
>>>>>> @@ -1195,6 +1199,16 @@ static int rmi_f11_initialize(struct
>>>>>> rmi_function *fn)
>>>>>>                 ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD] =
>>>>>>                         sensor->axis_align.delta_y_threshold;
>>>>>>
>>>>>> +     /*
>>>>>> +      * If distance threshold values are set, switch to
>>>>>> reduced
>>>>>> reporting
>>>>>> +      * mode so they actually get used by the controller.
>>>>>> +      */
>>>>>> +     if (ctrl->ctrl0_11[RMI_F11_DELTA_X_THRESHOLD] ||
>>>>>> +         ctrl->ctrl0_11[RMI_F11_DELTA_Y_THRESHOLD]) {
>>>>>> +             ctrl->ctrl0_11[0] &= ~RMI_F11_REPORT_MODE_MASK;
>>>>>> +             ctrl->ctrl0_11[0] |=
>>>>>> RMI_F11_REPORT_MODE_REDUCED;
>>>>>> +     }
>>>>>> +
>>>>>>         if (f11->sens_query.has_dribble) {
>>>>>>                 switch (sensor->dribble) {
>>>>>>                 case RMI_REG_STATE_OFF:
>>>>>> --
>>>>>> 2.20.1
>>>>>>
>>>>> --
>>>>> Dmitry
>
