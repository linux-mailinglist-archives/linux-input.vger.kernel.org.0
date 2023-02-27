Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED016A3BA0
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 08:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjB0HRo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 02:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0HRn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 02:17:43 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2A91C307
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 23:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TsQ/nqNQhIcTieweUkYrM6vNw/bZZ9eQoIkwwqnjXBzQqNSGxahh01FTCK7Qmyi2/PcclHZiIAOQvnj+Hf5K2isM4+0BgpODsFl5tvfDE0MyMMKf8ZZn/JzEGqylBR5x1wFvt/uziV7kwt2KiLCeDWZwzhCCzr4ZredEQsieJKnc2Vzrqws9shTPnQa+O1N3POXm5kDaYrazZDZqA8S4bKxms7pb22Ib9ij40k8vBllbcE3yV/UVu4rcR0ICS8A7H5UMWe72RgMhPne6JVFw9I4CXFQMVOpcqms/hFGxun9WD5VPzpldmUglhBHsiN+aZl6kasPYnxTDUaRIibBh/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeChDq/NcTNfPal1A+RQvC9HrZKGn2bsj8xCzsZA+lc=;
 b=HtwgapeArpaCq5RKivLonpmNAkBNwjYTwZ+OYOdqA9fy38+3CbLFfYJAdkq7QO9/PBP3DWa3CpUoEz3gGFgE0WsOTjQ1UGyYo2UrtwhMrObpXwfWfcgY6OcSGtCLH0Cvua3jMLEt5GnIQOHC/drdB7zO/0aoE9XUjmIB531+5LMlnv2i3aTGIcSokHQNcHDluKuMx7TMccCUVAnHoRLthvAt6adPLLxHnHpD6N+uQWzYw8QcnfZFPrPstiCiWNaSmV24/YQ6GYAvZOLDEMrodhqWG5aRK00DJusEM8uOgSdfNaNVeh8VGnsl1tnv1XHxoI8IIIU2AP3kSJX11ZlswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeChDq/NcTNfPal1A+RQvC9HrZKGn2bsj8xCzsZA+lc=;
 b=JsdU71FTLsxZL0RxruJ0h2/w6sQMX6TadwUg7PH0iv6lA4YvRcJomxwq3AlaZkHZfJVUgHXy2yVVhBw8hA7/dmhojL40FMn09Q9BnRN8sIq5/FttDHHNkwMwblF/BOI+FdcF7I0pn4eU/3Csun4vF1N3Dx4dTIbFxVx/KofitVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 07:17:39 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 07:17:39 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     dmitry.torokhov@gmail.com, will@kernel.org,
        catalin.marinas@arm.com, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/2] arm64: defconfig: Update the config for snvs pwrkey
Date:   Mon, 27 Feb 2023 15:19:13 +0800
Message-Id: <20230227071913.334617-2-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227071913.334617-1-ping.bai@nxp.com>
References: <20230227071913.334617-1-ping.bai@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: d254e41c-210c-49f3-a8c6-08db1892b554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FaNUt8gcOGuT10f76AvQaF3XsQUcuBqBMlTEFmX0vwjKPqiWTKE2XNl0z3HIrSJXkBgj8Gh6NpYBzHJkGe/nEvnpiJNCAcTxfXH2DAM71aY3SSTGHc5mnQelFOVy76MnUkBHXrU6qQVNt+V5mYiCa4RzykbBgt5OxOyGwiL+s/EjXceqratCn8u0OYlQdDAo+cKmmzITMDTa9mChqO1AkixEMcBjMXYK1czCRVqlc/6mnqfuXCfMeLDm3+4a1JRMuqPttd0vyW0HqbWrkh8uNnuPeZItxW68XIChqaWRldKgoyPjaLICMAXwuQLIP68Q6syCMyLUpXhZa7MPeMGPDNqGsdHBbi6UpOcwlPVPmN8jQnA8JB11y6+6jl9BTApmbuWIbH7aQcNWK5AGzpcE8x9OyLKaXamMdCn1jq1MvMenJc6ApJ2A3oJOX2BQAXd1cXhwzQGPKu1a+hfFOlD9l66HpnxwJ7c7DKmpaz43Q97b4EwiT4Cts9hMyrkjjwO53AfaUIZiDz0/7YreUd1pePenHAbnX1/ZH0CpTemiVnGCs3/ZoDbVZRgVec7QrXG0CFND6e//zgmkfHMBBHfxuzVWdLnPmTJIfgq+nvEL2VqXkQPVgvb6H99cwv5NPuMEZyLaIvQWqXTIO75P2EOdp7JBn5uA1iHafAG//SZLat8izlFKqlt3XsoAmIqmSxcH9IyDR5qFfsR3MoBiE1x6xT4lCOGV470vnU3CESc0OuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(316002)(36756003)(86362001)(38350700002)(38100700002)(1076003)(6666004)(6506007)(83380400001)(2616005)(186003)(26005)(6512007)(5660300002)(52116002)(8936002)(2906002)(6486002)(478600001)(4326008)(41300700001)(15650500001)(8676002)(4744005)(66476007)(66946007)(66556008)(95444003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R1Lx74OFZJA1b6LN5d+Sm4BPfHj00TelBZ3unzhK3hNUIhQ0I3JVlNfZSET8?=
 =?us-ascii?Q?twwfVGROW+1cjX1/qVNarB0f6bCB7vDmnEk3spSm1m+ghZWav0fAuojw55ob?=
 =?us-ascii?Q?3l8AtN/GoFACGLrKMXSW2ij/OK/FXHwDgoiLoi07DFFOvoM/okje6XnNpf5W?=
 =?us-ascii?Q?i4v7EHaE+uwHYdKa/QWtoiGHf73ksYHoxhQYkeZmMbSf+bA/zCPucElCeGX7?=
 =?us-ascii?Q?DZ5B138rG19txTBOzijVd3WO4pdZpe8uwNeFLEftobd1fJ9xxjyZS1wv8stB?=
 =?us-ascii?Q?UvRz2Iac4pruW3yxnRKGUNYyRKHs2004KprjPe59+dyTSD8jdcTdbdJ4dXXU?=
 =?us-ascii?Q?i0mPSPbFeE9myjrlkssj+Fz/OhqY0kE3XMZr6GzBdUNs2QbDRM7IwJfrH89T?=
 =?us-ascii?Q?x9w+yU7/mOIEKE6dWRbY3+Fsd7WLisl1557ZJZ8CLAe6XdVixTA7sn9pC0ar?=
 =?us-ascii?Q?xalPND9YIyG/gxPg1fEaZ/e28r92/OhHJ5eK851K6rsCXmQYMCui0sDkckY4?=
 =?us-ascii?Q?bdsDdYAz9qyPOYMSPkmLmEtFstcnpH2RLzq2wL/7R5Fx81AIgtCALrIpaFzO?=
 =?us-ascii?Q?6kaTL3DQyo20K1B3hos3cvLdpOxyI3c6WmZFSVQ78VzYRLYVgBijuw0rAj16?=
 =?us-ascii?Q?cEBz2VKW6ZKHUFeTzvz/KfJTyPkcq4evFeJeCh6fYdDMubck79sYGH0VB8mK?=
 =?us-ascii?Q?ol7t9dqio/3Gc6S/O4d0iI4rQVCv07xVcA+Sd5eQL2T1r7dVj7LszEc/tnJe?=
 =?us-ascii?Q?FSOrvh3kj3j9NtwLMj3RzrCI8nWrkVOs+BoCPpfVy6fxoMqwr9IPXRh63/Z/?=
 =?us-ascii?Q?yClTJa6/92dSVdp3jF3MRIRBqVh08DztWly2N0eZrkgoXfwnINGbiyAOqAXi?=
 =?us-ascii?Q?DgDWwJvShJiVuFuwrfwl+KohNhVVa0VVjtHo0tUit/tOoubx+/7GamsD8soS?=
 =?us-ascii?Q?qkya40SAn8Po4VH+HSSAoORJHyl8HTZgFUDtQw8GojaIiwUPswjOskwb35eb?=
 =?us-ascii?Q?fYE9SPW+FtYzX1+tsRio1EhrMmgNnHXt/GoAdG4b+LSFNDCGiHG1UxfJYrYZ?=
 =?us-ascii?Q?BGchgUuB6lFPBVuwHqc8nbM1NChBpnX+BljVzNlaT8CRipimR1/4d9tFIleC?=
 =?us-ascii?Q?kuL5Y1QBSY/2vTzIe/3cC2ixIPCGg5IEG+VO6Z6IagLfd2tm18n1mD0g6a04?=
 =?us-ascii?Q?4sHLhADxIf313v/VR307OwVRGLP1xypVwEmBuE1H9QoUVDK6vzNgtwd+ICgm?=
 =?us-ascii?Q?3fB5bpeUMJBxrq4jbI2pBfYLpbosXyyfP9ukv+Dmn9j2V+WfIutBKx7iV5uQ?=
 =?us-ascii?Q?pFq+GTKq7zlzeI4P1TWmAKFB7aPRU0B0Q67LV+kj218NVQZvWJYtJlHRnRaZ?=
 =?us-ascii?Q?gHSfcFwF0fnyQvtxTv26I1mRGwq2Ty2sQc0/92qtxx+x2t120g98O84rUt2L?=
 =?us-ascii?Q?0KOHEnGXs+QUu21lY7BosY7Kqnp7l2DvgK45w6EKSsuZRjhCGnhuEpY7/IHd?=
 =?us-ascii?Q?4dZqLMvaSnEkmAjIdLHXf3Ow6u9dct0RilWFjvR2O9DCcHbCbp51pvaiTkms?=
 =?us-ascii?Q?/uRuF8BsMUkdkSY73ic8aoELKdKSLB05UyikhZ3q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d254e41c-210c-49f3-a8c6-08db1892b554
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 07:17:39.2384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy4afgMQuZRmTbea4W5BLV5f4kHFoS7I154NqbPbhi/bYQWi0yqYrCq4uoZdGN+K3MnRqWMlImqYD5+X8ugLVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As the snvs pwrkey will be moved to input/misc dir, the build config for
snvs pwrkey also changed to follow the format in input/misc: INPUT_SNVS_PWRKEY.
defconfig need to be updated to align with this change.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7e0487bbdaa0..938b4231c81f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -405,7 +405,6 @@ CONFIG_MHI_WWAN_MBIM=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
-CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_MOUSE_ELAN_I2C=m
@@ -420,6 +419,7 @@ CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
 CONFIG_INPUT_HISI_POWERKEY=y
+CONFIG_INPUT_SNVS_PWRKEY=m
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_SERIO_AMBAKMI=y
 CONFIG_LEGACY_PTY_COUNT=16
-- 
2.34.1

