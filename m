Return-Path: <linux-input+bounces-380-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16A8017A8
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 00:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 085071F21131
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 23:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE5C059B4A;
	Fri,  1 Dec 2023 23:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vmware.com header.i=@vmware.com header.b="s93TrmUJ"
X-Original-To: linux-input@vger.kernel.org
Received: from MW2PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F77E85;
	Fri,  1 Dec 2023 15:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrVAHURCecxAqg+7JqxLP23FN7xYVLDKOKagNyluO5EkCrq/0XNC64U3lDABYfyurRcmF/qON1zOiFllz9MgEy2pW9TWppXICU1wko+0w4yTedtbu4bS8+vxGWcrROH1B+118O+KX25aEPZPgJ8nukTtxAQ/CgmqfJIjd4FQVNphcaXXt5wlxanqrgyn37a2jOEYNZIrNtnNTvaiN+Lr39LN6UPraFUPUgocXwoyo6CA61rHAmZ//3SUzire21dswtkL1SfZ6KE2g2+/UqYdB49wHdgAjNOxE3VJKQvf/Mi1GiZirXWxYP2nXVqFYivC5aGMRlozsCVWVZYY9l0trA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJ+gRkoGbU3l0zmNQ1Fq7uSrv1o6gbhB8z13Z2qxmkg=;
 b=gupRcuu7cXw/K9tmWUOpZV/uv6ufIIBJaCStX+kgFDF5DZySwRDMbqRf3Quy7CTU1yC/H0OOSwYd3UP7XK4xYKCyZtVKe6uqdJA0fpridZGLtwQP5nI+KCIogfieBxeoK7kRnhxobNyeeyDJ5H3v5lMERSmz02/OgsK61FiEC8qM3ovNOoY2vBbLxX78CyziaVTWE2rrCFSf55Zrk0OJbgnkJE+VwiFFtnh0aalYTLiys6zYd5z+3r8Td72AwYq1fA/fAvYTsm0Gb77mqMXo63BkhvmmKkjLT5LN6vLEvrQ2gZNVvP2CUSZpLbXSiuwNHEpyhOuwXrGfDIbCqbLALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJ+gRkoGbU3l0zmNQ1Fq7uSrv1o6gbhB8z13Z2qxmkg=;
 b=s93TrmUJuzvg4VLrLkDUG7Brm4gzBeXZxkhHcAWQ11CGFoMKiYn7VFeyrIXkuuag1njzJJZTXxjrLPY0d0ic5SDePnO859iUsIsYNBbQPEQ2PdpmRjGruEIpOvmWRKZc2kBCeDNjSmFj2a1vLUgHIMgwUNQmZXANDREYdECfWBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB7787.namprd05.prod.outlook.com (2603:10b6:a03:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:25:06 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Fri, 1 Dec 2023
 23:25:06 +0000
From: Alexey Makhalov <amakhalov@vmware.com>
To: linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	hpa@zytor.com,
	dave.hansen@linux.intel.co,
	bp@alien8.d,
	mingo@redhat.com,
	tglx@linutronix.de
Cc: x86@kernel.org,
	netdev@vger.kernel.org,
	richardcochran@gmail.com,
	linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	zackr@vmware.com,
	linux-graphics-maintainer@vmware.com,
	pv-drivers@vmware.com,
	namit@vmware.com,
	timothym@vmware.com,
	akaher@vmware.com,
	jsipek@vmware.com,
	dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	horms@kernel.org
Subject: [PATCH v2 1/6] x86/vmware: Move common macros to vmware.h
Date: Fri,  1 Dec 2023 15:24:47 -0800
Message-Id: <20231201232452.220355-2-amakhalov@vmware.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201232452.220355-1-amakhalov@vmware.com>
References: <20231122233058.185601-8-amakhalov@vmware.com>
 <20231201232452.220355-1-amakhalov@vmware.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To MWHPR05MB3648.namprd05.prod.outlook.com
 (2603:10b6:301:45::23)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR05MB3648:EE_|SJ0PR05MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: a170113b-653f-4522-f9ea-08dbf2c4c09e
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtFwd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E+ue7dd1rPbX6VHLHTmuxXx3D9L+CVQwNr3VRjn+J7eXXB31915SmtXQWdmHE4pXF20dzrAU843AQ95Q1RA2Y/bYZP/lBUX5NiSTAQQr4nl2ySvCFw6RcWDo7g79j2DmNHoufQW9L4ZLosYlJszTUTefUZZvhzev/cL3/WUDXP1vCDx3eDwDzyixfq/fWR0m5ZvO44BpTpslsyto3n8vpRmqlZCl0mk0JEti6xuxpofs7RG15VKdl8x6T9zvVpZUjH5/XHbmoJCk/+6fJGl3ZamHkzbsIA0cabL5fSVi9sCwiEfRoDl7+VwZna4XszkVCRgG/eFTnripIqUPw0ysdMK//tfUYyrG2de6rNwDv7jNcw5hGngVWe53ovsq1uUKmYVK+FFvBlQDqrrd2gcD4VRGwfAE7F+y0/3YZ/D3KK5Jc1eDQKmW2kEtf0n9/4YYxsrSr4cD8gu2zfhWvFzDninMR19aaj3QAp7u9PdZ9Sz0qN83qjYZtYgcWckkfwoO1iBbmeQaJlod/zaN+9jJWsAyeFpyve49fPNg/gXv2VdSurl1gVoakTEsy26LCPR2ZS5VbQfoHNOTj+Aomnvq+r8yMl1WiS0Nwz08hTYAgHXarW7Mh1GnQn8d56AnWS/pbE+xXpvjRYFrRdmRMMFBZi3X3Tp0JEq0Jixmptw0rlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR05MB3648.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(8936002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(478600001)(6486002)(41300700001)(2906002)(7416002)(86362001)(5660300002)(38350700005)(38100700002)(2616005)(26005)(1076003)(6666004)(6506007)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KB2Qp5y40fjnaSAe/oDoEDyi9u85tGoF4sAu9zMPD9ZahkaXTeDPG8xnzTEH?=
 =?us-ascii?Q?7baMO9Js6tYGp2Ex1o8lx49crJOddPeuoOyP3JtEZ2+2MevcgkAO6F4LI61c?=
 =?us-ascii?Q?+2n02kvK+/TELZ3oZ3nYb5BlDa2JLhK0LhOGxA0eVpzFGuPVuxIN7tBqwBDQ?=
 =?us-ascii?Q?UyooS+ESqeY4hHafjrKESkqZrngTjpEQRy1UHFkM3GY+b58vCIdGS8YxjPvd?=
 =?us-ascii?Q?M++GLP5dVHN++uuVHXKsz/IMViRO+5zUUem3C+sWZpeWE98T4G92JEQf7O6W?=
 =?us-ascii?Q?EE67OJ7vn7RkFxD/4nq5xylPpvCfzyJuoA4/jyDq8bVlvGVcNm71sIvOOE6I?=
 =?us-ascii?Q?s/jrsdeK6bYKzjWj7T8yzge2el5eGJxs5VJZ12CJo4MIhj0T+38H/bpEG4s+?=
 =?us-ascii?Q?JyRBGJYvJ66DHpKgGMvJWy6zWm4CcNboZB1Sc4mL0WxX4XByFJOV4dXFkIw7?=
 =?us-ascii?Q?n06QMQppaOLYwMAWLZ+ziED6yTPqibdsT8FxwN0t0DqaqZZghX1VlnzZ+RCD?=
 =?us-ascii?Q?LZIavKq0hrN5vC/lEmfVgKtVtC28hSYSZ4dGzb2ng8vUMPZeLEf7VpDG6/UT?=
 =?us-ascii?Q?MzCNjOAhWhs1m7OwmQBvBCxsGoOwn+aP9deoHoc+1E8DUWdnpBdjobMaNXvd?=
 =?us-ascii?Q?4Ap4yYdFTjd4qJ0pC16xBaZ8M7IUQ9rxA/Fmv1FU0XOOVMqkDEooXKUqOwn6?=
 =?us-ascii?Q?Z8UQQWvspHBKF9IumNO5KsPiSf0RSy6cA0/X6ihos3zGSREvRhhVuJ+YkwUM?=
 =?us-ascii?Q?FveeAwOEr/6KV0nreaAxozetZd3d9jmFOEhsNK0fW+q0cvmGNc4KsrvDlc68?=
 =?us-ascii?Q?h5UsRz4Vx7w1tbj2ka8h0TqGNuN40ET8yZcBZVYhjowGE4KnUmy6BS1BqnQz?=
 =?us-ascii?Q?gzN1TfmnZ07vTCwJCMqWGS0z+Lf8BsehbLHG+A545C/95zr2HQHC4RRGgml1?=
 =?us-ascii?Q?6pmAlpHXI+YrmQ9qylhoMePN0653y10kYm3r/1jT2eFa8Zr+ZVlyehRrvnMD?=
 =?us-ascii?Q?LCoA0imhpAoUhb65C5wqfmWeKcli4R+todhUUKRGIxs7+zOGK87tIu3fJlme?=
 =?us-ascii?Q?5235CcVFqPUechuuj32VX3qKJY7jhZp3L6GSy57OevsSUal+JcvWiyHRvAx2?=
 =?us-ascii?Q?f1c6AnNrxnRl4za5UkuGZqXrgmIa/dWbRsqsSQhBO0s3F9Hddw0Y7opTUmH7?=
 =?us-ascii?Q?mrxAMfL3rvM8oVHw98YE+KoXSm7u3H9o75dOETZNdkQWKeiROdSRdpifWaA0?=
 =?us-ascii?Q?qa+Xp4iOp3AXbH0aCHCSyxeFOtDDCymMuZdYA5hnmkVnJxvp9txx6CaZvtzy?=
 =?us-ascii?Q?Yxbo09i3nh4o3XTtQQmAipsny8gQCptHFVLQXz4oDW0XYneO8cGtfG693uFe?=
 =?us-ascii?Q?NQfAZL9oDmFn/1KM3TT2m7xHYgaq//EA0Bf+MgYCGjAJ3Dfktv2QytGRleso?=
 =?us-ascii?Q?Z+yAJd3Q8YDvsTIuMh2l0ylq8pKOlJATtibZhRICe/QWw6IOrSx1/qJeO2Tu?=
 =?us-ascii?Q?2KKya6Lykkmhj3jDMYIFtLGu5KLm6Ba8988duVJ/pEsVClO++35LWjpCoL0+?=
 =?us-ascii?Q?snuo+0EFylE5oMWfA6h2SDOr3dsQrleD/ByXw2aj?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a170113b-653f-4522-f9ea-08dbf2c4c09e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:25:06.5954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PE28J+N4xO8yaunaFew+Thwnx4Mkw9unuu6t9r5UeV9ngu1ExT5a++pXG8lHMDyJBBvP66POXvK2WllQ6b8ZeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7787

Move VMware hypercall macros to vmware.h as a preparation step
for the next commit. No functional changes besides exporting
vmware_hypercall_mode symbol.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
---
 arch/x86/include/asm/vmware.h | 69 ++++++++++++++++++++++++++++++-----
 arch/x86/kernel/cpu/vmware.c  | 57 +++--------------------------
 2 files changed, 66 insertions(+), 60 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index ac9fc51e2b18..8cabf4a577bf 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -8,25 +8,37 @@
 
 /*
  * The hypercall definitions differ in the low word of the %edx argument
- * in the following way: the old port base interface uses the port
- * number to distinguish between high- and low bandwidth versions.
+ * in the following way: the old I/O port based interface uses the port
+ * number to distinguish between high- and low bandwidth versions, and
+ * uses IN/OUT instructions to define transfer direction.
  *
  * The new vmcall interface instead uses a set of flags to select
  * bandwidth mode and transfer direction. The flags should be loaded
  * into %dx by any user and are automatically replaced by the port
- * number if the VMWARE_HYPERVISOR_PORT method is used.
+ * number if the I/O port method is used.
  *
  * In short, new driver code should strictly use the new definition of
  * %dx content.
  */
 
-/* Old port-based version */
-#define VMWARE_HYPERVISOR_PORT    0x5658
-#define VMWARE_HYPERVISOR_PORT_HB 0x5659
+#define VMWARE_HYPERVISOR_HB		BIT(0)
+#define VMWARE_HYPERVISOR_OUT		BIT(1)
 
-/* Current vmcall / vmmcall version */
-#define VMWARE_HYPERVISOR_HB   BIT(0)
-#define VMWARE_HYPERVISOR_OUT  BIT(1)
+#define VMWARE_HYPERVISOR_PORT		0x5658
+#define VMWARE_HYPERVISOR_PORT_HB	(VMWARE_HYPERVISOR_PORT | \
+					 VMWARE_HYPERVISOR_HB)
+
+#define VMWARE_HYPERVISOR_MAGIC		0x564D5868U
+
+#define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_GETHZ		45
+#define VMWARE_CMD_GETVCPU_INFO		68
+#define VMWARE_CMD_STEALCLOCK		91
+
+#define CPUID_VMWARE_FEATURES_ECX_VMMCALL	BIT(0)
+#define CPUID_VMWARE_FEATURES_ECX_VMCALL	BIT(1)
+
+extern u8 vmware_hypercall_mode;
 
 /* The low bandwidth call. The low word of edx is presumed clear. */
 #define VMWARE_HYPERCALL						\
@@ -54,4 +66,43 @@
 		      "rep insb",					\
 		      "vmcall", X86_FEATURE_VMCALL,			\
 		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+
+#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
+	__asm__("inl (%%dx), %%eax" :					\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
+		"memory")
+
+#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
+	__asm__("vmcall" :						\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(0), "b"(UINT_MAX) :					\
+		"memory")
+
+#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
+	__asm__("vmmcall" :						\
+		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
+		"a"(VMWARE_HYPERVISOR_MAGIC),				\
+		"c"(VMWARE_CMD_##cmd),					\
+		"d"(0), "b"(UINT_MAX) :					\
+		"memory")
+
+#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
+	switch (vmware_hypercall_mode) {			\
+	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
+		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
+		break;						\
+	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
+		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
+		break;						\
+	default:						\
+		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
+		break;						\
+	}							\
+	} while (0)
+
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 11f83d07925e..4db8e1daa4a1 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -41,60 +41,14 @@
 
 #define CPUID_VMWARE_INFO_LEAF               0x40000000
 #define CPUID_VMWARE_FEATURES_LEAF           0x40000010
-#define CPUID_VMWARE_FEATURES_ECX_VMMCALL    BIT(0)
-#define CPUID_VMWARE_FEATURES_ECX_VMCALL     BIT(1)
 
-#define VMWARE_HYPERVISOR_MAGIC	0x564D5868
-
-#define VMWARE_CMD_GETVERSION    10
-#define VMWARE_CMD_GETHZ         45
-#define VMWARE_CMD_GETVCPU_INFO  68
-#define VMWARE_CMD_LEGACY_X2APIC  3
-#define VMWARE_CMD_VCPU_RESERVED 31
-#define VMWARE_CMD_STEALCLOCK    91
+#define VCPU_LEGACY_X2APIC	3
+#define VCPU_RESERVED		31
 
 #define STEALCLOCK_NOT_AVAILABLE (-1)
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
-#define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
-	__asm__("inl (%%dx), %%eax" :					\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(VMWARE_HYPERVISOR_PORT), "b"(UINT_MAX) :		\
-		"memory")
-
-#define VMWARE_VMCALL(cmd, eax, ebx, ecx, edx)				\
-	__asm__("vmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)                         \
-	__asm__("vmmcall" :						\
-		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
-		"a"(VMWARE_HYPERVISOR_MAGIC),				\
-		"c"(VMWARE_CMD_##cmd),					\
-		"d"(0), "b"(UINT_MAX) :					\
-		"memory")
-
-#define VMWARE_CMD(cmd, eax, ebx, ecx, edx) do {		\
-	switch (vmware_hypercall_mode) {			\
-	case CPUID_VMWARE_FEATURES_ECX_VMCALL:			\
-		VMWARE_VMCALL(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	case CPUID_VMWARE_FEATURES_ECX_VMMCALL:			\
-		VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx);	\
-		break;						\
-	default:						\
-		VMWARE_PORT(cmd, eax, ebx, ecx, edx);		\
-		break;						\
-	}							\
-	} while (0)
-
 struct vmware_steal_time {
 	union {
 		uint64_t clock;	/* stolen time counter in units of vtsc */
@@ -108,7 +62,8 @@ struct vmware_steal_time {
 };
 
 static unsigned long vmware_tsc_khz __ro_after_init;
-static u8 vmware_hypercall_mode     __ro_after_init;
+u8 vmware_hypercall_mode __ro_after_init;
+EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
@@ -476,8 +431,8 @@ static bool __init vmware_legacy_x2apic_available(void)
 {
 	uint32_t eax, ebx, ecx, edx;
 	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
-	return !(eax & BIT(VMWARE_CMD_VCPU_RESERVED)) &&
-		(eax & BIT(VMWARE_CMD_LEGACY_X2APIC));
+	return !(eax & BIT(VCPU_RESERVED)) &&
+		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
-- 
2.39.0


