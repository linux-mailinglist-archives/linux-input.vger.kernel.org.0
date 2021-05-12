Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 048E237BDC2
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 15:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhELNNq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 09:13:46 -0400
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com ([40.107.92.51]:45536
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231695AbhELNNp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 09:13:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXFYSwrKJP231PnqB74AqFTNjyVoxAIWLTe54KM8GuXhzb0X07ubCoWGWu1lemCN64pLXQGIa9pxpg7Gb/1UfL8SlzK04RG3KFWLugwiLgAmm0lkqVzRYPgi2zhv66KT87LNkibt0QMqbbK4J5TLZ1ngf4PDqsd/f57QdEsxW6NR8ve7w/R/pM/jN56ytseyz3jm7PjOSK/YlItUoLT4FAECY4gWtxlrHADbDEIhvofNmivkcI8SSo4VmkfvqWXwXmEZfykGrtSf1Jc4T2P5dsjwpyrNVow0AKhJUmVoibvTFFWbEaZJi8aKmgeMekwFYrHDztgCTjQhGEZ04YWNkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9sqHgR3nNXF8teSN+CjgNFW+syzDQx8hvusf5rK29o=;
 b=VjCVBoJbIDnp/JUIxo/IkxpyHGW3Q10K1GUo3S8+d5ruHeXc9tUhtN21fLKZJXmvA5KzfOM55M/+QfY/SfHZSurpNAyhq53NGFQGv/QaqTdyCR4pZz7jVc8HzDNw3BBQaEMtdqbQIaGLIQUmObQNdQltPv97lGUSh4xt24/2He3eAJMnIcWIjnzJLkW6SWO5kTEaPe0Ws/qjLwSmgA8DfnUbP1ug4DECpBwNllS+4nA3DeFvquYaaJQeJUiAD7w9xfeePjSE4+kg2AyzOVrXhxjdifEdomQ3/fneSlXTuKlNdeZfeUo6KJ5ULaMOqXteu/GW3inAC1kNlTvWqYZfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9sqHgR3nNXF8teSN+CjgNFW+syzDQx8hvusf5rK29o=;
 b=491uZ11CPRneHjBsLNhwRuvz7BlNAEmfISbcPZk/Fvv9Y9VBYWi4njb7D00Kytze+2n1poe29GrcDaKkYhmhA865vMnn5JvZOls8kM70Fv9ZpnBEOrodyA8WmmPHGjlxyy5I3v9Y6pdLN+X+o+phEMC4KMNGFm8giplOXNdHhzo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4812.namprd12.prod.outlook.com (2603:10b6:5:1ff::24)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Wed, 12 May
 2021 13:12:36 +0000
Received: from DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa]) by DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 13:12:36 +0000
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/2] amd_sfh: Use devm_kzalloc() instead of kzalloc()
Date:   Wed, 12 May 2021 18:41:55 +0530
Message-Id: <20210512131156.740493-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
References: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To DM6PR12MB4812.namprd12.prod.outlook.com
 (2603:10b6:5:1ff::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from amd-DAYTONA-X.amd.com (165.204.156.251) by MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 13:12:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edb870ff-5967-4620-6646-08d915479ca7
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42180C5E511724659699B402E6529@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mKGf2dDp/PJU4hbLvyzZWZWcupajudpD688wPBhevorNKSFEv36JPv1GwLJvctPlWu2hVZq76ZqE77kQ/KQqPqDcu/QNq5ur4M/Vyzwor7XSRF3oCphHn4oPj/VXZro0jV5NqLGRbDSUofuhk0XXsXYW0hDzFM9U9qYa1h5D8vZnMOkcEsHqhqVdkbFnoEVq6Q57eSeMAKiYvj9kQVvspSUwqFnjmyLp7IjXX/E5p2bHajfyl526rMz8sDdCy25bmrVpKReYaz+Vhk6wQoyAVVjIRfcpEW2SDzosAfWQQQLAwsWY1ckcYjrXLTmCN3u2bMQOJsiZcuM3iulqLWS2+/e8CJvuRbcSJ4nfGWykDRB8d7NiMu8/4HhXFRciuAoSJtBGo0G+HCzz423ARmCvRpPTe/9RGjh2CZM14eABKQhB/7uWcgtFrnVvooXgQIb8/EYg02GVTnqnICjAQlR2CW0xbL1TOaBv+jB9MLSU62EJLF4ILaCeE/DLIGlsIQYUSSTp+39QLZRuGVN27WnK2exQn5xLaVYaEH2cb/llDY4HxtXdt2rC8EfaWutFVQ93e3rEH0rds2kgC5mVHJcHbj8153bp8L1nglJ1SX1kMZPb7iFtJtjB15mCvoUdKj4BGdMN7MISfjuxDO1X5nUjWR86sJrrAJ1yrasakFb3gWg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4812.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(66556008)(4326008)(8676002)(66476007)(36756003)(316002)(66946007)(186003)(8936002)(7696005)(956004)(2616005)(86362001)(6486002)(26005)(52116002)(16526019)(83380400001)(478600001)(54906003)(5660300002)(38100700002)(1076003)(6666004)(38350700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TZc/AYcjir5dPqfQCKgtEcGPoKdbA6oj4c6cZ+Y1APYD/PwG/rMjmO5Er+z/?=
 =?us-ascii?Q?C01dNbLoA0sjvH5aTGw9bHmMdwfFIpp58YgKN5AgTmTgwB8KdD6Yg56d4BoM?=
 =?us-ascii?Q?dSbWqKGi9vaV6TXiGOUu1rg5shScQEfUvgIyd5yA8qMQ4jv6/ZceQIJnd2xF?=
 =?us-ascii?Q?jotMQNdP5+8Q1ekLGTTpGF+WWYA87P6bFnNqcCm0yhXRS9p7mSE61ECxVBz9?=
 =?us-ascii?Q?IvnMoUzPJLbD65mgBCSd8Fi7hcfhkXej9RzOgYA4/KjHYLmRBrkuugkRqGOy?=
 =?us-ascii?Q?OxAGoy0AwnClLAiNCWIPUGGXBuljbKUvrNCma2PPqMUcReUlhI6V/1N2J29K?=
 =?us-ascii?Q?9ybcEIUceReCC6akKLVicifQkZSx8nPD+aA4yqxJy3k+aYu14nNCgU2vSG3Q?=
 =?us-ascii?Q?8A81lKWHU2DKHrR5Us0a4dEOp3sJujMib2LWM3uJ/7oBVohoyXKohyl/kW/L?=
 =?us-ascii?Q?2NsX66aIpqTcBEhsjej3dkkrnZOx9AGt8cVZ1qy40qppbFAOozsY2J/iZyqe?=
 =?us-ascii?Q?EJifzVa4S+TxBaGzQ6G0hwZC3FCR0+EFSoW0n3hQjAGeWCO98nMb7ZyzQviT?=
 =?us-ascii?Q?fmjbTxzt64tjRRWOz88UDaXnO37PSNzSabLEM/CtS/bX1JCQNF45xl1nuPoP?=
 =?us-ascii?Q?u2yeYCQT1pjgw/moGgozcCJ3kOv9aRYPHDv/dwLvRie5TxStK/NUVG1hvlyA?=
 =?us-ascii?Q?gv0Ofnoa7eYwZq1IQSR1E+mhkcmbzWudEPXgPf8dkphf8xx6e/pA5i/N06FT?=
 =?us-ascii?Q?pvFakGMGvqWAm0ZeyE8yTIllG7f68cX/MnA0IiU16+n26CjD1Ua87idE1708?=
 =?us-ascii?Q?cPzHBwd+DN8BD1EdPEER+K+WQwp27DcgspTIQutZGfgxLvzoI1Y/eAJ99jyd?=
 =?us-ascii?Q?6HFeL0DBAfzcDmtuDfIP2OTO6dCL5/9DurLdU3EmpyTMw4+lltWgoGwgCZs0?=
 =?us-ascii?Q?JOpNxMnRAL/fhSX5LbR3k2HyuvK1a1AjRudyY2/DDh+qhxlF3A9ajpKW/eG4?=
 =?us-ascii?Q?bZZ/nEvsgpmRxAuK7uz5hfd4X5CE0pqTAtQdGohXQF+4/1I1SvUgiyqJQh6p?=
 =?us-ascii?Q?RjrRexcyzVG/+eTJ1ldeANLCP1c/c3VrdnfVUZ+WriQw8HfjJbx6n4B4LRAm?=
 =?us-ascii?Q?X8qLbfJfYw/r0qF22r1Q7W49KZRTIj02UprPBgndhal8P7HBUDEOc3kpK+7J?=
 =?us-ascii?Q?nLDMie2Px9bC1tawOqsBrtwIjvTLhtWdFdkSM/vHaYPzZ3Tq9mind/sziOXN?=
 =?us-ascii?Q?UXlqU85RZ+SrQicbEUqLzSENpPT7PLxcVkXgIeS5cpCR8ILHe38u2rlaJ7/R?=
 =?us-ascii?Q?OihlhG0En/0mkXFENJg4BMMt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb870ff-5967-4620-6646-08d915479ca7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4812.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:12:36.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MQgZaxMUhhB7wYvPWbPnpWm+91G5tBlPZC/DoPG1GUojrkbXjpXphRELdE5EdjpRJSmiT3e2yvdTxmA6gyVJmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace kzalloc with devm_kzalloc in driver initialization sequence. The
allocation can be tied to the lifetime of the amd_sfh driver. This cleans
up an exit & error paths, since the objects does not need to be
explicitly freed anymore.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 18 +++++++++---------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c    |  3 ---
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 2ab38b715347..d04d6bd4623d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -142,7 +142,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	int rc, i;
 
 	dev = &privdata->pdev->dev;
-	cl_data = kzalloc(sizeof(*cl_data), GFP_KERNEL);
+	cl_data = devm_kzalloc(dev, sizeof(*cl_data), GFP_KERNEL);
 	if (!cl_data)
 		return -ENOMEM;
 
@@ -175,12 +175,12 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -EINVAL;
 			goto cleanup;
 		}
-		cl_data->feature_report[i] = kzalloc(feature_report_size, GFP_KERNEL);
+		cl_data->feature_report[i] = devm_kzalloc(dev, feature_report_size, GFP_KERNEL);
 		if (!cl_data->feature_report[i]) {
 			rc = -ENOMEM;
 			goto cleanup;
 		}
-		cl_data->input_report[i] = kzalloc(input_report_size, GFP_KERNEL);
+		cl_data->input_report[i] = devm_kzalloc(dev, input_report_size, GFP_KERNEL);
 		if (!cl_data->input_report[i]) {
 			rc = -ENOMEM;
 			goto cleanup;
@@ -189,7 +189,8 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		info.sensor_idx = cl_idx;
 		info.dma_address = cl_data->sensor_dma_addr[i];
 
-		cl_data->report_descr[i] = kzalloc(cl_data->report_descr_sz[i], GFP_KERNEL);
+		cl_data->report_descr[i] =
+			devm_kzalloc(dev, cl_data->report_descr_sz[i], GFP_KERNEL);
 		if (!cl_data->report_descr[i]) {
 			rc = -ENOMEM;
 			goto cleanup;
@@ -214,11 +215,11 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 					  cl_data->sensor_virt_addr[i],
 					  cl_data->sensor_dma_addr[i]);
 		}
-		kfree(cl_data->feature_report[i]);
-		kfree(cl_data->input_report[i]);
-		kfree(cl_data->report_descr[i]);
+		devm_kfree(dev, cl_data->feature_report[i]);
+		devm_kfree(dev, cl_data->input_report[i]);
+		devm_kfree(dev, cl_data->report_descr[i]);
 	}
-	kfree(cl_data);
+	devm_kfree(dev, cl_data);
 	return rc;
 }
 
@@ -241,6 +242,5 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 					  cl_data->sensor_dma_addr[i]);
 		}
 	}
-	kfree(cl_data);
 	return 0;
 }
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
index 4f989483aa03..5ad1e7acd294 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
@@ -162,9 +162,6 @@ void amdtp_hid_remove(struct amdtp_cl_data *cli_data)
 	int i;
 
 	for (i = 0; i < cli_data->num_hid_devices; ++i) {
-		kfree(cli_data->feature_report[i]);
-		kfree(cli_data->input_report[i]);
-		kfree(cli_data->report_descr[i]);
 		if (cli_data->hid_sensor_hubs[i]) {
 			kfree(cli_data->hid_sensor_hubs[i]->driver_data);
 			hid_destroy_device(cli_data->hid_sensor_hubs[i]);
-- 
2.25.1

