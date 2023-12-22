Return-Path: <linux-input+bounces-939-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521C81CD7D
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 18:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E0E1C2115A
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 17:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC8328DB7;
	Fri, 22 Dec 2023 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Crj9Ck2a"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2030.outbound.protection.outlook.com [40.92.41.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE25C28DB1
	for <linux-input@vger.kernel.org>; Fri, 22 Dec 2023 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFFLtEwrlbx8CBrpMXi035E2l9+okDogRDlU5cNq/wBL9Nhhx8t5chOhQzkz6NEfJ6U72Vd65fGNIxV/sbQXdUYxhdBsVT5Xrec8iD3OowvEEq9t91N02DPMk2gyfafRLyTfT4nt/BH/N3ciNch52wTUxlhis7TejIXYhS+bafNn4UqeCIoU2PyVR/GIwBMyt99uu7vIEvKgNsYQT3T+t8CpDQDxpQOY2jb56+e/izUptXnzNYoCI6ouz/bwdlGyO3K9CPbIRkEmfMGLuE82vSyBcwEPOWfu4TAgHhtYMuh4fdzucLC+VpQCcm6XJUIm2W4rfaKTycnIQHhecJuLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fozt6uNB08roCSkoC/NOjqXAwhcfhQfgmXQ0wW8C9pg=;
 b=hnqVhD+c9RP9O98IyTx012ldH88n1tiuYIe5slu1BGX3gaAriNBigNPHlP2oEwDsNAhTLtXWQSg7PHiy7oFf9xD4Njbv+UPYGJth8o7oxhsRexK1GPuCT6uRh/jd8AC98/t+ftIUl0AzBgCWDYbDhRhxVzcPeLAwp9STJ9k0bJ64v6mIUPh4tgW25lEXnYlQY739JiwLl+DWxEwyDITB0BU9mWRmKt5c8q8/oGBXbPXL/2l3KSEDBzPS3lerkNLj6cNAkLvddiDaXrnVooA1983x3E+ufDi9sqmJ8iP+P3xOkc+J87gkpMxjWLFXM1TjwKMznoRGcfMg4lrbPIiVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fozt6uNB08roCSkoC/NOjqXAwhcfhQfgmXQ0wW8C9pg=;
 b=Crj9Ck2a0wxTP24yzBYSKfYVXIMQAq+jdMhJ1EVtEb8OOYf3zZ1pJr2kYCn0O2jVBGoDtEecN2gVXS0ieS8BhHC/nTNzWdLbKRHhEbFdq3BaguIVHjKBR/QAeOWj951VPsQQ1oIjsXn8Jk89kSuayEI4bppEGTBJXhQ5SLfRC98/iZ6A/M/j/c2cBdCC5HPAf30Q5K0h/ArYSUBO/laDtZXedu2iGss4bFHnGoK9NI2pLD1g0Yasl0KU1yV7T0n1vkM3i8KtWCEU5D1mLPcRrC5+SUwbafzEcYKAGonoQd/AHtgxXicDQ20C4xIH4tyDzGALDiSCEVllE2gicwp5og==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by MW4PR06MB8394.namprd06.prod.outlook.com (2603:10b6:303:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 17:09:49 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 17:09:49 +0000
Date: Fri, 22 Dec 2023 11:09:46 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	svv@google.com, biswarupp@google.com, contact@artur-rojek.eu
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID:
 <SN6PR06MB53421C1C9CC9EA94CBB781C6A594A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
 <ZYJJC-ID4SyHhuuA@google.com>
 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
X-TMN: [g9kygDo9N1vuVmIpNX3fX5HG4iJLg5hN]
X-ClientProxiedBy: SA0PR11CA0124.namprd11.prod.outlook.com
 (2603:10b6:806:131::9) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZYXC2srVY3upn1Hf@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|MW4PR06MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: b3db2557-cc1f-442f-4d08-08dc0310cda8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RWo1o+/UwGGdrRuWSwwzjTtXLLJ6hCvw94XTIVQAMieDLWuj12lQzTljkA2cdGpPe6e0JLj92qiucpR3Jby1TmNmjTnDtKvAL1D5d8joqRdf13MC/XTnDfJ9LgNjWbiJOccGCIrUUqLKqCG/PNdWdwSJBbRWMh3Ss6Z4HsNmrJ+7vdOIUyIOAP8+XT6MHE8s41rpz0H+0YAnKz3Ck8W1E0fIzC01X6OdDyamJW4EeVWl9apHPcFw1GXt0Nc1V7c3ppg8ZFK4BUBJRv9OA2k7Gaxk2vnjm5BB4UUdF+AE5p5P5ekXipt4rm+VsJGRTcVf+hNEkATaelX1KFSHfzX6QdzGizjoQXCmropIryqaH9X16VrNxdwafwWoIIDdWxNmEYgv1D404bTccZI2gII4B3gFhaUcyBusEANB9MMiD8eNkRO89dwxyjo1+yV4CEbrkbtx5Lc2yubyJFy0GM22amsxh03/TVdKanpYEmhVQRRI4yHBSkqmVzwSH281DQYWhWUqiQHcC/eSyD2FgbKMjyHHXv5TAUFdLF2J2rAGJBE5eA5++DQ8/bsjq1fFlSKK
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Hiz3a7E59BcTvZC/gavzWWm5U3rVKCRtVr2JbzxJgpLS6+QaYtSf7+ofcp?=
 =?iso-8859-1?Q?oOrE5g6GBZchlu2bFo7izObhsQddLboViya55Ti6LUtF7BJbeuLTTP06JI?=
 =?iso-8859-1?Q?NIGnWotXMLz455J9wJONq+92hzJ5bECC2Nn/6C10ieW4FZk1NTUJXnXpZw?=
 =?iso-8859-1?Q?nxMdih9PR9YT8olll4B6TGb0agt25yggqxIg2ZiTyMxczuFMnhpwG4UNVy?=
 =?iso-8859-1?Q?4E590mzYAsfhJ3Kyr9KdF2if3VfscGoPx/xOJLsDOW4g+YGLMBhsHnkeV+?=
 =?iso-8859-1?Q?21HFXLre9wfTqE6xGEhIo0TzXyKkxeEaKwrDUw/w6gVOlAyE9ub/ZiDmzV?=
 =?iso-8859-1?Q?dK5r0FDODi+0iyKfX+r9vqBdfi2TeMcK1HFwdSl1cV5PzV0hBFRL2n1YRB?=
 =?iso-8859-1?Q?6Y7GlCxwUdPf3YBjW3wAVR6WwOS2Bf7/JaA8GjLJjzZz/pksRfuYHhOgrs?=
 =?iso-8859-1?Q?KXLNmhnJtVvtQg7IxgOmJH2hmKpJcJVRmt2aTSP4cW9ykCpPBJfx8PgQEA?=
 =?iso-8859-1?Q?PRLm/xoDKJU76vBrNkC7Fk7oXEtSfVvzX7pwlhuDDCBnXrMq+KBLOlOkUt?=
 =?iso-8859-1?Q?ZOos6pkUdXOs3T8NoA5lWWa+niKQsTjbA6hnzesleUAC/eZnkxwOdhyW5T?=
 =?iso-8859-1?Q?3to61CMyTtJQrJJyLL3uJAvEQHlKjvkv5JE+/J/R0CER7ZA0pd41FhIAnz?=
 =?iso-8859-1?Q?4/nF+CtkoVQz5aqbD8hwmJS6xMcLkr2mYebYgwsdRnX4bKHCdUKW+ygcF9?=
 =?iso-8859-1?Q?ooRW5Na1kQAszGKDbWaiIar9DDl9PPmVKHXScagXOCH9G41PoI2pW7oObc?=
 =?iso-8859-1?Q?edzWRabGKRxabYJOAgUZOCzSgLi7XoMex40mLT3/bZurayX1+JApGOE0mK?=
 =?iso-8859-1?Q?CS29Z71m3twFVdjXdopvxOYa6xBY4633PFevt79I7AEOZki4MqMwgA+W1S?=
 =?iso-8859-1?Q?J5Ulwm+ZWYhc4sjZd3GQQftL67QYTUibHIUvykfL0n7zjcZ2efO0QNASro?=
 =?iso-8859-1?Q?TfPbRafB9hcn8cbkaZjVI2lEkcylBtwYt+rTdov+5THVSW+zO2JqIOfmP5?=
 =?iso-8859-1?Q?ETzYZg0u83vQMb57NIPpk645+FHsvLQtekRcurYitXEKyGz1zT01uEsEwu?=
 =?iso-8859-1?Q?oNyeaD4U00Rz06GrCeeX2ZB8BwSvNXjF3y7eHmyXnkakIsUqGRFVo5XZcV?=
 =?iso-8859-1?Q?fGj3goNQPJ3IFi93QDL1AFBQ/1iHyW9uXnBo8LgDv9XLiVd7RXlnrY4CgV?=
 =?iso-8859-1?Q?ShbkINbl+wCPry8Fo5f+mQ9fT0FwU2IP/CDjbDoFc=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: b3db2557-cc1f-442f-4d08-08dc0310cda8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 17:09:49.1769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR06MB8394

On Wed, Dec 20, 2023 at 02:39:14PM +0100, Paul Cercueil wrote:
> Hi Dmitry,
> 
> Le mardi 19 décembre 2023 à 17:53 -0800, Dmitry Torokhov a écrit :
> > Hi Paul,
> > 
> > On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> > > Hi Peter,
> > > 
> > > Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a
> > > écrit :
> > > > On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > 
> > > > > Stop checking if the minimum abs value is greater than the
> > > > > maximum
> > > > > abs
> > > > > value. When the axis is inverted this condition is allowed.
> > > > > Without
> > > > > relaxing this check, it is not possible to use uinput on
> > > > > devices in
> > > > > userspace with an inverted axis, such as the adc-joystick found
> > > > > on
> > > > > many handheld gaming devices.
> > > > 
> > > > As mentioned in the other thread [1] a fair bit of userspace
> > > > relies
> > > > on
> > > > that general assumption so removing it will likely cause all
> > > > sorts of
> > > > issues.
> > > 
> > > There is some userspace that works with it though, so why restrict
> > > it
> > > artificially?
> > > 
> > > The fact that some other userspace code wouldn't work with it
> > > sounds a
> > > bit irrelevant. They just never encountered that min>max usage
> > > before.
> > > 
> > > And removing this check won't cause all sort of issues, why would
> > > it?
> > > It's not like the current software actively probes min>max and
> > > crash
> > > badly if it doesn't return -EINVAL...
> > 
> > It will cause weird movements because calculations expect min be the
> > minimum, and max the maximum, and not encode left/right or up/down.
> > Putting this into adc joystick binding was a mistake.
> 
> I don't see why it was a mistake, it's only one of the ways to specify
> that the axis is inverted. This information is between the firmware
> (DT) and the kernel, that doesn't mean the information has to be
> relayed as-is to the userspace.
> 
> Unlike what you wrote in your other answer, when talking about input
> the kernel doesn't really normalize anything - it gives you the min/max
> values, and the raw samples, not normalized samples (they don't get
> translated to a pre-specified range, or even clamped).
> 
> I don't really like the idea of having the driver tamper with the
> samples, but if the specification really is that max>min, then it would
> be up to evdev/joydev (if the individual drivers are allowed min>max)
> or adc-joystick (if they are not) to process the samples.
> 
> Cheers,
> -Paul

Forgive me for such a naive question, but what would it take to get a
bool of `inverted` added to the struct input_absinfo, and then an ioctl
to get the inverted status? I'm honestly not sure of the ramifications
of what this may do to userspace (good/bad/ugly?)

From what I am seeing thus far it sounds like we should not be setting
the values as inverted for now because it can cause problems. We can
either fix this in the adc-joystick driver, or my honest preference is
to just set the range as defined as min < max and add a comment stating
that the axis is inverted. If we can't handle reversed values
throughout the stack I don't see any reason to handle it special just
for the adc-joystick driver.

Thank you,
Chris

> 
> > This is the definition of absinfo:
> > 
> > /**
> >  * struct input_absinfo - used by EVIOCGABS/EVIOCSABS ioctls
> >  * @value: latest reported value for the axis.
> >  * @minimum: specifies minimum value for the axis.
> >  * @maximum: specifies maximum value for the axis.
> >  * @fuzz: specifies fuzz value that is used to filter noise from
> >  *	the event stream.
> >  * @flat: values that are within this value will be discarded by
> >  *	joydev interface and reported as 0 instead.
> >  * @resolution: specifies resolution for the values reported for
> >  *	the axis.
> >  *
> >  * Note that input core does not clamp reported values to the
> >  * [minimum, maximum] limits, such task is left to userspace.
> > ...
> >  */
> > 
> > (We should change wording of the last sentence to "... does not
> > always
> > clamp ..." since when we do inversion/swap we do clamp values.)
> > 
> > And note that the userspace that can handle swapped min and max will
> > work fine if the kernel provides normalized data, but other software
> > will/may not work.
> > 
> > Thanks.
> > 
> 

