Return-Path: <linux-input+bounces-836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAA1817834
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 18:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0601B281A4D
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 17:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5535F4FF98;
	Mon, 18 Dec 2023 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="UB6gxgq2"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2092.outbound.protection.outlook.com [40.92.41.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E54FF6C;
	Mon, 18 Dec 2023 17:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqYi+ZY2oDJ3zH6AVyQQDEaCgc+ItFaYdAzhdgzLdluvciIlss6CnaAEpgVTqkb18bKg2ChSPWMr0DfzSDyjl5ZbW/sVAxAQOk4VXjwad/rdhiS4+Cuus5cnZwoGRs96rCdsnWSDinaXwF0Ik2jMIBduMmTy1TqR9dTb5K4HpwTkNmLpP/tHVyov5Mdb/MOG201bIrQFKVNFeIfTYBcn1gDES1qzikwuN5LkvzXeORzLn6r+M4BDvoVqWCxl0EocB6/m4hlgGD1mmHrhfh6OD2wcsV+Grr2O6A15KCNSl27KkBbnyClWluoIPTml1m4shT6boFSaYOb24bVT7ffWhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5izcHEqh6h/sgYF94zInFqVgyzHf5EGv7dcFfolhas=;
 b=GwhDN+s060WcPUddYCpMDLPq4Yb16V3NKXCJs9mQRF0WljlMD6YLjudX/ClJ4ZQCRIe3mqVCZ/QmYXirM1ASGj5MnlYVh3YbvAGslrHp0cXB8iAPE8v6BIh3kMq5GXATwO33KHMS+7HUnnN14b0i183uPix7MMnPynAIi7387oyQhV3Rf/NK0HxTOvdVFL+xIxVY0Z4/1ua0vrVE0ZiWw7X7mSFnYZUlpVpGeUefIkamtnhc+fXVyb7Xto7/1vlto6B4pF1spqF1H7RY+bEe6OGTT/qGMQ8diOVw0evfFVtg2sXDid2mpAXUXllje23VYKKs3Xq7hkE+s+wD5OjZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5izcHEqh6h/sgYF94zInFqVgyzHf5EGv7dcFfolhas=;
 b=UB6gxgq2j5wGLrj0aS0/g6uVgQqwRIeHBJ5peOyQr69/EDtXhRPRR3r3CoDTHJsbLOSqRAWI0cwakJmTwpvXoFEpApQQu3JkokCoyJTSDZtqu5QE5IENDPR0bJC2OkB/NA9lMQyDo4fRrmCEsJrSiFO9DUwgFNDSbcxGmy5DA8n6Bho1mgTmtqdVic3mXsQpkZ/MJC1Q/tpa5utszsISb04WZEfeyPB8uWGyoi881VmMMNWo8Bb/JNJAlj9vkPmY6/XyFubMwzjnUNXxhy4qUOnDkEjyKyQm3dNYvGdeRIhkOqDQH2VyuAOwzJVxrN3CyhEtFrYre+XY1a+pc7ruow==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SA1PR06MB8291.namprd06.prod.outlook.com (2603:10b6:806:1c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Mon, 18 Dec
 2023 17:11:28 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 17:11:28 +0000
Date: Mon, 18 Dec 2023 11:11:19 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Artur Rojek <contact@artur-rojek.eu>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	dmitry.torokhov@gmail.com, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
Message-ID:
 <SN6PR06MB5342032E6FB4A53C7A3E3A58A590A@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
X-TMN: [eH0RF0354jy2oFYYO3H5UeeOay7vVcQb]
X-ClientProxiedBy: DM6PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:5:190::37) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZYB9NwugEQjlRiAr@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SA1PR06MB8291:EE_
X-MS-Office365-Filtering-Correlation-Id: 039b8317-deda-49f6-898b-08dbffec5f12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RmFN1wR7Bc4BrQcyTQ0mDeEgldUO+9FQz6gSPp1M5JRA1fO+6ykqOThdFpooKuSiCqzPl2/GUgZq5pmX1Anhow6Xh/hXDWnRcGIEPVZrwgn26KtF6nBBVDftfNtUg0R4k4mqx8VskPbfq8pGSK3t45qaQCZRr5VwMh56ZuuANFCaYKF3p3BeR40E/z6UAL03AtQ4IFe9Q9basiV7rVIc8qTOKGzHVYBFInanUG07JzTPmMrpY9PJuyyYH7TI2YGSQhMh+91bXwKsD+44aUUjFdxT0XXXkVrp+WLcL65MVrZLdRiVtum9TKhFuSU5BivcKaG5O5bi39RYWrN5Y0LZZefwDNTUbIJv48/4YrQ6kDWVHpRNK+wlwNEQ20ztfihrcBJ3iZTeOF+Qzb8bE8I+s6LXZfLjnM30VT/wpMGvOItglBQz3ml0BwyLd7usAwmHSHDukXFCt49hHDHWaxJS7ExhS1Y/05RvoAasiCepTCiiFFC+uWUScu/bsRwd1Lmev8JWyxLoNexw4L7DTJvDJ/x7It+PaSNOPj04n5c4+imP907L+SyCCKLYNDjhJrzdTejjsB6RCZqmWR7rl+VggPYfzPRy4a+WHbR7ymyLtqn8x5EvMcru8/VjqULAaexMaEuUPcEgbyaPokOE1fAALw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HsvIBk0VV1p302pgp4ImUTgTNQhC27skpCkbcc1qMlBOmlF0I/iaXmNFY/Si?=
 =?us-ascii?Q?Nem5Nx99sd5CsgQ5uDPqW/FElKhQqRVMiIiDb0B/ksxbswLQZ/7DbJPl2H4P?=
 =?us-ascii?Q?8e9ZfZHBTiHjGSDh2nTRMg5oLsPjet+T2W02qtyE2lO4H9DTkhu6J33nGh8h?=
 =?us-ascii?Q?r9MneFf0/2RlUyvynJaGnymcyq8c8Jh0oGt86NAR9N1K+i3l1fWczCU43v/4?=
 =?us-ascii?Q?icjB1gBG5NXsE/VS7kdxafOP/S2kNwkdFTm98knzjGFgIKdoY/En9khswfSu?=
 =?us-ascii?Q?x2fDvY84HCg25fkglHG95uKVcu7QyzQ6w+ZJNkFz7z551hmdmLjMtHa3EztN?=
 =?us-ascii?Q?/HXD/0wlBVAtQ3a9tqlfq8zNeEg5sg348tfRU9pZ808wN3Kb9yHx/qjQY75r?=
 =?us-ascii?Q?PM9aSY0AdxfthqfK1EKvbH4gw7czOodlXNbdRKNA+5CeYlH36CxnRy0DablA?=
 =?us-ascii?Q?nH5GMyRIsWME9pkIpe2tJMyBVRT//6fSWUw+CPdoWE3rDe6iJ6eZMjS4UY0o?=
 =?us-ascii?Q?vfnIR3CWBmx311MU58pK3xC29TeSnKHQ5QP9KTaXs5Vfb27qVLAp0L9zKWer?=
 =?us-ascii?Q?p3SYFni5Ol5DESUBavsnKuY6vPdVHjcO/piyaWsnk34jHKxhXt2I/yEbcHZL?=
 =?us-ascii?Q?x3uVhpxskNDx/6sTvyigpO9dESnE7qQSJ3qtXLOBBh+YhLzAv99XHg2GegD3?=
 =?us-ascii?Q?NnMblSwwGc/ZsYeGDyh457TJ8wgNVtWd292+ZRUR/kTcuLSHAqkdEjR7qRek?=
 =?us-ascii?Q?BIWcdR8y1Ls7pLInDkucndQDVzxPqE9rVNHs+GEFzD9shtIExv3xW0iIsBrf?=
 =?us-ascii?Q?hp+YdnCkwVV6I2xP7wJ3wp06DpV/vFa3rZHUbB77RyERtSBaM2Y86Sof2PTU?=
 =?us-ascii?Q?h3ck/f3G8D3n+CY8sVOEAzjKt/Zn2Ra5aTiIlu2hDcaicF9GYSybs7RaP/xW?=
 =?us-ascii?Q?lPO8OjJpXdbQ0PufDDsJmlw6obvfm3U7JtDM11T4JjIVSFW9/qEYu/CbsZxT?=
 =?us-ascii?Q?7f4TwmzAAS8uqOUkhOFJhASv4G4Cf5cDfoHFThQGER/q2qFd8Ituv6wQYSWv?=
 =?us-ascii?Q?tzkR/VjcmNSTOqKRdPdOKz5X7yc3Sx2/EjxRXXo397VSjtu99xHv5UvZzsDz?=
 =?us-ascii?Q?RYD6zS3qz1lyjyy/FY4FYoDILLaNlv3RbiyuIbgg2MCQiKpc+xdY+H3FKYSE?=
 =?us-ascii?Q?LgrsBuFCHdgNdH6d49wDkkEsSGyl1UHsqMFkZmEphOsU90Mg4HDIRcAtjKI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 039b8317-deda-49f6-898b-08dbffec5f12
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 17:11:28.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR06MB8291

On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> On 2023-12-15 03:40, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > uinput refuses to work with abs devices where the min value is greater
> > than the max value. uinput_validate_absinfo() returns -EINVAL if this
> > is the case and prevents using uinput on such a device. Since uinput
> > has worked this way since at least kernel 2.6 (or prior) I presume that
> > this is the correct way of doing things, and that this documentation
> > needs to be clarified that min must always be less than max.
> > 
> > uinput is used in my use case to bind together adc-joystick devices
> > with gpio-keys devices to create a single unified gamepad for
> > userspace.
> > 
> > Note that there are several boards that will need to be corrected,
> > all but a few of them I maintain. Submitting as an RFC for now to get
> > comments from the input team and the original author in case there is
> > something I am missing.
> > 
> > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > joystick")
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > index 6c244d66f8ce..8f5cdd5ef190 100644
> > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > @@ -73,8 +73,9 @@ patternProperties:
> >          description: >
> >            Minimum and maximum values produced by the axis.
> >            For an ABS_X axis this will be the left-most and right-most
> > -          inclination of the joystick. If min > max, it is left to
> > userspace to
> > -          treat the axis as inverted.
> > +          inclination of the joystick. The axis must always be
> > expressed as
> > +          min < max, if the axis is inverted it is left to userspace to
> > handle
> > +          the inversion.
> 
> Hi Chris,
> 
> Device Tree is supposed to depict the actual state of the hardware.
> I worded the adc-joytick's adc-range property specifically, so that it
> covers a case of GCW Zero hardware [1], which has a joystick,  where the
> ABS_X axis reports increasing values for the left-wards inclination of
> the joystick, and decreasing values for the right-wards inclination. You
> are saying that there are even more boards that need to be corrected -
> those are all situations, where DT depicts the actual behavior of the
> hardware.
> What you are trying to do is change hardware description, because of how
> a driver in an OS works. You should instead fix behavior of said driver,
> even if nobody stumbled upon that issue since 2.6 :) We fixed libSDL [2]
> for the same reason.
> 
> Cheers,
> Artur
> 
> PS. cc'd Paul to the conversation.
> 
> [1] https://github.com/OpenDingux/linux/blob/jz-6.1/arch/mips/boot/dts/ingenic/gcw0.dts#L273C12-L273C12
> [2] https://github.com/libsdl-org/SDL-1.2/commit/46806790ad043

Thank you. Okay, I'll update uinput instead to drop checks for
min > max, since that's valid/allowed.

Chris

> 
> >            This property is interpreted as two signed 32 bit values.
> > 
> >        abs-fuzz:
> 

