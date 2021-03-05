Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8436032E067
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhCEENG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:06 -0500
Received: from mail-bn8nam12hn2244.outbound.protection.outlook.com ([52.100.165.244]:11616
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=blyI5RGP4iPzN6T1QknuLlhwQQyUzkVnSQBDhWb7iWdPAvrAZPy0djP7P5fJKFwz5vJNliohIU0JQ6hlquXabWFKx3TJ1/2McNT9KfKBkqLcqU6gx5L6BbnhCJaOuOWgpq46q595nuP1MH1mUFDF+PWYRpsNxY2xgUHKR6mueVJJKDXboiuBEsA79uzXl1UdxBsXzELxDYUQhF6FxEW0+Ml76jvXICqP2yBr5/JsfWs/AlDjrf1D9epkpoPQrAyw3I2rQ3k4z6NqVzyCOhQevVHzps0L++nJ8d5SxzbvqgoALfRv2dKaaoOAfXsAFQBQ4qtyDxruUIE2zwUhX27I1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRkLavJ5qhuDK7vNcD+/hAlXyGhEVuch46iBjIyE4hA=;
 b=X42reSioCeMKZupbbSbI8nivKasAxzr4Y7WxGL/TrGJWKZ5AaCDj0XsvWoqMuGWbhbF/or9+S9ESD8HYcODa5jyNcPLJSwdYqp6ej6pX+/P/oRMD9uiraDcBAalKzjKfUfDHROSUT7qTn8GT/fF2nBInPnMmwYKhvEgYnCs3o18PCGskwtmTQJl/vx2000/dbCsIXHQ5GCFBWUPFE8Z5g9wguGxRIz572J1iYHISXuaizGSNR44s5rayWCOozxXeLgd5rHrr3Y0WG0cs3kOO9Uiw2u4FXpdgdXaYrxM/MZyvWtkIgRCaaH6Ml5cuKNPTJ5RQvxKexF6ik4kEG7hynA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRkLavJ5qhuDK7vNcD+/hAlXyGhEVuch46iBjIyE4hA=;
 b=vUZGl8j/IZRAVBJsAZKOYqlfytueX5aqS6BmvIS4SjvOP7t+LebjB46WONKHRIeuH63kNxN/v+Qzoa9d+ic3fuCVDTpVPmlWAAQ/JYty/gxHT+4C3zfa3pnHrfXstj4W/675VHzBDxWZQlGR7oCuDFVJzjKdznNa7+Cx46mPF6Y=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB6112.namprd08.prod.outlook.com (2603:10b6:805:f4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 04:13:04 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:04 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 1/9] Input: iqs5xx - update vendor's URL
Date:   Thu,  4 Mar 2021 22:12:28 -0600
Message-Id: <20210305041236.3489-2-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305041236.3489-1-jeff@labundy.com>
References: <20210305041236.3489-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3adf9b82-8724-44e9-9585-08d8df8cf916
X-MS-TrafficTypeDiagnostic: SN6PR08MB6112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB611259934F3939CE57AF8146D3969@SN6PR08MB6112.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8wMbkx9LUYBUcS4OLACPhDSNq96BEexFG1DyQMJLtb8CpcRlT9433tSmYW7l?=
 =?us-ascii?Q?3HZbRePtjvViKVn+SoOOyY8eJjAo08vZ97p7CwidLhIHeylwoETyS85BYYre?=
 =?us-ascii?Q?p4DqT/wniUyfcPOMRz9NNfRgfjZy4v35p2M/APZwrHlw7t2z8T6XdjmmCpvc?=
 =?us-ascii?Q?2Xwdnzz/+pV1oYLyJOVp+l0WZCiI/ZHB8epNHUEYbDvS6YTVmpjWDIpM81PT?=
 =?us-ascii?Q?l06B9qn8VjkMs+OywlPZeQBE9/QTF78qDuGpgMWzQ+q7kaHNaWviB1izaRNx?=
 =?us-ascii?Q?6NpIsZfPqzsTTkbz4UR3CLvmXChg64Lv+WbkNJNYJeiOisF16rBQfqJLP0hZ?=
 =?us-ascii?Q?Y/QQse2aKFSb3uEA80NHWDKYcvmHwgIzIfI97JBumZhEqT5UZ1B0OOGSgnIF?=
 =?us-ascii?Q?yvJs0M2DNPC0cT7l++T4DrSSQeudHvpWvs+CjcP981JuW7ao/rHu3qMD7g1T?=
 =?us-ascii?Q?uHq0RQQmlOYui98i0ehU6Abr9N9RC+QBsh+prpAiLVoB9DGP5+ATFc8QE6s+?=
 =?us-ascii?Q?7bd/mZcH/fNU7drm1en9YS59/PJzluyqmGkxcRhGQcSVKhb38qw+5EzTRsQn?=
 =?us-ascii?Q?xN9le4ZRV3NekrUC2inXD76wNFAcNViTZJdjeBguDa7nJQmbPcXePGn0evim?=
 =?us-ascii?Q?br3yGnGWLrUoBVMH6CeiAHYLD+8XMfpQw1Y2gu/Un6OHJV41C/DCECpUSq0v?=
 =?us-ascii?Q?65J/NU4GDRYnJ/Y39PiEMAaEe+iS1UydWl+Xp7JdVIlUiMdIU1GGMI/ZJul1?=
 =?us-ascii?Q?WaVOEbvLlsgWCbGCb7gavCw1Q2G+gfADAo/RDRXtVoim9lV+WH+rdb7SZXz7?=
 =?us-ascii?Q?o2HTvvhTn26kuWLxKQmyAVtqffO8JsauwXXGGe6sDvaBEshKLdw6U+sr3kmY?=
 =?us-ascii?Q?c6RunPN8TkA6y7nDPGDI9/qtSmxslQcmVaCOq4o94Ua/00L6s0njSO59CwLW?=
 =?us-ascii?Q?IN1rhRgSNNucJICArX0SZvQJqgDvHHi7I+L8FB/LfBvjQKHZlc4q7O3FJpPj?=
 =?us-ascii?Q?bLYx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(346002)(136003)(39830400003)(366004)(376002)(6506007)(66946007)(36756003)(16526019)(186003)(66556008)(5660300002)(2906002)(966005)(1076003)(4744005)(66476007)(4326008)(86362001)(316002)(8676002)(52116002)(508600001)(69590400012)(8936002)(107886003)(6512007)(83380400001)(956004)(2616005)(26005)(6486002)(6666004)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ie8003LlM9hVA4YZMHxLCYhzQQl6dqsY54IOnlnIbscaH701Pk/1YisjVWZe?=
 =?us-ascii?Q?iKOuIPGkx16bCYb9ZbfoSUJaFRwsU9JUNQjU/108sY7pIwkPSBGC3anc+yl1?=
 =?us-ascii?Q?NM9Jx1qwURhDWdLc9mrv7FeNN31VfCkOH4lZiR8kroFzctvGC/sM1fIXIakW?=
 =?us-ascii?Q?3068sW/RiPGivTnuQHNWBYnzglUTurscjBO6qD98DwsaNALYDVbAyvraQpGT?=
 =?us-ascii?Q?6IH3Ya0OaUdzAaHIRhdVcU78zYzUraom9tkElWgSESczj7x4+V+spOUzSCXa?=
 =?us-ascii?Q?uL0rCV7pjzYgy8T5NwMYxoBOvHLFqJ3nS/nfEW40vUnK+xZRzUgYuhBJIFqT?=
 =?us-ascii?Q?WwhqjZrp9YiWaxlO4kdSia+gn+yzV0yy2Njy7AGrdXepX8siuWsf8iEjIyuu?=
 =?us-ascii?Q?6JjLb3T2oFQS78VD/tx67XSULyPIF4bGJAXMvH23io8HKFRm0+UxATI3V9/T?=
 =?us-ascii?Q?ncMs2pwnZgk73STf//GFKlIEeG43Qt2ootwhVJMhyFrheJoD78Gg39bAi7A/?=
 =?us-ascii?Q?yI1hGbN6DTsZfKvlWvNYuy42CdxfxhgC+d+kbJ02UY+VwZwPt41PK4RDgJVt?=
 =?us-ascii?Q?opXl1GdpuOoPxdCoSdMX2c1XKnQIniXMt2yXzwwnbMUIJe+xz+8E4tZFbX/3?=
 =?us-ascii?Q?VWtzWUQF6W+/Zyc4swDSVPx0GR4Fs4mjylcoGWBE1fdHx+eH0r/wfkl6gIjk?=
 =?us-ascii?Q?FyxE69QdwQwuE8avi+HzICzUdbeMCUAeQLVXFzPPL8EXIUCfP4y8M34P99KG?=
 =?us-ascii?Q?1wBY+hG6FUgdC/6FzobDlR+w9ggWYAQgnc65v49Q2bTqLlQlVMr8dhH18UzZ?=
 =?us-ascii?Q?rKWNFcpxpBcbycGSV9PM7+vk+ZUBejy/YFGbtQBttK7YE/JnlXxN5jTbvQzG?=
 =?us-ascii?Q?MIGYUuEYkNRrSEQL91/1x59kcv9F/vGe4uzmg0MtLjbTSxmev8+KZZb4Pqes?=
 =?us-ascii?Q?UzLmJ6mWYw8pDUIjrY99AG/4Q3dbb6PpS4MnVARnTkASJ0UjcgPySZPpufS5?=
 =?us-ascii?Q?5FU4fC/AgZW9y5Wy7xyLWSZ1gvjmJT0sqrR+98D5BbEidNF5a8wmU9IjnsCu?=
 =?us-ascii?Q?HZh6LTZ1hHfVZLHiea//YdquRkpjpMwxcAW6bvGUFSfpe2zMXkwO4iiHBQDg?=
 =?us-ascii?Q?rymeEg8NH9IKlc3AqBHVzJHFDSOKO8gAaE0RnO9U4VKVvu4W5EffpiESWFpT?=
 =?us-ascii?Q?/bi1qY2YeF1mfE7bI+3qL6tf+cj84/YokaEXmswul8QjrVSN3vA38TZFtnGx?=
 =?us-ascii?Q?wH0HDb8UAr1Og9KiSEMQnAWxzTtPawgtcSE2bCMbMp+xVGpq6vd9XehVxA+E?=
 =?us-ascii?Q?z27FGFuxXW04OO4qgwuANr+p?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adf9b82-8724-44e9-9585-08d8df8cf916
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:04.1786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rz7iNecBahNe2uzOy0TI+tpLXOlTj/eC5fqLuOB3ZJrMv0U4XReA6TwrZe18qAuykFzgOzpybsABehzRYBA9KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB6112
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace 'http' with 'https' and correct the spelling of the nearby
word 'datasheet'.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 54f30038dca4..403e251a5e7d 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -8,7 +8,7 @@
  * made available by the vendor. Firmware files may be pushed to the device's
  * nonvolatile memory by writing the filename to the 'fw_file' sysfs control.
  *
- * Link to PC-based configuration tool and data sheet: http://www.azoteq.com/
+ * Link to PC-based configuration tool and datasheet: https://www.azoteq.com/
  */
 
 #include <linux/bits.h>
-- 
2.17.1

