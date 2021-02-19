Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E9231FD64
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 17:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbhBSQsh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 11:48:37 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:32355 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229806AbhBSQsb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 11:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1613753241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=xLyFfqEWv0t4EJgEovpkNv9Gn3S3NbFhWSsuyXaJRL8=;
        b=aEwvY7Tps6DQn8gFrdp3zQTZhPCAgxwzz0z9jVdaaqOX9GNOATGn5Hxn83BYavSiyMqbt9
        fu/PsFWK2A83sihnkdZjffFiEzLxu+K6LEdRcSKvWs6HlYhhAosPw4K//bJl/QrxkfEYTO
        vYV/dd3IOqjKKoa+dAvrKLUB+aZGa8w=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-s4tM8TKGP8GDOafZehryrg-1; Fri, 19 Feb 2021 17:47:20 +0100
X-MC-Unique: s4tM8TKGP8GDOafZehryrg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jY/TjGCddZNRlugrYRmup9CHfgSRNL+5AIyrgUW0zm+pDn671PhzYg1GItZ/Dr9ZrQPIb36RK3tGDFFMwyia1Af7G0FflMfnbLHcDu9d28URKuzfCXC13gSyeC/UEn7WeqvERSt2DWoegu5QsLyJZmKkfdCf9KUykeOh21xe9qp91V+3mFNuXaOav7d4GwPUqGJA3oP1ccIQ9RXTD7/TJNoZkgPkquwP2qHdSxX7WRMDurzcDUdPPwKciPU7KbVAZmszIExbwxAfc51jxK1r5i1avU8rcn6mKpV24OtJNX27xLsk6xkCwXh9eqd1/vdmH6QCpH2t/x0gd4qQZKC4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/Ev/j5Xxfu4YJ2Yx9W6j8VHX3L7ga8JP6rbocBHLU4=;
 b=XcY8hhRULB6rmDdVDHwYVmrT7r15WU7GEJILqHrZUAf4ZmXDjAPn6IpTZyPoOgkHra7dRMV8o5be5OEn5js7LQdgYmijfWmQqsVPD3rLSp0Ttw6c+xbrGpM/X9AYZvRlTIZmUQdWPOnnajZpT8SV2PMw4EoRweVe67vUYc2iKCg00RBbH6Yz1KfD/TMwZEX5lB+dTYA0sqGPvgtM0B04/W5AxQ6OjgPuTeDTGCcZUNELZUNCPfFl7J5crFyPzusuP4cg+yijNVfoiN3MyuT3dgOq3KYwEjorDu394acJZ/A4gLJNam0gsSGQuyzDX1F3rtHXI/FscUvt6ZkXS+cdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB4158.eurprd04.prod.outlook.com (2603:10a6:803:42::28)
 by VI1PR04MB4560.eurprd04.prod.outlook.com (2603:10a6:803:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28; Fri, 19 Feb
 2021 16:47:18 +0000
Received: from VI1PR04MB4158.eurprd04.prod.outlook.com
 ([fe80::30fa:94b0:5552:c528]) by VI1PR04MB4158.eurprd04.prod.outlook.com
 ([fe80::30fa:94b0:5552:c528%7]) with mapi id 15.20.3868.027; Fri, 19 Feb 2021
 16:47:18 +0000
From:   Marcos Paulo de Souza <mpdesouza@suse.com>
To:     dmitry.torokhov@gmail.com
CC:     linux-input@vger.kernel.org,
        Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH] Input: i8042: Add ASUS Zenbook Flip to noselftest list
Date:   Fri, 19 Feb 2021 13:46:38 -0300
Message-ID: <20210219164638.761-1-mpdesouza@suse.com>
X-Mailer: git-send-email 2.26.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [45.65.197.9]
X-ClientProxiedBy: CP3P284CA0106.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:6f::21) To VI1PR04MB4158.eurprd04.prod.outlook.com
 (2603:10a6:803:42::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from desktop.suse.de (45.65.197.9) by CP3P284CA0106.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:6f::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Fri, 19 Feb 2021 16:47:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fd1b0fc-80dc-4ef9-980e-08d8d4f604e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4560:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4560B5BFA334C57309903450CB849@VI1PR04MB4560.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n9WRnMalzLRbRWOrkoWPwQEjwlM34eaSvFpDBn52K5pOv/8nvinBuB/S+LJQINOlEc0JP0JkAOvNbcpyBKYEZLZZSXsQ5wGN/TUEQMCB0t78rNnjeCLtYCXeTr/htbuetmmUSkvMlSOajXSe20CTOX3rq3dyWJxtm9FJ+OPL75Qh9E1ph4F7Du2g2Y3ZkYjhpcHEDdpbdu1M9iYYcGtwXZq0p+AzS6LWcLWS8CGdHEwhgCIm7csGcxtARbRL0xyeNQbanHtwZ1q2w6e6Lk+eT/8KKE3IBv4G0NzLaMvqiDA3AAtKqZUrSDATdMDS/hIqkFLWqqN78+KLrpD/nx4sH1Qmu/3nA+A6kug/ccXnsNENEJgNwRBvtRQABDpNeAFD/kBFqKfsPmHn3U/nepL1cfL+dmp+os4xsAb101hxLYSstSaLyOA4gSJoqxXGYqxQEXnVZDcOOoRIYFKLQ+by6hDOqvh5gQrK3C37OIrD4jfE7du2Pr23hIz72ttxzxJczfEogsa+odYQFi0SoMtOpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4158.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(376002)(39860400002)(366004)(346002)(2906002)(66476007)(66946007)(6506007)(36756003)(316002)(86362001)(6512007)(8936002)(6666004)(5660300002)(107886003)(66556008)(26005)(4326008)(478600001)(1076003)(2616005)(6916009)(16526019)(956004)(186003)(83380400001)(52116002)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Og0MGchMlukw7veifbF3sQFlNdWpOV/zlXXBnScA5Ncf4wHvbaPnTseq3+Go?=
 =?us-ascii?Q?LveaMao0nvIqtt5NWyVNm9zgdcMXYu7UoreMxYaF6/XTZExUEi75iF1d9DCs?=
 =?us-ascii?Q?xcq/0VjYj0/BYtvrba0zW5onT0pmo9zEzsYlq+Pf5jdSzX+BapWw+lS2BzSg?=
 =?us-ascii?Q?BQrOB3xMYnOm0Vo0WEQiOsYzvKcBpzRNHCqj5/9aJ/lR1adMHKEPJ8evZMTb?=
 =?us-ascii?Q?zLl9nVGHZEqKXWkcCixldVSuuoNXc63sPLf/9daU2gsO+QP/NTpMb/VSK7Ah?=
 =?us-ascii?Q?MVvvUa+k5b9im0fOYntCyMpFj5BTIFUTS6g1tBUjMAPH86YLezXIyUCiPNcs?=
 =?us-ascii?Q?FCM/cw1Bjq+FFZnYz8m16FK80acFOIy5vwIUqxT6peWqE8gF7AtYU3FVkJmx?=
 =?us-ascii?Q?Mez0QoI+PTKOITnxAuCFKSEpCBOq2JtH+cnPVFdCKIPPyqZbiQuzLh7ghLL7?=
 =?us-ascii?Q?J4s/Ulfm4kVe7Y/d7xclfInoWjqwQbybM5yOVRRg64yqNKrdfeSWnk/VjUux?=
 =?us-ascii?Q?OeU1bgdshOzA7pDXrkapLNdu620MNTw/rgNg5vAp0s0LWOwRaN02L7hqQADg?=
 =?us-ascii?Q?hen56Hm3G+Gst4nMJvmWrQykXLgMn/5ilcazbvT6wkSN1RzIKHB5OPaJc2hJ?=
 =?us-ascii?Q?9alMGl6rnMIoFdqDEQ0iWgE+X2H0O8RwbsqL8XAFSzzoep1jrmMpaXmI6Wug?=
 =?us-ascii?Q?FT8AYvL+AZfmhWN4loS8SH57SL+jQUkAklKQyzQ2HaIlJCo2mJL/FaDsNq6y?=
 =?us-ascii?Q?J4MBEpFhkPmRZl6h0lggAM721XMJodp1tN1Qy2ZDEPTYoYpaiBYx2VqhJCWl?=
 =?us-ascii?Q?NCv6HOMcDxRzLh84BHpWGcw5f40sa27SZ5OVh/XsB2UXNmVJDqd6shGtiBVk?=
 =?us-ascii?Q?dfR+i8/5Y3G4hqFCz09W8VrcsEh3yuZmnnRc6Su2W8D+tVsJJLJe7k2fl7/j?=
 =?us-ascii?Q?ogUzzHN9y2yOD3VA5WvfAuvT0Zdi25BD2uNoiEJzqnALxgwbST1MCCPxDMoB?=
 =?us-ascii?Q?SQsZRqQZPkDoXuJQOFtd0rd2ROgnouYHaVRl4MWtxcApNz8hfrvaDfffXWBE?=
 =?us-ascii?Q?OXxdbXbrUeeN5imrEuDFpFJgSWlwO9ML/TcK3v0AusSSis0g6zvIxUS2wm0s?=
 =?us-ascii?Q?+VbgADgN9MIThuYITVuco/czNa5qpYxZYRCxsUCc29ioYP3cAbgiPo0xKwPg?=
 =?us-ascii?Q?FEuwXkDeRSBc07IEHzClmspJ+KefiLVqFrTI4HJ2jA45ozyPDmT02Fdbtuig?=
 =?us-ascii?Q?gOVg1NqfxwGlCUiKhxn7z62dqaq4TKLJZz3RxITay+LLW2ELOS4YF0u0Dnd6?=
 =?us-ascii?Q?wefcjsoGQk21SzQrc4gBtlv3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd1b0fc-80dc-4ef9-980e-08d8d4f604e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4158.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 16:47:18.3536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0SWpuiImr4U5NVm+kTuBXjU5HRi8aeUamBpFxVCeOgANWb/1Rz5T8unMBxH8o+Q5uS5+Fbs3cw87Wg98ZsKrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4560
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

After commit 77b425399f6d ("Input: i8042 - use chassis info to skip
selftest on Asus laptops"), all modern Asus laptops have the i8042
selftest disabled. It has done by using chassys type "10" (laptop).

The Asus Zenbook Flip suffers from similar suspend/resume issues, but
it _sometimes_ work and sometimes it doesn't. Setting noselftest makes
it work reliably. In this case, we need to add chassis type "31"
(convertible) in order to avoid selftest in this device.

#Reported-by: Ludvig Norgren Guldhag <ludvigng@gmail.com>
Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---

 Dmitry, it seems that other laptops also report chassis type =3D=3D 31 for
 convertible, like some HPs and other Asus convertible models. What do you
 think about it?

 drivers/input/serio/i8042-x86ia64io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8=
042-x86ia64io.h
index c74b020796a9..9119e12a5778 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -588,6 +588,10 @@ static const struct dmi_system_id i8042_dmi_noselftest=
_table[] =3D {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
 		},
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible Notebook */
+		},
 	},
 	{ }
 };
--=20
2.26.2

