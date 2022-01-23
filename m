Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84125497544
	for <lists+linux-input@lfdr.de>; Sun, 23 Jan 2022 20:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiAWTnB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Jan 2022 14:43:01 -0500
Received: from mail-dm6nam10on2072.outbound.protection.outlook.com ([40.107.93.72]:41949
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229681AbiAWTnA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Jan 2022 14:43:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXEU3mX7l9DhU8AYu0lqCAcBlJQWlvzIxD/ZXkMF9JEk2Njdx0mUNTftorAKLdqoa9UUC0J2xRaZVbG+wpphmFuGXP8rQrs5/1KsxcEDBNCxAmYL12yKZtv5rdVuecXeAc6vZEvxfzGQ09kHwSIeC3lEeM+lPNVhduEqhI/b80V9O9/drs/2cNn7S2R0KIHWayhRK2LSoCpSqxNqw6YUsTb8Kxurae9hmHbUt3jZgaftSaGco4XV0a2pgK/mPr4VpZYDwS/ueTba1gMa1onTHhvk5csbnA9USH6ElVkTe2VFrJvxBmnu9EcXnCwdLVmDBckQxyyw862ff6cdUivIcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjz3qH03GghGppX55mhtReLPFkRbDjERzsuFxUYNGsQ=;
 b=c3seBUOWPk6ogBS3+zcc7QPhb8gABY90Sto2qyows786RfqHq2OMfvwANRLSQFGKqmuWBNVTiKfkZzSu03tCOixxLBDJNR0bglYIlYpOF3lCnKRyLZ+QtPaFNwW9hSn5k9GwYNUZ0kujeQEgoIGB9+xhJfXVLYH7UtvcZeYTP5qtCk22gJQbhXdrXi1Pn0wfOOntRP36tCtf77MHA6vz0cWFyW2qrwN0aYZSSS14cSeGQSuTCF398mkzyuXfVmbMqCskXtuMu//Ddq8TAZY1BW7AcHWqEfAHxLjPvDxR91mF4rliSt5XLsH5d+GmrtpZgSuIQWLBt9qwBQn9QXPbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjz3qH03GghGppX55mhtReLPFkRbDjERzsuFxUYNGsQ=;
 b=LV/9J0yALJn0Ld6ao/OoP6w7wUPEuHmAak0XfYvXZ1DXUNMvMYuQuzqmpRr1ZADpDM607bPK1kwHOkzbrpDNEcdCWi2e9GIcn1UqOWxThBkXLqkNh+h4FUpvZ4t62rMM4r2ORKCgcCMW3HeKqg5cbE/dKCaEVhrGShRIOvYMpcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by SN6PR08MB4783.namprd08.prod.outlook.com (2603:10b6:805:69::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.14; Sun, 23 Jan
 2022 19:42:57 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba%5]) with mapi id 15.20.4909.017; Sun, 23 Jan 2022
 19:42:57 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/2] Add support for Azoteq IQS7222A/B/C
Date:   Sun, 23 Jan 2022 13:42:30 -0600
Message-Id: <20220123194232.85288-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0064.namprd11.prod.outlook.com
 (2603:10b6:806:d2::9) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f16e1339-8f56-4ad0-12e4-08d9dea88e25
X-MS-TrafficTypeDiagnostic: SN6PR08MB4783:EE_
X-Microsoft-Antispam-PRVS: <SN6PR08MB47832243345678E6E4DAE0DDD35D9@SN6PR08MB4783.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PwdKCQPTYUbrhrdMKKLANPGNsYOFZsVm/TGdgrvGaL6JnZI2BaGm64auWY7tnKZgWeQHcjsiOE7aqL3097JrbV522uXUFB6Ys1FofVkMgMv2t5iz8e1rgGB2btXqYuE+zOHBNAitXNeCmCOFRaVq7juVrjxfUUqeA6ppYyCqideZu7iSV8IiDCASfnQzGdvDffGf5T+1QWUzReSWbPPIB/YAzpbc2Fijf54E+7Rvkw2lj6DzEN7rk17S7GX6d/WxKuRn6MyaZPiJYxGGNIpI9Ujpy4ZHfNNc+Rip4DuTx7HRFxGrM/6jle8GhRgu0xqE5BRIskDaQRMVqcsfsYjLYrLgrm0FHzlk/b6j5sXHN53YhBBPzXpkAyPbunuX9UOh5lzh5o9vTOxfslhGcp8rNkc9jViYq3M7UMqhEFcK+bEstJZeEFucu0cU+B/Y/k945g/qJfNegPLHxArXdv3FY3l4M7ymmlFKLNertCKUwP5ZfEnc8hWeTqMbqjAdJIa6EZhIO5MzCopyTe6g/GY24eglYFE9nNUvCrZ4ny44N4Mz2SfVj5Xk+Q/4sSKeH1Ha40FaldxJOJ8ytR6hWff8AXEr539u4ULkqDASX9S0MunkkNUtbG9u2AKmCIb3168p7NjMA0uZ+U5N9TIoqQ9Ai9rUcla2TO34msI1RCNiHeRgUdGfRijz+l+kPM+vd12+KNrUv+36FlYHc0DJFTAsNk3hoy4eoCegNUBSLu1jEvHPvEdOIOUwIDiITcPddFustueu7iF8gHW3Ghb89sRTzx2yJRWDVHqRFgYdPOpItp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39830400003)(136003)(366004)(396003)(508600001)(107886003)(5660300002)(66556008)(26005)(316002)(1076003)(66946007)(66476007)(966005)(2906002)(6486002)(83380400001)(52116002)(4326008)(6666004)(8936002)(38100700002)(186003)(8676002)(6512007)(86362001)(6506007)(36756003)(2616005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2rAs5NE3S+Ay1UWRZI+lNpuV09hmHeIT/VYYOyRfTv1TY6ckZLzyL39g8qap?=
 =?us-ascii?Q?fHk6NYEcmEML7a7F4pjFn44h4Dt3IoLo8EA8vnaq6qhjptFyC3vB2u2K8akq?=
 =?us-ascii?Q?veNCgcCLoeQ+sR1diRlNqzn1vRp1bfaCnoR1jxjmmcDlzPF9kdoBUGyjOSWD?=
 =?us-ascii?Q?mA53GtOKcaPPuBbnNFpBZlYMRg87NNDnC/JfxTCuGe3UYn5w0UafaJ6xb3Qf?=
 =?us-ascii?Q?/lF3PMkbDHmah0r/0ar3r/MrruXv1wyyigJuRh4S9FMrm8mbCdc7WhwdiE6r?=
 =?us-ascii?Q?1+a/FHRL3sxurlaOa1ULmQxJ8j5/uIfnqGZElat9OXkdv47zKYcRr08NR95+?=
 =?us-ascii?Q?mOMP0gAXuY/d7D3ZlQL3MuA5LqehFQZFdNtSqBPw7JmHYdn6/6/nFQDLcMDr?=
 =?us-ascii?Q?T0DdsK0/WSaY6oYfVxq+Dg2R7uqGYJrozA9sy1nsrLAlmyexd9xKn/37QFPc?=
 =?us-ascii?Q?11CZ9T4WKt5Smg8vLFbjUcxUR/VWwmCed1uKRfhULiVKf8+CN8NCc6x1nh7f?=
 =?us-ascii?Q?nLQX7Px6tF+ev7iEEywCiRLdckd76naWcO4Hs+Y2FchAxaAd/BrG/oQaKULg?=
 =?us-ascii?Q?ULxx4aRsxIu0CKRQBHzAOU6kVo9VwxvTVVe7gDpPFqBDBe1XqFped0a+0P5n?=
 =?us-ascii?Q?BqUd56vIJj9qPE6/R6mF5tHlTVvnIJ66ycxzFyFpv4egpSCI6nXJnZd7oqd1?=
 =?us-ascii?Q?e1IPnZKNuoiTAsPbYlxeB1Ad4I2z8p0H4sBPeEF3Yjde9gmShb0s//UHcqaM?=
 =?us-ascii?Q?tqKmTIh0Xx74jP2+Rc8HRlBAW4e7jJPphXf0wL8nOAmCp+dCZOk+upgwKhcg?=
 =?us-ascii?Q?mRqq9E3OX4i3MmDRrk3xgVJfvmUx3fXUeqGfXzG7JOH7YsxWSiMsq6hETxqN?=
 =?us-ascii?Q?EliEF4YaNnqTpRRcJ06fofPf90hV3u/sVu1s2GW/kHQPArGoXaPELcDH9ZRE?=
 =?us-ascii?Q?yUIM66tqTjalAU8fmFF/WOfg0QRPPwDG+d5Z8dOcpPXrKpyaEUu/dT8xyRUb?=
 =?us-ascii?Q?9hEe2zs0uAqfJgKdhRp7C+92LdzicdfpYi02hosmHWNT2Lf5I/8y5ZUrt6KC?=
 =?us-ascii?Q?WZ++J0hAPXHAh2/hvSEpMxs9iBfGPM+uxDFAd57T6dlhjKWNo8aBMIehp2np?=
 =?us-ascii?Q?f7sNnS4XOUo3i8GSY0K7fruLw0J2Rr/3fRRhA1dnjTQEdaUf7LJ1M+YhcyyF?=
 =?us-ascii?Q?7pcvp2sGYYMzoJDe3cfaAT+c1WKqfXbtptC74514pZozQ2pmzvnIEISWenho?=
 =?us-ascii?Q?YSop3N9juTVd9chkZJslusMCgnptXR647TF2gfaJ7bWb1S7xA1WIyvI7PrRN?=
 =?us-ascii?Q?c9oLkkftxpSUBss8eR4ZR5mjoDizmwe3seD44xCziVF0GKLXrPKWmUA9DNCr?=
 =?us-ascii?Q?8eBYMY0G0BwvqKeEx4Ad/Tk+76+SWxMH6hgQb10HEDZi6l+IFPMlfjISkzxp?=
 =?us-ascii?Q?x8OmHpfHmqSg2dqbA+9hj7E+jXeQLjvkSPvL3OitFmP9WquJT3O/s/UCjq7z?=
 =?us-ascii?Q?kqDtLAPgZzOv//fMvgn9PXGeJ9pJXF8n2bD8UiA27MaWKu1HaQfn48rzFXgY?=
 =?us-ascii?Q?hRccXEEUvij8X5bEBFINPJgGE0vShGQCwzAQUIZ1xvSeD3LrEFNxIp1tSuK5?=
 =?us-ascii?Q?YA5iVKAglYOi9K5+5bEbPM8=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f16e1339-8f56-4ad0-12e4-08d9dea88e25
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2022 19:42:57.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ojOP2t/h94QVtb4ZnxJNAmSDvrbmXIXagMJTAAYj65cFuMDf8FZhk8G2qg9PSwLNELwLkXHUXvB+PxZUE0Eqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4783
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS7222A, IQS7222B and
IQS7222C capacitive touch controllers. This new family of devices is
similar to the IQS269A, a key difference being the delineation between
conversion cycles and sensing channels.

A cycle represents the charge transfer mechanism common to up to two
channels. Channels may represent keys or switches and have two levels
of detection (proximity and touch).

Each device has its own unique features including channel count, slider
or wheel support, and Hall-effect sensing. The driver is demonstrated
with each device in the following videos:

IQS7222A: https://youtu.be/SyHhe9pSr8c
IQS7222B: https://youtu.be/R9Yd8yFPmN8
IQS7222C: https://youtu.be/-ahg52Co5zo

Like the IQS269A and its close cousin IQS626A, the IQS7222A/B/C are
highly configurable and follow the same general structure in terms of
how their bindings are represented.

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS7222A/B/C
  Input: add support for Azoteq IQS7222A/B/C

 .../devicetree/bindings/input/iqs7222.yaml    |  967 +++++++
 drivers/input/misc/Kconfig                    |   10 +
 drivers/input/misc/Makefile                   |    1 +
 drivers/input/misc/iqs7222.c                  | 2385 +++++++++++++++++
 4 files changed, 3363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs7222.yaml
 create mode 100644 drivers/input/misc/iqs7222.c

-- 
2.25.1

