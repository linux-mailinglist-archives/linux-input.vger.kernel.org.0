Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E0D32E064
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCEENA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:00 -0500
Received: from mail-dm6nam10hn2248.outbound.protection.outlook.com ([52.100.156.248]:1761
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEEM7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:12:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBsDU2EHP7qibEJK997tPULBKhGh7VnbbRUIdUgiyF1R+1rQ1pBfs92gImkjEyywIvIq0HccXP8SxGYiwlVTOWK22kMPv2LfBHVAVC+T0nh42+3XDy9UhNcRY1vbv3QL4aSyraJmMHvryF5L6bbzJP3eILiXaN/9e8ifKUHMHSb7tXJ4nmJ3a2fPbWmxLyGeZIrPMW1f/bJh7VceZ76Z1TmuKsyDud3AjkPCizOTGl9DB7autK+1LW7NX84U1f3QCvdWOvxa/RqKN5MVcjTSX3FpvgyhHrxNgCk1YS8ylsIF4w+1Y7SAdhPTD2VXTMAW8fyv7O8WnsYIwy29hXjl2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6NcOmzq9Grh8986VFOEVN7+h7Ht0WE0N9rnMtXYREQ=;
 b=Mj6K6QrpYO0+dYy46XAWUS7GmxeUuvok/rSn3SrvYrE5zmRQqcD0caAUjjR+zC7J4l1r6hqqPeC5X1YCAJj+E5OgZMI14B0LkOrcXn6m2/9fAHnRgHZD/aSrSy58r7Er36DTBrGpGBRttCkPKR45VtEFFkLix9p1lSnZyPkSC/xDXCW2tj+JQe0VitXaHBeJ9E8Kzt/0Ece2f9JAa5wp4EpSb3zqm5zwuarCiW7Gr/1mO5ojSB30faHMmB4k6UsCjUEV6+k9nqCgy22d1sLH9VvobrTedRA5hU19dyHNzt2DWvB4fWwqeSau4jHTt2+FijUsKL9Sjl7p2K37ByTthQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6NcOmzq9Grh8986VFOEVN7+h7Ht0WE0N9rnMtXYREQ=;
 b=y2zBQZmTrWFzNHgbZIk2gqi3x7rYHc3G4mhqpX4s0X8TUUYJ6OHbNwURmu+GzmJDnZ7DrkNGQGiPhvFqeNlnmvhJyWJ/JihIqm0eiV0JmRCFF/pYpoI9K5rQacxc7Nw3p9Q0eRfPxGkQf6/jby7EMN8DfxmfTe8suOHbWOZZdK8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB6112.namprd08.prod.outlook.com (2603:10b6:805:f4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 04:12:57 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:12:57 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/9] Input: iqs5xx - more enhancements and optimizations
Date:   Thu,  4 Mar 2021 22:12:27 -0600
Message-Id: <20210305041236.3489-1-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7e230c6-7303-46b0-1daf-08d8df8cf4d5
X-MS-TrafficTypeDiagnostic: SN6PR08MB6112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB611248394F535EAEDA75E507D3969@SN6PR08MB6112.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YXCho2KBfOH+uKc8aBLl8LLRxKyBmy00jwbzIEv7FS49dc5C5s679ZyaMD4u?=
 =?us-ascii?Q?HZh3yeIf1MRuVuiSFglLmWfhgwnNgJd0KeNcf4ZjltIIl5QuO+w7wE0VYHgf?=
 =?us-ascii?Q?QSNk3we8kuB0g2cc2EBtyYJklZnEKKBmsL42Bcudg1LkgLqFSs5OU+szZ101?=
 =?us-ascii?Q?RG7uf5T5UHQLczIHinTNiFKKrRWSyUs6pZ8OyRe8ur6ZdxL/kmbWI0Ppm7mi?=
 =?us-ascii?Q?MAO4S8Er0RU4E5fJ+orfZHQ/ZqV+abB9ky7Feo4r4ndkt/kZUgs5yUoN7EM8?=
 =?us-ascii?Q?k5ds8T7G/zThnhIvbDib7UGytuXiMXBv71kzYzVD3SchH/cFxTTZKkGnGDEd?=
 =?us-ascii?Q?Yw61UObe3ByMvHx77SlNSSgh42rbPDLHnzhf5DZDbNL6TnHY0/rTs2690HmO?=
 =?us-ascii?Q?ZnTlVQcW9ArI5A9Kf0nAahOxEm8Lebirjk1Fl+KVWbdj0ZxZ43pPbmghn/dd?=
 =?us-ascii?Q?Po3NGb80ZAi+v7+7aN9SyqAax7CocyDE58lusdHdocXR5lgVcFMyhN3aWhHs?=
 =?us-ascii?Q?/cWtRkm93gDTmNZIkHtDQTe+eonuQcZ/06HUfXbZcrBN9q2H2era178uMNl5?=
 =?us-ascii?Q?CancaWoMASaNXIrt9oG67vs646xmToDSNVlY5h7RWVHEvQ4D94/WYunGu0jc?=
 =?us-ascii?Q?7cmQwkCkhOrrMWiuwMzyZ2Kuaa+QwWwfkMMJ42k2ztmHlzsPi1X4cQE0xXSr?=
 =?us-ascii?Q?37iFUOD2C4WS2n4Hdxsc+lC+kab+1vOujmkeMO0bGNZ7WM/3lw8xAZyoqVI+?=
 =?us-ascii?Q?bSxDdZ9vs2p18rIdUPULzeyrSG5jM5x/NxZWi+OYZu/WxbjGI+e+oXy3g4to?=
 =?us-ascii?Q?guH9KZigxNszth+tQO6pL7WlAgn8QukJ4Gd8UAs6oRmvyf1d7W4vzj41z42v?=
 =?us-ascii?Q?nRVs++kTIEqK4Ps3ReeyNWHLkHpgvs8o6+Tuhd1t/pYP9fe7Ucd3KRKNVH9v?=
 =?us-ascii?Q?Hbk6fw1XjgtzLZcBEI7GvqNjpNYSzypYSEOKnKbqfDOCh2m+VRrJEoctzuWc?=
 =?us-ascii?Q?WseSrtz/NZC406ETG2Nnjcmbpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(346002)(136003)(39830400003)(366004)(376002)(6506007)(66946007)(36756003)(16526019)(186003)(66556008)(5660300002)(2906002)(966005)(1076003)(66476007)(4326008)(86362001)(316002)(8676002)(52116002)(508600001)(69590400012)(8936002)(107886003)(6512007)(83380400001)(956004)(2616005)(26005)(6486002)(6666004)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HJIoAT+tkUP6AtRMpZqd+D2ynNX1OVOUdhEM8rjAMyhtH79ibe3feap1rUhF?=
 =?us-ascii?Q?6mNN8t/HbqBJ8suW+hwdqy7MJH2XnKve3gN32wMNEhsiHGyd/DtkF0fnAKD1?=
 =?us-ascii?Q?gu9zCduvefWo7aP+IiC+tRXOSSnte0z7tuCUh+ZlhlEqZZgLKTFURHXGpAfC?=
 =?us-ascii?Q?VAvdUf5eFvdRLwS4Chuit1snLPAZ8kxnWZL8kOR0OPBEyAjsvOVg83TS+Gve?=
 =?us-ascii?Q?fs4790C1DLeMhiqwt6jZf4nHz1VjL4priCqOZeWukdypPpdwrxwr9IktuWSX?=
 =?us-ascii?Q?jTvFT7fAko1qjLZHT9NCbi2EtUfU/ht7q3Y/Jw+f6H0+/ApvwNXIvTxMohCi?=
 =?us-ascii?Q?gPAFPVACsVUq5aRqEWA2+fG95GQGqsGCO564AEybKcZmZMkFdfztCBCGZuDR?=
 =?us-ascii?Q?eY5HhxIFjrqX0SEYzrQ8NKE4+ybLIHKJ5AEspoxFv6iRgVNbdPS/VMdj4U0A?=
 =?us-ascii?Q?cPqjkgoOC08Il/Kj/ZmC+hOomMFBVzGKMOy8E/XW1BlYvCybsxIGQ9sCyNkd?=
 =?us-ascii?Q?UlzXSVuRSxedwA9UDOMxNrhi+C17SVc43ZM+hqwVJ9QuNyxU5Tsm2NBaii8U?=
 =?us-ascii?Q?f8zfnI1ZU+wftTP4FnTUajYRR7K8b/rYd+DlQZ+RnDu3PccztuKPnArCjRrp?=
 =?us-ascii?Q?dcKXcb3caer9sIIVxJZqCfK2gvkgHNAoCDFXhkvCQjf/hjYvwG2tUR6EDMN7?=
 =?us-ascii?Q?RVUcqfw7UEiHFPEEM4gaUfq+fGCHNvPrdtG2uc0InkTKDlL+zXRRToajT+9d?=
 =?us-ascii?Q?aFufnCzoMeyNlnlpDR7RouTOaD7a0BIASmK6lUHGAbTsYMQwUQMQBba1UDrf?=
 =?us-ascii?Q?R4zdH75TKOAx+SkZvEvtcj4N5nMj2E7vD6KTxN6QVrgJozudj7uk74XP3fVh?=
 =?us-ascii?Q?G2P6OTtbNRay+hdDNX0QUNBUqungL/cSYthMwGvOt++xeFBktz8y4uOKxeLm?=
 =?us-ascii?Q?xUhYeQn5VE9NjbYo0PzOPumlDtVhnOc6Nj6Rjkbcm4o0EULDYM3GHfBVTihz?=
 =?us-ascii?Q?TzIVRwRCMSEr6SvyIBfWqKu5EbUfoYFOZCHHp0QCECrElwDDKrcmqnsPe2Hv?=
 =?us-ascii?Q?/Stu65fZFxcioOi8aA1IQTuiYKdXfb4VrSscxefq96Jmg9g9NKgQPzCySDIa?=
 =?us-ascii?Q?kO89X0iN/HICeMeJp5ueDznfhbR4GSl/ykCVj8hA0Y1cBSjqOhWuFu8ExnFf?=
 =?us-ascii?Q?aux+lPyqYlR26ydxgIt+yFaNXQIGat9xfGniRG22HeEEyRTTSFOjlC3S9yWu?=
 =?us-ascii?Q?bFOuOzEbA/TGez/vFKuv/SVunC9spLeWWh7+7+1vMcZ5FUmnJeeDpJE2xxGV?=
 =?us-ascii?Q?gL08ZelbAG2FXEYqReQ3JEX/?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e230c6-7303-46b0-1daf-08d8df8cf4d5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:12:57.0427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rVsl8r3A0oyjc3HwgNT70IiMqDZ4Gt9t7JxTHN3vxzFp/YTF9aF5zb7CD8Ox5dwQPawjQHfmOM9RX8uX4fEpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB6112
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series continues recent work to further enhance and optimize the Azoteq
IQS550/572/525 trackpad/touchscreen controller driver. In addition to having
been made a bit smaller, the driver now supports some additional use-cases.

Patches 3 and 8 are based on [1] and [2], respectively. Also included in the
series is an updated binding, now presented in YAML.

[1] https://patchwork.kernel.org/patch/12028203/
[2] https://patchwork.kernel.org/patch/12028223/

Jeff LaBundy (9):
  Input: iqs5xx - update vendor's URL
  Input: iqs5xx - optimize axis definition and validation
  Input: iqs5xx - expose firmware revision to user space
  Input: iqs5xx - remove superfluous revision validation
  Input: iqs5xx - close bootloader using hardware reset
  Input: iqs5xx - prevent interrupt storm during removal
  Input: iqs5xx - suspend or resume regardless of users
  Input: iqs5xx - make reset GPIO optional
  dt-bindings: input: iqs5xx: Convert to YAML

 .../bindings/input/touchscreen/iqs5xx.txt     |  80 ------
 .../bindings/input/touchscreen/iqs5xx.yaml    |  75 ++++++
 drivers/input/touchscreen/iqs5xx.c            | 238 +++++++-----------
 3 files changed, 164 insertions(+), 229 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/iqs5xx.yaml

--
2.17.1

