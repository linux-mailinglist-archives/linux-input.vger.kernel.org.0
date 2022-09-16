Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF795BA5E9
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 06:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiIPEbN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 00:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIPEbM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 00:31:12 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2067.outbound.protection.outlook.com [40.107.96.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA82558DE;
        Thu, 15 Sep 2022 21:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKoVBASTy3w6kLJVCscnwtsd8G4S8BHUOaiI5H1C6zmImg+9LEfefu8w44EJ3PsgOMxEAgi8NFdjnYcydP9EmUm/ywURW4D/xNKt6odHuTFfhZ+TLCTS6YoFSCkriPEqLP8+WhSXWFeayn/8smjqfjSpJip/h2q8JjGH4iqRrgnN2lsgBB20iPF+0XYDnjbZqovdi1aW1Z/8CkTdvDhe9RSpYW+tmJ4fxvCuIQU+Rig1Oc4ssH8lKeSuApFijmQT+LCtpLy+GZMc4s/uQfUtRHtHGXO0uk5EFpagMAC2QmdJ4VCFsqLTk5LWQfCTXNE5T9Td1yk65u76vDdGSASakw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abBegcGIFaLtlyVgs8j825XJFEPa46jo9cdiDRXDLT0=;
 b=S+iJRdP5a2eade2AFk/HO0670u3NmRxWG03ML3hccm7ioLcduZrSmOOrQD5MZqcxBd9pxiGcFNaZ3IBWGK4yC1cXhbLmh3+QjaMHcRvhKCb9DmL1ao0Fh57GBtRnnS1d2d7Ds7FLJkmFcuzMqtzOf3Ly7oIbgdKYN17AR+cldONEf0K8r1q34QCWPlYoLBtY5bHu2IaWCgQuPBwmSYMyxCzQgm8y0lwuQPrZlRkPq5vbsL8bJFwTQ1rsNuBMw3lvE2VsNN2Kvz4gGfC8xYOpVQs6M7yfYagEAejyvewlt2nJRB9R7T8cph8/76D/Ldx2Ii5uXUMi7U7TBYzYRUWzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abBegcGIFaLtlyVgs8j825XJFEPa46jo9cdiDRXDLT0=;
 b=U4BQdVXT3QBAVjvvFXSigY8RRDgXsgLO9BArtnNRlIOp8/MfbpHz1pLbGj1nP1yj3ZVCC5rQlRfnmoZhbqyU1O/KgHHdnh9x6fx2SOMBHQnfCb1HpCOvXhMBHNbqNXicVdVSQyMla8QNjikrfWjGOesZL/WvQAiBQOqpd77XgJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by PH0PR08MB7210.namprd08.prod.outlook.com (2603:10b6:510:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 04:31:09 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::446b:5d19:f4ac:66ba%6]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 04:31:09 +0000
Date:   Thu, 15 Sep 2022 23:31:07 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        jeff@labundy.com
Subject: [PATCH v2 2/7] dt-bindings: input: iqs7222: Reduce 'linux,code' to
 optional
Message-ID: <YyP8Cxtyh/iKQTfM@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyP7l/ts6SFI9iM2@nixie71>
References: <YyP7l/ts6SFI9iM2@nixie71>
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0801MB3767:EE_|PH0PR08MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e2a21d-e04d-4345-fbd6-08da979c476a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XaE+zk7D0618k4cBwUeQVDHO2roEUPPOIYTA+BznjrzYe0twT1fsvsImTbJbRfWIjQTH8F7i3rAf51vcu3V/QyQCjN13FgAAIgCHIqjkgH2kZCV0468JhYGNbZkmoENIbHiq2jYcvbLnk2ed/2+IAxq26ef3ims6LdVk7ikB+ThIU4K4w0NqwxlNiLeAIPjl48AzBUqD5PApbWliXL9zS6OwZC8rPQka8MNh9frJLhsy+fqGDxgMixuFb5KSfsFVRQAsAk/5u1wvEjes1dNkvrc9jRxlAiMZUMthEEuhzurthpEhCONTM4q3+0/+VwPHhtcpOywPFUJAls3zqWosOEsuC+QD4wPTbIqN/sjfdIRD/jqne7pQqIB4LK1/Uo3KjPwp71RCu3sSjesN3bA+0fEK+Yjy7jMqx3HHRWtDkW/fStXycg2FQOgB/PYoD73sk2n4ZCxAeZhEdUa7sHb7lu1aRQuB5skrEDa/GfR06qZ9a81AMw+teo0zKOWNjxepkcZIgoGUY0E3oCUHibXq3aLnhNlkyHKVk4bhlaw7EoL5nOf+c+73vOq16hzFr2y0jV4ZOz4fNvYrDacMh1Sb/J+mJAhAm1Wskybu93SDNuJ09w8GUHlfdvEM0QhfvUn03wS7Illfv+Dh3idkZyxHh5OGCP/2wGwSogR3QJaTXpGVhDCpLfovKl5l9PpLT/imEMRw4XmdnR8NblbD8IIb5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(346002)(366004)(376002)(136003)(39830400003)(396003)(451199015)(86362001)(33716001)(6486002)(316002)(38100700002)(478600001)(6506007)(107886003)(8676002)(9686003)(26005)(6512007)(66946007)(66556008)(66476007)(4326008)(8936002)(41300700001)(2906002)(186003)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTk/b/terQBv28wcpQZ4nILfJI91LexggvrzzvqxYCj6tVHyEmZSpV/yefRX?=
 =?us-ascii?Q?XaG8uJxHorMRTq3gnD5TN7xKLdsNUquLOKKtKSKrklwi/x2dk7gLYD6gxphI?=
 =?us-ascii?Q?MSzAhwVPlIVXwmCVfFeQIU8Yvz/wxA5IrQC+lCpO8X5l7aFcbIIPkftS0tu0?=
 =?us-ascii?Q?EYOdeIC4Df3wVWHtDiDbzYJITteBGuEQmvB/iNtrndjF1drz4akYhP6xVVnn?=
 =?us-ascii?Q?U2x9dA5Js1ZsRYyxDxjqur/IbtMDmuvHMGjYBS3IcjVz8H3FUaq1k2CSeh8a?=
 =?us-ascii?Q?wMvAXNDveaQT1NLnfpjGzSkX+bKsCMGavOij+L0+Ld4z6bFZPVl2NdRODDCZ?=
 =?us-ascii?Q?30XXRHVUDJUh/NiqPiLztPyMNxgpE8eTH+jpD0F+LWLzlrBHsFHAG3M/c8KN?=
 =?us-ascii?Q?d9GJ/KL1VDlsllOrefb06yy9So2v2SQA/Ic1TJZHgtY5Qw9/uL5yuANh+ER7?=
 =?us-ascii?Q?a0auj4U+F/ujvSxzpDLzQNcUs4Ed+xamZx9b0QYAUZgK1BATuLMTD0Uz0rkX?=
 =?us-ascii?Q?kvtxb0SpSguWrhzY8P2nGQRzZW7sTRPfG6DCyP4Z3MJvHT21FVjVIglV+Rhr?=
 =?us-ascii?Q?yMTg83uI69G6CQ4y1RlU//LM39JzjJercx9fIMeJl3Vb3lQmFsKjh8aEhGO9?=
 =?us-ascii?Q?+W/XcneJVYnosnMgfvXXrCczxFEmvx/Y2mnr6SITWYO0jjIA5YlikSnJo/3E?=
 =?us-ascii?Q?UHK6FTzCXQ38/t3ojp2h1yP/E5SGILJ/VvZnKlMR+jpSvqY7RspZxcFxpgWv?=
 =?us-ascii?Q?qMIEezP2m5bUSnuKuCC50g1SRPPMs/+91Rud0rsB9DPhCMZ+5TJLurOyUTLh?=
 =?us-ascii?Q?leVPspwtLBEVorBLDYY0H6MtZJr8myHRFmCcvISd3Idw7cBbcgYHU0JWd7GE?=
 =?us-ascii?Q?xGXF4i5/5+PWupwbwsx7JGomrRb9oP7Ya9o2KGdL45IPw8mF7Szq+PxCm7Ar?=
 =?us-ascii?Q?/x207ij6cpu+eNx6eMUXsD3JybYTRnbQNOthNcEs/g0/GLYpOzjTxlVHx04h?=
 =?us-ascii?Q?qTTqy1tltGXo0YIBMzu2fAP4vzOXLF4uOp39Negd2Nu/iDU3zV5S1SkfZi1G?=
 =?us-ascii?Q?HULtM33LGdXcDY7l9CL5VGv8j4BcCbDLRTg57LRbIQeaz0RyfkoFhc5dDsPN?=
 =?us-ascii?Q?SKbOU+rAaZVh+PNHWZ20GVBWYvWOe+a4Pgfz5HayeCpCF2UF4BZXZaBwaKHW?=
 =?us-ascii?Q?Rp5o+jG7L/rbIt9qisg96F/mKnnMDMTvLnXHd4bHlfReOIjsM+hJsGesktba?=
 =?us-ascii?Q?SO+gZg62bXzb7UH3+VkUgME5hH6iSJ8AXDQvEXyANFhZXNgSBN/1M/1bGkGG?=
 =?us-ascii?Q?nvPXZQI4YzYLs2OwzJItO8eusdH+hQzHE/LRbofsRXfBIUvlFqTG4F+Le0sK?=
 =?us-ascii?Q?7Eb6HeNz+PavRqDkEzj9NMMsMVmRvBigWgqQgvaN0jMO+sCw2hADMzQnee7D?=
 =?us-ascii?Q?cnJ39UiIX5vgFWRLRGe//C1iITjE385BYUOLzGm0n0SlgFk8Wcr0dNjYN8kK?=
 =?us-ascii?Q?e1j97M9veh/ceqqA6mCp5kGozLWaR7TXeLw5ts23T58yN21Y9PV5WLh3r9bx?=
 =?us-ascii?Q?Z/7n11eLOa0weKA1o3q3v5ycvte/+9aSIL8bm5yK?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e2a21d-e04d-4345-fbd6-08da979c476a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 04:31:09.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+cG6+feGfRFEFOQQhu1dO1GQ6D31br4Q1Xsr1nudAzhzMLLktZ7zXPe5jGWi4RPWPXVRkaNiPoQUvoaelYsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7210
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Following a recent refactor of the driver to properly drop unused
device nodes, the 'linux,code' property is now optional. This can
be useful for applications that define GPIO-mapped events that do
not correspond to any keycode.

Fixes: 44dc42d254bf ("dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C")
Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Updated commit message

 Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
index 02e605fac408..b4eb650dbcb8 100644
--- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
+++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
@@ -473,9 +473,6 @@ patternProperties:
               Specifies whether the event is to be interpreted as a key (1)
               or a switch (5).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     dependencies:
@@ -620,9 +617,6 @@ patternProperties:
               GPIO, they must all be of the same type (proximity, touch or
               slider gesture).
 
-        required:
-          - linux,code
-
         additionalProperties: false
 
     required:
-- 
2.34.1

