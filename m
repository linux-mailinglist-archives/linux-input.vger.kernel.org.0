Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728CE40DB13
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 15:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240087AbhIPNXf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 09:23:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:44970 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240084AbhIPNXc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 09:23:32 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GBUC6E008855;
        Thu, 16 Sep 2021 13:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=gqaxF0jGQvAcnAfukYN6P65kcc2d4KBjtWiwSMuZAdI=;
 b=wR3CN9x+WluBcPXQbm98cOocknVZqXukGf9bEgiATrDgSvkdgJzDBtnCF8FDS6lMTsOj
 WqXtzbkOqcQhVPSGamD/iMCtBjQx0LkACoG4Kq9foqvTCnepDUUNdN6LKaE6PZUWenry
 T8NruMj2jWzE2o3uyPeYkSL+LkIq3y3LL7+UqxCFOPbONhZTo3GqwgPVnCtfTEbf3Pje
 /I/ToDUsdipYv+ny8e2zMA4JuWI4rIHkVmiyAqRiTASdk9OsxmWNDKZlC3kp8szRhMV7
 z4p5PREIAMtU0gq0Cw+L5ZYL2j11T0g7z98o3RvHwimpL3WLxm3ad+EULEsnbNlaoPP5 9A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=gqaxF0jGQvAcnAfukYN6P65kcc2d4KBjtWiwSMuZAdI=;
 b=KUx4NW8W3feiAeZPuXpLeORIDb7ZNpxxzde7BkOkuEHma3NniEZwtOtvZ5v/0FDu2r6M
 R5Zvkmd4DhIoskko++pOj1CcHEOGdpYJx0ZZkTeE4ykZ4ykMngU1KjXO4+hQJw2GZ5zV
 r3aY1l5BWWyuAxSqUp99nLLpV3skxcUrOZoHUiDwk+fzx+wQJGUxtu4nQpV7pfTWxJKc
 CeNsahiou0TzSZTGiG9Cu1T10Mi/NRsKMejEk33dQnWS5vvvi/jrk5m2uKJteUYAkJ0Z
 uvdsflgyH29AofgkcMRoCgRLt9xP9VtOKtQ7w6Amu+CuPhkqlDwWsUlcszVToFcqzOYG XA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b3vj11u3v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 13:22:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDKqin178953;
        Thu, 16 Sep 2021 13:22:08 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
        by aserp3030.oracle.com with ESMTP id 3b0jgg4fp2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 13:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPo3X2uxsgFDUtxqUMyJO2Rf6bDM0L/AXQA+R7YjHAa4i7zX6oB+Ye2NBii9VLgMF3pYwe2ZyLQ0ex/BxX6U5nioflb5QLhGO4VDtXCw555WuviURXbJz25bHo85DHOSG0dlHPNXA+iIEefySGTvrGg/IQpdUPQ6t+v+/o2g/AeW897hZdUqEcGW9n41eJfoS23VPzhcqlhj+M5aRBje2raABWc39tzua84HUAC48pZuNehM36wJO1jJK7mAeNA6Y3igyKoapx4JxzoLTLLmF2FDTE8grPEx64aeg0Op7W1CJfWajSfgBlOVUtwixDYmDetvkbO3G8Qzecyq5pLRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gqaxF0jGQvAcnAfukYN6P65kcc2d4KBjtWiwSMuZAdI=;
 b=Be5eqaKT4pftWccoY9ufNNIj4tkjx4xJkJhtd/rEdcEsBg2Bfhx1hlwwFYNqLL/4PjmlQCxGXXz1arMrm0peo4oSBmM3k6kfIBQCF6fZk9TO9m/ogl2dh67MQrvAALRVVMXVvuHwH22I72sZs/wHY71cR5LeDF3aBb+3BtVL3+VOeD0DUYoDLPPRdVOUi7SEM+UnKKzjdloojsYWNoNu1FjG5gnmreTlnfO91ZjZEn4IMsZFQC4zGwNKDff0HTSuJb8dfsVYTrNAKliWhtNvrp68Agxc4TrEEMkPMyBMlBte3m/AUzvhg3OfgWLMJwRAPjh7iesnE4B2QdbcJTwnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqaxF0jGQvAcnAfukYN6P65kcc2d4KBjtWiwSMuZAdI=;
 b=di9Igi5TT8s50e+KP+6ZHXBvKBHwPb3V3dzb9Y73RbyaKTYYFmhgeIE2w4R15ZFkwAqtn5rdah8tb+AVbeuE0UC7c8KMxpQRfkcmNHt3e3iQoif5TvPy6kISyGpnYNrz4HckhnkMPm1X39OlN/OFEzOKwco0LiFKdSO5jjvBc5Q=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1615.namprd10.prod.outlook.com
 (2603:10b6:301:7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 13:22:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:22:06 +0000
Date:   Thu, 16 Sep 2021 16:21:54 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: hid-debug: clean up snprintf() checks in
 hid_resolv_usage()
Message-ID: <20210916132154.GC25094@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 13:22:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 440e7424-5882-457b-970e-08d97914fae1
X-MS-TrafficTypeDiagnostic: MWHPR10MB1615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB161533EE147BFE9E126DAFE78EDC9@MWHPR10MB1615.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyzh/xoEUgFEpJaa412N9cWO02FGQ1e6JW5mZFroMb4xpWIlE+ow8h9XdcPJYJ1olofLtoju3tBkEiFDp22YQuTBKKlZonpfv0HeXpk0KuF+MlNkt7ZaKgFD9jwsDnSuUBqxTblzGev2wWKCL4Wbx6kw0mFQAKji+k303JPb1F/QdQ708dIPM2VSqb9Yv+KgSlOL9eLLdCJ8Asrjk6cHzVfp6M/2Uu3vs/6XlQsfrcfUtm4VMARz9HTRat5knrnYe3xjwEOZPv65/PkkKTR1X2hu/Flw3gmz2aWKCgaQkSVz2RG3mIwGbWabShVZxH+VR6jHlhiOnoKDFrNpVKb/1TmbhGKd7pPADS8DDzuYgGcpu0xwHkQctQqji/YhN3z1GrKoDYXCjPALFYg+CjZOnrAJnRdIPqnM5SfRqgEwrxQw9AO+ICd32ma6i7MFJEqsw/gYC1zX5/I/NnRn2dO+0lWYc4+Hryc1COTWBAw3u17WAe1K/FK2/Ljt6i2itFAjrXE2FofBK5HkBbWfoT9id5ZEsDj9MS53TQBkPJ02uAdqBnGPjIb5PQJwFuKT4GYBjr3U5L9F5SylbPV9mv1Lq79N87cFC+BkDF2Mku4AOoQeJQjbwM82qvzU70/gvsXsFbGT566Zt7RgifANwmUrvXyuStuIfnOvtZrUP1HJWF1haq+0txhDmxumtes21Mn8FLbjlFMzlB9hbOZADCi/sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(376002)(136003)(346002)(66556008)(186003)(8936002)(8676002)(1076003)(9576002)(6916009)(4326008)(9686003)(6496006)(316002)(478600001)(6666004)(86362001)(33656002)(5660300002)(2906002)(44832011)(66946007)(956004)(38350700002)(83380400001)(55016002)(33716001)(38100700002)(66476007)(52116002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qPPlWsdB7Bpa2WOFTCfIpFgtfjGvLlDwhqAvZyhzYoP/vKJkkcLksgCpLR4o?=
 =?us-ascii?Q?EMF+Gru1JQFMcLwCYz0A9EFPwB5NAhqK0O+5/9Ed0Q7ztrZnhVRw51fX7FWo?=
 =?us-ascii?Q?5S34/oOwX8YuNEV3EALOKtxvC0rkXQW8eOv0Cc/NIR1XOVDNo0MFJ4sY0F4j?=
 =?us-ascii?Q?68LTLsXvX2FXMGS2XOIMUnpbFOBjbCgB1uyjxcslb8DCG74ONvNevsme69+N?=
 =?us-ascii?Q?AyOD55yNYn8BRX1wftfrw+DuXYI0uR+u36JWCg2WnfpcITcyOf2F9ANgBtBR?=
 =?us-ascii?Q?hwOSKpgYfCQTmUHWXHd6EcHv2pHPGDXQ7h0ujwEpKXtmjFzfvwKLxgsNKEdc?=
 =?us-ascii?Q?GuP5KKiAi4MztNlPYkZoi1XTHafhbUhAwXDhnn2HnzeonBA/9edd+QpDjhh/?=
 =?us-ascii?Q?Yr6j3I75OngQNb2jQzkOf672JtubewgHWHpQDXpj3Rvle05fZ5j4x26fLPN4?=
 =?us-ascii?Q?75g23I8OCcecxKaLS/fJRfxI2uaZf641YHfYH9nzpWN+CxgDp7YaHNJdv3D4?=
 =?us-ascii?Q?c0edVgJDSEsFeK4CYubxLTHQrYDkApIVheMkSBXnsivaVr/+NMbIxozGgjwE?=
 =?us-ascii?Q?auPRGIL1Wj+gYx+sSfT3KwpOdSgGd20T5fc9IJFHQSrePpVO8ST35nF2G2P4?=
 =?us-ascii?Q?PgNMj0qRTX+FZupXVisNpRQytw4qIw30dujehDoH6Pz2oMH7DPRYk65hhhIZ?=
 =?us-ascii?Q?XNb0yzLgBb0ghxingKFxuIks/xj5leoM2IAQyX3W5jWGolmDAjjnqwN4OvgO?=
 =?us-ascii?Q?HwstJevvdVGJMXjeI/eKMMft8G076X+K5NT62Rqpu4FYHyc6uGa8bZxFA/wv?=
 =?us-ascii?Q?Qte7SAuBO68Nv/QjGkaKfOEW3tppX2zKBtwildQrvUqewv4iBuW7FUMRDw3M?=
 =?us-ascii?Q?jNxLz0ePNL/atLVZ4bT2/+tuqz3VPM4yesWc0XtFXF7pPy31JxMSc7+l7jeb?=
 =?us-ascii?Q?l8CL4HWSUf4xReOQTEiwBbKPpK3zKMNOHbmtNq4mLKUtHk0tPb5UUZZtDxVd?=
 =?us-ascii?Q?ic0C2IdSNAC1gPC7LhTeHrXnUUnhlTQ1tDc1XiNg+rFa15leQQL9P1SOGQHg?=
 =?us-ascii?Q?F6kNmqMd8R8i4KyhrLdX+Tl/2xYqzc3MU4vgbXi3Qy0RD/yBFZAw6EPC+f06?=
 =?us-ascii?Q?DXFavZE4gFGyk7Shy/67hUVkVqJTFHo2KjNdLcWSJaLTe7mOiG3OHS83MTqo?=
 =?us-ascii?Q?/cbhYwX48uY2k3034izmAYfsu/vURFRqegHDddzCng7/DFpNUD5J66PQLYH2?=
 =?us-ascii?Q?kXYWa4Wgtbm3SDt4JAF4dU3nyupk7YO2L/JJ3s8P2M3p3borxB2v6eyCqNeF?=
 =?us-ascii?Q?+dsablYQWk7k7d7stI+ulxe0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 440e7424-5882-457b-970e-08d97914fae1
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:22:06.6120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHrR+zKchSnLXuss2CRYtQz+mwfSyxOvR5GpSKYXqr7B46eLcUmjX3b2o/w/HO/EmPDKEvWFqeQBGJW0If6qZK6eQWUZZCf2fDQoEUVmt68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1615
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109160085
X-Proofpoint-ORIG-GUID: 1_jKt52Ym47gAut5HOfUJiPGH2meO-2k
X-Proofpoint-GUID: 1_jKt52Ym47gAut5HOfUJiPGH2meO-2k
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The snprintf() limits are complicated and slightly wrong when it does:

	max(0, HID_DEBUG_BUFSIZE - len - 1)

The "- 1" should not be there.  It means we can't use the last
byte of the buffer.  If we change the first snprintf() to scnprintf()
then we can remove the max().

At the start of the function the strlen(buf) is going always going to
be < HID_DEBUG_BUFSIZE so that is safe.  If it were > HID_DEBUG_BUFSIZE
then that would result in a WARN().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hid/hid-debug.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index fa57d05badf7..3f62fe3b0a49 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -486,8 +486,7 @@ char *hid_resolv_usage(unsigned usage, struct seq_file *f) {
 
 	if (!f) {
 		len = strlen(buf);
-		snprintf(buf+len, max(0, HID_DEBUG_BUFSIZE - len), ".");
-		len++;
+		len += scnprintf(buf + len, HID_DEBUG_BUFSIZE - len, ".");
 	}
 	else {
 		seq_printf(f, ".");
@@ -498,7 +497,7 @@ char *hid_resolv_usage(unsigned usage, struct seq_file *f) {
 				if (p->usage == (usage & 0xffff)) {
 					if (!f)
 						snprintf(buf + len,
-							max(0,HID_DEBUG_BUFSIZE - len - 1),
+							HID_DEBUG_BUFSIZE - len,
 							"%s", p->description);
 					else
 						seq_printf(f,
@@ -509,8 +508,8 @@ char *hid_resolv_usage(unsigned usage, struct seq_file *f) {
 			break;
 		}
 	if (!f)
-		snprintf(buf + len, max(0, HID_DEBUG_BUFSIZE - len - 1),
-				"%04x", usage & 0xffff);
+		snprintf(buf + len, HID_DEBUG_BUFSIZE - len, "%04x",
+			 usage & 0xffff);
 	else
 		seq_printf(f, "%04x", usage & 0xffff);
 	return buf;
-- 
2.20.1

