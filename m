Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9053065C57C
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 18:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238247AbjACR4s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 12:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233189AbjACR4r (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 12:56:47 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50D31182F
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 09:56:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ouh+bG5NPr0HylMMMqBjl2KkLyM8mCm99O4+gpZ1/MCvMRBjmRmSrdMwrUkJcH/ImkA2XkveeZtXrdCvJaSxBDhhlpKwfmJWxXvUSwPZ+qZHYTk6CAtcXtmtCOUt8KQ05k89ruO1TWmptvu7ACBUJuxX+XKcPLq3cSNDDmq1YfR9z/VyOeFPlZYlNL6pJLEzgmnkEOQJVSZAdMCQTONOjK3U3GPebC6MwVgOJcrGQEATYtU9NpT1bYyCtPB7rpBl26vQ0v3t1M3UewDltMFmwwef9qzbn44x4gPrEdzeJxIut2GajNJi4l0ml422rjjrmcrM3pYshYJAJ0zpVBdhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axcr/VENsEq+7NBCX+n0MRvopYVVL7tYxcwopscX5QE=;
 b=bs11jzsDKsBG5iJ8iZDDPJBmJOXEMQE3Nwr2yH7QvDU+RTnMEpm+ye9Cyxr520mebiWGk+xpx/UWh4Z8gpGxZyFKL69+gdhp0WXMVZCBDU5CZZf5p2yXEac0/wmVauDclIQ9RhU0z/PkKeGUNUv99w54FrsXkAIHT9YqjLHlHOXTKFZtx0QMb549aL72J6aqGDLEoQimJTlYaH3kA6HJ3ajcS5g1C6Dvr3b7ZBYpNX5o+H87AtMrRMWF8A6WrNAMM8/WTxPcWPo5whrw8njKa9wYLfI+k0+HXFpJnKqkjlXgze2L7oDGNIMpD77dJHFh2jfWXDiFEsGXqKlLN5bjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axcr/VENsEq+7NBCX+n0MRvopYVVL7tYxcwopscX5QE=;
 b=uITqm2+z/3xGj3UDPPysvo501+H/UnieTUwI4np92AcswvfP7wSk49fDc1Q3LefK3WwzH9i3quWWsC5i9URlg2EXr7WOl8Xz1OqpGX5Bh4TdxQYoHSvaHIcBqlhlYSKFCZL40zFY+QjUobbDWzfJ0g4jL7s6Paxqs8PgHA6hj7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB4474.namprd08.prod.outlook.com
 (2603:10b6:5:9f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 17:56:41 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%6]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 17:56:41 +0000
Date:   Tue, 3 Jan 2023 11:56:30 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH v2 0/5] Miscellaneous fixes for Azoteq IQS269A
Message-ID: <Y7RsTqhYJOZs11sK@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SN7PR04CA0214.namprd04.prod.outlook.com
 (2603:10b6:806:127::9) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB4474:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc36056-764e-4127-88a6-08daedb3de88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V5mGGskpMNcNb1Gb/ZUaHXo6gRrkgABChEyHuq7RaOlPwKgB96Pp5st+o36ubt4/zX0ThtpDqNvUVAU61/lQEcVd1SoASm1sHYGVYbeMjSC8eo2Y3NIK3rYbkIzPwkRkAv3F8e47cM2ShYlZW4ODAVR7TWpWS7TIdW8AVNSTrzQsG9b8P6PDBQ9tn0XjMTZz/KQcmo51eZGV67HdFn90RD83AVOVpitaqf5Rc80x6y2PH78Aa38V/EygTQw1SXTai0HbCFSLf3m1o/UGr1nW6aJsA7Mue8O/tf4yhvMXrUAawI+6kEa5jxBPRbZ+Qj5Nu/X3Xcy70RKTsjSV6SXqhUR1/1o1Tptf9hgAQO2oGUTt1YgvDN7+Pouv+dg63kbkQcbrfCGKjV30HHyYVaiKeN/IjKNvaCDloaJTj7JYISxlyUp2CMDzlwxqP+JGmrOpwVtdDSw3eEkDF77lJs4K/UH+psslkki8Y/N59VOP6mGS408uiCLThDY9GjRTFUbHG4nxlS80gXbh/Q7X9SnldFR8ybIlOVI6AJujb5/1H/efoO/g3YAii30q+0epQ9OKIGd4FYKS/gdyqj8GhcOsae4eeIG5JxAVd1gg9/9+R1zAwjD463UKnNza4Ne8uHOdGK9vvaR/y8XyNLSW6zd/pidN9VBk6SmKVLviJlT1c8tb+CuWOb3ZB8E8a3IPRYz8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(376002)(396003)(366004)(136003)(346002)(451199015)(6916009)(316002)(38100700002)(8936002)(66946007)(41300700001)(66556008)(8676002)(66476007)(4326008)(86362001)(83380400001)(33716001)(6486002)(478600001)(6506007)(107886003)(6666004)(9686003)(186003)(26005)(6512007)(2906002)(4744005)(5660300002)(22166006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1AundDh1J1FtwEzXRPFQBFGfcZCCpOzh2ms2LchbOr7SOxVoxF6DF1BOZQD9?=
 =?us-ascii?Q?nek4bI5Yo6o4waN6yw+5UF29bkDtL6TfDisXGYDM27WZTIOatjD7UXRM4hoM?=
 =?us-ascii?Q?+j1Yb+QAMwok245pHrHqCb3ogYeEvRdeQtdlSggNMIZJSvfnfczmzqhlpgYR?=
 =?us-ascii?Q?pIAN8lmnzXNlkTOduvrjS9VAqx5RQ7/SkR4U60y7X5iHB2XS7tucAdTsW6Xq?=
 =?us-ascii?Q?F4+kTHv1ky0jp7aVbeKf7tf6xYqHZWfYWiuEgOMyR5F/kU1S07s4dFqqEed0?=
 =?us-ascii?Q?DoffVZ7tlmYXF8xnLUNxSVo/HtkIqtiCVPSddVxqb4VIEKPBr140ElJgU8Ce?=
 =?us-ascii?Q?gQ6DvHguoMVrGbOpsTYEF4/LrptRGEORPNa8Z32+JVAaHgFD78eXYrUMpbsU?=
 =?us-ascii?Q?lORbOoW2u6DV7wWQgpB59w9NnRdMZhGZm5eMwsG+Ld6KCWJPv0ZqbfjZEE49?=
 =?us-ascii?Q?J26OCDqeM+F8M6UKiaD3mXaU8hcLaNkbbiB16Gj0F9QOUrEeX+UdXlW3PbCB?=
 =?us-ascii?Q?Deyo7SKPlub6JCFZmy6+vD/rHbyLtpLWeZygjKuIcKga8CanwOwpup62Y3CT?=
 =?us-ascii?Q?iHu+W0VfM0HiKgONHkHZJWXxUoKyebqAsE85yClREwYu7rOu93RiCqMts+ef?=
 =?us-ascii?Q?ynA47tj/HGcD0VWV9b5zZBXU6UzVWHBRtJtZ7NfwTznvEXjbG6eGiKaw0DeG?=
 =?us-ascii?Q?YB0ld9IYzAOVePk94OugkSHIWSBbq5eCsjoTZigFABd87RMYC+B5Q5FI0FOM?=
 =?us-ascii?Q?GNPSEBNGjn8cHTPp1vCY5A5np7dWJdZe24YXoR2jAo6f0UQHmyUBXspoXqn7?=
 =?us-ascii?Q?lwz47q1JRqreqiZOSZzvaq6Y7qKY0ZbOZXI7n761cAgvMKUlJ436dLpd/cQU?=
 =?us-ascii?Q?ReRLj09vL8WUSzG2eiThjvW1+ok7JZj0St3x+xlt1SkOvLdXWN4Y/QVp8EuE?=
 =?us-ascii?Q?jOuqqSM1GbiPPoamuGA1DMmc02IzqJ/a9K8bNYWRlhWxHx4YMxvWLzWDX/gY?=
 =?us-ascii?Q?e7BLUBjAYcx8ndGfBZMTLcHpQvAZvKCxJTCekZq3jxeT8xrRev/3gh4kLfK4?=
 =?us-ascii?Q?21VPfT2GB4E4UKewGvQzMm8UI5ngUkcPu52RDq86FUhnesI0Kbljo7ZB5PyL?=
 =?us-ascii?Q?fupgezWIawOg0e5F2M92fp4SPP+zfzwkmu7waQjkCg/3R/xTWDVB/yWMvJtd?=
 =?us-ascii?Q?OTrMiTx1ZICQi1XmmgdltcH4KkgBToGO3dmUh//Hi5J63GzA7PZPBDyWcvte?=
 =?us-ascii?Q?EOCOvXEsOxESZ52FS2d8tLlV0UxUYllwiHpvwp6y9REkmvMvOIrMgrf38/RS?=
 =?us-ascii?Q?jfz2o+bR9iEEtFg5yYkWe/t/j5ZiIfARXq65I1euecABUlFPBQa2T48H20Cv?=
 =?us-ascii?Q?KsinqhPxW3gWAqiKORu4U7QDYbm0cAkTmVbM+4BnnBJhGhBxDz1t7OSvpLqf?=
 =?us-ascii?Q?P0J5eVhurnsPPd+zecHpu8tUwRFB6GPi0JbBnUVlJNiRINXJmUq+j1s7+gbc?=
 =?us-ascii?Q?j3qLfWNkvxhB4/ywWXQNmcXjI+I8qGxswEcrztQjV3Puuw+AupEASNhCtvnS?=
 =?us-ascii?Q?NHfM8twrOjr2L+Mw9GPOjz1JvL+pijCoGlBPBHRY?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc36056-764e-4127-88a6-08daedb3de88
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 17:56:41.6171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSRkQGF+L+c3aUG+0dh4rD1LvPKXvOIGOvnlHj5iEt3d/YwEqy89LbmN8QkOREZZZuPatWWnmSLBw6Bweh9HsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4474
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a handful of minor fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (5):
  Input: iqs269a - drop unused device node references
  Input: iqs269a - increase interrupt handler return delay
  Input: iqs269a - configure device with a single block write
  Input: iqs269a - do not poll during suspend or resume
  Input: iqs269a - do not poll during ATI

 drivers/input/misc/iqs269a.c | 327 ++++++++++++++---------------------
 1 file changed, 128 insertions(+), 199 deletions(-)

-- 
2.34.1

