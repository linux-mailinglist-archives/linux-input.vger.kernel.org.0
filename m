Return-Path: <linux-input+bounces-2376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6223A87BFB0
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 16:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85DAB1C21C89
	for <lists+linux-input@lfdr.de>; Thu, 14 Mar 2024 15:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DBA7174D;
	Thu, 14 Mar 2024 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="aifjkeqs"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2138.outbound.protection.outlook.com [40.107.220.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC4D58104;
	Thu, 14 Mar 2024 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429378; cv=fail; b=TFT31rlhpDFnpD1H/piqyA7oyA/vj2DYTaqiTKo+a/vV/N6m3ikd5fdp54jEdc2hf3ZH5cz2q+NhS4SlvyVEdnr8nvKsFata1Pfdf/OSxRcKOtuiAiAEOVEh4o8JQd/lBsU7rwmZ0mxLuqhVKEKAeFDVFFZWtpOComG/10ApD9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429378; c=relaxed/simple;
	bh=vqPDNlKSwo9X77IRSEkc9xR/EVZZvvR8h6/ClawJPT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ae0jk7yTMZy4rOf4/BLxR4IpljFkz8mNI0/1fk/hwIFt66ZYqWl5UiN9TlhwUpvpek+/UAFAw8ykxZMzGZzvoQ0sdqsfiZF2yV6+UOEb7GkDjgtoc7sRryntOaDamBOf8dvMSIHkrLNLS+jeUgzUrUmgOD5Ealqhc5lG4XpO6bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=aifjkeqs; arc=fail smtp.client-ip=40.107.220.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ED2muHYt/BAu4a1bZxn2XWs3wE1jNL9X731Zg/AgpmOeponzg6OzwV8F/n3BVq/t/uqGD74BUkFUvQJkKhmoRe4pv0lpovqv6nsItiQ9xN/aykb9PJcuDWmAIKh1Fmfs6J1pPBWNPm5yfSAOtrQowVXIxYvwafdEirq2jdZzUSFcdZwp7oSUmZtr+0/3a8iN8WeLXugRE43Lr9/btJ5Y9Hjs9G6qNsuLSmxak9W/8s8rZ6PIetQguTCnuFO2t2OplX7GxZX+7UJE2q1czcqdIzDHUiYEeSJ/Q4Vwg/aTpK8Ja7M/o3P2VDwisV6V/6bVz+kWl57m02vz3dIcOBRG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my+GW2Cw42Cbzy7uQiGb6Gx3Qo3ZP6Wi5dAXEDus0e0=;
 b=MDj8P4V8oxQvEO1qLxMRnSmOIjHqv5VZl4BgQ3k7x59US6glg13y2PoyGygFVE0eLkzYZEP/1Q0cxGZeL79YmzFbVOxECOIPsKz91nAUuSHxvGyVg1dmdhxgLUmHil38plIWfwyP2WMJpnhNjGnN/l5OQVaQJ3sCjoI2Qexb0u9qztTsm6sMB7N2uJrfOQvC3UcvwFLemG6E4W5gug1rRIjPvHdbyWDSWqH3Nl5lngxRtSzw4vdP7IgKwIfsr6RHosRQoJY0DHsp3hhJkZ9B3fp7yqKho6a/KhiBSmb5Cu/0z9SmHqQxxp7fcfsRgEB2YnXo8fSY0yqpAJZgNlvwjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my+GW2Cw42Cbzy7uQiGb6Gx3Qo3ZP6Wi5dAXEDus0e0=;
 b=aifjkeqsOwc7wDrZ/VslARA04H5HTIEOddZo+jjx7Ol9H/XnFIWC3iyg1MiPChaLVkUQZeySAMXFTdkhkNAezTYps4t8CA6mCb7asZDgQipf3y+X9whOKMDwSh77h8gc50giliHMUR71Dq7CA37aBCIdPiJ7VOd4vkh16z2Z/bY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CH3PR08MB9256.namprd08.prod.outlook.com
 (2603:10b6:610:1cb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Thu, 14 Mar
 2024 15:16:12 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::bea5:3186:8a9f:52a%7]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 15:16:11 +0000
Date: Thu, 14 Mar 2024 10:15:58 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <ZfMUrs0iAKsgqrEP@nixie71>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-4-jogletre@opensource.cirrus.com>
 <Ze5E1KxRltUTX4R6@nixie71>
 <Ze7dXdVdZKN5Kmv/@ediswmail9.ad.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ze7dXdVdZKN5Kmv/@ediswmail9.ad.cirrus.com>
X-ClientProxiedBy: DM5PR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:4:ae::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CH3PR08MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: 94750fc9-068d-4988-7ce3-08dc4439aedf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dLA4Ya/uGm3jWsGPrn73tAk7fMjiqyD6ClI1hPZ64m1Bq9LLnDGvlW5v8CttaG1xGthSLvIwcTpk6MXxX0LyYGV3Wrd0Et6kvdHrpYmmGM4alMsrxz575gTH1B7UUQJ2nnkzcYAIjAx7BRkKj9rfzd+q5ptlDfcfyyxuXTbswIvvU8a1yMLvZdPRz1E91QzcQQaXh6iC5gQf2uQvDHMaoMfhL9Se3siQ5vM/lakzxy31/DUJ55rCjCMcYDOPANEQQadJlRAwYhKhWB7gWiMNKERSVABh6tPDsR9zO4IkiTnI1zHdENjxFukuFtS0bBWl0NCvbMuzcNplTL6myYoetbvpIN4UHcnFV/wbHHpGlVzHgtLwtVMwvrcn2Yisb2RAZXFYh3is4F7fR1H8OrzX/NzUXEO8YTSxLe+oillsk/87G9asqwwNQ9HI1G/mg5q6jbzk/xbFeuv3nscSB7QS+CXzn0ikTDjTb2TNt2k+rDMDMILXLuN5M1+C1YzU7rKXxzW8uGSUvvzvqIOogl0kEqEi1jjMspLG9b2zimkZ/oPg6lDZEz6kcpBpeT+j6B4vUWxjpgP2m+vYrseCRmnvxkGQAcS4MkKiY36AK5BVL4KZtLdMkAHjcovjQnLMClnJ54TPRYIFoeqckjuuGexsJ1x7wD3mkVqCXMyFMV4th9Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5XpaqX/GJZSzNKLCCrGn0s1q759edLG7/lLVZkuLXNXdz/aBJIbVkk8YeccM?=
 =?us-ascii?Q?wr1XeIMKb7GsL7Ur//95KASLdQ3z0E1uCBaVdG5CmYAH4HV7ueC8lPe9BWIz?=
 =?us-ascii?Q?gQ9dXj1/XmWP45ol1wkagx0e8V/8kXJgr1KVM/L48BE2DNG0DuKCH3RiFe4F?=
 =?us-ascii?Q?Pox3j9nwP2J+mcdE/TXA7ODfucGefbs2x/TG0Nbyxts8uwe+4oDoiZG7FKsx?=
 =?us-ascii?Q?2zQtLvyO6m4Y0agBkgyOi6VwbQ6ceylS8yFpb5FYn0yAjdwBp0ep3Kq3hRXL?=
 =?us-ascii?Q?RwbwoXb3o9nxgnyosos0C/IEdkhmJ7VO37146p5CNRHpYIpON6TytwTeBwt5?=
 =?us-ascii?Q?w0H0kgEzR46t5AoY6xjmO5dQOLvk7qJcrmx2COf6gFOk2ctzfNZrMp1OjIDT?=
 =?us-ascii?Q?L9Yw49LQaNZI7XQv3yWlo1LEfbvATpt/YTYUkLeOX9ec1sn/EKd4cONM65O7?=
 =?us-ascii?Q?/AtHkVKwAmiOedrwdMQRSO1t1KfKhndPF/2wj15gwYJaecBboenHhCnqjwV1?=
 =?us-ascii?Q?r+YmNhD1aegHnghE7vfWyW5QHCRRuUW4PANedUpxbk2RiFRS3ztUsF+RPVNx?=
 =?us-ascii?Q?HfmZjZEaVOM+u8lyxBre4Eeb+FsiViAFbSOr5syRksqgtiI1XKIwpje1pG0Z?=
 =?us-ascii?Q?WnqrUSluSiHhjEyE5BqadsWg6eqmod4+m7cYCs76jqZ6ce/oooaHnjcCOiXY?=
 =?us-ascii?Q?Qq+rbmVRKCl19IkcgznvKC3w62AJXOkkkyVdLlTpVBATBgqyznTD/u1HvsEZ?=
 =?us-ascii?Q?PbPT1zpLHxf4NfZhhZH/C1mvEXy9c5vC0pxs/dKNjjvnB2jIGgWgntD1nPuC?=
 =?us-ascii?Q?GnEaTIggH7bKkvNPHVtW+Bwe+LhjWenz8iIiEBiO5jmnx7IdMUMO4zeC+vJh?=
 =?us-ascii?Q?4OhUXw3iRv9BoKO0uG571T0ZQrmfz2cDn1nkgiWV0Pxyz0AIpx/FeVQDYIW9?=
 =?us-ascii?Q?bKQ7zLwMJwkir+RbFYHnNzrtJzV5K9GpTdhUMU5EonB2uaYLeUxI+Ypyk6Or?=
 =?us-ascii?Q?wnz1WQzkZgMoDivMM8E/71VX7NrK+kvMCFHBs6cP/o3R/E2E4UAeRrXZ1aFF?=
 =?us-ascii?Q?daXYaMJBOdKDRJtM0hYu15fYy3iAka4AeMcmiWCaM4kcD6IeKxIIQHB1L2Xd?=
 =?us-ascii?Q?aP/l+QRnSJQtd37C9+0U2TixQbwIR12sxkI6am66/daXNdqxdcevsn7ho0j7?=
 =?us-ascii?Q?5q2eyJjshCWu9KLkIblF81ISxOZtumU2An0wTdV8Q3YplXXHly8LrGUShhN8?=
 =?us-ascii?Q?MD3YPLwSTsRfsiwyzfbCiEXDyyYoeQGHusSRfA02dEU6PH3jByScwJRtUXHV?=
 =?us-ascii?Q?pMVzZXEMoY1c9h+1BRhiDcqdZzhY1+uWgGj5BYkSLUOGc0oN5ydl/wH2Dtgm?=
 =?us-ascii?Q?rlIlCtEM7hcGaeSUT/EO3kQMagwvH+HZt49CmKtS7wgh/0vXlPqWX+Ik7mfc?=
 =?us-ascii?Q?N/yyv536HvCQ0eCE1y2t7HQogURuAbr/uVzt1zRp1kMkgKQ2JuAOSjA68zzW?=
 =?us-ascii?Q?iWxv52vHonugDjU7noFcXzYQbYkPMh3rJg3gjOQfYq1Z3cvWQaOvU3eFt7tv?=
 =?us-ascii?Q?alg5whR64rRh3RVHdrEcyG3JDQBmBEXP7RV0ZZTG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94750fc9-068d-4988-7ce3-08dc4439aedf
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 15:16:11.8872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEFXPFYcg7/vsAeVWQO5/eLH1MgfA4GrqhDToQR5qwRRBYoD4aITiPnNiHgf0I2oxMB9aIy3pZEy1KAPfZKkpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9256

Hi Charles,

On Mon, Mar 11, 2024 at 10:30:53AM +0000, Charles Keepax wrote:
> On Sun, Mar 10, 2024 at 06:40:04PM -0500, Jeff LaBundy wrote:
> > On Fri, Mar 08, 2024 at 10:24:19PM +0000, James Ogletree wrote:
> > > +static void cs40l50_start_dsp(const struct firmware *bin, void *context)
> > > +{
> > > +	struct cs40l50 *cs40l50 = context;
> > > +	int err;
> > > +
> > > +	/* Wavetable is optional; start DSP regardless */
> > > +	cs40l50->bin = bin;
> > > +
> > > +	mutex_lock(&cs40l50->lock);
> > 
> > It seems the mutex is used only to prevent interrupt handling while the DSP
> > is being configured; can't we just call disable_irq() and enable_irq() here?
> > 
> 
> The trouble with diabling the IRQ is it masks the IRQ line. That
> means if the IRQ is shared with other devices you will be
> silencing their IRQs for the duration as well, which is slightly
> rude. Especially given the driver requests the IRQ with the
> SHARED flag I would be inclinded to stick with the mutex unless
> there are other reasons not to.

Ah, yes; I see we're using IRQF_SHARED here. Shared interrupts seem
like they made more sense for L+R audio amplifiers, and less for a
haptic driver; but if customers are indeed sharing this interrupt,
then the mutex is OK.

> 
> > > +static int cs40l50_irq_init(struct cs40l50 *cs40l50)
> > > +{
> > > +	struct device *dev = cs40l50->dev;
> > > +	int err, i, virq;
> > > +
> > > +	err = devm_regmap_add_irq_chip(dev, cs40l50->regmap, cs40l50->irq,
> > > +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> > > +				       &cs40l50_irq_chip, &cs40l50->irq_data);
> > > +	if (err) {
> > > +		dev_err(dev, "Failed adding IRQ chip\n");
> > 
> > I don't see any need for individual prints in this function, since the call
> > to cs40l50_irq_init() is already followed by a call to dev_err_probe().
> 
> I would probably suggest keeping these individual prints here and
> removing the one in cs40l50_probe, it is nicer to know exactly
> what failed when something goes wrong. That said at least the
> devm_request_threaded_irq can probe defer so that print should be
> a dev_err_probe since this function is only called on the probe
> path.

Makes sense to me.

> 
> > > +	dev_info(cs40l50->dev, "Cirrus Logic CS40L50 rev. %02X\n", cs40l50->revid);
> > 
> > This should be dev_dbg().
> > 
> 
> Not sure what the concenus is on this, but personally I greatly
> prefer these device ID prints being infos. Nice to always have
> some indication of the device and its version.

Right, but every other silicon vendor feels the same way too, and many
customers' dmesg is typically quite messy for the first couple minutes.
This is only one print, but my stance is that this type of information
belongs in debugfs; in fact for this case, we can get this information
from regmap if we know what we're looking for.

> 
> Thanks,
> Charles

Kind regards,
Jeff LaBundy

