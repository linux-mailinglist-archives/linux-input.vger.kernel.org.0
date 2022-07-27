Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6195823EC
	for <lists+linux-input@lfdr.de>; Wed, 27 Jul 2022 12:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiG0KMt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jul 2022 06:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiG0KMt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jul 2022 06:12:49 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492681277B
        for <linux-input@vger.kernel.org>; Wed, 27 Jul 2022 03:12:48 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26RAA2mq010359;
        Wed, 27 Jul 2022 10:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=jlrbyBuwVKQGrXjZ7xzINbkxPzZxfe2aYxep7iTHnjI=;
 b=oHBONTOYgxthrl+51OxYs+ypL/lOywJw6sQ7fcK+gi1P3elWytLSkZxAqcvNJZKMJ8po
 ZJ5nVmB0fjEfNhxXb0XcX7J4HcVCiVZEdA11BnGaF6g100k99IRGeaclUtvLrgohIOLl
 qj6Qd8PfqPJoO560ht8wLYh+ZM/PPPZDVLXkofs4SOn3g8KbgUpVVe/ltQlPFm4wKZZP
 QauK7FlLMAZcktkg/5MX2JS1euXKnZ2qpSN45ogqc6YVrjhdBwKySRqwtnLBRmX6a8fU
 YFF0gHPKMSseY7VrWCYWQ2nkWtpvTMbBiaU/3KmsLC18sAdyVuuKlivwMNcyvG8S+OB3 MQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hg9a9h4m8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jul 2022 10:12:46 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26R9iFdr016642;
        Wed, 27 Jul 2022 10:12:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hh651qm0j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jul 2022 10:12:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgaaRSW1piMl1gNJdVg+CV2mcTGTerEqmBQ2qqP9N0eaBsM7ccY10+eZVqm3qSFC8QYP9GT5d5NIqh/i3EhSqBy4Ftz3s8XAaqpCXdKeTdIJ2RrZ4Lxk9/uIKiVFs4RS0H6hWl7pgnRm2G84KqBs4Y7gK1wvHWl9KDVX6zy9DQCZ0iMRXC9Ki1B8VqGmI5OVKkImHYQJ29QSx2ewguqx2y1DVbbx5JrDf/kgNDHr3C4A2gn1F4Dxa+j5AwFpKiZ0iZnVH8necloEeNuECOQ539cm18LhZXrcJsICgH5g7veKpq0u1KfFy6nnUfzMw6HX8FOAvoHeZSNa2Ph1pFY9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlrbyBuwVKQGrXjZ7xzINbkxPzZxfe2aYxep7iTHnjI=;
 b=gmFto6bYl59hWvo1xoH50gxyqNAQoN5zyev32EhftKA8m9QPKmcvyidQUTSr6piQzvwu8u4LKiSY8IQA2BQ76jLtb88WyBAmfi6phtu3kh/1ZXK0/e0r0xHDjPYscudsLeDnzrel2AzriUf1RgI+wFzScxlEz/QHFa9A6cnVdqtcvNUV4sNR1mgyklHkTv7iOkdXzQKkTQE9qmlfiByuyfDqjNl0UPzzBXz11ZXTeuKSUTbSX9pkSYWkUEOTOfv/odNAifaYxZGAoehktrnpDPCRWs+h62LCaIPPqwZA1L6GpNjCuYqchsBqLdEhmyFsCxDIrUOIPegINR/wynM+yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlrbyBuwVKQGrXjZ7xzINbkxPzZxfe2aYxep7iTHnjI=;
 b=DBYpyq7s3sa3ZMrcot7XBjVvVn6sR/2gm5X57mZ+gIgIO30t0Fsw6NmdTpdi/mYDlHswWgYlWuCs2CtZZHtsQ1wn8tm7wbxjA/68YNWh0BZ/ip81QLK4spjgAxJSiIo46foKlMaS7DJMQ2i+wHHvcWKdnMzIDWrxEv2FJk/8l8M=
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) by BLAPR10MB5316.namprd10.prod.outlook.com
 (2603:10b6:208:326::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.6; Wed, 27 Jul
 2022 10:12:43 +0000
Received: from CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::eccc:6ecd:41f7:ed02]) by CY4PR1001MB2358.namprd10.prod.outlook.com
 ([fe80::eccc:6ecd:41f7:ed02%5]) with mapi id 15.20.5458.024; Wed, 27 Jul 2022
 10:12:43 +0000
Date:   Wed, 27 Jul 2022 13:12:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] HID: Introduce hidpp, a module to handle Logitech hid++
 devices
Message-ID: <YuEPkge7M7dTgjLi@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0181.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::14) To CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d267f407-a055-44c7-e0b7-08da6fb88b49
X-MS-TrafficTypeDiagnostic: BLAPR10MB5316:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pjVDZPWafHmgQvfLnCWpS4dGvyml6Egi253WGs0z2VMwyB1b/67SEdy025iqkUCUWiIScMpEddIu+SUNXbkEhSN2OuF8hRQoSGJgx2hbXhZ0VDKESC2XpiPXpZzSDipHmCOwYeLlFL2+TseVoisCGWoil/bZPMykcJ01lfyIECABO3lT201cJJKss3ajpvL13Ti9+99TKcCEh3hNXwbH9Xy4tTq+CXDdEHlanNurGbpPIDSTvQ+mHDC484YaX3wveYAYLaZvB8DBIIvjHbgtDpyub0V/YsVjXITJECzOzNgUvVJNkdwpR2OLsMPwvmE1cPLTlvFVEvsi/mV++R/foCJAnRVrQUxPGRNX2rSh1ht/Xm5PqtJViVRciQsG4JnSL1t5V9aI92Ai6pujTkHJRMQMzSg7tMhCJJUiwJgpHnt+pkxTD7m/Xyn7rs4dkCbT1VtvksW0syo4Zt708GGJY/bpIBNWalpXPcEPNkRMPDO23FKsn8EHHFYM8EdtCxTnbc56DF3vP+svGofqKeVsZ7ejGrvPdkrvA6KqR8gGToLtMMECZSVQpnPwyjcRBQP43vyKGivKOGSx5J6xJCCMq5yqwpxe+QHhefyMdbOWoGf8ZZ+CwpqGTAy6jgr2h2drdrP3IVr+X/AyxkHPitHAOl+Kk8XG3dAfAjrTiqcdEp8Ic9OALCbxNGO66RvEeNT61xlOZ1grWqRmOlGRdO1P2IaXqXA8uNaGmAnqQRGQA14HKtdRIX2O+uLnWicELOIsK7Ta1Xaf0f+Tg+Q14tIeQBV31be7WBEAKpdUimMzE5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2358.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(366004)(136003)(39860400002)(376002)(346002)(83380400001)(8676002)(2906002)(186003)(44832011)(66476007)(66946007)(66556008)(4326008)(8936002)(5660300002)(478600001)(6916009)(86362001)(41300700001)(6666004)(6512007)(33716001)(9686003)(6506007)(52116002)(26005)(316002)(38350700002)(38100700002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxPvbTuE8urXaJP8az7wHwgaGz5hfYaEV7qrLl3AzKkcNDGYCb0A74G/ocd9?=
 =?us-ascii?Q?vKhBsg1ZbO09XWaIst0Oy+1R6w8fG9lq1fACfZ0s+NE8bpUxOZnCtqRAySVg?=
 =?us-ascii?Q?CbEhTzYwI5A6SdcINW7Op4rmE5UeMe376LGiBnpMjBuEB9UTXc4fsR1f/OYz?=
 =?us-ascii?Q?lePwy10qMo1O7KhcF1jTKIrFTUHmDy1qbeZesxZBe+qasT+O3dznbztOS6wX?=
 =?us-ascii?Q?TxHuPk9Jp58SEHgO0mR09t+BosCmuQN/DbNSB5ZAzVCAIXeGUt5GX4mmoqkw?=
 =?us-ascii?Q?koN2b3KVDvHaVvh565vNYvfV2pHYBp+czhDry4JeMuGns9pn20JNaSFbsU8x?=
 =?us-ascii?Q?dY9m6o+g/zqoFm3QXIxaucPyhY4RwIurWxUQRjSVg17lmQhGRkk/MvLeLdoI?=
 =?us-ascii?Q?6aXBdgWTGymEAg562StG/fGbNRLEceLZnVM8+jklDxwNIpI4EIzHBsmkZxFO?=
 =?us-ascii?Q?FHBEg3YV0RJzKuBXU0rIprk8dj7xxsKUeXocWusWoO8o1qZuSSFF8FaqPpkn?=
 =?us-ascii?Q?zAHODfC+yzTshWvBIp6bLgKLollwvysPYT1bBvbg5QGwQu+fy6ygEVNlKkFX?=
 =?us-ascii?Q?togB/EGJb8SzzNLB+NvMRJkPzKrNUn2CDx3O6TVqBZt16s1/2pXahMjedAML?=
 =?us-ascii?Q?qC8ugYiP7tAgp7aW+pRl7qHqxFPrfj1geS6jEP/fHoRn3oaZFWQprUMbUf6q?=
 =?us-ascii?Q?nN3+oG3B7VJEMXbPUmjq3fG+fyEiO8Xi2bVnl/LIoeHqavO4Z+v1X1VeOc9W?=
 =?us-ascii?Q?q2I3XqAvpyU5f+EdGbQF21SqH2CWd+1LDlKscrD4GjeHqJxbkerNv0CNQEo1?=
 =?us-ascii?Q?jLledA1yW9YNjvktKyeq+jLH72XUAR5OGnJOf7gPI7rKUc4J68rcTgca18R7?=
 =?us-ascii?Q?vXlDkc9mB6BDJECJzwvdTTHiWKiHZEVDa/ejtLA+Bamy4TIWUOOUBSV7dYyh?=
 =?us-ascii?Q?dIwLwFQLWMC+7I+uojK2LQD9gctqsyfmTMXhiZj8TVop2iuN/rDMt0YNxrHT?=
 =?us-ascii?Q?OqejHNXcBW1MJ1UJJw8mjYsb8sLgGxrxM8twkYakqmAHBz97ZMJQT05y3Duk?=
 =?us-ascii?Q?D4+yKX2IpbncYV75MkhO7jBm8ohORdlG8VlAgJEnQm+9lNQT8TIziYZugs/G?=
 =?us-ascii?Q?XRfWGABWX/RHJ+BOsWkuB05jvrZ6U0ZraELYT4SLj4f8RLirxtdizFzWdnuk?=
 =?us-ascii?Q?j3ypk8Fls3MGc6XmLGCgcmOQwFvu+orXRGRUxMOEpK5hQiB7lb/eb7rvr4GV?=
 =?us-ascii?Q?Kj8/9KVi6v7aMXu/wkKdx0tb124wLKdKZCrqCPr3u1ZkrepmwJE7E49W7RLZ?=
 =?us-ascii?Q?5aAjartJHf6Y3/hqxUR/Ae4clqvsZFJIC96UEIYCaEgmSwC/M2Os5LRX2ZGD?=
 =?us-ascii?Q?Z2zRNUb19LUy1M1yMVaAJTfHir/OeI8C2fcmZ7eH6yEkiJbnrmASWbu/RwnG?=
 =?us-ascii?Q?Xftp7YLrnYRpAtN2lBy0HzmUTzk6cCKar2JHB5oB8TRoNOVeo2d+PrECm1I3?=
 =?us-ascii?Q?37zhdwSyJcQbTRd9AdmWggvmTUikHD9s18L9p8kUSCbBpDg5CEah/yjnEkjD?=
 =?us-ascii?Q?53aASCPd2fDQPXaBL3SupinADs5BD67Qy7Dcht4+z8x4Ad5l6hqb5UuMxigW?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d267f407-a055-44c7-e0b7-08da6fb88b49
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2358.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:12:43.1324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNYHBRPQPaQ5HlP3GMwOO4zNYej1CIxtGqbXqhkssYSq+rN4SDT5iJALQk+Jml1rfNSlXHfuR3VLJJLjhMfPW/RlbmVY7ZACUWuDnqyYJ0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5316
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 mlxlogscore=839 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207270042
X-Proofpoint-GUID: cTjYD0fgfOuEylqzHktHHPSaQ17ziLy0
X-Proofpoint-ORIG-GUID: cTjYD0fgfOuEylqzHktHHPSaQ17ziLy0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[ This code is really old, but I was just looking at it as an example
of some Smatch warnings around hid_device_io_start() and I don't really
understand how that function works.  ]

Hello Benjamin Tissoires,

The patch 2f31c5252910: "HID: Introduce hidpp, a module to handle
Logitech hid++ devices" from Sep 30, 2014, leads to the following
Smatch static checker warning:

	drivers/hid/hid-logitech-hidpp.c:4205 hidpp_probe()
	warn: '&hdev->driver_input_lock' both locked and unlocked.

drivers/hid/hid-logitech-hidpp.c
    4117         /*
    4118          * Plain USB connections need to actually call start and open
    4119          * on the transport driver to allow incoming data.
    4120          */
    4121         ret = hid_hw_start(hdev, 0);
    4122         if (ret) {
    4123                 hid_err(hdev, "hw start failed\n");
    4124                 goto hid_hw_start_fail;
    4125         }
    4126 
    4127         ret = hid_hw_open(hdev);
    4128         if (ret < 0) {
    4129                 dev_err(&hdev->dev, "%s:hid_hw_open returned error:%d\n",
    4130                         __func__, ret);
    4131                 goto hid_hw_open_fail;
    4132         }
    4133 
    4134         /* Allow incoming packets */
    4135         hid_device_io_start(hdev);


IO starts here.

    4136 
    4137         if (hidpp->quirks & HIDPP_QUIRK_UNIFYING)
    4138                 hidpp_unifying_init(hidpp);
    4139 
    4140         connected = hidpp_root_get_protocol_version(hidpp) == 0;
    4141         atomic_set(&hidpp->connected, connected);
    4142         if (!(hidpp->quirks & HIDPP_QUIRK_UNIFYING)) {
    4143                 if (!connected) {
    4144                         ret = -ENODEV;
    4145                         hid_err(hdev, "Device not connected");
    4146                         goto hid_hw_init_fail;
    4147                 }
    4148 
    4149                 hidpp_overwrite_name(hdev);
    4150         }
    4151 
    4152         if (connected && hidpp->protocol_major >= 2) {
    4153                 ret = hidpp_set_wireless_feature_index(hidpp);
    4154                 if (ret == -ENOENT)
    4155                         hidpp->wireless_feature_index = 0;
    4156                 else if (ret)
    4157                         goto hid_hw_init_fail;
    4158         }
    4159 
    4160         if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
    4161                 ret = wtp_get_config(hidpp);
    4162                 if (ret)
    4163                         goto hid_hw_init_fail;
    4164         } else if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_G920)) {
    4165                 ret = g920_get_config(hidpp, &data);
    4166                 if (ret)
    4167                         goto hid_hw_init_fail;
    4168         }
    4169 
    4170         hidpp_connect_event(hidpp);
    4171 
    4172         /* Reset the HID node state */
    4173         hid_device_io_stop(hdev);

We stop the IO here, but not if g920_get_config() fails for example.  I
would normally put a hid_device_io_stop() before the goto, I guess?

Unrelated, to your driver but in ccp_probe() it calls hid_device_io_start().
Should there be a matching hid_device_io_stop() in the ccp_remove() function?

    4174         hid_hw_close(hdev);
    4175         hid_hw_stop(hdev);
    4176 
    4177         if (hidpp->quirks & HIDPP_QUIRK_NO_HIDINPUT)
    4178                 connect_mask &= ~HID_CONNECT_HIDINPUT;
    4179 
    4180         /* Now export the actual inputs and hidraw nodes to the world */
    4181         ret = hid_hw_start(hdev, connect_mask);
    4182         if (ret) {
    4183                 hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
    4184                 goto hid_hw_start_fail;
    4185         }
    4186 
    4187         if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
    4188                 ret = hidpp_ff_init(hidpp, &data);
    4189                 if (ret)
    4190                         hid_warn(hidpp->hid_dev,
    4191                      "Unable to initialize force feedback support, errno %d\n",
    4192                                  ret);

Should this do some cleanup if hidpp_ff_init() fails?

    4193         }
    4194 
    4195         return ret;
    4196 
    4197 hid_hw_init_fail:
    4198         hid_hw_close(hdev);
    4199 hid_hw_open_fail:
    4200         hid_hw_stop(hdev);
    4201 hid_hw_start_fail:
    4202         sysfs_remove_group(&hdev->dev.kobj, &ps_attribute_group);
    4203         cancel_work_sync(&hidpp->work);
    4204         mutex_destroy(&hidpp->send_mutex);
--> 4205         return ret;
    4206 }

regards,
dan carpenter
