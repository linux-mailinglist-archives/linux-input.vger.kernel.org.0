Return-Path: <linux-input+bounces-3631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5C28C08F9
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 03:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C6101C20C70
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 01:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF6013C801;
	Thu,  9 May 2024 01:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="ni/IbvjS"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2036.outbound.protection.outlook.com [40.92.90.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D913C804
	for <linux-input@vger.kernel.org>; Thu,  9 May 2024 01:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217187; cv=fail; b=dZWnOZ4lKYQRCyvgEUDRXamyPKU8NBacFdJF4bfGbo6CjqOtg96seEemK0CKzZCVXsg7kyLoR6NvgvyuFrqLOu2ZTo76Ym92UWvgMyASpAqga4MVxymJyJ4Wmb3S1FZYEtSnf85skk3k2Q/Z2EVrwnxsKiL/gerWEYBdo/vYY9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217187; c=relaxed/simple;
	bh=psGC5q6RsbC2HN4yQAnMRY+2A/vsNGbNBVyFJkmg2/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KklpyP3FFTx20E2dfjUiJFhPd/8ydg0uXtks1P5onhfYAg6ICRsBSaOmmZzIbTzNuDNj+6Lc9xTw1oYj50iE671y4IhltBh1FfwxmtIK1sLaQGc+7LNk7qGYeSBmev/TLTloYj0cCldAR9gH6F6QACA0YBqP41v2v24eVFDINyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=ni/IbvjS; arc=fail smtp.client-ip=40.92.90.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZi313CNal5T3SxSQ1CZJomH4ZZn8YuUP4zHbEFsQpWznRHkHg59UZCK2WWiEDwMEMIQ195vTpZ546tiJXMavHwht5+zTYO+kEN722riKrUZEYL/c6DYvPRxum4RFMeNydIglyS/Mjs+uMyoHU0dBMrofsuu7maaE+KP8iAsaBbJ6wIQYL3r/c3PZt6awDUc/cBtrS/YXwHkWZcvDm1i+0CS2CtcsHwvUiV2aajyMsqUI1RfdooCZpqIjN2zJLFwjQsiSwB911ezyXAvofynKjRVXDxH9sgPAioBKOz270cL8dm7NBGNYNInNOGfh6N+aBt3X19pyr3PEerqWE+SWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu4LYOALJBqPGuzB7ik5/JUxQ0jf88NB13asFjTJIWc=;
 b=Zr8NZzqjPwyjueLi37IcAacrf4ZUQQterX+h5GfE/A7SAbwVAyZMtCRX9LL/sq9FB5ZByBGbkX4S5FC9wratGGcU4coVKvIMYCZnrsMLwWIN+VjRdziGs/3sO2yf/gNtwDt1hRVp5NodrHZz6yPZ/L/u0gTASzjYmQMpytE69z4dWehmYYdujBnNOn2WnH0bwJ1MXNrMfNyeBtKtw1Qe6GnPHQRFNR1mju7bB4sSFJctmb6J5rxeOtWEsSfDxJNuPKGNswTPFMqxUkhgRMn3cwiL3kC7sBeVEGkJRAFTcSq1bXqf2VFAvFqemvacyR00UrHlMW00d5G2NvsfUjY5ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mu4LYOALJBqPGuzB7ik5/JUxQ0jf88NB13asFjTJIWc=;
 b=ni/IbvjSxPVIqy7JXHgFBXnZW0UbnNMVopYkJB3ymcl/iEd6Au2TveXKnHCtw6FiRABdBNnbK/Jr+fsej6ROo+DQxJ0TW90L/OYRh8F2hV0KNdipBif+MXadbToonYyYA2kAoxJ8a/ps6BlZaEZKXBr3ioWm1zERCCFCBFViagBvAEnI1Lq1DeLL0l3cB1DSvEeVsHvkNmjnoZWt9sMkFRSNotpu+dwAcx0SWWBpKYog9X1uJIrZnTgTJ0jWYHLvHlLm9DNI1kg1pnIPLHCC2vKV+gSP+A+5U2oVzkffp/EMP8R9CSHx7m3Eb7O1hJxrx/zINxc4w+zek49/P5t0zA==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by PR3P189MB0892.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:47::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 01:13:03 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 01:13:03 +0000
From: Milas Robin <milas.robin@live.fr>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	milas.robin@live.fr
Subject: [PATCH v2 0/1] Input: add gamecube adapter support
Date: Thu,  9 May 2024 03:12:24 +0200
Message-ID:
 <PA4P189MB146928AA17984371B61EB909FAE62@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <ZjqV_uMHj8Q6VG96@google.com>
References: <ZjqV_uMHj8Q6VG96@google.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [kYOiJsBhFuFSODtCL5WKRpRnt49lWdQ83nPDkq81YfByEWFOzfztk8xzQFHXa14/]
X-ClientProxiedBy: PR1P264CA0086.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:345::12) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240509011224.80600-1-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|PR3P189MB0892:EE_
X-MS-Office365-Filtering-Correlation-Id: 597e83ee-b38f-4063-36f4-08dc6fc52baf
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	8BXIfPEUiLTzYf5XrzpFKAg2aeNwBuUdh5EcFB8cxuoognO9YP3XO5Ur6SLNumwH6SCvpe1bRNUgAHT/7SzBDxXzGw7R0yW0jXnyeUVMriCMutMpfLetTiItevbkMpL26cf7nLLzj8OEC119HImogAXTz6/IAKpY+27tWX95HI88d5gsWIpuxtyyBV4B0XkQPp9WvTtPdMNbHES6hSzGjynp4iMRCfN1zty775ISNAb5J4d4OMWUSetIJuDD5EPkNfICwT1lpAsxUvTXXd5PqcLlq3Bh8SUMFqIleISFoBMRP0dleBXnjwrrPj+j44amf3OWu+Hv+YFcoPF5oVqfuvYej1uM3D/k8AE8V7drozmAFmsnQ0wrIrwH6RVABhVOylcu03NZgqZl7FCeeZyWrkE13a5FU3jiSuJd5X2i/B0T96LSzeZ1zbwdUz29n2XPU5Ah0HzPqUyk/SJXr37pJzsWDzUcfVEa+4B598UbydxgsVgPE2lEB+ccU2P0dzPGbnOBnHNAtlp1hjvvyNGGptZs0Lg/TwzvUsGyhT2apBC2RwKFAtUsCXdNRFpIrJ3/mpvPNOYRWZ3xxedMvckznr1vt/LBJHfllh/k3u0AtujAjspnS7xBGgk2mEYopj6M
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Fr4SBpOqy50D2h788fAG4tBqMs6hHlOE+hVsVPNVn53LZlA/VikIumUpOtj1?=
 =?us-ascii?Q?23lepBbFut5IAPRzUntlb3DUbkirSMsXBwGVofxBbNswyZsRDdpG6HsspIBp?=
 =?us-ascii?Q?uGH4vfiQ1cVfHZ2hEBDifUuBwCqLQRbSqDnUH2Ci+J5iFkStp9/TiwS5nTah?=
 =?us-ascii?Q?KI7q0ecPKwItZIoNVFzmroQFOfm2u3uXITISpytwY9Jt8mk6T8KmX8UAKmfm?=
 =?us-ascii?Q?DD+VMFqh0Snn4x5QawvWQhxo0nm5W2dW5KnhMz8p6p7U3w7qC11k4dBJwzcB?=
 =?us-ascii?Q?vJq7nC5PDGC3kJe9kKTAZyYEHBhetPiiq6xbROFCgyDgV02C0M6O3qa+QTZ6?=
 =?us-ascii?Q?PkRXGqNjjk+AHNgmFsCjcbfK6iZ+fh27aoHQ8bWL3Tmtov5iXDO22SqEqoZJ?=
 =?us-ascii?Q?/9pL55XV+CTCqpZieH2DovA2/lRh7daQKoJpbdpELw5XIbyBzM880KKjx6Ym?=
 =?us-ascii?Q?khUW0foj7OKF7D8vz6DEmOeekX+P5pgzEU109TaOklSTPY6nN0r0sbsoX53+?=
 =?us-ascii?Q?byB+eMdjIq0ccx2jCKYpPGcGyTLBZ9lMrUs8ejCA28vkIOi2O3q2X6F+ogZR?=
 =?us-ascii?Q?AuuUeLUrjZZ7rPVSaA8e+QPoigEc0x8PukLSZrkY21ocTWVyrFUEmOR4Gvl1?=
 =?us-ascii?Q?2r7zVAroTAHEB//dEmyZGHnRM6uobZ4qXS4BGTOJjgriIWIGqWoXy4CsGplB?=
 =?us-ascii?Q?kFu1kfRUTuoHyI7EAGwyhc+m1USX2EkyWj2V+BtG4AcRa1InodnlTtEbbitp?=
 =?us-ascii?Q?WXyhJs7a5pGq/UhU7hJqzhblx25jEEk5U/15L7gGPlvpu8VesT/YfFhGlMQj?=
 =?us-ascii?Q?mTvspLlTsYYHwu1pLcIwctuzjrqJSa9sPRa36mnCvECAnluZg78H5ZPTQKLl?=
 =?us-ascii?Q?LCxrc7Osix+edm8LaTPwcjYKBIsLIlkwgy5qseqlIPhzi0YEg533b2rORepA?=
 =?us-ascii?Q?nhxr3diJHLjk9BGtxxG8QpAPVo42AhxIX7ETik71F6SpK+e/y0ipYjedGjzw?=
 =?us-ascii?Q?yd34aXhjsKeUY7rrXe09E40ICaLD73WIO1NBopxioXUYVTMyeKm8O7xS5aSx?=
 =?us-ascii?Q?BQuWCAFQvmpH48wFLFj2xYGEi6pSDp2IGeneoFMggNJluOH/2c8Jk4FlKWTb?=
 =?us-ascii?Q?2Ltah1VSnmfY31xdXOIUOpInM+au7nr7DfgYK4KuVp3FJy4Dlvvu2Gt+4RuP?=
 =?us-ascii?Q?zU2KcWfQ1FLm9p21LtNUrqV1C7VvA7POpUVK5snqTtENEOiJAltNrvMSBi4l?=
 =?us-ascii?Q?7+QuC5yobYSaqZw9H35ASHEvajV+BnbM6xsTp1q15+6/Y4qz0vlFz0D6zh+A?=
 =?us-ascii?Q?oDQ=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 597e83ee-b38f-4063-36f4-08dc6fc52baf
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 01:13:01.5088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0892

> > +struct ngc_data {
> > +	char phys[64];
> > +
> > +	struct usb_device *udev;
> > +	struct usb_interface *intf;
> > +
> > +	struct urb *irq_in;
> > +	u8 *idata;
> > +	dma_addr_t idata_dma;
> > +	spinlock_t idata_lock;
> > +
> > +	struct urb *irq_out;
> > +	struct usb_anchor irq_out_anchor;
> > +	u8 *odata;
> > +	dma_addr_t odata_dma;
> > +	spinlock_t odata_lock;		/* output data */
> > +	bool irq_out_active;		/* we must not use an active URB */
> 
> I think all of this starting with irq_out should be under #ifdef
> CONFIG_JOYSTICK_NGC_FF.

Unfortunately, a first packet must be sent to the adapter before it start
sending controllers values.

I was able to remove the irq_out_active field with some rewrite.
Technically it would be possible to remove the odata_lock field too but with
the current code I have it would mean putting a lockdep_assert_held into
an ifndef which feels weird to me.

> > +static int ngc_queue_rumble(struct ngc_data *gdata)
> > +{
> > +	int error;
> > +
> 
> Please check irq_out_active flag here and also provide a stub for
> !CONFIG_JOYSTICK_NGC_FF so you do not need to sprinkle #ifdef checks..

I changed the way my code is cut to reduce the number of #ifdef as best as I can

I incorporated every changes on this new version

Thank you for your review

Robin

