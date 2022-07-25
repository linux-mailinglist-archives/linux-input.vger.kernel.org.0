Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06ED158021D
	for <lists+linux-input@lfdr.de>; Mon, 25 Jul 2022 17:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiGYPo1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jul 2022 11:44:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiGYPo0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jul 2022 11:44:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6EE398
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 08:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XW9JqxFBZnvPcKuUMd0wKR8nJm8utQ4+ADseFb6aQf8OAj3Dww0BabBNxKbpervcvlpRRWUhxvpAtya9cHQ5cS7P4xENkGhTC6Unewfrxekq9RclXFqexfo73Uant1kQHQGPLrFdFXfGiQ9jJFHvCK2+dN8dIyMlPUxZ6nNLMDuYE1r6uQfclFo0DYB78a5bQaXCD/G1TXKmTOiBvipUdoalV57O5uJu9UMOghpsgevxd6bkW3g83FMF/Ky5yjegrzSnyCzBu/3UN7qNmffdcLHPGUnnSD2fbG/ys4cGiIT3w9sTWsrqc0Zjbga7e6w75dtxnoYm6VyGWMrafj+cVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Nrn3DPb+jOPlf9H4I4/F3y5X9uvOrDCVgSMcae08XM=;
 b=d79qoYUhSL+ybMpABn2AxNGTcO9yLiqy3rcDq0zjjnanSr9yforYR1w6L2T8pdvU9XjrF8eLBFMSo2iA/U+N4HQ494SBwpJ77rske8PIr1sp0GxyNM2Sbj0Ljso3IOyRF0tpylstvLRSNXHdmkMLuEs27HT6H+0naWKTqnITQmF+h61L++9OxBIrqeJfTrqEfJMzEs0H4xn+K8+9Lj5xN+PfkLRHmYPvNDYA2pfnbWJg8o0fo7FPNL6behdXVI4ON6i4ekzxsBRoiAwmMoOw1t7o35VdDhWL3g/eUxRmrSWEZ6b9jKYFLgyUEG6A5DGQCkxSXIgrcuAbHkdriFDjcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Nrn3DPb+jOPlf9H4I4/F3y5X9uvOrDCVgSMcae08XM=;
 b=5n3S4Fuf9o7pLtov9IyiM4hZ0Gqpb/zeIxxPFHKD9NNSsynj/YqOhBVXgZ1K3Zx8L/aTQttpS287kIu7IvHTLm1zWpuwKX1DVnsx4+6ex/UhR4vFJeIRPfm24DlTdX4VC+f4GC9w2OJYeTKUkjm01eUAWyQLn7JGg1bdUSsEMeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by DM4PR12MB6182.namprd12.prod.outlook.com (2603:10b6:8:a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Mon, 25 Jul
 2022 15:44:23 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::2ddb:590a:f046:b38b]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::2ddb:590a:f046:b38b%6]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 15:44:23 +0000
Message-ID: <56582f45-270a-907c-15e3-e5495b5f19ff@amd.com>
Date:   Mon, 25 Jul 2022 21:14:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [hid:for-next 11/27]
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit
 declaration of function 'writeq'; did you mean 'writeb'?
Content-Language: en-US
To:     Jiri Kosina <jikos@kernel.org>, kernel test robot <lkp@intel.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        kbuild-all@lists.01.org, linux-input@vger.kernel.org
References: <202207250836.cwfTgngV-lkp@intel.com>
 <nycvar.YFH.7.76.2207251139160.19850@cbobk.fhfr.pm>
From:   Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <nycvar.YFH.7.76.2207251139160.19850@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::16) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0fd93f2-a8ce-4468-6c7a-08da6e548bee
X-MS-TrafficTypeDiagnostic: DM4PR12MB6182:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42uypVVVot9XyTv4Ye03VyTpQcRE7wMO/6nvy0R8GZp2zcUMfF0TYEoRXqOcOs/okVKR1T72BYkTQedX+StHABsQBhbavqAk1u3lsGqbfpF/VGElQWZeFqn9CilxCMJ1w365f+pCfipB4MTyZX0VoLoW4lts1SzqlZ+mA5Lt73emMuxQnTy6IKD/pkwtn7dUxnqo3JVfDgrImIRniz1w/DVwQr6K5lrkMqeJNZa29gPqGbcmq9sdZ9EEcfeYWpP9i6Ft0sIMxF7L2zMZRpk9elOqrl2f74rkVEc4plr0FfcKM0l6MURJMPYzj9Oyby8vwdOoBd8A9VWIEMv0B8JjEL2SPY/Wd5PjTaDqoFi8VKbYAjPu5G9p3FpKJIIEDRUe564sHqWPe3ysCQpAFcYcKEiCbvJJrscsbe7l1vpCn/OS0JA9NLy9XtJaVos/Yk7Kq4ftm/BrEMPiPymBMVQCOupoFM8wskiqxz5PvEZGDY0sVf+3MvpvcH2xpynEYGOPybVM+dvAmk/dEMA/nvf7kvFIGeDk0cDwTrBETyTG+UuH1rqy6tdXFgaf0efNJ/59Aww+KHQsMXF1HT0tUqx7w+UfQgaJBNjCjnCTrb4D7dcwPq7r9AVYEjN/cYTT+3u9gpiO5Z2lxmqPBQVbAtjGX4ImlgplqkuhtBSfcl583q6pl9H99ZP/dH5vx0cX5hPYV7xqgSLmf6BN7AMHZkYDWXtgUQ5yWnNcuJvXCXwXgbTjrgjaqj5XEQps/xsaOyWNz5Z4I7NDaRSdR+q9KhrsNzEdGiIs3b4c4kAcI3ENC7IWBqy0lTBwOM1yxPB6sb9xZZep7UNyYFQEKUaCtel1egE7j1P3GZxmiTE/XST3OJYvFzBX8Rfb8AbCJiBwOQsVga7ja/MKc9tuNQYI5mriig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(110136005)(316002)(6486002)(966005)(6666004)(45080400002)(478600001)(2906002)(41300700001)(66556008)(5660300002)(8936002)(66476007)(8676002)(66946007)(4326008)(31696002)(6512007)(36756003)(31686004)(2616005)(38100700002)(53546011)(26005)(6506007)(83380400001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWJ6UlhJcWR1eXRPN09JeWx0Z05IMEtrTmVyN2lGaXFuQ3pXeE1mRElBZTZa?=
 =?utf-8?B?eGxsbHA1SHZRVmMzb3NHd0FDN01kTFR6bi9WZXdCb2pySlMyQU4rTFo0MVNB?=
 =?utf-8?B?VFNGZklvUjg3Qzgzam43WlMweDVlY0xlSmdZMS9sdFA5YWFYMlNtbDExZjJT?=
 =?utf-8?B?c2YyWmJIODU0OE5qaVZwaSs4NThqV3dGbzBaMHNWRGI1bTBzcXZ0MHlCVGdG?=
 =?utf-8?B?Y1RBTUlsaGxnUUh6L3U0SmtGb3NZa3ZKSEh2cytTOW9tZG5MQ2lrSEU1WFFt?=
 =?utf-8?B?MVdwVEtWanY4OUFPam04MGNCRkg4R09ic3h6enhUa000SUFBekhBRG5ubVVh?=
 =?utf-8?B?eGliaWs4TWJzbUtzUU1VUWZxbGJJMGR3NWQ4M2xtL1dPYVd6VDRMc2ZqcHRZ?=
 =?utf-8?B?Y294b3ZWRzBZYzZET2hvc21DNVVRdlZVUGVkWnZnbGl5NlJkTnVkOUxtQTFS?=
 =?utf-8?B?RTllZTMzL3I2aXdqNWYrYTAzWkRXNTRBei9HVi83WDBmMlNCL3VYM0ljdFh5?=
 =?utf-8?B?dFk4UVExd0kxcnJlSkxXMERNeDlpNitGU3Bkc2Jvekx5TWM5Y2VwNW1kYnBE?=
 =?utf-8?B?MWJlODIxWTVwUlRTUDRhc3NHOE1pMmQxc2Y1QlRXSXpCMHlkWjlwSS9vTVpz?=
 =?utf-8?B?TlFnOHBHc1Ntd2J4YWF2dVpGZkZlS1dDbXF3Wk9sRFArV3piZjk0a3FLZE9K?=
 =?utf-8?B?c0VUMTk1ZzFlblVQQUtxS3BzTDlycGxobGlHUkMxRXJta1huYVNGWkNMeVlR?=
 =?utf-8?B?d1BDWEcrd3hkTHd0bmJKekxpSi9CM2ZqK2liWkVpdTFzZCsxM1lINS9YdjNM?=
 =?utf-8?B?eGJFWmFuVUNIbi9wdXJibVd4VzhYdkx1eDRsV2QwRGxlZHZveVJadU1KWFhp?=
 =?utf-8?B?NjExLzZPeEI2a08rY3I5ejdaUEVrR0ZhQXVrRWorcnZxYi9CeHdvbEg0MnI3?=
 =?utf-8?B?KzNUYUlDL2Rldmpnb2NRdHl4d0Y4YnhLUUlLd2xDemxZWlB6ODFTWnVsODBO?=
 =?utf-8?B?aFh0bHpUbkJlMG9yREJBMzR5WGFWQW9JSUJFLzQ5aThKazN3QkVBb00zZGZx?=
 =?utf-8?B?U0Yxc0VSdFRyNENSc0t4dmFPcStub01QcG1XVG4yLzVva2RTdTlnTnZIU0NY?=
 =?utf-8?B?UlJlUUhUK3RudEE4MkxZak9mVk1uQVZYL3VwWEQyenRxUnRoeE54UlAzck1v?=
 =?utf-8?B?MTcvLzF1SjRwUlRBeWIvWUI0YXVUbkRvSDlZYjJqL1I1QVhFU29vYTV4VSto?=
 =?utf-8?B?NEo0SEhYcG1QV3RJektvTGdSak1xRVFCbWRyd0RlTnpwaGc1QTZ0b01IZUox?=
 =?utf-8?B?SGtPbUJFYi9nLzV3VkxocjhsK3g1ZVBqSk54UEdmR2VpZ2xwa2FNbFlSMGlw?=
 =?utf-8?B?VGNETTEzSU1ySXVUUDlkbHppdm1POEJpUkJyQU5XVUZPSVRtb093NWJOZUFY?=
 =?utf-8?B?ckhUdnBkaXhqSFRwaDkwQUs5K3FCMGxzUmwwZHRhK1c2amFEbTEyUkd2d1pL?=
 =?utf-8?B?dDZ1MDRPdTBjTytGczkxOS9RNXM3Y0ZMSnN2Y1BjZ205ZGdjM0Q5bG5hNWdR?=
 =?utf-8?B?QkR4UUIvdWxhYS9qYWdOR3R0TmdSeEliOW5mYUFhejFZdGo3M2JaeFhYaXNi?=
 =?utf-8?B?SlRCaW44MXJibUtSWU1jdDFzT2c3ZFQwWnQ3bjRrNWtXRys0REQyRHlhNkly?=
 =?utf-8?B?UFZYVGJZdjA0VU03MlR5YWRmVnBZa0tST2RRWHQvaHdYV1VkOWV5QU1xNVVu?=
 =?utf-8?B?STZwd01RSXRXUHJUVGFhVmQrL0hDbERlSjJ0eGM4Rkl0eTJmQXFlNThPRGZl?=
 =?utf-8?B?WlZSMkQ5ZnNLWGd5NXNXMGZYLytjU0ZaTTVVcWNWZmd4YnV6czZJbTZ2eUpO?=
 =?utf-8?B?b2pwQ29sUWZrL0VsOGxQWnZRTWlGWnFubGFZK2YzVW9lNGd3ZXlPMDZlaGEv?=
 =?utf-8?B?d3lEZHQ3QU15a0N0WmdTNkF4bkxvd3p6RkdLY2VHejcrWEFvOS9nWk4wZFdH?=
 =?utf-8?B?NElkRGlvU0NTbHZEa3lsLzA3VHh3bGlWWXJiWGkzSUFsemVUbWZ4SVdvN3ZW?=
 =?utf-8?B?cEo2ZU9mbERLa2VlRmxjdFZGVEt2VGhKa09XUFE5ckllMzNtSDJJcVE5MUJ0?=
 =?utf-8?Q?i22rtiVoIFlK7QPspVCHVA58y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0fd93f2-a8ce-4468-6c7a-08da6e548bee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:44:23.1406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJz1rshHPLrQuOwSlw3XF0V7prJfhyMiWl/FQh/ZOHdnlW1VO//efUEZg5f0LIkbp83tJshUUbsimSiL/qhNYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6182
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/25/2022 3:10 PM, Jiri Kosina wrote:

> On Mon, 25 Jul 2022, kernel test robot wrote:
>
>> tree:   https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FPabO720i7GSUkRHzNtWpUpKo2vzoDskyg5D%2BPcfv5g%3D&amp;reserved=0 for-next
>> head:   9c9914cc509bccd7b134d33594e19b9411c12d4b
>> commit: 93ce5e0231d79189be4d9e5f9295807b18941419 [11/27] HID: amd_sfh: Implement SFH1.1 functionality
>> config: arc-allyesconfig (https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20220725%2F202207250836.cwfTgngV-lkp%40intel.com%2Fconfig&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=wUiF3lD%2BzugnBwoIbc%2Frmv%2FQgbZxTfb%2FuMjvjUzsOp0%3D&amp;reserved=0)
>> compiler: arceb-elf-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>         wget https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pcU0nQ%2Fc7FAKNP0Gej8VG%2BfHmb1g3ZSkXrZdHJk%2F6D4%3D&amp;reserved=0 -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git%2Fcommit%2F%3Fid%3D93ce5e0231d79189be4d9e5f9295807b18941419&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=8mdjArHzn%2BTYn9Cypx3GUO3PakmUi9wLMtjVsCnZYbQ%3D&amp;reserved=0
>>         git remote add hid https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fhid%2Fhid.git&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=%2FPabO720i7GSUkRHzNtWpUpKo2vzoDskyg5D%2BPcfv5g%3D&amp;reserved=0
>>         git fetch --no-tags hid for-next
>>         git checkout 93ce5e0231d79189be4d9e5f9295807b18941419

HEAD position is 93ce5e0231d7 HID: amd_sfh: Implement SFH1.1 functionality
build issue on non-64 build is present in Re: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1 functionality
- Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207211344360.19850@cbobk.fhfr.pm/> 
above git checkout 93ce5e0231d79189be4d9e5f9295807b18941419 leads to Re: [PATCH 00/11] Fixes and implementation of AMD SFH 1.1 functionality
- Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207211344360.19850@cbobk.fhfr.pm/>

Already fixed for all builds with patches Re: [PATCH for-next 0/2] Fixes to amd_sfh driver - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm/>
HEAD position is 5d4d0f156575 HID: amd_sfh: Handle condition of "no sensors"

>>         # save the config file
>>         mkdir build_dir && cp config build_dir/.config
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Note: the hid/for-next HEAD 9c9914cc509bccd7b134d33594e19b9411c12d4b builds fine.

Yes correct builds fine since issue is fixed in Re: [PATCH for-next 0/2] Fixes to amd_sfh driver - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm/>
since HEAD-9c9914cc509bccd7b134d33594e19b9411c12d4b is after build fixed HEAD position 5d4d0f156575
HID: amd_sfh: Handle condition of "no sensors"
 

>>       It only hurts bisectability.
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function 'amd_stop_sensor':
>>>> drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
>>       48 |         writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
>>          |         ^~~~~~
>>          |         writeb
>>    cc1: some warnings being treated as errors
>>
>>
>> vim +48 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
>>
>>     38	
>>     39	static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
>>     40	{
>>     41		struct sfh_cmd_base cmd_base;
>>     42	
>>     43		cmd_base.ul = 0;
>>     44		cmd_base.cmd.cmd_id = DISABLE_SENSOR;
>>     45		cmd_base.cmd.intr_disable = 0;
>>     46		cmd_base.cmd.sensor_id = sensor_idx;
>>     47	
>>   > 48		writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
>>     49		writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
>>     50	}
>>     51	
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2F01.org%2Flkp&amp;data=05%7C01%7CBasavaraj.Natikar%40amd.com%7C998f7294bb914743e98908da6e21a832%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637943388080227109%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=v18RWurFcm8DwHK949WLjQrGt%2FHlYrTdnovdHxS59Zo%3D&amp;reserved=0
> Basavaraj,
>
> could you please fix that up so the we can have a fixed version in -next 
> at least for a couple days before the merge window opens?

Hi Jiri,

As per above mail issue is already fixed for 32 builds Re: [PATCH for-next 0/2] Fixes to amd_sfh driver - Jiri Kosina (kernel.org) <https://lore.kernel.org/all/nycvar.YFH.7.76.2207232011090.19850@cbobk.fhfr.pm/>

And I also cross verified as below builds fine with 5d4d0f15657535f6a122ab26d47230b5c2b944af and
9c9914cc509bccd7b134d33594e19b9411c12d4b.

'''
root@amd-Cloudripper:/home/amd/hhh/hid# git show
commit 5d4d0f15657535f6a122ab26d47230b5c2b944af (HEAD, origin/for-5.20/amd-sfh)
Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Date:   Sat Jul 23 11:40:33 2022 +0530

    HID: amd_sfh: Handle condition of "no sensors"

    Add a check for num_hid_devices to handle special case the situation
    of "no sensors".

    Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
    Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
    Signed-off-by: Jiri Kosina <jkosina@suse.cz>

20895:  CC      drivers/hid/amd-sfh-hid/amd_sfh_hid.o
20976:  CC      drivers/hid/amd-sfh-hid/amd_sfh_client.o
21117:  CC      drivers/hid/amd-sfh-hid/amd_sfh_pcie.o
21279:  CC      drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.o
21361:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.o
21449:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.o
21499:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.o
21588:  AR      drivers/hid/amd-sfh-hid/built-in.a


root@amd-Cloudripper:/home/amd/hhh/hid# git checkout 93ce5e0231d79189be4d9e5f9295807b18941419
Previous HEAD position was 5d4d0f156575 HID: amd_sfh: Handle condition of "no sensors"
HEAD is now at 93ce5e0231d7 HID: amd_sfh: Implement SFH1.1 functionality

21635:  CC      drivers/hid/amd-sfh-hid/amd_sfh_hid.o
21649:  CC      drivers/hid/amd-sfh-hid/amd_sfh_client.o
21661:  CC      drivers/hid/amd-sfh-hid/amd_sfh_pcie.o
21742:  CC      drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.o
21785:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.o
21887:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.o
21941:drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c: In function 'amd_stop_sensor':
21942:drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c:48:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
21951:  CC      drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.o
21956:make[3]: *** [scripts/Makefile.build:292: drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.o] Error 1
22068:make[2]: *** [scripts/Makefile.build:555: drivers/hid/amd-sfh-hid] Error 2

root@amd-Cloudripper:/home/amd/hhh/hid# git checkout for-next
Previous HEAD position was 93ce5e0231d7 HID: amd_sfh: Implement SFH1.1 functionality
Switched to branch 'for-next'
Your branch is up to date with 'origin/for-next'.
root@amd-Cloudripper:/home/amd/hhh/hid#
'''

(FIXED) newer HEAD patch :5d4d0f156575 
(Build ERROR shown by kernel test robot) is older HEAD Patch :93ce5e0231d7 

Works good for 32 and 64 builds on newer or latest patches: HEAD position - 5d4d0f156575 HID: amd_sfh: Handle condition of "no sensors"
Build error for 32 builds observed on older patch HEAD - 93ce5e0231d7 HID: amd_sfh: Implement SFH1.1 functionality

Please queue for 5.20 and let me know if any changes required.

Thanks,
--
Basavaraj


