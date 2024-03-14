Return-Path: <linux-input+bounces-2374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C2D87BF1C
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 15:40:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0E21C22E18
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA77B5D756;
	Thu, 14 Mar 2024 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="NeZUVR02"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2128.outbound.protection.outlook.com [40.107.94.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A81A38EB;
	Thu, 14 Mar 2024 14:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710427244; cv=fail; b=uAaQb4Zeu3KhWj+gt3GQWr0zw5xpsoO93KZDbxuFmLnFLb+D8wLlWtaqlI+Tsa0AdiufgNJ6JA2LtYh7o0+V9CGBw0GHgysarMOqg4m+G7qiNLdJGKSHSmLdGh3f8xEdIhpCO21E3MgHI6+K1RnOPEhSK1AKLLaQwi9UTDP+wjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710427244; c=relaxed/simple;
	bh=kmTsDtBpAvAAYqr9b708IPRMakP30Ah9n93/ZXdaU04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DndpRAInzpBWb62C9duIDiAqbkA2CkbKvnMKIxX2jES+kFlkoioEhjoXHxE5ZaxwqbOtBllqGE1EhKOBsL1La8gNyFTqfysq4GOsPXfwDwHbgQB3CjHVgT1Lar/yE4wzbD8WUS6ql2QAfyDNg4o0qUCo+78TTg/4RhN+F6aB+sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=NeZUVR02; arc=fail smtp.client-ip=40.107.94.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m99w8gNzY8P3buk9hXfxGHaJwRwgiaLyOOR0vSeMWQVmZh48HLgXDbYqidaOvEsoK9bYBylWLrhcqj9AeTypqJTUMWiGx2Fx+Fq6hvhNxGnuN/Y3juh9wnfVNWix2mUN12Y+St/jhEbDFqftRzllkid8VYop+hiZzt+57k281Bjn71xe0hUQG+B+bURz5PT8V8SajquKluZtF19oNk3KncCIsIOkXYT1PgD7I2tphIfCwORSMCpoLGl/sFB78kSdey3RjcbjdGtJyBRv8g4QhUYxMpw77tdzqVojfvG7phbuLgTIgM8KWJSXFP/P6+MH27nFQlYk2P/iZ0upQo7B7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmWDMsuBiP/3dqchjd4puyCUzop6W40w9ZALd092E+0=;
 b=S2MmVO7GHhnk0PpD/uoplLhjdPQOHO5185hMIRHgZpsL/CyEBH3Hl1aR5Uzkh4zG3cxziqs4B4l+fa8wHhOwSyCnyAKzv8peoxoMv+AuFNhECqfbEsdZbbtGBBd8QRNlDtY9+9TTf4L6oUkXODaaNKUeZykFX6igc0pAxYtcmiDzw0V3Msix/XchNMhMZDJtJ0mLR5C1QHnNL290WbULR1QPqlUY3O0EEjMRK1EhrzUk/lJiUIumW/VTtWYPl3rIAlH+FZhwzuNa7rQdTS6Y/V6I0lFGpLMBC7szQkYWrnYl84FsIL6VdiglvHJbyerzt2QEGLfHxIAtlrRv4c8WgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmWDMsuBiP/3dqchjd4puyCUzop6W40w9ZALd092E+0=;
 b=NeZUVR02ME8DSkNp4vwh6XfOV0jAo+kUQudkeFDBdHZned8tIhxqzHl1y43cRo2eps6hbH0v3f+L6cUQpTmikZ8vDQWhSxCm8rSwAIHrLQV3MkRfmQlv3mC8SVjflYSmXzMyzo1diaGYqyMdBU0Qrfw0sEVSfTyFz1qdN7W/zBU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DS0PR08MB9595.namprd08.prod.outlook.com
 (2603:10b6:8:1be::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 14:40:38 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 14:40:38 +0000
Date: Thu, 14 Mar 2024 09:40:34 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <ZfMMYm1k7qP7Uqm8@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-2-jogletre@opensource.cirrus.com>
 <Ze4GEKkXoRA/4Sga@nixie71>
 <Ze7ZeY+FTPuk0zyE@ediswmail9.ad.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze7ZeY+FTPuk0zyE@ediswmail9.ad.cirrus.com>
X-ClientProxiedBy: DM6PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:5:335::10) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DS0PR08MB9595:EE_
X-MS-Office365-Filtering-Correlation-Id: 730ae4d4-cb0d-480a-3e9c-08dc4434b6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cSuTBfxkIv//gmMFnGRofDdzB6OE+ZvhXtZasCGS8dKFdadGmdkIOlRfWGW3u6tcoNCXjBCMJwsXrRjI2+tGGA/ZGxP/79uGlTJyC645LQSk5eyK60RLs/+k4TdrBQcYZUgcYZh8CdGCMaVceptvVDRt7f68YGeJttvZRiXTGhsZCsICl4uP180deYurbmc2CN4AEKYKFV5FHOOmrVHl0WlbbWQpY0b8EFwY5dDRv9S1A5CYdOsAm4p10LxUN36/fIJIsZjhZzFX/Hwc5Va9ynwNkJhINhfu40OwOYWyxyVV/bQKpV6AkrQZH+TRfq3icHNHoXMajxzlPzlm3WH5djTB7BIy64usju9jLZWhSoO+NYjHQ4tnVvd+CxQUHu7nhew6hhz/EzrWI0IUBvL3qjqcXWh7DZ0ZjhPKMdfOMGU4nJQQ4RNFMyh2ljGHymTAVJNW9wrg0nP3oYdF1gjgNluSaNIZsxFkqBWJZ5bC2YwbSLTmI/nsP1+1D23SgPvdegGY8wesmOTbIMKLqXSp97b/iCRh77SLz8/WHJmoUN9SmpcM/NMxiYRFTjIX/VgL2gbUUW4NKjS5E+80YGR5YwRKFU4Jy7W1mUHn11rMbHicI+aMKKWNxq6aCPDkRnV604cFmHuWGH3qbLOCgYepqjmly4idoybtvRPNPotNoPg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ls36CSpq6kF0vi4q8WLRU6i3aD3RtjyBCBR/ViEBxO/QX5Nnc/qQL6mnYCm?=
 =?us-ascii?Q?bWDkG0sHNY4s0UCF+WxmbK3aA5USNj2uhTSyPruiOCwgChY0pNOG6uHwulD7?=
 =?us-ascii?Q?wTr8T7egd3BXmOllg4Z+oyd6K8kwD1tyivDCb3nhW1EehPU/u2RQVckmebcc?=
 =?us-ascii?Q?0gyZ5E2Ln6evH7K7395OFbzOGeQerso3TX4WGyxNlW9yiMuCQYVDsdKNYTIE?=
 =?us-ascii?Q?KlQMINlt5XBUXtOh5IC2heUd8MNPcSTg1LHnygcqQBQsozvdoSRfYlRmTLuk?=
 =?us-ascii?Q?YJGNAG//4gbS/canhEFwFcYNLvaHXpbPtfExn6cruCyddnrA+YAVnqfRHwxf?=
 =?us-ascii?Q?xI1DfleJyKN86bgwzGWtghNjYB2VdLLDdJQ5OwCnQ/CtyamKFhjXMAtUjJe/?=
 =?us-ascii?Q?Cmm3rsZ768pZsmrWXGQBWxneRm2WEdC6hRQiPJ/KBUJkibNvykKs5isLmQzt?=
 =?us-ascii?Q?8T8aM1rs932vEhedvUB+L1PjtvC6l8ZvqE3Kvr/fY+xSf/597BppucCQljgg?=
 =?us-ascii?Q?KcNmLn4ublfeUXzJGfiVQujGG2FLCS2Cui/4dxT7HqbSfIxH+wi+gQWw3ZDZ?=
 =?us-ascii?Q?ekWR06LHFVEB93/OWtddPcoDMzFxYVTdzVOGqb0kRjcbzmtZJnZobXvpTIzA?=
 =?us-ascii?Q?8BRmJhtBmNIZYB9UfYwKTppcfb0yPlWbrEd6tPckAUWLEupg9/l0DCaJVv04?=
 =?us-ascii?Q?wB/Gxfrl5ZTrTOzbeFE08PHDOjxu+xw8wWDS3sSpjFYjo0HB6JlIpUEzJfvE?=
 =?us-ascii?Q?wgz5PmgocQadd/dvZg8GTuo1rm50GtAIcWmTvRanF/cgPEJSmbKGRn0Dif+e?=
 =?us-ascii?Q?2geWrYM4OGRU3BAsu3TJedybTF29H8Jcl+ZJy1vbX5SUanTtfPzCAN8lqv3h?=
 =?us-ascii?Q?HjVZCReexFtndqaqRu1mNZW73Yeaciy4JoJ/GY2Rp0fDp5BQH375r8B/PqHW?=
 =?us-ascii?Q?7rrfQrwfrxpee1otbokAOWMM9KNcRLW33NgwXPEa4s4OeiC4KZ+qTED6zjF4?=
 =?us-ascii?Q?q226Bcg7BmXydWGw2OYjaN/osKWeArObEQMkrqYZcuLslJO04TPRVF2fb8u0?=
 =?us-ascii?Q?jZKSTGnAp9k7JJpvkMNBmDXSP/PmHl0g+TfEDtb5b7qZQQCzluBDnOhsV4Xf?=
 =?us-ascii?Q?j3EaxVk5e3SoohyQ5F13Tn7+KB52uwsS8dpl3ZTw15sXWjrMvJqSDygRpMea?=
 =?us-ascii?Q?U+BEeLOsLPsN4Aj/duGdOd2izJ5I+Wg0MDArqEMyfInqsCuLj1YPNpNKZm1Y?=
 =?us-ascii?Q?HlfcFCKrO8YOA10ZecqWM57G/UyrYF92D6HJEIebLr7hkYK++vFgQfXsxrmo?=
 =?us-ascii?Q?89RhbAFoeAExO74yt8qmJAF0U28J8Ag3mc5Tw4N6JNcp9hWUDiT7KctkK8Jq?=
 =?us-ascii?Q?LvHBgoeJFAVhs8M3b3HSkK3UC7YWcG4PC+cBpMEmJXSvNgK5RAqKR0vqa5j8?=
 =?us-ascii?Q?8/7CyFP9xFkyNUD6IoUGOzZ0Ctne1Yo5nPKmx7kgm2NjoEwFHxxS8cHo8A/P?=
 =?us-ascii?Q?FjvW+DrkV6nr5PaVZrYrLQ0DSeKugCu0Ak4XrdKajIKMRSLsr+SHkyUJ4j5v?=
 =?us-ascii?Q?EjbY4LI3jjZdlj3SkWAbX9WJ5HQ8k6GpARhjraht?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 730ae4d4-cb0d-480a-3e9c-08dc4434b6c3
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 14:40:38.2699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LbQ0iR7We7BabhebpM/I0vx1DzNg5d7nRfxAzBzBLNSDzvIePcvopEXPtDmfPCvW4COddR1gGP5cuCP5sVD+jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9595

Hi Charles,

On Mon, Mar 11, 2024 at 10:14:17AM +0000, Charles Keepax wrote:
> On Sun, Mar 10, 2024 at 02:12:16PM -0500, Jeff LaBundy wrote:
> > On Fri, Mar 08, 2024 at 10:24:17PM +0000, James Ogletree wrote:
> > > +	switch (op_code) {
> > > +	case CS_DSP_WSEQ_FULL:
> > > +		cs_dsp_chunk_write(&ch, 32, op_new->address);
> > > +		cs_dsp_chunk_write(&ch, 32, op_new->data);
> > > +		break;
> > > +	case CS_DSP_WSEQ_L16:
> > > +	case CS_DSP_WSEQ_H16:
> > > +		cs_dsp_chunk_write(&ch, 24, op_new->address);
> > > +		cs_dsp_chunk_write(&ch, 16, op_new->data);
> > > +		break;
> > > +	default:
> > > +		ret = -EINVAL;
> > > +		cs_dsp_err(dsp, "Op code not supported: %X\n", op_code);
> > > +		goto op_new_free;
> > 
> > There is no need to drop down and call devm_kfree() here; it's sufficient
> > to simply return -EINVAL. The devres core will free any instances of
> > cs_dsp_wseq_op when the driver is unbound.
> > 
> > I imagine you're calling devm_kfree() to protect against the case where
> > the driver successfully probes, but the contents of the firmware are found
> > to be invalid later. In that case, yes, this newly allocated memory will
> > persist throughout the length of the driver's life.
> > 
> > That's an error condition though; if it happens, the customer will surely
> > remove the module, correct the .wmfw or .bin file, then insert the module
> > again. All we need to do here is make sure that memory does not leak after
> > the module is removed, and device-managed allocation already handles this.
> > 
> 
> I disagree here. This is the write function, there is no guarantee
> this is even called at probe time. This is generic code going
> into the DSP library and will presumably get re-used for different
> purposes and on different parts in the future. Freeing on the error
> path is much safer here.

Agreed that this won't be called during probe; all I mean to say is
that I don't see any issue in hanging on to a bit of memory while the
device is in an error state, before the module is unloaded and devres
unrolls all of the device-managed resources.

It's also perfectly fine to leave this as-is; the existing method is
functionally correct, and I understand the perspective of having the
generic library clean up immediately. If that's the intent however,
the same error handling needs to be applied in cs_dsp_populate_wseq();
currently only cs_dsp_wseq_write() calls devm_kfree() on error. Since
L50 uses asynchronous FW loading, neither are called until after the
device probes.

> 
> > > +int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> > > +			    const struct reg_sequence *reg_seq, int num_regs,
> > > +			    u8 op_code, bool update)
> > > +{
> > > +	int ret, i;
> > > +
> > > +	for (i = 0; i < num_regs; i++) {
> > > +		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
> > > +					reg_seq[i].def, update, op_code);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return 0;
> > 
> > This is absolutely a nit-pick, but in cs_dsp_wseq_init(), you use the pattern
> > of breaking on error and always returning ret; here you return on error. Both
> > are functionally equivalent but it would be nice to be consistent in terms of
> > style.
> > 
> > If you do opt to match cs_dsp_wseq_multi_write() to cs_dsp_wseq_init(), I do
> > think you'll need to initialize ret to zero here as well to avoid a compiler
> > warning for the num_regs = 0 case.
> 
> I would be inclined to make cs_dsp_wseq_init function like this
> one personally, rather than the other way around. Generally best
> to return if there is no clean up to do.

Makes sense to me.

> 
> Thanks,
> Charles

Kind regards,
Jeff LaBundy

