Return-Path: <linux-input+bounces-13716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ED9B14F9A
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 16:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7FC04E5AD4
	for <lists+linux-input@lfdr.de>; Tue, 29 Jul 2025 14:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7546216392;
	Tue, 29 Jul 2025 14:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cvm1oiaL"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC001ACEDD;
	Tue, 29 Jul 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753800867; cv=fail; b=Hbl3o7gaCPp4ygEOtb4M1ZSyAQUGD2n8CwkIV8UDfs3xUoFSKEkfVQpwClytuj4ymBhAS1abBKo2XIBwk0rUxIX4f2NNXa6UF8T6MdTP/wAfsoyo8tLBeJC7B0m0kCyg6e2vJEPX+gBT4lYM+7kW32b4i8O2QPrIq5B7YhAduyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753800867; c=relaxed/simple;
	bh=Idi4Kv2tMWFleBWJM51FJhUEtSh8p/eU7KOMRS6hnp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hdyJiVaRPUOdkqWyffh5HWNCO/UNhdRQyYsw1TSiNqADbWFFD8oeqRQV3CrDBBXJovXrijSJIdcgzA6Y0r9nok5q3+0LcLsYrVBspmoxpZtT4eIlr+RX9RHsXTVtkPBlNDsGgmYrXIPqRJbwnTCZruAe5Wpc+SiTp7tTf56ULjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cvm1oiaL; arc=fail smtp.client-ip=40.107.236.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7gdSSXUtqUUOmugYdO8iMSzTzyqLewZqJV2yko1sFL1aQNp+7zNFeP3x6I7g/Hsbpj3uqiTazI96fva8KwrCOeEcQN4dTzKsO9uS3UI77wNyHTs2SYv/tJOHLW0eLR24vpZDzB8VxZmGaYF+VDDKq175jid430f/6tpDGQxGWhBxYlrmSCbsem/WFgNqnohPs9LbNoJd3kCz1Y1EQkxy8Q3dUQMCWP0b5MdjVsbHid72+Nho2KajUJrxmXcbTVK9JyfcJQbmwpRI/jXZgVGfY9l2iQ0CBzr8RjX2VmjRbbLRvZo8X3uVcGEpBNFr3aso8Ab3v9Cf9liJ3XBR0DB7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Idi4Kv2tMWFleBWJM51FJhUEtSh8p/eU7KOMRS6hnp4=;
 b=oUORVKYJjJfTS5IMCG2jNB4Ba0wLJ4Jm91zVwbKQwkB5i10byaEhOtgLSDL7pUtA3a504mAgDiVkGsOrm+V1itzg5T+W16S8Z3h96UuUdmv1RNZEzhRLsr18d+2MOR0+Uc0aBAirAybbCGycmC4zOvqv/4Frso1LWjATL9prpwgbjleGsh28D+qb4Pknslebwq3jx3O91ZjNh+Rj1JDBBh6+BqqbrQQYkI7xc+8y0pAg4N71JQpsuEuu6UBC4f5CHRAsuqFDsn+e4qEqBv+DHFxqnjlID8E2iJkDn+t1ptU/MyqNMG3bf4dtihHrTBYbVS5jG46UvHbdUVgg4g3VUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=plexus.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Idi4Kv2tMWFleBWJM51FJhUEtSh8p/eU7KOMRS6hnp4=;
 b=Cvm1oiaLOduKdgwqY9sFY5TwFGLdNk/kR19x5ljNHdzBRxvOnNQs2dsMY0vCa11+4fWgVaTFGKyl2Hs/+EHamll75Zz2XvTUcGhKPl9yczahiv8eoRRaWtf5/eUeOqZGo8k7efW+QSrHiyVCsUxVCSrQWQHuUmS9Bud2vFcCCfcnvNVAK/Fo6HCFurSqllPjEjAILjB5RsgqR9WC8QhvksAqhSbc2gXbfsxcfz2FVYleZk+UPthLf+KhLoYfy2SRBxoF0IAR++OjX33NKLfJ3mPLQl3NFy6WMQo3h/wJlVzAuaVnfUqr41B5OE1HHJRmP/m3qxJxmxTnWGCkLgohJA==
Received: from MW4PR03CA0002.namprd03.prod.outlook.com (2603:10b6:303:8f::7)
 by SA0PR12MB4398.namprd12.prod.outlook.com (2603:10b6:806:9f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Tue, 29 Jul
 2025 14:54:21 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::13) by MW4PR03CA0002.outlook.office365.com
 (2603:10b6:303:8f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Tue,
 29 Jul 2025 14:54:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Tue, 29 Jul 2025 14:54:20 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 29 Jul
 2025 07:54:02 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 29 Jul
 2025 07:53:50 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 29 Jul 2025 07:53:50 -0700
From: Willie Thai <wthai@nvidia.com>
To: <danny.kaehn@plexus.com>
CC: <andriy.shevchenko@linux.intel.com>, <bartosz.golaszewski@linaro.org>,
	<bentiss@kernel.org>, <devicetree@vger.kernel.org>,
	<dmitry.torokhov@gmail.com>, <ethan.twardy@plexus.com>, <jikos@kernel.org>,
	<krzk+dt@kernel.org>, <linux-input@vger.kernel.org>, <robh@kernel.org>,
	<tingkaic@nvidia.com>, <rastekar@nvidia.com>, <dkodihalli@nvidia.com>,
	<mhn@nvidia.com>, <arundp@nvidia.com>
Subject: Re [PATCH v11 0/4] Firmware Support for USB-HID Devices and CP2112
Date: Tue, 29 Jul 2025 14:53:50 +0000
Message-ID: <20250729145350.3538324-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|SA0PR12MB4398:EE_
X-MS-Office365-Filtering-Correlation-Id: b5d8b4b6-ec68-4e0b-f063-08ddceafcce8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXozVVRGTU14VTNGVmpiUVFZTGRwTlUxZTBkVTBMUGxHWGxLV3NzMjl3TS9K?=
 =?utf-8?B?cEx0WXlnUFNQK0J2MUZvdTkwMTN4Y0VFNUZCM2RNeHBLdU9WZzkraiswYWl6?=
 =?utf-8?B?VzBMaENZNEM4K21SWlBENWc5VXY2aDJ5cE5zMlBCeG41eEF2cVRWU0sveXc2?=
 =?utf-8?B?TkczNVNibFF0SWduVEExb2lONWVSaHR6R01TZjNwZEdCQVc2TXRrSzgwaVA4?=
 =?utf-8?B?czhyZys5NW5MMU5jVDFOa1lVMng0MkNJRHpld0Y2MDNGbjZWNnYzVlQybXpu?=
 =?utf-8?B?RUVOeUtCbktHTHhPWWt6STg0dEtLSzRNZmUzWlI1dUQyaFVjNlpOVGl2TlJP?=
 =?utf-8?B?cDBVUzU1QVBFQjdXNDNBcHdqVk43eEQzVURXWWdic2cwSE11K0d1bm43VUc3?=
 =?utf-8?B?eUVBRURGRFc5TStnUTlGdTluc2U0QzM1MitZRFhQbFFGY2hiTUs3VzY5QS9v?=
 =?utf-8?B?TTY4TmFhWlFWOGF6V1lXeVExNFc3b0JteG5wNkExV015MVRXOVNHN05tWndW?=
 =?utf-8?B?a0JnYnVFQ01Fc2xoTE9wUGk3bkhjSnRIc2ZwYTRaRGNZVkRyTTJuam4rQmF3?=
 =?utf-8?B?bGcyUzBEbFVvMHJHQmYxWldCdzZuMEZXa0d2RGdRWVRUWnhDaEhzTTJYLzRI?=
 =?utf-8?B?WjVGYmdCYk5qOGFRbXpXSTdjaktBSStIeFQ4NlRUdEt4bzJmcmpsaTlsRmZh?=
 =?utf-8?B?SzRIZXE1ZkVQL3RHSlJTQWhqN0NSNklOOU9XUUpHMDduVG0rNXhSWUdiQ0xP?=
 =?utf-8?B?TFVxOFJFcWFmVThTL3BzUUJNRGdzUUY5clF0alRObi90NUdhVmEwRktzZGgv?=
 =?utf-8?B?cEZ4eXZMak5tMjFIRGpuWGNRYmRseGpFRGJtRGxCVmNnRG9wVXNjSFU5ZjNS?=
 =?utf-8?B?U3E0Wi9LRlJhcGpWWUl2U3FpMmRPZHdsT09nKzdLYVlzQWpyL0NqRDJxMWdx?=
 =?utf-8?B?RWRYV0FJbE9nRUFkb3RyUVBNUHpwbnlxUWhwRk1jNGJlRkx3anF6TTMrUDZv?=
 =?utf-8?B?NFZ3NjFlSlFNd1MzdXI4b1RsMG1ncWFlRnB1UTd1bWhYLzJLUGZFTVN6UmlP?=
 =?utf-8?B?N0hwT2Z5R1BIVXR5MGZOL2szVmkvRWxTbUFsb3FWTTlSVThJNVRDN1NJRy9z?=
 =?utf-8?B?d3pBa0lxNmEreGxYM2pldUlGbENxUmJoQUt2OHZwMm5HWW1lTnFwWVAzUGdq?=
 =?utf-8?B?RWFrQjltYXEyZkpUanJmSlZIN1FpQ3FCeVBRS01CQlVCYmgyRXFpT3RzTlJu?=
 =?utf-8?B?MVBGQlRGVDZZUm9aZW5HNElMQ29OMEw2Q0IwNE5EOXRHSExHZ2ZXM2VycDBx?=
 =?utf-8?B?OW1lall6OHRCY1A5NDkwSUZIWnN2b1ZmTzdoSUEraGRvNnZoRGtUeWkwVmJ3?=
 =?utf-8?B?MmVkOEFaRXMyVFNab1ZVK2d6TG4zeitYVTZpR1JScUtXZjlmM0lWSm0zUDJP?=
 =?utf-8?B?L1hqOW1EeENCbmxnQVpxYmVzQmdhMzZtL0RtMVBXNDdNMlR5OGpDbXh5WlE0?=
 =?utf-8?B?SkVtOGRIV2ttdEdvblc4UmE4Yi9ycER5c1BRcmZQQ2tyMndveHl1SFpMYzRy?=
 =?utf-8?B?cHNyN3NxR2xEMkhlYTd6dEVEQnlXTmxTNzVoK2prNm9rM0Y2UkRML0ZPVW5X?=
 =?utf-8?B?VkUvbWlJR0d1aXpiaDIxRGZoUnFVeHYwbkMrNzBheDlqeUlzc3ZDVUhid3Vx?=
 =?utf-8?B?dU1sNDB6c3AxMjVxUlVkZ1BETDVhM2Q1TUFKZjczTGRDNVRjUkZ0U2t2Rzlj?=
 =?utf-8?B?OHdNTDlmbUh4enZuVzh1NVpEWHFVbWUzV1NXdEVIbWU5RGRaeUluZ1dmUWsy?=
 =?utf-8?B?SEo2cFg4T2FQOHhrMVd6b3Vxa2JsOW9VdU5tcTVvTWNieFBidmpQZE9hQTgw?=
 =?utf-8?B?RkcyTHhJZmIvaU5JZy91M052em4rcGZ6MXhEcVRaVzB5WjRyOUlnbThrMVIw?=
 =?utf-8?B?a2Q0NTdTSENueXppK0ZsRmVzam1lSTBIT1MweWFjbzRlWThISmhrVE0zRXlP?=
 =?utf-8?B?Zi9Xa3g0WjUzWVRLdEp2ZjhuUmkvMWpxWHU2YVRxMDdPRFRTRHh1MS9Tbjdv?=
 =?utf-8?Q?jevCUH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 14:54:20.7328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d8b4b6-ec68-4e0b-f063-08ddceafcce8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4398

Hi Danny,

I hope this message finds you well.
Thank you for the patch set — it’s exactly what we need for the I2C-over-USB feature in our new products.
Could you please let us know when we can expect the next version of the patch set?
If you've paused work on it, we're happy to take over and continue from where you left off.

Thanks!

