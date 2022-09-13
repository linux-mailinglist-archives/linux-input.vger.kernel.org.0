Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5C35B6E90
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 15:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232305AbiIMNrV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Sep 2022 09:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbiIMNrU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Sep 2022 09:47:20 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F380255BD;
        Tue, 13 Sep 2022 06:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmUena2yN3WpB9aintSQMUQvf8553NcNm7Pn+nOioFUsDh6aaD9k+6nqjtMTwzdFw77pfEQsmUKATrdiPXGoFutdreNwoQJ7QWDYRPBEd9iPTtfhhPg6FCiSPL15DYm9rs1FR3W/+wgp3g4/j+vWIz2Gzj97NweDJcAOx2RqnrmphSawipuXW+n9+oQK5uPvGwxt0d1Jj0vfHXLCdkhWUth3WzRtl1km/DbsQg/UOclTHZUjwfBajK5aBWG8erynxgrwm3Clj0xEYmfbY0U3Eu9Z859oC0FtKac4BkInMHqR0HOWKH/aQZkqevYfsSLi21EXnqYf9MTv9Lps21Mg3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7erTexeqpZqPpsAadamH63pyPVNqDluWmuCoOZwXOo=;
 b=cF5ZfufZxDWIJtZ0kD0o1+pUvHUPBeSgBrg1dp6MwSn1uzNeo645VQ+Tfn8ZfXaS7lJcxJB9bIXI9iHKrh18uquXEn/QymdCNz2T7f+PfzqGp4rLzDWB2I4CVkvtKLNxtZClYcijSSJ9YEtaB/3FGyueTEFAFLcHR3MlsaJpHfaF7L1zazbqvQrhqlqbxDYMySlMFC75hLSPnR+LmsnuDJV0WWDtY/t73pHKmCYkCzGWkEW4Ud6b3P5QwQXQIVszvoYv9EQFp4u9PIOFxM1MpptU+6nhtGVdFKe7Q8koREhFZY/ZLEqerMskzPluzTrhRwUPZVTFzEQd40dxOZ0wNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7erTexeqpZqPpsAadamH63pyPVNqDluWmuCoOZwXOo=;
 b=fT3+AeBwBozmoa57mDbpokAtdp1318tO/0hyS7TOJpCEeYEyui+hJ6cMraHyjARyjn9VPviBdScKqQxkPtaAdjJEW8n0zees3IHvQEnycz1xYpeMdGpLJbpuOyiZe2FWUa3m7C0k+OrvT1WxR9kn0oOAsPE5VHNkgTXDTIUAmWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SA2PR08MB6745.namprd08.prod.outlook.com
 (2603:10b6:806:110::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 13:47:16 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e9de:97f:447d:1cee%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 13:47:16 +0000
Date:   Tue, 13 Sep 2022 08:47:13 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 09/11] dt-bindings: input: iqs7222: Allow 'linux,code' to
 be optional
Message-ID: <YyCJ4fNzncZR1dqW@nixie71>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-10-jeff@labundy.com>
 <20220913114249.GA3323895-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913114249.GA3323895-robh@kernel.org>
X-ClientProxiedBy: SA9PR13CA0159.namprd13.prod.outlook.com
 (2603:10b6:806:28::14) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SA2PR08MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: d535eac9-9c90-4d3e-6a43-08da958e77b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ExnIZTGhubuSaCfduKLNi2gwL7xUVcJoXVMgOT71Oaq/wCHTfhAWVv0qcDhnoCCjzxQaAZ49mvUh9dhTlj1ZUS1BIGXZT9w6Urr3Coy1jAcXxOIgYOqNOrC3FcDwrQj+wbPdwAYgfJ9tKRFUdeds3pocaLZlBrv/3vILlhVy8AC//F/sfDjjs20TrqJ8jhYt5aRuF7wNogtx8lGPv8sVbv5Y+xbnJUEtuiAQPOHaWWubn8R6kxlArQ05sDxglPD/QN4jn2VX8jOnReO3ONJpT7Z4MUatcMDENBQb634ZpDt2YR+O/sWZOr26+fTq6chH1lkVivhZE4+MN/nptR2yBe/pp1RhTIfoQ4B5CievR8fOtVr/41z0uzLsws9NmvvQkH3A+TobCDR6L7BKhNV2REGCWfGjSXbwFE+sZYK3ITxAqg+OIbPefwXr91y/nyOTBXFc+kNofBB0nUevGQHvQXD4HhP2wurjtdMA5O/0b/hwzQx7ec6fiDq+B7UeF78iI2RhbF8zsXm7jCTTFtnoeQndZJi7QuuaiuIk6RLYLikQ7Vc9dywEmuzNtUN6054dlwkH0PSvNe2WJBlXFDAjNCQJZyUgqf4e9kO4IluHUNGJCeC72k787niXTeToHqczN1aiUTj4vKxyPfcrosLrdBnevTYO1AADOU7O+785BgHM36ttImhEP3W64EPmyV6y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(136003)(39830400003)(366004)(376002)(451199015)(86362001)(316002)(83380400001)(66476007)(66946007)(186003)(38100700002)(8676002)(6506007)(6512007)(4326008)(66556008)(6486002)(33716001)(5660300002)(8936002)(478600001)(6666004)(2906002)(9686003)(6916009)(41300700001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iUAB0Q9YRiXKomf2WiUfokzdtvc5lvnDDC/RiubS4/EixVmdscFfxLXlmyPc?=
 =?us-ascii?Q?gdNqUDK574yMuaG1OcS8EVcZjvhVW6bD+jCu8/a/fBxKlf/FdwDhVxYeA5x3?=
 =?us-ascii?Q?7L1WaLqfplSEmuZKgC2AME/xHb9gOQiboRYoQ6yLVoih2jSbCbzXAPi/2r6y?=
 =?us-ascii?Q?Hp1D/EcO4V5LsD5UbAJlVqIwHMPTNiighDrK1ZDlUBu52U909XhlOqsi1h9E?=
 =?us-ascii?Q?YnB6oNWa/4axln918qqFatF+DQV0UDGGzUbXJPc5kDvB91L2rjjJp+G6Rt0J?=
 =?us-ascii?Q?1KCi7cb03/dlUyTwGpalRfzKX3Kf1MtUE3iHxe7EH6+4g1z2YdKWeIvjNH/7?=
 =?us-ascii?Q?DFRT7cFMEouWqBsUUr09WTvycHvhD10olnGoSoTEk2Lf9kvQ+AKP/8OE85bz?=
 =?us-ascii?Q?QWSG4+G8jeF3fr/tEOcxzK8gB6Tg1nvg8DGGWHlnCrITcPHXZoTUnv0ukOBE?=
 =?us-ascii?Q?U6bx1zWkBHzkVRP8gc3qXvsYT9jzmaoICZFhnuzD5evwSi9+S9iNEDc929NJ?=
 =?us-ascii?Q?1qsH5g/LgdjgtLUKd75Ad9q5QyCIbmOg6Ows9h6KouXyGrFrjNYykZTAXNr0?=
 =?us-ascii?Q?e0zBYixZ+CBrSzC5LStAbxz5vsU61M3ixEVGW+RE3gJNXgq8CMQhsOpoxj0d?=
 =?us-ascii?Q?ICN8AD8p+i1ad8KYs7O0g+cBTRJjHIVZKfwpnofcGdcAo7qWDqSsy0G7JgU7?=
 =?us-ascii?Q?kpshCmJhge5GdeVQtJfvKoSJxW6n2hPD0ThWk4LvMHU/OohURVV0K3WXFTem?=
 =?us-ascii?Q?6QR48e5kXVKzBMMjOhEV9pmO8SgNj0VI7gVjOT/5iOfYEvJWIE68Gv+6JA8+?=
 =?us-ascii?Q?Qa9fosfna1eUl4RWQMJTA7Q1RC8x9dFS02A9KvICGzEqeyBqU8hAnnCBMRv5?=
 =?us-ascii?Q?mWhvZneWWw0DoNEfyZVoBoLrqrVRNl4z85Ew9WzImHEcTokglP/IgJ+oxBPo?=
 =?us-ascii?Q?IqeERoVCcFCHo9Ud9khGNFwEov3sbCX+hTYFHV73KVSYc/bHnTthK0IyoRqg?=
 =?us-ascii?Q?G7wBX6C4JYLaO4NLzMsiDoJIAfn8Yu49skfL5/Pe5PGc+gHUSbPPEeXznmpj?=
 =?us-ascii?Q?L5hgS9JPZrIE620FAjVZKYVCV/VjxxKJBt2Ux5wjkjz1q01lyyzgr141pDPD?=
 =?us-ascii?Q?tpyv8L7CcRJy+M9ME5S1CVHqGprPuxb9LQJMcylJ7F/tHFV/2twTLMMERlp1?=
 =?us-ascii?Q?91kPaxFmCYsI4W67s+UigcWS682gXUjKe+61IJ0M8Kiaa5A8pD6tVk9pfmsW?=
 =?us-ascii?Q?87K6Wbr2AH6nlpkXKgZZbs9jzB0WoVgmmwlgOSrmalhhX9nN0SjlEd6gxCUD?=
 =?us-ascii?Q?P/ZJBdF1Y7cP6hVtzvwB3xHIKTCWNZPAB7mMo3nqGsMI9S6XEefbGkieRopL?=
 =?us-ascii?Q?GTXi1EtHNwMw6N7ig1YjdL/16G8OAWHhgsSfh7AhbSWlkWdNQ4FuemN4Q1eD?=
 =?us-ascii?Q?9uRqLm2k3NNIl4YJl1oZDtW6qmr497e8My4DzbIi2C0VwvGor/jPoiKm8CEF?=
 =?us-ascii?Q?dbMaOZg0UM6d4Zeu0KqViIjv0NEurUGyi+hrkCIFZqvcVcWsvXAU5pnOS6//?=
 =?us-ascii?Q?4DVzyEoHaF7EFpY5cxU/NehjcZWqhIMp/3y7zpuR?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d535eac9-9c90-4d3e-6a43-08da958e77b7
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 13:47:16.1186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FP1I1tNVsI+UfB1krDflmZ/8Tja/waiSYJG/SeZzNGCbtwnu74ED9eKJ7VcCXFJ5WuI+jA9X+0MyISkqOJyQjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6745
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thank you for taking a look.

On Tue, Sep 13, 2022 at 06:42:49AM -0500, Rob Herring wrote:
> On Thu, Sep 08, 2022 at 08:15:46AM -0500, Jeff LaBundy wrote:
> > The 'linux,code' property has been made optional in the driver;
> > update the binding to reflect this change.
> 
> But with an old kernel, it would still be required. So still required in 
> the DT.

For v2 of this series, the corresponding driver change will be
absorbed in a patch intended for -stable; the refactoring just
worked out that way.

In that case, even older kernels would drop this requirement,
so I will keep the patch. In case I misunderstood your comment,
please let me know.

> 
> > 
> > Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > index 785fb9e83354..913fd2da9862 100644
> > --- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > +++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > @@ -473,9 +473,6 @@ patternProperties:
> >                Specifies whether the event is to be interpreted as a key (1)
> >                or a switch (5).
> >  
> > -        required:
> > -          - linux,code
> > -
> >          additionalProperties: false
> >  
> >      dependencies:
> > @@ -620,9 +617,6 @@ patternProperties:
> >                GPIO, they must all be of the same type (proximity, touch or
> >                slider gesture).
> >  
> > -        required:
> > -          - linux,code
> > -
> >          additionalProperties: false
> >  
> >      required:
> > -- 
> > 2.25.1
> > 
> > 

Kind regards,
Jeff LaBundy
