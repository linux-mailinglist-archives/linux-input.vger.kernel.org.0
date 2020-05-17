Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A48C1D6D70
	for <lists+linux-input@lfdr.de>; Sun, 17 May 2020 23:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgEQVV5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 17:21:57 -0400
Received: from mail-bn8nam11on2050.outbound.protection.outlook.com ([40.107.236.50]:60993
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726372AbgEQVV4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 17:21:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAbQnHkrrw6JfHsgMUxCCOBzOKWdx270ejQF/PrwCLv0jO/hEEQJbOSuppnvA9AzUukIn8ZFNfNqWQeP8Ftzz2QpQKJTbgWvRUpmOCG8CqgDYnpVp6UTeOSKXO0HqRz0KdKTtn5AFYihLTfktr9HLjcQOrYUM3kQLH2398VLoXOMkug2CzBlewNcMPIwx/GTHbOJlBe5K6EYEhmMZGaG0Udt9nZxvF/aDjXeMjxRNgKT0UCBKktqGnHBcbtZIuokomExii2d7n+TwpB9rc3Hisa0sPxtjHKU+dJkGtunulA3070PBb3Hn51QTjV6CWpgS/7ByQKUEzb4Xwi4SssUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdgNSkg+XAd8ZntpWnpynryqwUkQu8jQWf7gOa15Smk=;
 b=odNgd8L1fyu4BcaELXaA9C1UMK42DTxElAFTSvh6T7Z/QTC1KGDrKTDr8GIM7XOlhf4354M5fNtChpHTXr/YCOu3I2M/Vdcjgon6LZXQK0xI8NqodF/AikfTos2Zkgn5Dk8plnvzLB2fEXMK+4q5DHVBJqgg/HljJvmp9aBKSZZDDFMCsVeCUtdz4Zn9D+eIrW/Img1T7agU2nALIR3jUju7/rOaoAt4QRPq7o41lT/DpMG7JFCqcdgLASfu/2yEt6Me56RnSAuarNbPxwmFw4Qf3t12kWkoeGxXXPre1iocR7YVCaVj8xbtKAEYNezt024nAjlJtTApJGqS1Ii2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qdgNSkg+XAd8ZntpWnpynryqwUkQu8jQWf7gOa15Smk=;
 b=WXxOTizNRenxXrtnenC6SX9+2eHqlPtgRTfcGGEgmBXe79yAp7DtrwF8b96OPYmUz4DOzEArM0st6z/2fReAOmd7Qj66LfzFKaSs7ZtBJ7joOc+zoBKagtmRSbzdvpqxlFGX+eYKKPMzVJmDhiB/8yWUknrQnbZiCK193MZvy9A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5390.namprd08.prod.outlook.com (2603:10b6:805:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Sun, 17 May
 2020 21:21:53 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.3000.022; Sun, 17 May 2020
 21:21:53 +0000
Date:   Sun, 17 May 2020 16:21:47 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: misc: Add support for Azoteq IQS269A
Message-ID: <20200517212147.GA2158@labundy.com>
References: <1587340068-2818-1-git-send-email-jeff@labundy.com>
 <1587340068-2818-2-git-send-email-jeff@labundy.com>
 <20200420170930.GO166864@dtor-ws>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420170930.GO166864@dtor-ws>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SN2PR01CA0023.prod.exchangelabs.com (2603:10b6:804:2::33)
 To SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by SN2PR01CA0023.prod.exchangelabs.com (2603:10b6:804:2::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend Transport; Sun, 17 May 2020 21:21:52 +0000
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02230e65-bb67-458e-6849-08d7faa851a7
X-MS-TrafficTypeDiagnostic: SN6PR08MB5390:
X-Microsoft-Antispam-PRVS: <SN6PR08MB5390B7209C93647DE71F4526D3BB0@SN6PR08MB5390.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 040655413E
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cnxKC7lZPrjXmbFxH3e9e7hZJ7gNJKYYkVL9OGpD1fDtjQUO8gVLMnrPSV3UZPnqsEnYD4b5XGVIvM9trwTJqI9w/Wl4JJOp7ZUrjmTbJ0f5nbyxcbyEIdw7t1zjy943O6wmeCCxNurqHpOi1CKSuv2h43b1syq3EJ/b8h5nbJm3FTiSnAWyxIOcYyN0N2PXpZsr2oC5pKa0TYcUTPuw5jZ5QN/qIi/0fSlkIdmV9usdpHH52D1JtMvJr1k8NwTy+aRuJ7RiOm3VjD38sRqMz/Yn6egNx3GWwXOkvaFLIju/vIb7y0ZuG/jxntXQ4BmxdpgClp/DtB0lJlr5JVOrtYjugN2F4o+yLu/dTiTzqFt8EFHv9dXrIIE60pvL7b8Dvo2Q7dVFP+NfcLFjBPHWchlaF0VjlazEdmrbDpPyCICJXtZBNjegK5DccMh/YwU5xWSRenSfYrXDvMjS9M4/BUa2rpz+aE02HIYhj0SWOUd2+C1jTF677iQ+MGlt2hm0THdhCBoEQG3GmM+TU9sMPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(376002)(346002)(39830400003)(396003)(16526019)(86362001)(6916009)(956004)(186003)(316002)(2616005)(52116002)(7696005)(6666004)(8886007)(66556008)(66476007)(36756003)(66946007)(4326008)(55016002)(508600001)(33656002)(966005)(8936002)(26005)(2906002)(5660300002)(8676002)(1076003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: QTcFdbrjYz+hPK5oX4tyiPgAQdRmAz6Aqia7v9DUr9ebQjX3eROVb3ASy5obFiGKDANAVYdhyt0Tcfaxnem/13dF3MpEtakludBxIr9n2mktNH6a8KJxbipzdWDaUSqmNJNclp7QrEjDqpS4blmzT57j2VRhlhPD81OruN8G7B5r3k0eXCPvf1nqhFWm7FfHMCkBBIDgbjZJs6KWFut3XLiM28lrNTBLGWd+vxWRX64iVaDnyh+ZWMWMm8UpQqyBP9NC107vaTAw2l92cnUxGnr1eBujddfqa24heXyw79RVSh7qIr+0Z0nbvavvMUNdeOlJvZO2ufYWucvQ6SQDVOLEkdi5veIH8Bv5oBTC3ZCt6OT4kgA97N2E8kjTPAAS6B3rSFCPF0p3Mi8lm54ZBbH2OLPtM/c/6BoqD7rDa4D/vUSjDmZ42jFdYIMN1LYz7e7Z9BkE6DQkqZ2KjTZ4CiIQrGlhNgt8EvHwZ2uiNrM=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02230e65-bb67-458e-6849-08d7faa851a7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2020 21:21:53.1157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmKFN1Fcx4NNd/fJr7kIaerTWDQPUbgmjd8l2UHtvOXtjAClToNNNtMBALiwm/b1/pYutalRv3EYt6umlBAuIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5390
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Apr 20, 2020 at 10:09:30AM -0700, Dmitry Torokhov wrote:
> On Sun, Apr 19, 2020 at 06:47:48PM -0500, Jeff LaBundy wrote:
> > This patch adds support for the Azoteq IQS269A capacitive touch
> > controller.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> 
> This looks good, so just need to get Rob's take on the binding...

Thank you for the quick turn-around. Last week Rob reviewed the
binding for v2 [1]; the driver has not changed since your first
review. Would you consider taking v2 for this cycle?

> 
> Thanks.
> 
> -- 
> Dmitry

[1] https://patchwork.kernel.org/patch/11522939/

Kind regards,
Jeff LaBundy
