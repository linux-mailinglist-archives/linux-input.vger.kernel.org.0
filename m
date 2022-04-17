Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC76504965
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 22:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234959AbiDQUNW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 16:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbiDQUNU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 16:13:20 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBFEA193D8;
        Sun, 17 Apr 2022 13:10:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQ9v4Ym4eTbzOI8KcNvBOEZ50SK19fabEB5b96Epl0vTijIiwn0G3bbOqs/NuLxPfVZ0ZksjEjr2kPOpS3ZtnMEVpf8mW3yRRQ8sb0blBhi34ABMdATUu0U/xfQbCL9dX78hb6K7LlOek8H7M0sAKWV+Fufb6SVY7h7RvGMiQA2OphRhQukgTiJcz2xnYjHFH/H/XkqOuth9HAQROHb0e8H1+ifICM1Yfwovc75eyQsdoh8RUSJziQYkXYAzC0PSRVNq738KL3h79WfuAj8RBEz0wwVKtn/dPFnh36YzasuZtTaIqYufIAlng1jjvV1A89MO7SRcCkRJ3NMPBxGolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBn2FrJzvCwFZg8DHFTI0bu+0GD1sZj/PYz5KB70938=;
 b=LU1JpS24fFpvSHDWKV4CvxpCKaTMAXbQNgckSBB8NwZBt9ypFW/8pYnSkzhDEFxaPcVZXxjyKLn1hDv+Pn8AeSqfv+488Wvc/46CZ3ibWvKccS4Y3OmWWVvgvNFRNrdvvp4s82OE8LI2zjjpVaoyd87SZ2D/v98lRp0bgDhLFmLuBB5xuvKXcAfRq2qJv3WGQ01rut1/nX4qWpS5bfl+qPcnCs4fk6Tb9GuRViBTNd3F0LafVKbZlqYuN2u3vdpo1CFM53ENeW4WpfeVVEsRmMeGwjkfAUkv7k0pPqtr71vTqsgDeKPaGWFpeEBtrEVD3krVxAuejQtLqTt8mrTldw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JBn2FrJzvCwFZg8DHFTI0bu+0GD1sZj/PYz5KB70938=;
 b=PSogo9eHk8LM0j7PFgGn8mo3H7VnKQ5Rg4fiPorYnJN2PxHBI4ReZIJXOUZyOjXGjqtEo/EQx8Uy7fGCAoWg5VNrPtkMXAo5+uq5FOnXRkGi8WSh9A/Uzks8ARfsdmj8QyLlLb1YeaNHAg0grEMxRdBXgrjcIHERynlEuwMlohA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BN7PR08MB4113.namprd08.prod.outlook.com (2603:10b6:406:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Sun, 17 Apr
 2022 20:10:39 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::700f:b135:8bfa:4408%5]) with mapi id 15.20.5164.025; Sun, 17 Apr 2022
 20:10:39 +0000
Date:   Sun, 17 Apr 2022 15:10:33 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - propagate some error codes correctly
Message-ID: <20220417201033.GA197290@nixie71>
References: <20220412153954.GA15406@kili>
 <Ylxy0fnZ0lNSWzxh@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ylxy0fnZ0lNSWzxh@google.com>
X-ClientProxiedBy: SA0PR11CA0161.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::16) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8523717a-fc99-44be-efac-08da20ae57a2
X-MS-TrafficTypeDiagnostic: BN7PR08MB4113:EE_
X-Microsoft-Antispam-PRVS: <BN7PR08MB4113D0C4B4388C27B81BF64CD3F09@BN7PR08MB4113.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIaLEVQZrTvda7Byyy3A9ZOP5dIDzT4DBGjL/glgD3XJ8HdFBk/2WYnJXkQIv2HvbzfCMwnwgfLJDPf5WYM7lTm2oVKsd4kMghNM3a2A+0zGm4/qRgaI+5xe/OGdA0iYWsMlvSbQS2GzODGzTTmOk+2vUdHliUbRgVsuyc+1WirYYGi92TxFAqTgxv0m7UojLVraed5m7Q/vIIwtHt1isg5COcV36RpQ9osBnAI62wRYv222SiXwoWh970FanC8Xy3hDp50u+mxF9ym3CcqvKrNfjk7n9amLgnBYqYsoun5fZ4bjV8YK77f0zJQDdjXV0nq17unodNPYuhYbjQLGwqBIGedwvXMmUnzBZ4Y/ARCSMDM6KZh9dhnsL5UhDO1uYZ4Kn0HgPAT9CtIKc/DjylQDVC3NWUUs/46jrRhf7xZ2+kGzFVpxE03enrKJYT9XHpxgTHm8Yb+woMOIFRpvBCGZiDakBHPHsXM9x2jSWmj/mnDsd14ADe7uFj3ZfMJrYntWkCBTMa+MNzbUpIYnbfGKPHTX3JqV4pccSyEjvVwP7YnWxFkub9ZumpPftkLD7T/PUrRxA7Om35z0d8DLzwS2Fuf8aJd54HPzkhXlGzAOdXhlUdZwYPCdouIRLr37KL3M3j6DgtTk6kh264IjNY8+us+0DNx+2rCoDvM0mtg+0/CdG3qX3jiZmHCh/hbx/7KSRHN5d6HieBnyx4Hy/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(376002)(366004)(136003)(39830400003)(396003)(346002)(6486002)(5660300002)(8936002)(86362001)(83380400001)(2906002)(6512007)(9686003)(26005)(38100700002)(38350700002)(52116002)(6666004)(33656002)(4744005)(6506007)(186003)(508600001)(1076003)(316002)(4326008)(8676002)(66476007)(66946007)(66556008)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ePf00IjYZWyhiRD9PErOgE1ETcL6FT/oxxBBq14v4pueWict09NLmh8SjrLl?=
 =?us-ascii?Q?nU56e0qHK1DnXD+76lhcJ9eOjBrMm2423F7MVXGB0O00mzEdeDNBXNVqUJEZ?=
 =?us-ascii?Q?Jd7uxLv3yxE5WMHIG/l1elZ27AYd2gXya+VA7s6B2/iKbNDnHMqvuPMjIUcc?=
 =?us-ascii?Q?JlAfpqpSv5SYZYiZumUTzX46EQ3GlW9HnYin/Filkl6rHoK8SC1IGl8zeu86?=
 =?us-ascii?Q?U0J4SJMHqj9Nkm7GCyI+a+0lK796O5SKL8r6s9SYbXSVrwBAftXNWMCLiOr0?=
 =?us-ascii?Q?5XuFn3j84TRf+BwJOrfPX0yktKWul0tcC0S2+80RdDnxytyYZTJsHezFE9xA?=
 =?us-ascii?Q?guWgck0LlY8T69E8PUI/UmioaeT/ccipHO7YUnt9r4tBg1yNq50DCrh/1Fl0?=
 =?us-ascii?Q?NiVISziGBdOqb9gHzxl9zHreJkyddNFba2WtrVIIVLBt0SBdiAj099jZe73p?=
 =?us-ascii?Q?djnSkj3NRkQ7kUwbR9TPx6OZv6KauS2gn8hp/v6ec2o2CmtaQZKc+1J1T14H?=
 =?us-ascii?Q?BZu6Shuq9o8UOUwG4bBrtA7FBIchRr96sEBF1B01vzC25HjsAfdHHahB5/hH?=
 =?us-ascii?Q?J7MlcLKVKO3+sEmSZoF00RpvZ08FZ0jmw5kqqjwhHRe87TW+4+6SI3cb3oTi?=
 =?us-ascii?Q?/6U4Dus1cUQ/kDtrI3KqHF5qiPCRuKhle+SiwaxAwXgXQX7wQ3rB9g8fOuXK?=
 =?us-ascii?Q?EcIhemScHgFfSCvK+RdIs1SzNzQYFzqJlEsDnXGmoV78WOuIMWHkweppcHh3?=
 =?us-ascii?Q?v+ExG2xiwdxFaST7cM64o26dTQGKeuQkEFrfNt1/kqnswX9GQa3VxX09EYEH?=
 =?us-ascii?Q?XD+W+BvcjO3sgGQEfRdVRY2ZrbrI5bJnWfmdDuaoRAOQSsTkLo29gc0CIMim?=
 =?us-ascii?Q?OCLwuUamXL9B+rO+mPFgyfYHKF1te0N/gCMeE06LRkDHateJoZcYpIy6EgjB?=
 =?us-ascii?Q?KPq9pH9Q5/xjtXGK748fzk6HQAMv2n/NsxMn951tWGX90dUzrbxVtGxWt9T4?=
 =?us-ascii?Q?+xKQw67tFEn39EtBzPtc+3h8bYu0Tvclnss4qWp8SMw/7muExwAGHLHN37GX?=
 =?us-ascii?Q?OUbFUAlA2QDsljsbd4GW4gDdw8k38UNZg4K7DpaDFAyPpxtjbxxNnxmB5FJ9?=
 =?us-ascii?Q?uTyMJc0ECcK3ZDNBIWTfwZZvclIG97gF195k87DqEt7k8OcNcgi5xAPOgA89?=
 =?us-ascii?Q?s31a8CHCzzokm6uUU8n2aBnab8Sqnjx36UX4i+rKTnn9e76oXFSDFn2iR7KH?=
 =?us-ascii?Q?1OsVodbNy559AgvMpe9bj48dt4uJsFy+7fxLuwbhrpaisM5Eo25liwMi/xx2?=
 =?us-ascii?Q?gHLHA3WSGK0iHtdVppdbBcsMS05CCaZxTUAirSnJi/SCmpgUlR8kIGg3FiVg?=
 =?us-ascii?Q?0uWNRRII5TMZ0Q4teoClNoVVsA5DQR6veshFUE2ysTSq+177bPBseyz0Chg9?=
 =?us-ascii?Q?0c6ZUPFfq8VeqZx0DuZ1H79zT7nZ6B+SzdltcMAuWhadHcpNMFNpPLzqriPF?=
 =?us-ascii?Q?C5ohpMBQ24nmi3lPjiIMXdEKFgzsumTCtYKQxLxPBdSinQpvekN+2BDT3o1L?=
 =?us-ascii?Q?aqEJm9PPcyaV9L2MO343v1COJGQhfZmnwyqRM1llf0yA0pr/WSAEXpOxhmEa?=
 =?us-ascii?Q?4PkjPNtDBHuY6hWlURNfEtDLNEO0ATlHodbi8vgaZIJLBaKeFdooGDKlUcMZ?=
 =?us-ascii?Q?i0LSOa44HytDBYGdpm+YHKD7URc1SRV2XevRsOUYOAm5KQiWvyhM32nXQB7i?=
 =?us-ascii?Q?w3uldS6Rgw=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8523717a-fc99-44be-efac-08da20ae57a2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2022 20:10:39.4290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7F+Hq8nNAyYqVUHJ1KDj7e8fWckv9ZX3VuGbK5DWdHYT1b5cKwT6wz/rRRjMHrCmb7HlN4xaKWdvohZLtsF1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4113
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dan,

On Sun, Apr 17, 2022 at 01:04:33PM -0700, Dmitry Torokhov wrote:
> On Tue, Apr 12, 2022 at 06:39:54PM +0300, Dan Carpenter wrote:
> > If fwnode_property_count_u32() returns a negative error code then,
> > because of type promotion, the "count > ARRAY_SIZE(pins)" condition
> > will be true.  The negative "count" is type promoted to a high unsigned
> > size_t value.
> > 
> > That means the "else if (count < 0)" condition will always be false and
> > we don't print that error message or propagate the error code from
> > fwnode_property_count_u32() as intended.
> > 
> > Fix this by re-ordering the checks so that we check for negative first.
> > 
> > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

A bit late on my part, but for what it's worth:

Acked-by: Jeff LaBundy <jeff@labundy.com>

Thanks for sending this; it's a great catch.

> 
> Applied, thank you.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
