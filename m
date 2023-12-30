Return-Path: <linux-input+bounces-1056-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B78203B8
	for <lists+linux-input@lfdr.de>; Sat, 30 Dec 2023 06:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 233D21F20FFF
	for <lists+linux-input@lfdr.de>; Sat, 30 Dec 2023 05:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F481FA2;
	Sat, 30 Dec 2023 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Bs8Ibdy1"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2017.outbound.protection.outlook.com [40.92.18.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606BE1FAF
	for <linux-input@vger.kernel.org>; Sat, 30 Dec 2023 05:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuiuRahJgyScoST+FzzFQ8E4SKwEYAvaBkH2vF++qZiW4/xpstfscu4oBwHBK6OkrJa/xwdRfmsFdYtIQ42v/7ucwscKFI4WajdjmRtsu5IAAfeTH3nL3wGIR4LZWqmnVl+ob2m0v6GGQOWBNWoxyGiFh1UZCW0I/5FryGN5CYNNpUyitqeBT8ca2F8ObWR2CnrIpFaDZRSR0cvpYZD+GYYuqv3JsevbRNitDVhop6UaRLxE17pbTZO7qqrgwv8+/tjaaH6TbPPO15WccbDOaUSxpsDBSne1iY4xeeJY7inN301LLAPaWHkEGB7f79fMboZgSqCzZxih88P8uYT8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkW99wChIgHJsNXWfmt4zMC9quvW6uqRz+xTlSXmAGY=;
 b=ddchK77G8ECNFFD+UT0Ppithhb5FHddv+NEPW56ESw4tHYlhyGqZY7mb1lYzR9M2DX/uhRSkTXxHABzQWLgYqWE+KaXAWdK5+WHrHcy1RZaK6a8lVn/CSsX5My8jdZMKfVkb54rSCqQPXE3jfPzrxjNgtWqtyju4H/4dmslhFQu7Ts7eVact1PxTDsfdMwLsH5ug1OxUuUxKQgWdFfvDoG4XUv5Z0YzYMEsI9D8gsb3aSHBm6Hm/BM6jUNjF8PsHNJovM3dY7wBuJD7khyaGfQ2pFaEBretsvlh+juIJspm/hwNKJsDs1+tOpsaRNfzjgZ1KSB9+Sa+I2gcGpsGN4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkW99wChIgHJsNXWfmt4zMC9quvW6uqRz+xTlSXmAGY=;
 b=Bs8Ibdy1MCtS1pCRxmpfPvuzrEY2+OEJs4lqRLz+7wRCSQwA3PQ8m7QWS+oCfCmrHpUlxCfCQsLj9GjnuqcL/wA7h4//q/uAaRGKy600ny7YxiUxL6gpKR3yKdXoppQ94Gf4fmRzO7+562T5lACKxnM/N/RDfHBjlFWaKe1h0p6EU3GlLqHAhpDTs9//Bz+CNsOZ2PTo0+XjgR16GjAFLuivOtd7kWsU+CZEvhtbd+AaCjKcSXoH3wSqRsR7cLvbIpU/Y7bVso+I74yk65yk/5rWtJkCfWJfzj5XqPHKkl/makbft8zS9KpQxQQrSqKTvOHuwP7JfkH9FhMNY8BxAA==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by SN7PR06MB7118.namprd06.prod.outlook.com (2603:10b6:806:10a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Sat, 30 Dec
 2023 05:33:01 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::3fca:a39b:c9d2:c834%2]) with mapi id 15.20.7135.022; Sat, 30 Dec 2023
 05:33:00 +0000
Date: Fri, 29 Dec 2023 23:32:57 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	svv@google.com, biswarupp@google.com, contact@artur-rojek.eu
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID:
 <SN6PR06MB53428DB46DB403B03067B33FA59CA@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
 <ZYJJC-ID4SyHhuuA@google.com>
 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
 <954f6537-15d5-42db-94b5-d148d4942870@redhat.com>
 <0ac9f339380ca3acd76eff065238599f39cde039.camel@crapouillou.net>
 <63ad6de2-8f24-47c1-b00d-588c22f6877f@redhat.com>
 <ZYflxnNC-72vh6De@google.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZYflxnNC-72vh6De@google.com>
X-TMN: [okj5nUUp7okNdSUtA8ZMGbvpu7XYacoN]
X-ClientProxiedBy: SA9PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:806:20::18) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <ZY+rie2DrsEVpkMB@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|SN7PR06MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 884abc19-dfa3-4b5c-c0d1-08dc08f8c906
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sWogBrxR12+B/dDuW1uDMphq0wpUt2Ko6ccUi7yg4BJMUZ8D8Z0fIqQaHjn1jX0rphzbKdgl9YO3S0/NKcF6BpYAyOcXjBgq6dTxxvedFtkRLPTTlJWsxYm9kQr02vWfKOtN29lzYX+D35Gp210ahWwNsxIFPmiyTmtiQ2X+/BXloo9mcRsuf0ZXcMt1UH+GLhz+AOcBzdgH5OpKjuvOyxpNUijo8ia1HJR8B659VOmf2pU8wxiYsidh8HpVsw4vY0ggw5rB96RDGuV9GEzYxnaDE5i/pSVjee5MYtluUuyRNBlf98zZPvVladSRzf0Bv/JoueyimakpXuCPUnb43Haik9Cq7vTkKVjhtyLlCntctkDKJNN6c2GbHwZK9iog2Zwru+dfED1IcdIk00WxMdRdYXUDb6NNlDnLwXjErj9ewzwpvw8Z1VlM47Ltk4TNrHuulFYUikqICGBHrw/vkgQmsF312klqmhY2pgUnN0hZm7b2b1xrDwejzv7SnPr28kVL2KHcQ3b1yE/O7hcyuiX26PiUjh6WcXpwxG3EPzbr5svkCJmE8i7S9LEP9VLM
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?yPFw+7joG8BMU4LJBxG0WaKF8XymPhUEjN8o7cMz9+3790oV0Ie3/Sgykt?=
 =?iso-8859-1?Q?CGJxjaUg6qWILvbs44NsGYnyoDeWXZVGaAFjTvxZ+xv6pBNdNPAPZMxB0B?=
 =?iso-8859-1?Q?T+11SKNn4TRoPRJ0v86WhQEmmXsCYve9Fxylbrv21Q4yIp8tLhzgsmbcaq?=
 =?iso-8859-1?Q?1coO6QQkt5yos/u40BrknWGqjZ9CpQ4BJStyGLfK9fSVb40VGpmUbL4qaR?=
 =?iso-8859-1?Q?lOm3HmP7mRhPe4mbcd0pf5j77TaPnhxgWuYQI39T2FWexzgAgcw1txGeXF?=
 =?iso-8859-1?Q?2Ijc019qZ5QGovlvMbnKIyJPEhNoQr0b4XxTvU4DDLMGWR0gCDTTEDhha9?=
 =?iso-8859-1?Q?faL+CIqoo2oTW6RXFs0PC3sGE/w+4+Mm2+nt5RqGkpgzFRq8ol95EE/2Qm?=
 =?iso-8859-1?Q?1ydTHwkZZ5W8t/ne4IjQ9sCjIzm0vDEZ3ADD102pSeg27DLoX8pzeIBHH2?=
 =?iso-8859-1?Q?tK5Q3pU6HBHO4OFpCNHPaPu4IucLh3DqV311vF51bGfqSdkFoya57hUXmo?=
 =?iso-8859-1?Q?w2udAIfrYI7nV7tmYtzsS8QEwGXt+XNQjf0ouo/6MzjLr7a79aQTP1z++B?=
 =?iso-8859-1?Q?4j07lUzXEU5NxqkdIouis9/ADazLD3J5ecvF0HA/zyq8IeajisdDlpU3LC?=
 =?iso-8859-1?Q?9LHcCGRrsUpIeJq2H8XlGQxSPtcucC3cg9fQdIRggbJPI2yztN4Aoxht/9?=
 =?iso-8859-1?Q?CVzDO3d24w8s4ivI6JhBDBa6rGCQYa4EvpRIPfXIWFMJJrHRcEfmcenRXP?=
 =?iso-8859-1?Q?rG0DGOupCXiVPqtSrUoHt8CvrrGy98ZZTnH34R0srifVLnIKfVzUnuvKE9?=
 =?iso-8859-1?Q?cf7Q49pRjZiUQNSEOzQ/7E8oq+1oPwXK8scC2crsr0X2mb27yHwx6oAN2T?=
 =?iso-8859-1?Q?ukMVl196Fg4ucVoDQ3PkYzDNYI071HGPpwzhsg8m549WukXWqQycdrZ+YE?=
 =?iso-8859-1?Q?rmKVAU9rl1w6NRmaMGdNcwYevjbxQcvWYWjlHnGYKDZ5Njof59a03R6mpF?=
 =?iso-8859-1?Q?DjyQQTJIQGf+vYPOlrK/WjZrFyfSsTg314GOFLcgkt3O7dIcuMU/QQVRLN?=
 =?iso-8859-1?Q?fVNwv4qRCcJRqt/tFkBRT9VH4SwrCjctfmwgPNiqrUWxZEB8RCUTpznRSQ?=
 =?iso-8859-1?Q?24PxGfTChOsm0uM9A7wz4KG7415OGup7/cfwRzQKuUEodlXefHhlRdJdFc?=
 =?iso-8859-1?Q?N8Vxs4a7JZ8A6lMcORIRCkvsgZYixJ6umoqw80B5k8WBwQ14KWrDubq+YT?=
 =?iso-8859-1?Q?kv7lIN/7StDYWt0VA4cXFrVv26obD4xWCYxUebrO4=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 884abc19-dfa3-4b5c-c0d1-08dc08f8c906
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2023 05:33:00.8532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR06MB7118

On Sun, Dec 24, 2023 at 12:03:18AM -0800, Dmitry Torokhov wrote:
> On Sat, Dec 23, 2023 at 04:16:46PM +0100, Hans de Goede wrote:
> > Hi,
> > 
> > On 12/23/23 16:01, Paul Cercueil wrote:
> > > Hi Hans,
> > > 
> > > Le samedi 23 décembre 2023 à 15:29 +0100, Hans de Goede a écrit :
> > >> Hi Paul,
> > >>
> > >> On 12/20/23 14:39, Paul Cercueil wrote:
> > >>> Hi Dmitry,
> > >>>
> > >>> Le mardi 19 décembre 2023 à 17:53 -0800, Dmitry Torokhov a écrit :
> > >>>> Hi Paul,
> > >>>>
> > >>>> On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
> > >>>>> Hi Peter,
> > >>>>>
> > >>>>> Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a
> > >>>>> écrit :
> > >>>>>> On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> > >>>>>>> From: Chris Morgan <macromorgan@hotmail.com>
> > >>>>>>>
> > >>>>>>> Stop checking if the minimum abs value is greater than the
> > >>>>>>> maximum
> > >>>>>>> abs
> > >>>>>>> value. When the axis is inverted this condition is allowed.
> > >>>>>>> Without
> > >>>>>>> relaxing this check, it is not possible to use uinput on
> > >>>>>>> devices in
> > >>>>>>> userspace with an inverted axis, such as the adc-joystick
> > >>>>>>> found
> > >>>>>>> on
> > >>>>>>> many handheld gaming devices.
> > >>>>>>
> > >>>>>> As mentioned in the other thread [1] a fair bit of userspace
> > >>>>>> relies
> > >>>>>> on
> > >>>>>> that general assumption so removing it will likely cause all
> > >>>>>> sorts of
> > >>>>>> issues.
> > >>>>>
> > >>>>> There is some userspace that works with it though, so why
> > >>>>> restrict
> > >>>>> it
> > >>>>> artificially?
> > >>>>>
> > >>>>> The fact that some other userspace code wouldn't work with it
> > >>>>> sounds a
> > >>>>> bit irrelevant. They just never encountered that min>max usage
> > >>>>> before.
> > >>>>>
> > >>>>> And removing this check won't cause all sort of issues, why
> > >>>>> would
> > >>>>> it?
> > >>>>> It's not like the current software actively probes min>max and
> > >>>>> crash
> > >>>>> badly if it doesn't return -EINVAL...
> > >>>>
> > >>>> It will cause weird movements because calculations expect min be
> > >>>> the
> > >>>> minimum, and max the maximum, and not encode left/right or
> > >>>> up/down.
> > >>>> Putting this into adc joystick binding was a mistake.
> > >>>
> > >>> I don't see why it was a mistake, it's only one of the ways to
> > >>> specify
> > >>> that the axis is inverted. This information is between the firmware
> > >>> (DT) and the kernel, that doesn't mean the information has to be
> > >>> relayed as-is to the userspace.
> > >>>
> > >>> Unlike what you wrote in your other answer, when talking about
> > >>> input
> > >>> the kernel doesn't really normalize anything - it gives you the
> > >>> min/max
> > >>> values, and the raw samples, not normalized samples (they don't get
> > >>> translated to a pre-specified range, or even clamped).
> > >>>
> > >>> I don't really like the idea of having the driver tamper with the
> > >>> samples, but if the specification really is that max>min, then it
> > >>> would
> > >>> be up to evdev/joydev (if the individual drivers are allowed
> > >>> min>max)
> > >>> or adc-joystick (if they are not) to process the samples.
> > >>
> > >> I don't see why a driver, especially a userspace driver which
> > >> then injects things back into the kernel using uinput, would
> > >> not take care of inverting the samples itself and then just
> > >> present userspace with normalized data where min is simply 0
> > >> (as result of normalization as part of inversion) and
> > >> max is (original_max - original_min).
> > > 
> > > Yes, I totally agree.
> > > 
> > > What I was saying is, as Chris is only "piping" events from adc-
> > > joystick into uinput, that the problem is more that evdev/joydev don't
> > > handle axis inversion and provide min>max values that most of the
> > > userspace (and some kernel drivers e.g. uinput) don't support.
> > 
> > Ah I see, that sounds like a joydev adc-joystick / driver bug
> > to me then.
> 
> joydev/mousedev/evdev are simply consumers of events coming from the
> drivers that handle hardware. Even though they reside in the kernel,
> they still consumers of events, much like userspace is, and they operate
> under the same assumption that if min and max are specified then max is
> not less than min.
> 
> We always had HW drivers invert the axis to match our coordinate system
> (for absolute coordinates 0,0 is in the lower left corner, for relative
> right and up are positive and left and down are negative). You can see
> that in psmouse (psmouse_report_standard_motion) and synaptics drivers,
> one of the earliest in the kernel.
> 
> The rest of the stack operates under this assumption.
> 
> > 
> > >> Note that this is exactly what is being done for touchscreens,
> > >> where having the touchscreen mounted e.g. upside-down is
> > >> a long standing issue and this is thus also a long solved issue,
> > >> see: drivers/input/touchscreen.c which contains generic
> > >> code for parsing device-properties including swapped / inverted
> > >> axis as well as generic code for reporting the position to the
> > >> input core, where the helpers from drivers/input/touchscreen.c
> > >> take care of the swap + invert including normalization when
> > >> doing inversion.
> > >>
> > >> Specifically this contains in touchscreen_parse_properties() :
> > >>
> > >>         prop->max_x = input_abs_get_max(input, axis_x);
> > >>         prop->max_y = input_abs_get_max(input, axis_y);
> > >>
> > >>         if (prop->invert_x) {
> > >>                 absinfo = &input->absinfo[axis_x];
> > >>                 absinfo->maximum -= absinfo->minimum;
> > >>                 absinfo->minimum = 0;
> > >>         }
> > >>
> > >>         if (prop->invert_y) {
> > >>                 absinfo = &input->absinfo[axis_y];
> > >>                 absinfo->maximum -= absinfo->minimum;
> > >>                 absinfo->minimum = 0;
> > >>         }
> > >>
> > >> and then when reporting touches:
> > >>
> > >> void touchscreen_report_pos(struct input_dev *input,
> > >>                             const struct touchscreen_properties
> > >> *prop,
> > >>                             unsigned int x, unsigned int y,
> > >>                             bool multitouch)
> > >> {
> > >>         if (prop->invert_x)
> > >>                 x = prop->max_x - x;
> > >>
> > >>         if (prop->invert_y)
> > >>                 y = prop->max_y - y;
> > >>
> > >>         if (prop->swap_x_y)
> > >>                 swap(x, y);
> > >>
> > >>         input_report_abs(input, multitouch ? ABS_MT_POSITION_X :
> > >> ABS_X, x);
> > >>         input_report_abs(input, multitouch ? ABS_MT_POSITION_Y :
> > >> ABS_Y, y);
> > >> }
> > >>
> > >> One of the tasks of a driver / the kernel is to provide some
> > >> level of hardware abstraction to isolate userspace from
> > >> hw details. IMHO taking care of the axis-inversion for userspace
> > >> with something like the above is part of the kernels' HAL task.
> > > 
> > > Totally agree, but this is not done anywhere, is it? evdev seems to
> > > just pass the hardware values alongside some basic meta-data (min/max
> > > values, fuzz etc.), it does not tamper with the data. Should evdev
> > > handle axis inversion? Should it be in adc-joystick (and every other
> > > driver that needs that) instead?
> > 
> > For touchcreens we have chosen to have a set of generic helpers
> > and then make using those helpers the responsibility of the driver.
> > 
> > Part of the reason for doing this is because some touchscreen drivers
> > already were doing axis inversion inside the driver triggering on
> > things like e.g. DMI matches, or maybe custom pre standardization
> > device properties, etc.
> > 
> > So the decision was made to add a set of helpers and convert drivers
> > one by one. Where drivers can e.g. still set prop->invert_x manually,
> > but then they also need to take care of the min/max adjustments
> > manually (min is typically 0 for touchscreens though).
> > 
> > I expect that there will also be enough existing special handling
> > in the joystick code that piece-meal conversion using helpers
> > is likely best.
> 
> Not only touchscreens and joysticks. As I mentioned, PS/2 mice have
> their reported relative Y motion inverted since forever, touchpads like
> Synaptics or Elan invert Y axis as well, and so on.
> 
> > 
> > With that said having axis inversion support in the evdev core
> > does sound interesting, but that means also storing the max-value
> > inside the core for abs axis and this will likely be a big
> > change / lots of work.
> 
> evdev is not the only consumer, so if anything it should be in the input
> core, but there are enough quirks that I think touchscreen helpers are
> the best, at least for now.
> 
> Thanks.

I feel like what I've seen here leads me to believe that we should
handle it in the driver. The only other *thing* I've seen that's
leading me to my solution is that it should theoretically be possible
for a joystick to have negative values (every place I check shows
int or s32 or something). I do see the way the touchscreen handles it
in touchscreen_parse_properties() and touchscreen_apply_prop_to_x_y()
and I was thinking there might be a better way to do it.

I'm under the assumption (still new, sorry) that I can't simply modify
an existing struct since userspace relies heavily on it and we can't
modify userspace... specifically by adding a bool to the input_absinfo.
So that said I was thinking we should add a helper to the input.c
that inverts an abs when requested by taking the absmin, absmax, and
value, then inverting it by doing ((absmax + absmin) - value). By doing
it this way we should be able to invert the values correctly, even when
dealing with negatives... With this example ((1023 + 15) - 15) would
give me 1023 which is what I would expect the inverted value to be, and
((1023 + -1023) - -1023) should give me 1023 which is again what I
would expect the inverse of -1023 to be in this case. We'll leave it up
to the individual driver to actually track the inverted status and to
apply inversion as necessary.

If you think this is the best course I'll add a helper to the input.c
function and then make use of it in the adc-joystick.c for both
polled and non-polled cases.

Thank you,
Chris

> 
> -- 
> Dmitry

