Return-Path: <linux-input+bounces-381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF208017A9
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 00:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E23791F210AE
	for <lists+linux-input@lfdr.de>; Fri,  1 Dec 2023 23:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4CE4E60B;
	Fri,  1 Dec 2023 23:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vmware.com header.i=@vmware.com header.b="LuJdenvU"
X-Original-To: linux-input@vger.kernel.org
Received: from MW2PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012013.outbound.protection.outlook.com [52.101.48.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C971103;
	Fri,  1 Dec 2023 15:25:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crg/T9eqrSGh5QBXe2jHqYD8FZn6+LHSYxFERPVNjpOnA+KW0UcKOw0FrGjNio2OU0qA1WQEuGco1DtoTEZXGqZVAzaqjgeaz2+uoNBjeKgLJlbsxtQ0h4sy8bwTdqs8sSVvjquWZqkfokSdWcVbC2mFNGK1fD3noRa/rFx88QZ46iuJmlrDIg+HO7NSbTkP/+b6zVGE659yGXgtQXjAj/jR5cVuv43JSqqjElivfGgtZ00ZTY0FbcrzqwpFExmy6uezRqgJtRGG9Y5GgHgky2mtjmTq6RZssL1s6k5y1719nrmiS0dGMzQ1r4bBX0y0XYNcjuihOALQglyPjtK6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16Jiqcw4y5HDF4lK3qfi7xjzPgfVe2rKDSyYxNFchE4=;
 b=HJY5VcUDndI+QhjqXHqW/ZX017k2n4zmvjfF1XdZrhhkBa8zok/2R1eLnsWQFxWADyvhuo98mZ8smNg+IZDLzV/pJzjWmgRyWX2RirLhRZefyZS3wvJXj8P4bbTKzeepEhxIWB6KILTE4Hzv1VYSRowqLlUd5Jbku9MaZrx9Vp4Eyz5UrrvlWGBg6XsScwjUvOHNOIe+MWynxnawdsjzVvOKVGvCpJN/G4epmuCPtGWZ8XjS1o0czt1hlzK3gv6vZcEex3l32MVFhpWwWp1/d5C9cMhM5hgGEDpC/n9sYskWS/l4lBDnJoHUy3+CjjVkfk82Tc2AK66t+scNPXFHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16Jiqcw4y5HDF4lK3qfi7xjzPgfVe2rKDSyYxNFchE4=;
 b=LuJdenvUiv9BdWPUYBQ8dkWSNJRXC4VVewU5C6hbS6Rhar751PHkJVFH8nMAvEhQc28iKcDZiYB0SG8yXqGeYkZD1xwaUXlwSz0gQin1MwKNt5QLW6C6AQhRmMdY8zi/AP50SJq0cyBfnSk1P4ORZ1d9rfA65wNogmfJQlNC2Bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
Received: from MWHPR05MB3648.namprd05.prod.outlook.com (2603:10b6:301:45::23)
 by SJ0PR05MB7787.namprd05.prod.outlook.com (2603:10b6:a03:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 23:25:07 +0000
Received: from MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7]) by MWHPR05MB3648.namprd05.prod.outlook.com
 ([fe80::10f0:590a:708:4ad7%2]) with mapi id 15.20.7025.021; Fri, 1 Dec 2023
 23:25:07 +0000
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
Subject: [PATCH v2 2/6] x86/vmware: Introduce vmware_hypercall API
Date: Fri,  1 Dec 2023 15:24:48 -0800
Message-Id: <20231201232452.220355-3-amakhalov@vmware.com>
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
X-MS-Office365-Filtering-Correlation-Id: e9de836f-3e44-4ad1-2c85-08dbf2c4c154
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtFwd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iZXYon++i/r1ZzNXcHj1ANEHOBU/Kg3u40VP0iNYtHJe2jhECTyhKn9pmtN0lCEXaabwRK9zSzWQzcbhMHXKvEsUWEdvRZlGsdmEstorwRmfiBXpd4jnF55+aPkkxGrQMijefutc81wyZnaW0q4cLT9b+idreoYAHbkeWpgkIbS6GuWuWGUl3iBbW9wyuZF4CpA5pRWrNDmQjNha91cTkavPJTeyJrnmGwNnUeIOWA8CSX05GFuXtRP/e9QEgsvosfJ+yQtmtF0uP9+6N25rJlFTAgTyGMglM0H3RHhD8GeR0sfEIcOWX6WuGuHmXVPUkLMC2gPgbur+EWdwPP9pLyaKuwJvvT8Ksbd/Q+tLcBLQ5LTBY7ftFVnch17TID7QjA9fw3CzzWYRdOk9s4+C3tFe2tmxgxIgscMW+cCj4lOOWCiwdX2mW4QkuSSpl5aZsB8riaIxuXMQv3TnJRwCs8rv3FshshKE0No0ztVyaF13mXJQ5hgBVuoyLff/OnJy+W+55J54Aa1dlo5J/wL3yal0XiQLSr+0Mya8MIgxD9rM67cGLV9tPemLK2rj59zZDdKFgoMqDYYul8s8/lACKNrnCxtZrUW3D/YIFu91kwllt7gLik/29D4qvm8S9App4XPlRBLO1oYotSxXK+Wr4avmOlmGev+o2HpXHQut2CU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR05MB3648.namprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(36756003)(8936002)(316002)(66556008)(66946007)(66476007)(8676002)(4326008)(478600001)(6486002)(41300700001)(2906002)(7416002)(86362001)(30864003)(5660300002)(38350700005)(38100700002)(2616005)(26005)(1076003)(6666004)(6506007)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zJkTbv3UKpmFn2EF7wjjcsU22wiuAwwpUtrocCIQjhuStykoeYj0+UL6jEA+?=
 =?us-ascii?Q?CU6Q8JXmINOkzM1FqNraeBQwq51qps9aVu21DYrs+LydoY1WkPoT/SnNyuET?=
 =?us-ascii?Q?Ln9i7YWOcuoQup589bfMdDf2WdVGVLAeoRFJxUzr9sq9kXkpYCNp4A+cRGK9?=
 =?us-ascii?Q?o3yE8yJiz0VbdQioXAsMXjBs2bBVCRL7BkGHSr1Glx71v+JdPntShZYQWRMT?=
 =?us-ascii?Q?OIHyZd5Ea9LLXaqOvIo/PPJH988+PtmuYZChUa6QHppNGz2SuEj2KfDGwUtM?=
 =?us-ascii?Q?R4gUojALIo4wd47xXXo2e1rPCOkScktp84t4qHFLdk3PNa87rwPmw3p+zbFq?=
 =?us-ascii?Q?1ruvslCz5GWAkcpUXBVLIhv4K7wX97BttHjLFVDNp2ADZ26epqKaPuaA5k9E?=
 =?us-ascii?Q?ILdgy9GlIve90Bw//HbIMWzkymPxxT22xOspCOIpSntWBWaWliY0S4LKEC9X?=
 =?us-ascii?Q?K77g7yfK24SHUAbhuX1EQoUKf9KrU9MKpiiy0iC4/QxsFrmj/JqdAnsQiYLs?=
 =?us-ascii?Q?WuWlrbjwOtZDiXsjbij/zb1dX1yR9k3qvBCFAKAm7oH/xA1IftBl/pleuOzQ?=
 =?us-ascii?Q?m1IAZaVBbd8uYyBKEoOMa/tj3z1H9MsQFAAdZ5aRfHy/mxWARIhvhfa3dM3d?=
 =?us-ascii?Q?CBq2SB6YeHH9zzohBQJaE4V8qyyM2I+W615f34zPcSFWuoLlfFgimQ0fzeaA?=
 =?us-ascii?Q?ie/KzHC9qmEtJ1gyHbged58xPOoluEZEqYGY0mkyWG+sFQt6NLbGhfKggKxi?=
 =?us-ascii?Q?ZCxRJ/EQrZHj1Vf6IdLIAbkH07he2W0t9RpYeSwfznrho6VvqdhscajqTp5W?=
 =?us-ascii?Q?b2gzrIuhGV1drtK/PIKQuaEtVM+qKtQP0fpnW4B8C7ilLX6UaAcrRskRLrIa?=
 =?us-ascii?Q?NiRV1CTtrmR4lgFONbSa0I027Cl6hLvvSqQonngpwInE9ix0f0Navcg6EfDm?=
 =?us-ascii?Q?EsnhMPu886lTa1mXJr5t44JWl01vyZkjLGlY1GOsN36uEhKoejA0x4+TPv5h?=
 =?us-ascii?Q?9U7IxA/mF1n3O6LiAOCDs//YYy4HfHRN8nxiULCUwHD1Lmrq9NtPUFI2EnGe?=
 =?us-ascii?Q?UtnR//sFVhMOaS4ua+hsbFUq9rc0zQ7jU4dvfX76ZdsszUG/mQc6J88DIvVy?=
 =?us-ascii?Q?SktDepKzvk3nYPW+zaAfOkXmBWPkvbZfui84Df+h+zFLX5DKSzfU+u+s6S8I?=
 =?us-ascii?Q?Zw9+ydwCAAF/PMDdkZFi1DliPwPs+yyZd28KXNopsBRPbzY3oz8cuw6h0IH3?=
 =?us-ascii?Q?0PeX4/jlQed3Ku4sY4sh+2meKNVNXDDZMxfpgCWaPXv3AaaSd+3gqMF27m7k?=
 =?us-ascii?Q?jSe4+UWBalvFMScwtANsotqoU+GBbsOcqGizYQEXQBkSvpyKvCDuGGUjgXk5?=
 =?us-ascii?Q?S8V6IuO36eqIKYbva6f6c3bpN/jwncMRJZ8/vB0HksJIDamepYoEcTih2MA3?=
 =?us-ascii?Q?mJZEhnQr3gw27APLX/HGHpLmHfeKrVkF6AfV+zQynVZa/cpdYypR+/6x2HXX?=
 =?us-ascii?Q?Nq8S6U9XzBBXUifWlByGaTGIABTn1IyydTsmyFd7YtTCJnUEK4QvV0iumkdZ?=
 =?us-ascii?Q?Okwz/U+C5BHcOwA4B9B/64fqccCRK5xBGXbraBub?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9de836f-3e44-4ad1-2c85-08dbf2c4c154
X-MS-Exchange-CrossTenant-AuthSource: MWHPR05MB3648.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 23:25:07.7502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsFvB4jPwhNtb3SlHHZq9u9wXdFzDolKgQobd57Jx8+TPTs2uUYNMpzlt0h8Bw9eHjaBRPpPRM5AZtVQhaycUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB7787

Introducing vmware_hypercall family of functions as a common
implementation to be used by the VMware guest code and virtual
device drivers in architecture independent manner.

By analogy with KVM hypercall API, vmware_hypercallX and
vmware_hypercall_hb_{out,in} set of functions was added to
achieve that. Architecture specific implementation should be
hidden inside.

It will simplify future enhancements in VMware hypercalls such
as SEV-ES and TDX related changes without needs to modify a
caller in device drivers code.

Current implementation extends an idea from commit bac7b4e84323
("x86/vmware: Update platform detection code for VMCALL/VMMCALL
hypercalls") to have a slow, but safe path in VMWARE_HYPERCALL
earlier during the boot when alternatives are not yet applied.
This logic was inherited from VMWARE_CMD from the commit mentioned
above. Default alternative code was optimized by size to reduce
excessive nop alignment once alternatives are applied. Total
default code size is 26 bytes, in worse case (3 bytes alternative)
remaining 23 bytes will be aligned by only 3 long NOP instructions.

Signed-off-by: Alexey Makhalov <amakhalov@vmware.com>
Reviewed-by: Nadav Amit <namit@vmware.com>
Reviewed-by: Jeff Sipek <jsipek@vmware.com>
---
 arch/x86/include/asm/vmware.h | 262 ++++++++++++++++++++++++++--------
 arch/x86/kernel/cpu/vmware.c  |  35 ++---
 2 files changed, 220 insertions(+), 77 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 8cabf4a577bf..17091eba68cb 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -40,69 +40,219 @@
 
 extern u8 vmware_hypercall_mode;
 
-/* The low bandwidth call. The low word of edx is presumed clear. */
-#define VMWARE_HYPERCALL						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT) ", %%dx; " \
-		      "inl (%%dx), %%eax",				\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
-
 /*
- * The high bandwidth out call. The low word of edx is presumed to have the
- * HB and OUT bits set.
+ * The low bandwidth call. The low word of edx is presumed to have OUT bit
+ * set. The high word of edx may contain input data from the caller.
  */
-#define VMWARE_HYPERCALL_HB_OUT						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep outsb",					\
+#define VMWARE_HYPERCALL						\
+	ALTERNATIVE_3("cmpb $"						\
+			__stringify(CPUID_VMWARE_FEATURES_ECX_VMMCALL)	\
+			", %[mode]\n\t"					\
+		      "jg 2f\n\t"					\
+		      "je 1f\n\t"					\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax\n\t"				\
+		      "jmp 3f\n\t"					\
+		      "1: vmmcall\n\t"					\
+		      "jmp 3f\n\t"					\
+		      "2: vmcall\n\t"					\
+		      "3:\n\t",						\
+		      "movw %[port], %%dx\n\t"				\
+		      "inl (%%dx), %%eax", X86_FEATURE_HYPERVISOR,	\
 		      "vmcall", X86_FEATURE_VMCALL,			\
 		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
 
+static inline
+unsigned long vmware_hypercall1(unsigned long cmd, unsigned long in1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall3(unsigned long cmd, unsigned long in1,
+				uint32_t *out1, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall4(unsigned long cmd, unsigned long in1,
+				uint32_t *out1, uint32_t *out2,
+				uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (0)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall5(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out2)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall6(unsigned long cmd, unsigned long in1,
+				unsigned long in3, uint32_t *out2,
+				uint32_t *out3, uint32_t *out4,
+				uint32_t *out5)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=c" (*out2), "=d" (*out3), "=S" (*out4),
+		  "=D" (*out5)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall7(unsigned long cmd, unsigned long in1,
+				unsigned long in3, unsigned long in4,
+				unsigned long in5, uint32_t *out1,
+				uint32_t *out2, uint32_t *out3)
+{
+	unsigned long out0;
+
+	asm_inline volatile (VMWARE_HYPERCALL
+		: "=a" (out0), "=b" (*out1), "=c" (*out2), "=d" (*out3)
+		: [port] "i" (VMWARE_HYPERVISOR_PORT),
+		  [mode] "m" (vmware_hypercall_mode),
+		  "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (in1),
+		  "c" (cmd),
+		  "d" (in3),
+		  "S" (in4),
+		  "D" (in5)
+		: "cc", "memory");
+	return out0;
+}
+
+
+#ifdef CONFIG_X86_64
+#define VMW_BP_REG "%%rbp"
+#define VMW_BP_CONSTRAINT "r"
+#else
+#define VMW_BP_REG "%%ebp"
+#define VMW_BP_CONSTRAINT "m"
+#endif
+
 /*
- * The high bandwidth in call. The low word of edx is presumed to have the
- * HB bit set.
+ * High bandwidth calls are not supported on encrypted memory guests.
+ * The caller should check cc_platform_has(CC_ATTR_MEM_ENCRYPT) and use
+ * low bandwidth hypercall it memory encryption is set.
+ * This assumption simplifies HB hypercall impementation to just I/O port
+ * based approach without alternative patching.
  */
-#define VMWARE_HYPERCALL_HB_IN						\
-	ALTERNATIVE_2("movw $" __stringify(VMWARE_HYPERVISOR_PORT_HB) ", %%dx; " \
-		      "rep insb",					\
-		      "vmcall", X86_FEATURE_VMCALL,			\
-		      "vmmcall", X86_FEATURE_VMW_VMMCALL)
+static inline
+unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
+				      unsigned long in3, unsigned long in4,
+				      unsigned long in5, unsigned long in6,
+				      uint32_t *out1)
+{
+	unsigned long out0;
+
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep outsb\n\t"
+		"pop " VMW_BP_REG "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+
+static inline
+unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
+				     unsigned long in3, unsigned long in4,
+				     unsigned long in5, unsigned long in6,
+				     uint32_t *out1)
+{
+	unsigned long out0;
 
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
-#define VMWARE_VMMCALL(cmd, eax, ebx, ecx, edx)				\
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
+	asm_inline volatile (
+		UNWIND_HINT_SAVE
+		"push " VMW_BP_REG "\n\t"
+		UNWIND_HINT_UNDEFINED
+		"mov %[in6], " VMW_BP_REG "\n\t"
+		"rep insb\n\t"
+		"pop " VMW_BP_REG "\n\t"
+		UNWIND_HINT_RESTORE
+		: "=a" (out0), "=b" (*out1)
+		: "a" (VMWARE_HYPERVISOR_MAGIC),
+		  "b" (cmd),
+		  "c" (in2),
+		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
+		  "S" (in4),
+		  "D" (in5),
+		  [in6] VMW_BP_CONSTRAINT (in6)
+		: "cc", "memory");
+	return out0;
+}
+#undef VMW_BP_REG
+#undef VMW_BP_CONSTRAINT
+#undef VMWARE_HYPERCALL
 
 #endif
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 4db8e1daa4a1..3aa1adaed18f 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -67,9 +67,10 @@ EXPORT_SYMBOL_GPL(vmware_hypercall_mode);
 
 static inline int __vmware_platform(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVERSION, eax, ebx, ecx, edx);
-	return eax != (uint32_t)-1 && ebx == VMWARE_HYPERVISOR_MAGIC;
+	uint32_t eax, ebx, ecx;
+
+	eax = vmware_hypercall3(VMWARE_CMD_GETVERSION, 0, &ebx, &ecx);
+	return eax != UINT_MAX && ebx == VMWARE_HYPERVISOR_MAGIC;
 }
 
 static unsigned long vmware_get_tsc_khz(void)
@@ -121,21 +122,12 @@ static void __init vmware_cyc2ns_setup(void)
 	pr_info("using clock offset of %llu ns\n", d->cyc2ns_offset);
 }
 
-static int vmware_cmd_stealclock(uint32_t arg1, uint32_t arg2)
+static int vmware_cmd_stealclock(uint32_t addr_hi, uint32_t addr_lo)
 {
-	uint32_t result, info;
-
-	asm volatile (VMWARE_HYPERCALL :
-		"=a"(result),
-		"=c"(info) :
-		"a"(VMWARE_HYPERVISOR_MAGIC),
-		"b"(0),
-		"c"(VMWARE_CMD_STEALCLOCK),
-		"d"(0),
-		"S"(arg1),
-		"D"(arg2) :
-		"memory");
-	return result;
+	uint32_t info;
+
+	return vmware_hypercall5(VMWARE_CMD_STEALCLOCK, 0, 0, addr_hi, addr_lo,
+				 &info);
 }
 
 static bool stealclock_enable(phys_addr_t pa)
@@ -344,10 +336,10 @@ static void __init vmware_set_capabilities(void)
 
 static void __init vmware_platform_setup(void)
 {
-	uint32_t eax, ebx, ecx, edx;
+	uint32_t eax, ebx, ecx;
 	uint64_t lpj, tsc_khz;
 
-	VMWARE_CMD(GETHZ, eax, ebx, ecx, edx);
+	eax = vmware_hypercall3(VMWARE_CMD_GETHZ, UINT_MAX, &ebx, &ecx);
 
 	if (ebx != UINT_MAX) {
 		lpj = tsc_khz = eax | (((uint64_t)ebx) << 32);
@@ -429,8 +421,9 @@ static uint32_t __init vmware_platform(void)
 /* Checks if hypervisor supports x2apic without VT-D interrupt remapping. */
 static bool __init vmware_legacy_x2apic_available(void)
 {
-	uint32_t eax, ebx, ecx, edx;
-	VMWARE_CMD(GETVCPU_INFO, eax, ebx, ecx, edx);
+	uint32_t eax;
+
+	eax = vmware_hypercall1(VMWARE_CMD_GETVCPU_INFO, 0);
 	return !(eax & BIT(VCPU_RESERVED)) &&
 		(eax & BIT(VCPU_LEGACY_X2APIC));
 }
-- 
2.39.0


