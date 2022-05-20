Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51EB52EFDF
	for <lists+linux-input@lfdr.de>; Fri, 20 May 2022 18:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351209AbiETQAj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 May 2022 12:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237681AbiETQAi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 May 2022 12:00:38 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2044.outbound.protection.outlook.com [40.107.95.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC7971D8B
        for <linux-input@vger.kernel.org>; Fri, 20 May 2022 09:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPVbT1kIIp+3qdStL6BxCMcCT1vi+ZE01Mr0dAgZffXVALc1nkDWwdvSED82Q/DHkWMx/e04/8HaVrl9Lf1h2vkgECBp0Ix5bEpjDuDlz2KAMicohZKSvu0gFlJVhU2FOSlm/Mbg49xPcPgLHTpjIiwMSgoga20MjvXAoVe54uu5Z49J4cCxNwnOcjNzfzhItaxoUQ+1e13hMjo7qA6ivMB3wRbc1YjgbhLPZDC8LHtUd5uKbhP1b79k5WXZMA+QRvAMRG8yIM1OEdN2TpGAezOGXuhkRDqmL8A17VQgvBlfDy4cjEepDWdwyKU4aAZ/QxI3DkvLmOR7Mc7/qQm9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d08qXe6cz/pk/lHF6M9UC+4hmCFyLBRHcbVWjz4Z2uI=;
 b=HXKVo135KE1wiU8nmQ4Z26lXRNt6RZduPZLjJuPZW3wLvNjjE0/Ii2TYQLIWql0eMB3Jy64NAS4DwIo1IrcjAdRl4grvm1rwLYgE0StN3X6sMxIPd39vj/quw5rImhE+OtSDsv1Ey//DlCib1wVFcY2QgQ88Wh3MvYY6LDmL3oNIv000fWdMLcrdJtMX951JD239npHMwvpQlCftUWlV4vjjcVF118oBPGen+rI7Q18FB6PDwM3Z1Y361XUTuByd0kmt9rtCpQuvjWaPykq/psAQTlvsYK7g1xdodCjNE/M+gN1y41byzzuXkX3ZwUGBLKNtVeOD7qS+ofnRrJuzfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d08qXe6cz/pk/lHF6M9UC+4hmCFyLBRHcbVWjz4Z2uI=;
 b=vw4GxIlJdLGZFamH/gyi7CH0G93srYT1FDySmpMAE1hyoXQGLPzT6KpzrUxYRqc2nuJOidXKCFSfeOs3ZbNJXW5EtJ/y0ZBCHfgzx9Sa9X1aiJ/hEeKlIuj07SoGQ7fFTzuvgu+kZdj1m5vuQ2OlhN+JjYLJpSTHqj/lp3nz2YQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by MWHPR08MB2862.namprd08.prod.outlook.com
 (2603:10b6:300:d2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 16:00:35 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::6d9f:69f6:7920:8eb3]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::6d9f:69f6:7920:8eb3%6]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 16:00:34 +0000
Date:   Fri, 20 May 2022 11:00:29 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Document the units for resolution of size axes
Message-ID: <20220520160029.GA49889@nixie71>
References: <20220520084514.3451193-1-svv@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220520084514.3451193-1-svv@google.com>
X-ClientProxiedBy: SN7PR18CA0027.namprd18.prod.outlook.com
 (2603:10b6:806:f3::22) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cb5caac-996e-4fe3-0155-08da3a79dfc4
X-MS-TrafficTypeDiagnostic: MWHPR08MB2862:EE_
X-Microsoft-Antispam-PRVS: <MWHPR08MB28625FB3E6E86AF39ABE6192D3D39@MWHPR08MB2862.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s+k2fGtsNIB7niCIeHLRqzJr2wlYFzgYSO+2sQ2Re41eXSxPJotz9pdOfEP9yzESJdiIHBJP4J2cOTdPRShw7uTVXCZI5XzMrtY3dRLiLIMyKRZ2/LSTSAC5c6b1STEDjP2tXjEPpXFMENx16y5GMU2UpSlqPBfuN0hP50vTtSLoHpl4TMLtnvaqgjpvbTwzRXXNf3+9iCPsbOW3Nw7BFM0+CEFyIIqhJsZLrl/uEa7Lre6KqdxRgipG+if8FpuRjnPmT6FqGo+7WJCbKLnB1rj8b0TWCGjIkJWV+evlSiPmWRb4MpGpLZkhcSM4q6zcWkb3TA3NhmTbE8sOnwyeiwH0d8sRNaqz4jZ2usDvxBNnkjAwGjz4q6H/klQZ3rsb4RP2aaGc7/HhNiV0vUm0Z9xFaWLoxRedf7v1fqnP6ciX/SZkS13MN6rwnGciPFATQ1Y2WQeCQBkc23nEjQCZukzdgNGWV0N83L7cLWLUTdpSnsPMmD7HLUw6CgJzy/1sIYwIwsXpodHtCLTPTS6zx9Ue1s5vxomoCoL/WBq4ZPeH3wJlI9lidpjGk5qsZs+ViBevWRRmdMtIJKwkO9oXPHufiCJLlMPP4tHcq1qNdxNTmtn3oqDMTZ9uAqPn1tHiCWoRnUmcnTOfFzu5OdR8e0rcnbkliOiZNbfjKZIIJjOVTYz/VjM8jCvs2/m9RoeJHIFY40KBMx2D2JWuQ+JUhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(396003)(39830400003)(376002)(366004)(346002)(136003)(508600001)(6486002)(2906002)(6666004)(66556008)(6916009)(38100700002)(316002)(38350700002)(33656002)(8676002)(86362001)(4326008)(66476007)(66946007)(6506007)(9686003)(83380400001)(6512007)(52116002)(1076003)(8936002)(41300700001)(5660300002)(186003)(26005)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aMK6863C26JjcB4zNSAz/tUDJTSpexHAcvxnAiRPgf+1Mk0FVx4IjMrKRCDJ?=
 =?us-ascii?Q?n1ZvLacxRJBCY/lS+QAoEPZdj2d4bx24NznSfhx7zDrCMWSuxFc19cNvyveK?=
 =?us-ascii?Q?rTMFVzkiul22oQxpuR5HHSFE8TTO0sctarTSYfOWzKE+tU3RGoiRFCzjbj8W?=
 =?us-ascii?Q?hIdz9ForBVGYB42EGKQ/nvmzrR791ExIpkg0nDKT7AJXjEYIWyiRSJnRpjJj?=
 =?us-ascii?Q?j157E3eFpL/7gJk7XIfS2I7kOH+bolWHNWOB8Le1eeHN5gCI8LhTai5rNhwv?=
 =?us-ascii?Q?IQcKKLtc340/3CMFMk7HAWlv6uoKCf5C11rrzub/wMmZ/tncItGmLT5qtjb6?=
 =?us-ascii?Q?wkZvUTciNT4Ayz7rsKWnP5JqE5sALHVVhqs9hDM9NWgvvL724gq0MSp/Yys/?=
 =?us-ascii?Q?Avzojdi3lKCisVUimqB8aFQKmljh69KN/sDe+9dVoaqnicaQ5k4fhhuVw5rE?=
 =?us-ascii?Q?d0dF9w9yaRCHcuGndszZQUX13DogRINzkAXP3SrzVlQDJTWSFq/g0iyiuxC4?=
 =?us-ascii?Q?8kvJWA6j33vSLvIFMs3uFZTYHNjaf1JuC7E2qq3nQUGCuiBKHiKBFNjObXS0?=
 =?us-ascii?Q?TSoZDLcH47Y+1AuvvOEuJzvrmdHep2OVsY4MkeTbLQlcBkEIY88oDXPh50iQ?=
 =?us-ascii?Q?bcAvTxuZVG3MX4hivGVgqgyB7e02Riptdd3P4cuRD4rDDDqd4MZt9Sjsal/Z?=
 =?us-ascii?Q?IYIOQBB1nYx1V4UpUMhsYXvKOTrueT2k2Q+cTnSeYWQ5xFM9DQv6qA62H8Zp?=
 =?us-ascii?Q?hqHSke966V4faBa3vFPcjUo3J9zMudn3FZ6nW/xanelpPfLG+PKwN29DtMtU?=
 =?us-ascii?Q?xY7jp8YlnnMT0Ipz+wF2Kfo6PNNWLEMD4BSlZVPauwanKosiYp4ORLMsjxpV?=
 =?us-ascii?Q?WWuKS2u7msrF8gE5309anY++PLyrxezzOC6Iy1HjTe1ZuQ0WJBk2qqD9P06K?=
 =?us-ascii?Q?HhLfA2w655OFL3LzKw71B2aECQQ1+X7NHmjJB0pm/9BCfxsDkmz2htAT+FSn?=
 =?us-ascii?Q?lqYgENat0T2rbJeDyOntk8RHDcIjm/Q8OQgSqHHWEwa8JU2NpWu1uYR6N5vD?=
 =?us-ascii?Q?MZIiSbxA2jUtKXwbCByBa50+8FSX29kwF1n4VzlsE2P9iixOjrrXRFoDGXlv?=
 =?us-ascii?Q?3urFPXWoe9CFo9t+IXiksxul9uoxr17pWNH7ERBv1JA76N/Su9Q70fmlqKlF?=
 =?us-ascii?Q?KB82WCeKmNiKVz2qhQ0R5fwolxAu9n0KZZLRFaotlovvqybt6ABLu1BKoT1d?=
 =?us-ascii?Q?C+qOKat9woyjTNCY6T/DDwJ6xbCMwK93ciHhWBCCDyGJZakYQdJKCp2X6hON?=
 =?us-ascii?Q?4HEEeb7Xj5++9CXkhCNK9qLjQoEtiJHjVBpHAvJ86Sm4ur+KwfNQgXm0F/DV?=
 =?us-ascii?Q?UdJ/OxSqRB9n+v8Xan8SlOnY99D8VMwieorks6lm6jkHatbJ5JxV6iUJkliY?=
 =?us-ascii?Q?aFahkJXXy3WZbWnOSpqTiSM0bn9LYiJAMvgXnS14p8SHXqUjYH0R7aWFxumM?=
 =?us-ascii?Q?Nnb8S/Jv6c+MAnQRh1XQ+2Gsyuts1bRj/de1sJzbJq4nN2164TPtR+TOH9dI?=
 =?us-ascii?Q?FzD9Jl0bxz6tDcrS9SIJGNu436DtWUK50PSvUze3PRHkcDouGJrP70KWNgtT?=
 =?us-ascii?Q?17ACmv8FM1hOUbOv0PPHuUFOdoqXepTtOCDDmk+nIII73dQDZmLfyDjEr5wj?=
 =?us-ascii?Q?d/JwTPjpefGjVVQTa/4QTkcYfhWCqmWzxuVBQgUc1kyJ5E6cBrxQD3vhLr1W?=
 =?us-ascii?Q?l9CsMa7yiw=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb5caac-996e-4fe3-0155-08da3a79dfc4
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 16:00:34.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SuEdr4u5cEfRJQ9CCyMK6vQ4dfFp7HGfQd3/vsDsw4IrniHFFPG1mprP3qhZCydqwcW8kziX7YEo9qalqx4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB2862
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

On Fri, May 20, 2022 at 01:45:14AM -0700, Siarhei Vishniakou wrote:
> Today, the resolution of size axes is not documented. As a result, it's
> not clear what the canonical interpretation of this value should be. On
> Android, there is a need to calculate the size of the touch ellipse in
> physical units (millimeters).
> 
> After reviewing linux source, it turned out that most of the existing
> usages are already interpreting this value as "units/mm". This
> documentation will make it explicit. This will help device
> implementations with correctly following the linux specs, and will
> ensure that the devices will work on Android without needing further
> customized parameters for scaling of major/minor values.
> 
> Signed-off-by: Siarhei Vishniakou <svv@google.com>
> Change-Id: I4a2de9e6d02e5fd707e5d312f5c3325734266a6e
> ---
>  include/uapi/linux/input.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> index ee3127461ee0..328cf545c029 100644
> --- a/include/uapi/linux/input.h
> +++ b/include/uapi/linux/input.h
> @@ -78,10 +78,13 @@ struct input_id {
>   * Note that input core does not clamp reported values to the
>   * [minimum, maximum] limits, such task is left to userspace.
>   *
> - * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z)
> - * is reported in units per millimeter (units/mm), resolution
> - * for rotational axes (ABS_RX, ABS_RY, ABS_RZ) is reported
> - * in units per radian.
> + * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z,
> + * ABS_MT_POSITION_X, ABS_MT_POSITION_Y) is reported in units
> + * per millimeter (units/mm), resolution for rotational axes
> + * (ABS_RX, ABS_RY, ABS_RZ) is reported in units per radian.
> + * The resolution for the size axes (ABS_MT_TOUCH_MAJOR,
> + * ABS_MT_TOUCH_MINOR, ABS_MT_WIDTH_MAJOR, ABS_MT_WIDTH_MINOR)
> + * is reported in units per millimeter (units/mm).
>   * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
>   * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
>   * units per g (units/g) and in units per degree per second
> -- 
> 2.36.1.124.g0e6072fb45-goog
> 

Thanks for raising this point; it's a valid one. However, I'm not
convinced this is the right approach.

On all the controllers I've worked on, ABS_X and ABS_Y are mapped
to arbitrary resolution values that don't necessarily map to real-
world units. I don't think we can make any assumption at the input
layer as to the physical size of the touch surface.

It is the same problem for ABS_MT_PRESSURE; the values are typically
controller-specific and we can't reasonably try to map this axis to
any standard unit (e.g. Pascals).

If user space needs to understand the mapping between axis range and
physical size, maybe it is better to adopt the approach from the IIO
subsystem wherein the input_dev offers a property that maps each axis
(i.e. "raw" value) to some SI unit?

In that case, dts could define the scaling factor between raw values
and physical dimensions. At any rate, that is just my $.02.

Kind regards,
Jeff LaBundy
