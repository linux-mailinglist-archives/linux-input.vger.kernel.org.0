Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A49645F81D8
	for <lists+linux-input@lfdr.de>; Sat,  8 Oct 2022 03:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiJHBUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Oct 2022 21:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiJHBUl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Oct 2022 21:20:41 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BFE5508B;
        Fri,  7 Oct 2022 18:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=US4VLpXj4NTRkHYjCICtUYPBnjMtwpWekOTNJl7euuHNU0RCZYLuRT1LWRVvQcmcCWIlSTw65Wiwo0dCN4v7KUXaeCHtMTC/thfj21TLNqsPOgfldVGGI2+N+J8UD/inWekHdUabyOOacJcbyKAwEQyVhop+IHzYv1b0IlclHS43ynCaNOuN6dXOQfH0TVoExJmOSKfUijyqHdutSzMfHb2Hp2MwJyqTBzR/7j2V4QxScC6k9MAbK8B1Q/bG1P+9ZXzeP1M0YyzX0YiUbx0EWNalEAzgPnsk0l1oDoTJxfd3WKlGHyUAa9NO3GmHKx7/A43eo2CeTmxcm57eRaLBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIyzRKrutHl/rh9EtY++ek3Z6tVPfqFKDtVDjoMyGvw=;
 b=R51fO6yuvIIcr0zopvt0fRbUWqpDwps6MstTnZHJBmx1g9XAa+VK00YLLwaXekVJKEw/S0MJ3kIvofTKkshyk4bEjNoiCf+vu/HPz8Ed+w0TBTSgIUKng940K+WSV/reAYsZljt8pfb0zZ5xWtYcp+z9DGHMf3Mb839fCEs5lNBgvetud7K1+BToFpwCx7puj6PktJoPZI6gkGxR6XzON0D9MPJ/EWWBkk4r9mKfvnQoFX63QbOFwBd1eSwrXY+ZP7jaeUIxjMyIo/cQkRDznglVo8A6ezNdt19+TbJ9CK+78P95ABWs52nuKF3u/Jg39CqvG+Wl0eIY5LJf+Qming==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIyzRKrutHl/rh9EtY++ek3Z6tVPfqFKDtVDjoMyGvw=;
 b=0K1X962VBTmFUKNbKCOGiSnMWnnpLdeVQgHsJWktRiaJuL2O8EMxzBD91uhJD0HrBfgdNxT3BidpJvJVzo5I1K1Tses1TnEcAeHdHpOuKhq4n1Ko8WDrLj1G14GqZwyUDXiQoxzEkFVd+BL+dAfEdM1hP+ogUexod6IxE143kWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CY4PR08MB2440.namprd08.prod.outlook.com
 (2603:10b6:903:44::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 8 Oct
 2022 01:20:36 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5676.028; Sat, 8 Oct 2022
 01:20:36 +0000
Date:   Fri, 7 Oct 2022 20:20:33 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/7] Input: iqs7222 - report malformed properties
Message-ID: <Y0DQYUnGYo4Wfl7w@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
 <YyP8GaYqdwVUNzPe@nixie71>
 <87o7un7p72.fsf@mkorpershoek-xps-13-9370.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7un7p72.fsf@mkorpershoek-xps-13-9370.home>
X-ClientProxiedBy: DM6PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:5:134::34) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CY4PR08MB2440:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a8e837a-09ab-4547-38a5-08daa8cb4dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6s+Kzg8WJm2tAQXxB8RF2QYyqMVpBuvBJJ2hi7H0XAL0eBXXansfJYj1GF/DLHlcL6IBNc98P8kqVTEaTmn2hyA36AQ4N/Py0AD+WaW1a/8NmD02cYfEQvtSNZ9DnP7pPwgbojvMIWI2y5OIpjglbmlofSpZL/On1qe2bE/3HvnTMLpkTwQNEFx19e3SsZz8lnjMrpJLvUSGwkLENlCn1Zlriur9RRUsx4WFsPtoWK8HkZuLKUvO24Naor798Lru5HUfRHiqRE1PkQGhwVew9aw+aJc20VWBZeszininH1TqEguLFXOH7rozqcoKwo3VdRy8NwVtxep0hiyGISGhTVJYBsxe5CRahG4JoWHhcYB2o0mWbXvvk4GN3yf1O/yk+qgrrn+J7PdQevqwSH3/1zV77IY0bctgbmZsIdGFQa27f0f3Q1z6narYp6EnRRqgHUuRaEk/WVzWjH/ZjtIPkwNfwqO3XVqvVuvkm44VhZQfEcvjAbRd5Q+Gmf4Dey7foLI+b1Rhi3/0KHJo9oGae4SOBlgXytKhxM4Q33eq5tHfIHDS1zu61SLIZmSlFsYhUp/Lf/TQb/raLH4lLIKASBopTFlznDUze1FN0/MPaA20FvjMz4YQF5BYMz0FqinLxBbiCdiCa+aK4Gix17RlOGjUeJjgzOyLoMuKyR8jkJ4rGBy7yF801bD4qa0AJGDIDQtSJd3mEshBbzc9rQUF0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(396003)(39830400003)(376002)(136003)(346002)(451199015)(316002)(6486002)(478600001)(6666004)(66476007)(66556008)(6916009)(4326008)(8676002)(66946007)(8936002)(26005)(5660300002)(41300700001)(6506007)(33716001)(9686003)(6512007)(2906002)(186003)(53546011)(83380400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?54NdSDWcyWcGG9qdphp8/7qxjhKFJGNM6vuSwk0JSLb9pKzmK2r/anwXXvoy?=
 =?us-ascii?Q?kdZBYGl/Ebqjx5J2jO5o6nNBosABbeyMkAKLNtgh824garK5qNjC87D9mNgI?=
 =?us-ascii?Q?jU2sjY+uEioZv58bgCYy8kIySgr8O9raBW8s5kIk00RrUnT4qa862/oOi+eD?=
 =?us-ascii?Q?BsMOVz2TCY0ftWs7uenXqQH3muz4Tzd87AIwCuhD1hQg/yhOXjNcHvR/z1T7?=
 =?us-ascii?Q?F779zktaAUpBwD9AEyh3P6/f0mbVp6yTEdh8ssjNRjErRwDny8dgVPtfUftA?=
 =?us-ascii?Q?btWacjy6EYjFl7wvsPDOHg4g20W1YIq9Nx8KGHaifQDa3AFzwUYFFkfoua+G?=
 =?us-ascii?Q?ZfEp7BOFTz8V6GoJomTRKQJ+k8VDsycT2Za0bCL4yEIA5hBNfaVhCCv7xjWa?=
 =?us-ascii?Q?Nw2zAdeyBG0gv5uBjxpkD4olqg+YvYLyD2qIKzdxUNmpSOCNrf0SOvVFaACY?=
 =?us-ascii?Q?rKoCZttBAzEucIsTyZRFfk4mbSFsZVGclECJ2aQI9a4ZapSyE+/tRZwG11he?=
 =?us-ascii?Q?UKXB3MJy27DQwbZskbFIXfTwUb4JiOhlFoanfkbu3PKxevrGP1oNWhvB1TtQ?=
 =?us-ascii?Q?rHmUl0Kklh6iAD912z1sJrYBJ1WMjDyYcmEz8utSefGKqqgI52+OiIBPp7bM?=
 =?us-ascii?Q?mbza9eNPrfRtPVph/4LbukEq7A+ItRyFbbN6Fh/KMG5eaSXsiksBr+mlwA2d?=
 =?us-ascii?Q?BjRrcGtBoqbiOTpW892lrfjzrDoCUmrYQkCC11ws8O79kbXS4+V58RjB+GT2?=
 =?us-ascii?Q?ipUb9TM25A1rodgA4iC0PIgcDwX/NAES16FyhMDFSMfkqY5xqZzaBFc/isg6?=
 =?us-ascii?Q?Cex0Y28Px2SXWAiO1U0mo9p+9ve5c/BTuBhwnTbjkM03WFVVL8MwUrPf7BS5?=
 =?us-ascii?Q?Yy1dqfk/v7HEm7G5ZvmqZL8EJUvpDC9xl7KnFlZafs7BuQCQ7rLy0MjYrMJ5?=
 =?us-ascii?Q?SWtsIncg2Vzv3Kmu4aBiSSzZaRhihUR7L+XO/xSTd9vzkgzz92dnJe5IonKo?=
 =?us-ascii?Q?aWH3HAFU2v7TsH2ThNljUdq0L3T8N6jKbXaKfb0UeLLHHD+Bn0fwGofkSsj9?=
 =?us-ascii?Q?PYs39knUIgJNdxqrHM0HgfacnikGEb+3C9kA2YOHEpmSRr/3aNfvTiwGHhwe?=
 =?us-ascii?Q?fzg7KEjna9M/xbM2qufpdW3PDOZTTSMeR/y5kJMkf/+wGwH0LQ1PxnGLl45C?=
 =?us-ascii?Q?sJoh6PV3evztbOnuha3nYO5dsFkyc4R9SFBE9t39fZScHRrzSgaVDi6SKJx/?=
 =?us-ascii?Q?TtNWqKacXNVsBJ+u5cNevGSszYPf+pu1jvV2LXL2u9pMVtfhgab3Lz4WAOwK?=
 =?us-ascii?Q?lpGimJK80mi1eTKtIWSa+W2ST9nK7UNsMshzStvEg8nCLL6JG1g/dFRti9xW?=
 =?us-ascii?Q?2bG1pNUfSknZmddqAg2qE3M/k8aiPwv/YF1xvG2lLvUTKChfELqOg9ujJC/2?=
 =?us-ascii?Q?o6fHv5o5Ts5Knsq8T0/araMkA0jshO6I3EfWUQS9DN+tydaVciLIlaZJqMfI?=
 =?us-ascii?Q?hfRdVM2jJbjoytLXvAYzndKXPVHK8MdA/PJeJFRfqXYorED0ixcaQ3Ko/q0+?=
 =?us-ascii?Q?5ZRdVmZIYT1unzH+vk6xCSHKld4u443gRdQw+FAC?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8e837a-09ab-4547-38a5-08daa8cb4dcc
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2022 01:20:36.5590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMvZRLu2atmPQxQxResHeNfmWcFD0/X7kUIsAR+2cBTaqeOOwRPDwUzZRLuTrtRmgyz4AEUWv/G0oXx20cbl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR08MB2440
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mattijs,

On Fri, Oct 07, 2022 at 03:12:17PM +0200, Mattijs Korpershoek wrote:
> On Thu, Sep 15, 2022 at 23:31, Jeff LaBundy <jeff@labundy.com> wrote:
> 
> > Nonzero return values of several calls to fwnode_property_read_u32()
> > are silently ignored, leaving no way to know the properties were not
> > applied in the event of an error.
> >
> > Solve this problem by evaluating fwnode_property_read_u32()'s return
> > value, and reporting an error for any nonzero return value not equal
> > to -EINVAL which indicates the property was absent altogether.
> >
> > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> > Changes in v2:
> >  - Used -EINVAL returned by fwnode_property_read_u32() to indicate an absent
> >    optional property as opposed to calling fwnode_property_present()
> >  - Updated commit message
> >
> >  drivers/input/misc/iqs7222.c | 43 +++++++++++++++++++++++++++++-------
> >  1 file changed, 35 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > index d39b3fdfb849..36c3b24e99a3 100644
> > --- a/drivers/input/misc/iqs7222.c
> > +++ b/drivers/input/misc/iqs7222.c
> > @@ -1820,8 +1820,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
> >  		chan_setup[4] = val * 42 + 1048;
> >  
> > -		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> > -					      &val)) {
> > +		error = fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
> > +						 &val);
> > +		if (!error) {
> >  			if (val > U16_MAX) {
> >  				dev_err(&client->dev,
> >  					"Invalid %s reference weight: %u\n",
> > @@ -1830,6 +1831,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  			}
> >  
> >  			chan_setup[5] = val;
> > +		} else if (error != -EINVAL) {
> > +			dev_err(&client->dev,
> > +				"Failed to read %s reference weight: %d\n",
> > +				fwnode_get_name(chan_node), error);
> > +			return error;
> >  		}
> >  
> >  		/*
> > @@ -1902,9 +1908,10 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  		if (!event_node)
> >  			continue;
> >  
> > -		if (!fwnode_property_read_u32(event_node,
> > -					      "azoteq,timeout-press-ms",
> > -					      &val)) {
> > +		error = fwnode_property_read_u32(event_node,
> > +						 "azoteq,timeout-press-ms",
> > +						 &val);
> > +		if (!error) {
> >  			/*
> >  			 * The IQS7222B employs a global pair of press timeout
> >  			 * registers as opposed to channel-specific registers.
> > @@ -1924,6 +1931,11 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  
> >  			*setup &= ~(U8_MAX << i * 8);
> >  			*setup |= (val / 500 << i * 8);
> > +		} else if (error != -EINVAL) {
> > +			dev_err(&client->dev,
> > +				"Failed to read %s press timeout: %d\n",
> > +				fwnode_get_name(event_node), error);
> 
> Shouldn't we call fwnode_handle_put(event_node); here?
> It's what we do in the error path just above (line 2029)

Thank you for your review and for finding this; it's a great catch. I
will send out a v3 after the merge window with this fixed.

> 
> With that added, feel free to include:
> 
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> > +			return error;
> >  		}
> >  
> >  		error = iqs7222_parse_event(iqs7222, event_node, chan_index,
> > @@ -2028,7 +2040,8 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
> >  	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
> >  		sldr_setup[4 + reg_offset] -= 2;
> >  
> > -	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
> > +	error = fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val);
> > +	if (!error) {
> >  		if (!val || val > dev_desc->sldr_res) {
> >  			dev_err(&client->dev, "Invalid %s size: %u\n",
> >  				fwnode_get_name(sldr_node), val);
> > @@ -2042,9 +2055,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
> >  			sldr_setup[2] |= (val / 16 <<
> >  					  IQS7222_SLDR_SETUP_2_RES_SHIFT);
> >  		}
> > +	} else if (error != -EINVAL) {
> > +		dev_err(&client->dev, "Failed to read %s size: %d\n",
> > +			fwnode_get_name(sldr_node), error);
> > +		return error;
> >  	}
> >  
> > -	if (!fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val)) {
> > +	error = fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val);
> > +	if (!error) {
> >  		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
> >  			dev_err(&client->dev, "Invalid %s top speed: %u\n",
> >  				fwnode_get_name(sldr_node), val);
> > @@ -2057,9 +2075,14 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
> >  			sldr_setup[2] &= ~IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK;
> >  			sldr_setup[2] |= (val / 4);
> >  		}
> > +	} else if (error != -EINVAL) {
> > +		dev_err(&client->dev, "Failed to read %s top speed: %d\n",
> > +			fwnode_get_name(sldr_node), error);
> > +		return error;
> >  	}
> >  
> > -	if (!fwnode_property_read_u32(sldr_node, "linux,axis", &val)) {
> > +	error = fwnode_property_read_u32(sldr_node, "linux,axis", &val);
> > +	if (!error) {
> >  		u16 sldr_max = sldr_setup[3] - 1;
> >  
> >  		if (!reg_offset) {
> > @@ -2073,6 +2096,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
> >  
> >  		input_set_abs_params(iqs7222->keypad, val, 0, sldr_max, 0, 0);
> >  		iqs7222->sl_axis[sldr_index] = val;
> > +	} else if (error != -EINVAL) {
> > +		dev_err(&client->dev, "Failed to read %s axis: %d\n",
> > +			fwnode_get_name(sldr_node), error);
> > +		return error;
> >  	}
> >  
> >  	if (dev_desc->wheel_enable) {
> > -- 
> > 2.34.1

Kind regards,
Jeff LaBundy
