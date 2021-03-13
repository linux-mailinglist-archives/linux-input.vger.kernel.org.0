Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356C033A03F
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbhCMTOH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:07 -0500
Received: from mail-bn7nam10hn2244.outbound.protection.outlook.com ([52.100.155.244]:1777
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234348AbhCMTNk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7QWZc9guHICvp2/VGdA7izUmLQe1kRLK/ScTkSAPR6vkU1gaz7uhJennXROP/50noZdBx1A5yWHgFO8Cg5nbctbnre4KufIPKudXzFZktqvNlxWfN87FnWjvaXSm05TsbaS0O7l4Jw/PdbQ215B6nvCYWD1Ow4sq5MFoEzIycLHZL2nfV43jVhta0Mz4FrDATeQXWsgePkCgla5U8RmBRJ8GzdFHFfEqx/OBXCgsP4JHekf0inAfFH7nHeHaZ8fLys0J/np4NS5sBtbhnziEoP3ONvwY9xfBmkt/TAaAaiavrHihh3MmHi6L9txX7PD1OZiXRcCYLwlejqDBoZH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBfhqSK7tfqTCAHcCCAhGoWvVbCQLFO9RExAHjoQl/g=;
 b=IR12YGvz+IK9MRq92aXcETq67NjPCWJp5ZD5P2rb/DAdQJYz07JVBBOJt/MIXHI18Gai/NIIJZrxszOIUMQLWcnCfAV+gWP9RHNVsMJ0eyKUS/FEUJ4JPn7n2UIXZiqDwsIAZUtf7vg9wEF1pR+PUxq3xhhyWMYUAtKOn+kcFC2zfK9L2grTuIyHGpxhH5OU8UJ5GDXseoJYek3gHAO0Un5X6Ewmb/IusWcioZreYCECHgeAGePTrTfw2O3yVbfHVq3ku3aO9TgWRyBuc/VhkAXljDAJVVnKbFQqP6AOkK3jW4+g3UB7Hy0gurkJ/LFkWDMBwpml39sFbzTXYddfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBfhqSK7tfqTCAHcCCAhGoWvVbCQLFO9RExAHjoQl/g=;
 b=RfV5U2AcTbMD4RKM1+6/r6szQRZW3C3oZT0Yi/3a1wAUU3ixv3ncRUFNaP2h9gsEj1YpzGPQm43Ol8FnCsubAsFK5Icj3/QG6+0+1/jglYkj+H/FJ/VQyie13K47cOAe/83m8R1XZuG/Hs4Wn7jlgFhBwUSEA0mTIEfwK9kHXVk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:39 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:39 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 7/9] Input: iqs5xx - suspend or resume regardless of users
Date:   Sat, 13 Mar 2021 13:12:34 -0600
Message-Id: <20210313191236.4366-8-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f2d8429-008e-467c-2f96-08d8e6541bbb
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5694FB5192E7C24C70DBE37CD36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ye6WGuQfvWXDR/7Zt8hH4czpRo3qvnVtUSjgmDHARPEygMQfM9sKNbYPhQZL?=
 =?us-ascii?Q?0DZ3PmqfgWzadbTudamF/RMeZgnlTPHbjGUOxN/2qhjyC6xiBmpBn0kRS76b?=
 =?us-ascii?Q?SHdSUHLuRMQdyBGyj5J2PumAVHwgJ2TzvI5+ReJOeC8PJsC2WnfeScfUhQCb?=
 =?us-ascii?Q?j/GCx6LqooflcserQI4G/TYcV3UGlN9pGgHH/gbIIEBfGCywGkgTA2os36kl?=
 =?us-ascii?Q?guN3raK2v+w3p13lQuayl4EdIwetVARhHqgnHqxsACr9HgVRRFbGlKnm2htr?=
 =?us-ascii?Q?eFPXQtALWWDJOIo2QashTbtJIYlJMG2rGsxO9aZ390Ip2Cw9t1Nuzc/SbIMo?=
 =?us-ascii?Q?7lZMOiNVpDQghvZNAapIzZvFbgJNsleI/RgBS1sBYAVtbdovZgje+F+SUCw0?=
 =?us-ascii?Q?Nuv4OXuhF+sQq0ss3rJ0cc2n6ZyZQiAF9Z99CU6g2itB15h3V1b0EpblbewR?=
 =?us-ascii?Q?vBumr3DbuOh+BbKyljKp+Ar9mVnN8kOiQi7yWswAF54yKl8fEUilzDI1e/qv?=
 =?us-ascii?Q?90AKNXV+0GjdfcPlFL052ejJ/VzV+wojX5y1Gu+5PjV7WIh27m5Xv2rrfyav?=
 =?us-ascii?Q?fkf25nA8AtDbOkk243AxsQpnqxC7K4Rr8BZkI7rFZJz4611NYvnnmN6NVnyR?=
 =?us-ascii?Q?ydnAeG6QUO+y81Aa3BHzCW8MbPPS2uTvNprUYPaGOqLYtq4C9xjXPgaQ+42Z?=
 =?us-ascii?Q?iGipe9oK+JQ7C3Xi2bNa642IXqRRcuMy/DUhxZpC3EbYxfY9ecn9cNlGUi5G?=
 =?us-ascii?Q?Qq2UJTdDoNl2uI5ITo5iqU/0XnB1KzA85quqUeAHqGeptGpYYNokNPld8zwh?=
 =?us-ascii?Q?uPgtLwbiLJvWP2+MBul8D2QQY1xgshvC+O2KhA7VcEPmYf/smjpYgi61nH25?=
 =?us-ascii?Q?h1A8rWcv4vkobp9f64cPu9e6t8vgBUwWGk+TDBWjg3/Nn5MoeJlVPoqRh5V2?=
 =?us-ascii?Q?IBiREx9K8bbbyT64sB7RUEjve3qIA8hP4U+sDcLcizk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(15650500001)(86362001)(5660300002)(107886003)(8676002)(42413003)(26730200005);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fsYU9py03wLgy2plar+GHTxMhXqiN8VLeRhsDYglCRWODj869G1k3etMAiP0?=
 =?us-ascii?Q?RpbYpM+V+tiMKguSNTEicp6du1gHGEhlGk4Q26lSYpPwxDQcnZ3NXkjhB+37?=
 =?us-ascii?Q?9Jk0Vgj7V40V6RjcQNnG8tyzoTH5pWsB9CDo/y/rfc/958Jb5lYqAD0wKLBz?=
 =?us-ascii?Q?90AU8Ed1jYH6MLP69zPap8LoWNiqWEwvdeSRQ4nbU6eHGK26lWF0IgZkFtP6?=
 =?us-ascii?Q?YZ/16moieV4LUiiBe1YjDpaot6ElcqtfjqYq7DfBbUHGE30dCvvqcyaKMC76?=
 =?us-ascii?Q?HS0pYt7lga004oCRb82OMC5jkD20kexYa9kMiq8xlnDfwABkc9Wvci7zlAnh?=
 =?us-ascii?Q?6J1j31qrC+jeVQgF5+32GcRo1SwcFxrr/hEMTggFwSagad3RlbQucvgwXlB7?=
 =?us-ascii?Q?oGl7KUMtWfwc9i5H2DIbWVvAhjrE1bNUTc7q/3qDhxtOs65za0pkpt5mJLQO?=
 =?us-ascii?Q?E9YlkJlVO/76kR3pDkbHnrIqxQiKmhbdIWUp0DrV6igcERx4I1Qh+yA5PQJh?=
 =?us-ascii?Q?ouXtip7YI8+CGN7GsZrOvwitqWuyzfyB3k0mL6ylQRqVMREZVi2BjtZq4V2I?=
 =?us-ascii?Q?a0EOsIu+gaFFaGTffM2UbvzTgHGPtQepLpwCt+xwQAbBMcl3FV+EnJWifCt+?=
 =?us-ascii?Q?XO0NismtUwmc6owsrR0V22DJm97rGtKFMgz5EEM44zCUhWObUlqmcHhpcoqM?=
 =?us-ascii?Q?eBloccJl22WKKGC3WdCdwp7S/yCXMI6D9B3k9mSOJz3mB13xzjffmnl77quD?=
 =?us-ascii?Q?auiVkdpERLepzGuYhgVqleou9/d55RHI9Lj5Zp7vXiSMWGh41yoMjnAJPTvf?=
 =?us-ascii?Q?ANf1WtqoQoHpd5Mj79FzFtv6NeJhsSMkw5YMPu7f9RbfJ2Hzf6RhBngNKi1X?=
 =?us-ascii?Q?W4KpNNW+Vp7oDi4s+ak4RBBicb10fOeaxNrztM7Dy5JIYNm0NWTR4wBYONfL?=
 =?us-ascii?Q?fx2l6pnFGZmrhOVZ6HnuNEGWrvwz4MUSAd0SE/qWpmqaVJu9jFUaBpWd58T3?=
 =?us-ascii?Q?QdznDDm11iil4n79bsZ0bb90cI+W+HaEmA0JL9mzF/MlopF4y7Hdj47SF7UK?=
 =?us-ascii?Q?53UGOM0KGcMcZu6LEDATKIq1agdiD4nzaNsTkivlrDRg/RX5djWdYmxHqnl7?=
 =?us-ascii?Q?nlbQdAVkPRmXPm72rliWYUGkkTZ/we0WcQzF8BIf26NHVMG+uqT7iGgMGwdq?=
 =?us-ascii?Q?MXYkIlZV4XRpQbKjC/fq0v8VZrAOHNKinz8aEDz1cPfdGoUBucEEl2oBo4Bj?=
 =?us-ascii?Q?CwpKzoVDyd+LYLsjQuDPSUpKnIP0aECn0G0NKE705SMucp0vuj5hBOtH6mOU?=
 =?us-ascii?Q?ECLZIgtqPMKSaf5jHw1l05gI?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2d8429-008e-467c-2f96-08d8e6541bbb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:39.1098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5sphawrxxbsDNa7dKmbsIMTPEQ3z+vHseqqH+OWyt2eRumBXYigd2r0D0MmJnqNzkFrEsXjP5gWk4zoUez65vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device should be allowed to enter its lowest-power state during
suspend, even if there are no users. Therefore, drop the check from
iqs5xx_suspend().

It follows that the same check must be removed from iqs5xx_resume()
since users are not guaranteed to be present upon resume, and there
would be no way to power the device back up.

This change makes iqs5xx_suspend() and iqs5xx_resume() both smaller
and easier to follow. And because these are the only functions that
call iqs5xx_set_state() now, call device_may_wakeup() from there to
avoid duplicate logic.

While here, collapse the return path for iqs5xx_set_state() to save
a few lines of code.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 41 +++---------------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 350466ff6bbd..180d2618d8c6 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -39,9 +39,7 @@

 #define IQS5XX_SHOW_RESET	BIT(7)
 #define IQS5XX_ACK_RESET	BIT(7)
-
 #define IQS5XX_SUSPEND		BIT(0)
-#define IQS5XX_RESUME		0

 #define IQS5XX_SETUP_COMPLETE	BIT(6)
 #define IQS5XX_WDT		BIT(5)
@@ -442,7 +440,7 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 	int error1, error2;

-	if (!iqs5xx->dev_id_info.bl_status)
+	if (!iqs5xx->dev_id_info.bl_status || device_may_wakeup(&client->dev))
 		return 0;

 	mutex_lock(&iqs5xx->lock);
@@ -462,10 +460,7 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)

 	mutex_unlock(&iqs5xx->lock);

-	if (error1)
-		return error1;
-
-	return error2;
+	return error1 ? : error2;
 }

 static int iqs5xx_axis_init(struct i2c_client *client)
@@ -946,40 +941,12 @@ static const struct attribute_group iqs5xx_attr_group = {

 static int __maybe_unused iqs5xx_suspend(struct device *dev)
 {
-	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
-	struct input_dev *input = iqs5xx->input;
-	int error = 0;
-
-	if (!input || device_may_wakeup(dev))
-		return error;
-
-	mutex_lock(&input->mutex);
-
-	if (input_device_enabled(input))
-		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
-
-	mutex_unlock(&input->mutex);
-
-	return error;
+	return iqs5xx_set_state(to_i2c_client(dev), IQS5XX_SUSPEND);
 }

 static int __maybe_unused iqs5xx_resume(struct device *dev)
 {
-	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
-	struct input_dev *input = iqs5xx->input;
-	int error = 0;
-
-	if (!input || device_may_wakeup(dev))
-		return error;
-
-	mutex_lock(&input->mutex);
-
-	if (input_device_enabled(input))
-		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
-
-	mutex_unlock(&input->mutex);
-
-	return error;
+	return iqs5xx_set_state(to_i2c_client(dev), 0);
 }

 static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
--
2.17.1

