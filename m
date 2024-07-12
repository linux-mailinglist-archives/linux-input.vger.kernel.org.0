Return-Path: <linux-input+bounces-5018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC93930252
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 01:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5B1D1F21D43
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 23:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289E84644E;
	Fri, 12 Jul 2024 23:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="ESsZLmvy"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DC1BC37;
	Fri, 12 Jul 2024 23:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720826242; cv=fail; b=YH05isX+cwpMkI/KUedLTbZzn05qy3oVs1pzV7dwXUwyecQRe9CRf9qtopbzYD4vCYVHMzGOdNVPRid8AqsimoGWVySagsQnYcewbNKPKwkF2CtYvO51YuEhWuc2rfK4PhEBsScHNI+P3MgxgV5I46sDre0oZ0XNa7RtiCuGIYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720826242; c=relaxed/simple;
	bh=lNvSB3dHIGX4UDTk7gGLpq+M6Rlwuj7jBHofwraoQKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OYKQN/5mpkaDotjiFtPhNldIiyco9OXNWWteDRwbEh9l2ftPdljlD+P9fjqJYiODF3aWCEqgf0FON2mhmbV+laTJGdPsabF053jEOxi3YsHRSIoobpq7ejnbCy54q3NeOxDUGrVFDKqLaLWFIMfcy9GSv6vVJze0Wo7XdceWTV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=ESsZLmvy; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHbpPrz4ugjeIcu1AfP3jY5k4HIpYI9GQS4KuQeECsQ0A8NHPnfMI2suwR9qUuTXmz+iGT9mpJXkOMF0exudvmZOpw6AgGSRfqCRx5REa2epo/KcEJiTWNxNCsUrqPSLd2qMUrJWEA58AcVZ8wP1NPndwB5hKOW96vXTNblkpa0F83a13seg70EmMlFnUAAmZX1nlyPi/jjEwNmYSPFPazWyP1M9W+Z2EnEjdM+0j27wktGl0ygQPnG3goBFPJvQDYbcovc2EDnA6A4/XAGUN3nl8T9Qzxenl7xOQH3Sqia+9KBA7H+ulmPQ4/AvjtqIuAT9LjxiZEsB9nmbf1FFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jP3N3tykHpLyh+tGmzPwMJ4qGKI2/dsgkteveP0hac=;
 b=V/cpdJjxKiXLwWjbVwaRbbYTXdpxWY5xsfntsMJBJjC05xgf5QwJ6FYp92G+92+VKeJmStsz0JtSPj9pipLlH5UJLNJ2w1+HSYbUNvGWQtDMu+e+nKemQzeYScB79iNXkmreBfQAUZw0Fqaxit3JEO4+dM/xARBxKbI9GBoIUn7WzG3cOwXTf9LS+LEN/UqcbL68fAiXTS8IzzOaMYxxcNtBqxMXWgH1nBYoBsl4rUMYgI4Wavzv3/1kIcT0ZgSr6h7HnZSSjB+/Y3g/WAEIz5+9/7AvONLdUAuI30Fl9QmTeTLGlpNyjOR6IeGs9KCVJG0yWw3CHxsY18Y9xD2LNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jP3N3tykHpLyh+tGmzPwMJ4qGKI2/dsgkteveP0hac=;
 b=ESsZLmvyvJTlWdwaKXTES0JkedvG5vXTUixEMBmSIer44d27FlN8oN6k1+6/iItPJkTPI0QkOdrunLXbrZeQzSN+JWyuLqRw654YB8lV0XZ2M3Hy8Sniitjo4tROQ/UnthNfDQeYEZji1fRptLMfms407yyNY6HT7hrjJsau8nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Fri, 12 Jul
 2024 23:17:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 23:17:17 +0000
Date: Fri, 12 Jul 2024 19:17:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpG5d1/EsOU4eJEj@lizhi-Precision-Tower-5810>
References: <20240712224352.82190-1-Frank.Li@nxp.com>
 <ZpG2fNQ9-inLN8-Q@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpG2fNQ9-inLN8-Q@google.com>
X-ClientProxiedBy: SN6PR16CA0061.namprd16.prod.outlook.com
 (2603:10b6:805:ca::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: c8790e31-a62b-494d-042d-08dca2c8c561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NNoCRnebI1HUJCJJH7BEDoTJc/AzGaIH6OpN3fqoIh0z4y/DiBihoj9bZ+Fh?=
 =?us-ascii?Q?0RPGlebvvumkV1ZXO8+GjaamsvyvsPIOBglyvrrLpprUVkqVzy3oMi55XYxQ?=
 =?us-ascii?Q?nuib9PP8p3U2twW8wzpynBgl6u27FQ+sZbod2zZAxhg4XzSLze6kaoWeCtYq?=
 =?us-ascii?Q?oeKItgxYgarj3QJhqB7GvKu4FyaZEochN2DvbSvjr7wifoDNMh4IiBODAxpS?=
 =?us-ascii?Q?sROkR06MrjDsH1DBL8o9bcV5aSSo0SzqamROOPoRpe4HOs2519uLNbcnj9kA?=
 =?us-ascii?Q?fpK4VTbNk+0aMF2S0Tl+A9rGIiFnCd8jbAl3wCDTrEPrJficcvEX7SinlWLb?=
 =?us-ascii?Q?bM963CkiHcIrJP3QWZKxgnegmySULoYOiN7kc9rx5sgw8alRwuVVoeQTEMMM?=
 =?us-ascii?Q?yOS/xRLXWXFSJwuvkudKgSmN2bZQCIcU494qR/i8HSS6aqDOzDfoIUSxAnzP?=
 =?us-ascii?Q?OULtqa0KmXjB/pNHav97rCmfHDEBaUrHKZcZes9+gE+K2YBx0ShKXBh691MI?=
 =?us-ascii?Q?XMgKyqwqJ4PARVasQ2xRiUcrxMexh9wqfiiMhp8Bn9mvTFOrByySnXt2KM8c?=
 =?us-ascii?Q?ga6YHBf6mx3mggfJqO/2udR+umiQYI7QezKSUclSHuZ6KCF9jKQ6oHLAbqPw?=
 =?us-ascii?Q?0n22ufjHzP9F2P1AdNnS8YQbj2YdHsv3wN4KzmaO3zHpElvouQ3IFHVUsXHq?=
 =?us-ascii?Q?QJN3qyYg8VW/jobqkdLb3tpS2HL4EOv/Gh3rHHTmOymv+XiZA7beP7fnP16P?=
 =?us-ascii?Q?yKcvbpAUlXgOusCS5utKxUMImJTfQMfT8Pij/FBklVnqSOQkS9NlY/VmMyyC?=
 =?us-ascii?Q?9CgGPGj4f7LVAhO4cLNNIq9ItzqLFAh/xHIsv7lcrk5Yh9sJsUSimcvoHJHT?=
 =?us-ascii?Q?KpMJ8N+D4hCjxBL5oUeFbu6/OXir9DxfJBAciiQ1CJmPxIg6tNMGkvpqnRHS?=
 =?us-ascii?Q?ER5qNAQ1WZFGcS5aw/c2u51jlq5wV0YYY229wSt6IMRxM9Nkh1qKf7CEcoI7?=
 =?us-ascii?Q?ylQKApxPIHCiYT1SCoQxbU3BlQh1cCagUDED32yCLCTaOszl52Cn2osq8RRZ?=
 =?us-ascii?Q?OeMzyZ85LeQnMugrRElzn+xIQvDY/idxN4uoqXdhEzu9uVkt44Z+QcExqyr0?=
 =?us-ascii?Q?v3jI+2IEXG24+uPqxiEMg7lPVrcEwfxt/PiDbXpOiZBEGuDGEwWbNurxWZk6?=
 =?us-ascii?Q?0MqUB4b88nZ1Wz9jWy1TAhR63MdRcz0IvieME+tVeoFmUIyLfz+kfJRHMYoh?=
 =?us-ascii?Q?R+0Wa81AkEM6WDh4ZyKmPL5dP26ooXUnnYW3EODm1BMuakrnzbErg1Op8q+C?=
 =?us-ascii?Q?TZG7UkcDzniW2QqsArJmL6497bIaNMZg6ICMh289PomOoYaQXIoJZI0qICWl?=
 =?us-ascii?Q?IecRCEhkhvDwSbWdDhOWQ7kpaoU0CNaxqJDRUfahk6wOsb6SqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?STjJA4+t4lQo8FztV4P0d6ZOvk1U3ZXmhGhAAhsc9ztQ0aqFTLcCd0rEmQfc?=
 =?us-ascii?Q?EXKNgZTqYqlmzNay48t8h4s+DffcH8/95f5UB92aYyxGTm69+fxXbk6Hd7t1?=
 =?us-ascii?Q?AfT8u0FA10wNg6jg4tp5fUC+yoSAJPh17j/ZlDWwWcUsZkq+MqcOGf3TBReR?=
 =?us-ascii?Q?PYsGd6rDFeGfBX7Vk5MRi3AN9MwW+Pa85vDvuIzQ3Ap8Vuz0LEufYBYTo2U1?=
 =?us-ascii?Q?GRUfRxIdKXxelpkxb+++WkoVTU5qyn2sJRhDLOK0+/nHsX0ry4SHJ8OkWmmC?=
 =?us-ascii?Q?Jhw8mHI0YGHnDv67qM7lioESp3vGkr0JDkdqmSCf69M3/jHhkLoQK7xfC05K?=
 =?us-ascii?Q?7WwKp84eBVG4I6UUasm4G0OM99j+2b8txIiZborvhENYFbvcJi2WJR1ySbvd?=
 =?us-ascii?Q?AAqlmQDH5sGLXSJipjim6k2xBbUudHsh6lEB2sgQ8XeOV4exlj0hPRK0atV8?=
 =?us-ascii?Q?G8fMZ8r7zyMy1VPqsOUBxrjKYS9AAuiSLeyUx/9pmiQPVm0yMlOVTgGoH7wT?=
 =?us-ascii?Q?RjQcpyz9qMVvjNLZBFvjS2bVUPPCOvTw6ninQuKiLkANu8i8XtB2mkMrb3eu?=
 =?us-ascii?Q?Jl7roqt3xaDxJ12agiXfOmRLQeWYNjM7Y2hxGCWc+Xkqfb+D2A/PFByJUSfP?=
 =?us-ascii?Q?8h/lUfyikcPUT2AsSf0TMnGLOLmLSvZk2xjv13mfSCVdKinQYt5RKGWkswci?=
 =?us-ascii?Q?5qwAkhm2Cmk5EIZN93EAnoPiPdXFgi2hm4BPl/dDQXSAb88oaBNvKsqZgdil?=
 =?us-ascii?Q?NMbcqtVm7edfPM4k3q/2j10A7EGOYVqnNtXFUgKWnallqbh3MOw+nif01A+C?=
 =?us-ascii?Q?hl/zOACupQ3h9ax5qjs+OvKGG2ztWXIXOmk2/Djzu0Xu0ggY2V+NmAxlDTBM?=
 =?us-ascii?Q?6yEJqcVyETEdoZz2EaqEzw8ah3uDslyydBqLrPHn0RZVPIaBB7WeYXvjO/D4?=
 =?us-ascii?Q?skSVueZ9slD7aa6SvvHbKnEutcKKOAHLvX08O+ibiu8J4o9bIYvzrhtTWWJu?=
 =?us-ascii?Q?N1Yb/Zcp6AEPMiKPtKZYg86a935O7gO48A6FUown8zNwWdH5SwuZdd9aoXA/?=
 =?us-ascii?Q?wuN6upTzbalexBC61JqULD8HSWvlCfFBylEoVn2K6iZGS5Lyrt56TvphLch8?=
 =?us-ascii?Q?xl501/66fBIy0Cr8DiOFTV7oSJyfCLlfRDe7iNcJH8VDVDRG0Kv2fUggn6Ue?=
 =?us-ascii?Q?69H71GmQpPnol4V3T2vPUmy3FXdl3pQRJU7CLJAH2SXwfavb4FSaTfqwKRNM?=
 =?us-ascii?Q?31se/fOTjeAGLxKKiV11hDalFexQ+Y5S33dEE1CH17Wk8yLdP8UFYb6d9mXl?=
 =?us-ascii?Q?+XGCpNaZU73LHaFM65odzzqV5Tb03A+Ayc9f1xp8n/ZtG8n0nShjpbgUd5pP?=
 =?us-ascii?Q?uwsqGsATc4ampeKfCa4IuUivhQ1Q50cr414yfeTwU3l7pWGDBzdl+DebK+1m?=
 =?us-ascii?Q?Cgc/E5GkqQxFQC+E8Wi1dCmhMl41pV+v1uxhjD2DsOs1//7SVeefgyZZtR2e?=
 =?us-ascii?Q?6MpU5Fxlng0jC1jSjqzCjA++1K41ZPHS9NzUDsUuzXn4lyZYP0wa5/YB+OlC?=
 =?us-ascii?Q?6HixmDvqk0uj1PUpy53KnLoc2y1AivhS6iqWMi4B?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8790e31-a62b-494d-042d-08dca2c8c561
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 23:17:16.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WDncI3ATe2hbvASXbBBIIyqaPCZ8+loqnh6o+O2nktXVxfm9WkpWaejhZtDnx4KJG+fCdQqBjdP06lyiuAUtPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

On Fri, Jul 12, 2024 at 04:04:28PM -0700, Dmitry Torokhov wrote:
> Hi Frank,
> 
> On Fri, Jul 12, 2024 at 06:43:51PM -0400, Frank Li wrote:
> > From: Jacky Bai <ping.bai@nxp.com>
> > 
> > Report input event directly on wakeup to ensure no press event is missed
> > when resuming from suspend.
> > 
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > index 1d99206dd3a8b..9675717ecbdfe 100644
> > --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
> >  	int irq;
> >  	int keycode;
> >  	int keystate;  /* 1:pressed */
> > +	bool suspended;
> >  	struct timer_list check_timer;
> >  	struct input_dev *input;
> >  };
> > @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> >  {
> >  	struct platform_device *pdev = dev_id;
> >  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> > +	struct input_dev *input = bbnsm->input;
> >  	u32 event;
> >  
> >  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> > @@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> >  	mod_timer(&bbnsm->check_timer,
> >  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> >  
> > +	/*
> > +	 * Directly report key event after resume to make sure key press
> > +	 * event is never missed.
> > +	 */
> 
> How do you know that wakeup was caused by the key press on this device?
> As far as I can see the driver requests the interrupt as shared, so we
> could end up in bbnsm_pwrkey_interrupt() even if button was not pressed.
> 

In bbnsm_pwrky_interrupt()
{	...
	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);                                           
        	if (!(event & BBNSM_BTN_OFF))                                                               
                	return IRQ_NONE;

	...
}

If wakeup was not caused by pwr key,  irq will do nothing, code will not
reach to here.

Frank

> Thanks.
> 
> -- 
> Dmitry

