Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C083F4494
	for <lists+linux-input@lfdr.de>; Mon, 23 Aug 2021 07:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232222AbhHWFJG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Aug 2021 01:09:06 -0400
Received: from mail-mw2nam12on2045.outbound.protection.outlook.com ([40.107.244.45]:24673
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229462AbhHWFJD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Aug 2021 01:09:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbddPaInpXbMVAUaJUTen1R7qK72o/1OrRbANw2Np3H3vDEXGC33sqXm6Mkm19QIpWt3zgRneSKp6/6B5/djEHvjSApH1xnRetzFsB5jSgBwP71BR/Y1wx2E53hTuZ7hOwQi3/kK5TJq9/afqtACqg6/yTvW1qxWJOdpnOV7SOmlz1Ay54MUh3OFa1Qp+gfWvUnkJH9w0m5WJw2ulLhrP5TvsJldeLHDEufGeoYQL34Usv/uXtsFJLeiZ3vNs36p9izIsoaBCPKXeEHAgfqQMfpy1wwZvY690kqD0LIbyumSNGSxb21FuNU14dx4onIBcbgV11p6FxqUIWbPSzPNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaOxi7vmpWTEAg4ITpyuX/66F+019URU4LGSID3xrnI=;
 b=D3BYho0rj2szrWd0BbP7I9HzQpofBnr+d0PEeNInYjmDb2kk4fM3U5MvEpvaTC3mMSn9zgnhzU5dPIB9UuHqKmozacalPeQcavjrSSltS1MmXOj0HtE/smrmDVPN833egpVTjYyV/52bdhEm/mkSrCdTLmW9YB5Xty16pRHEFPJ8UUvWPUUBFUjHNGL/cVPxOX4xujnd25PnqgpSxA4Is5N798wcA0VH5hSr52pHaWYlT/qnwp7jUtymb/TUUCAOWHQiOYU3iy8sxG38LD664YCf0EOWA9yfVw58in3Ys3tvWQOYdBiRG4HrCdcQE+gyOQyAtfTw3kyU+Pfc+xJmkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qaOxi7vmpWTEAg4ITpyuX/66F+019URU4LGSID3xrnI=;
 b=Nacqh17SWaCNERp+VNhHQpGeTJwHNBc1RDvzTXsRiFiAV/PYETRYrlxoIUob9rS1RoAykO6PBhz+64PW0q1w4MhBlAtizcUj1DlQkwo4lgE9v08piZXo3NOvESIXQztHmn9obLD0V4f69z2405JTtpqCp6Sl6NJrawcEK6Y7W7A=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM8PR12MB5446.namprd12.prod.outlook.com (2603:10b6:8:3c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 05:08:19 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::946e:7191:34a2:9850]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::946e:7191:34a2:9850%9]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 05:08:18 +0000
Subject: Re: [PATCH] HID: amd_sfh: switch from 'pci_' to 'dma_' API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        nehal-bakulchandra.shah@amd.com, basavaraj.natikar@amd.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <439924a3414563a6ccc26eddb75efba6f54521c4.1629663605.git.christophe.jaillet@wanadoo.fr>
From:   Basavaraj Natikar <bnatikar@amd.com>
Message-ID: <4a4e06e1-6011-4a17-a520-ccf5f6f44cbe@amd.com>
Date:   Mon, 23 Aug 2021 10:38:05 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <439924a3414563a6ccc26eddb75efba6f54521c4.1629663605.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: MA1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::31) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.136.44.26] (165.204.157.251) by MA1PR0101CA0069.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 05:08:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a43f8a-627e-4dd8-2924-08d965f40558
X-MS-TrafficTypeDiagnostic: DM8PR12MB5446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB54468632E68D5C02BA2F6BD3E6C49@DM8PR12MB5446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H82K7dUMSNJEKJayot/8VMcNnHLRGrqJTbVQLMBjuPnUU/dIBZZEMumLepsjd7jVaz9CL0IMNHSiMUUh/ITX8iq4tIiCUSGDqV6DtTlON5jWtxMKeGWHm4iPAuJF3B9J9A4P1CrX95ghwp2pCF2T8C3llz/1KPf3RpHrHNET3XBV2T5iXtpY/bPgDN3KfGx5tn8KNZVZvh6X0uXoXEDXTdKK3eBLXFNO0HR8XXSUlD1gN2oNUmj6Bqe3R4l1NW2NXjSpA/4Vk/8ghp/ezyFHpCo4c+BDLba0ZoTWu7++bdUaacXZFyB53QpSFT7pAhOyMirfweH/EBfAInnH/y6JJFq+232Du2/Xvw9b2NgUpK6bMYoFU/wCOmlTuFojj4MefGuxsK6+GFszdcetUt9GFb+RmNDsIU6R91OG2PpWlvVWf/YTjyYsGWmYw6V7D1spYf6P+sZIv2gmYI4OrxLTcflud/7khPm28lSW/T95DZGF18T0RFd/zW8r98XYp6geGrklH0lo5+2n3ZjKPsrGBn8IE+M9SUOg/85cB3gCRAzkni1fIAMImQUkIH/e2O8C5JJf8XIJnyxQ1e1KNIn4ulZQt3pXkWdVtudPQrV9lmgmM0+Kvp627Co7vj1ohEFrtJTDSsd8r1ShPhqZecYpT5M2yOtm9WLjeLDfhXbY5KaXVA8IuG3eXpxK6WN8YaZtUla2bKEU4eRjGD+KTFeG056hZBdimY7PzU6uAkeR2X7XE+bAjzOKUlNa71mPzex9Jlrt/yKdGZ0OLCYpEcVETPCR6u2W9Zw8xSM/MCgtGTp1ojHWItx5pp9OJTaK9okS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(316002)(36756003)(16576012)(38100700002)(31696002)(26005)(8676002)(186003)(83380400001)(6666004)(66556008)(8936002)(2616005)(4326008)(2906002)(6486002)(53546011)(31686004)(66476007)(5660300002)(478600001)(966005)(66946007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxwUGdueWY4NHY1N2NNVmY0Yk9OM056OHczVEFEZ3lYNmdLR1R4bXRXR004?=
 =?utf-8?B?NGpuUWhtR1A0K3NVamJjV1REYXBGc0FxbDZTc01aYTJMeFJiNjFsSEQrYzdi?=
 =?utf-8?B?cjhOSDUvbktkMWpzeTkvT3ZYOTlOUDVFdCtrRk5idTNkMEFiYXNtT0paazhs?=
 =?utf-8?B?WXNjMGcxbzZpNUd6dlBFa1Z2WFdheG5LcVhWSWFFYUp6SjFOd1Z6U1M4OEov?=
 =?utf-8?B?bUFDc2Z5SjBxay9Ua256U2FrM0Qzc2F2dzRlQ3QrNXRQWllFNEVHZlR5TWFt?=
 =?utf-8?B?SFplWUhRT2V3Sm5VSjJkVVRnNFhvMXcwTkFCTlhsYWxOMUxUMG14MG5jYWlI?=
 =?utf-8?B?U1A0WTQ1UHdyclNraHhqME5TcWU2MmZMSGZvMmZHM09kS1pEbHNRVGRpQlZO?=
 =?utf-8?B?WkZjWldJMUNQV2ZFWFBpZE5Yd2ZJWjMvUGU2dStHcXNrbzFFQnpxR0ljY0Vz?=
 =?utf-8?B?V1k3T20yVitaZVJtWDJKY1hQaWJ4R0hZYTYvZzlGbGh0WWxUeDh6QytNdWQ1?=
 =?utf-8?B?cjdyWlFPTzNPV05RSkxWOVdnZjdXY1BSQVFHU1phdzZaYnNIdjhDano0WjdS?=
 =?utf-8?B?Wm1rOTBNVVpBYTJwb09hV1lQN0RaN0pWRW9vZTd4UGpBZ2JqdFVFZVpmLzls?=
 =?utf-8?B?NC9PTTduQjYvNnUxTVA2WW1WMWtsemhNZDl2eWhqY1N5UW9CbktXVzJVWG81?=
 =?utf-8?B?b0RpVTQ2eWVVell4YncwNVRCcDg1alNNeS9HUUVJc3dhK3RWeTZGUXVnR0x2?=
 =?utf-8?B?MEhXellBVVZ6ZHFadjdLajB6dktoOVVDa2pTTUJGZmxFTEFveVRObG5ZRkZi?=
 =?utf-8?B?ZjRFdnVNQ3FYdmc5d285UVRiTThuQVkyRVFpT0plc25JRnZyZGVaRmRjaDNJ?=
 =?utf-8?B?S2NpWDBtVHBHQjJhZ0RyVW5ZcW5WZ0o0SldSaUdoNUVqdjB3U0w0bVhjdmdP?=
 =?utf-8?B?YVNUYUIyM3pzcGttazVKRkJKaGxRdzlUY1hVaDA2SUJxNlFPUzN6MFhKcmVO?=
 =?utf-8?B?SnJSNVNpc3ZxOGNtUmRlTFRkVmRvck5uNHh5Wld6Zm4zbXlTZDhvNFlzZnpa?=
 =?utf-8?B?cWYxZXp0MkJuZWtJSk5WWmhoNDBrYko4WmRpcldSblQ5UUF3UGlycjZRQklH?=
 =?utf-8?B?cXdEbXhyWjRvbmJIR3g1UlkwU3JJak9xd2JOVTZEYmlLSExUbWpkeXNlcWov?=
 =?utf-8?B?Sm41RERaZmJvMTFaT1VjeTNmdWxsL1UxZzJlN2hkWGlPNkdTa0M5N1B4U0ZM?=
 =?utf-8?B?NEF4R3Y2cnRoNnBlMGtGUFJwM1Y5cThEV09QZXcyNWQwajFuKzlDQzRUQ01N?=
 =?utf-8?B?VDRlZEFNVCtJL2N1T1dGRENpREVVNDFHc2h0MXg1MHZPeUxyWkovMjBKTjlX?=
 =?utf-8?B?bzhOQVNOTHNnUG9LOFh6S3NVbEtPZXh3ZjJEbWZ4K2lOYm5aZTQ0NXAyb25i?=
 =?utf-8?B?Nk9HTmlQQWZ6RUhZa1lWRXpNdFI5cXpMa1BibDZRK0pwOWJjTWZqUitrbjFN?=
 =?utf-8?B?WUYzb052YTA2Y0JuL1FaVUttdE9mK3JIVElqRklrV2ExRHkzWHU3WXVPYVBx?=
 =?utf-8?B?a1dVWG5PbmJBTHlWbWpZQUdNQTZvZkdFVmd5dERkN1Q2Q0l5NmtqRGoxZktX?=
 =?utf-8?B?NWNSYzVnNW1jSlFOa0RwcURjY3pZSjA1ci9Ud01Vck9jaktZTTFZZ2djTjJy?=
 =?utf-8?B?RU5PcHFXZ3ZCckZJQWtCaFZLTU9FajMxV2RQa2t4QnRYOU9Sczd5c0dsM01T?=
 =?utf-8?Q?tEfRD8TDXAxTHbl+pRCytguOhkMyQQ0ZCZ4fPME?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a43f8a-627e-4dd8-2924-08d965f40558
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 05:08:18.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leP+Rx//9nfpbkmWLLNelW5BozOUI3P1UK/sr6ohnaHWKS8oIC5SO83lnjNXz4KULYssNJH0i015xjHOiYSuCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5446
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/23/2021 1:51 AM, Christophe JAILLET wrote:
> [CAUTION: External Email]
>
> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script below.
>
> It has been compile tested.
>
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
>
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
>
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
>
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
>
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
>
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
>
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
>
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
>
> It is *NOT* been compile tested, but it looks safe enough!
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> index 8d68796aa905..fa313c75a8a0 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
> @@ -229,9 +229,9 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
>
>         privdata->mmio = pcim_iomap_table(pdev)[2];
>         pci_set_master(pdev);
> -       rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
> +       rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
>         if (rc) {
> -               rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
> +               rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
>                 return rc;
>         }

Acked-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>


