Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEFFC7247A1
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 17:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237816AbjFFPZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 11:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237600AbjFFPZX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 11:25:23 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A271810D5;
        Tue,  6 Jun 2023 08:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPdXET9iyQ8MlJCthXaWRlvcEz/qrWS+b9yOLKJawG6Ribay1KUztIxtcMZ5Jm6lx0cfmtLYS4o+/7lNEwQEGUwiw7UVAXl4O936Z/itnDnY5LVIzNeUN/VuFsuU/4vPB55JL27DazY8muJXE5GTXxYPta7OL8rzxGtEvw2oHkvlJZX6BpfEDV1GqLS3VKKKr2MTfF1eK/TVV0z/eUserguJzpat9OxlV6qQirHapfdS2XBy39sjBT2wZskGZnLby7Fq8SjUbY2tjSdivIKWwS84mBvzJ5FyzWlWxDUenVLJ79mN2Hjf//DACjcqtnQTX8k94PctrHTgWavoviAmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ip6D39rdQCR3C+2MyOU1IylSmcLr73cpoxkqvWCvPUs=;
 b=eEnruEBjn7a+o2FSNOVWCKiSXX6j8kW3Gg9HesKngxxlCZu+9dQwApzh2SYFc5/Zs+IIkupBBPgq+hxhcy3+7Djc8ScSjFihBIXv5GxBb/mtHQ58GI795sz1/Qeo6WA0RJAPs38sWBBvGArX0q7VFi8urgns1zLabFe5Fpok+HfVOcwZycAS73jg+lI04L0GhKj+VIWRK5vWdISiVCsEsxZxdgKc/8XtKSKyaLLsWmR/Tg/aybb3JffQ8kqQGpdIAL60sgw3DOUdKqR0RZmzh4osVsm5CQSqsUVSRzWa8sKP7lGW9slvgaJOuM7SQy9wB9nRvFhlzKRxiu4tfyLIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ip6D39rdQCR3C+2MyOU1IylSmcLr73cpoxkqvWCvPUs=;
 b=fe24FTlhKmfYBqi8LetSwU/+hII6ez15/qO5ACPEu6BhVi31V0DyPbCXQZO2McotyPKKpKEA6t3fPL1LwgBfkTZTUmcItjZeGVC131zF85GYwRTaYQcTYXHDdgqnpXU8w9Ys6ISRLBz4FsAY+4VD0r5pqp+WfPndTXfZBgBqNI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CO6PR12MB5492.namprd12.prod.outlook.com (2603:10b6:5:35d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 15:25:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::43b2:55d7:9958:390e]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::43b2:55d7:9958:390e%5]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 15:25:17 +0000
Message-ID: <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com>
Date:   Tue, 6 Jun 2023 10:25:13 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: amd_sfh driver causes kernel oops during boot
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Malte Starostik <malte@starostik.de>,
        basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org, stable@vger.kernel.org
References: <ZG3ipauL9FTnQJiC@debian.me> <3250319.ancTxkQ2z5@zen>
 <ZH6buB8TcMd5aT_1@debian.me>
 <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
Content-Language: en-US
From:   "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:8:2a::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CO6PR12MB5492:EE_
X-MS-Office365-Filtering-Correlation-Id: 74357832-a049-4747-0c5a-08db66a23b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsXsKMz0FK7NBwSiseIt/tCfjKLKY9RUtLETvAuB5QEaB3HFl/zeHuo3oO8nQQvKmpDYFWawBVWCLvO7I4+thI6l357vOZak9qF2d/NzgyUHGn4+3WtBJp7xrP2IkFflp8EZk6RnDwb6GwJAKML4xyYkrkbbrF6JQFerWI0xPykuZMCVCQl+ufjXVNuqnUd+AydKssnGwAs9D0Admt+HN8SQbkhXl2TZ90RmNfzeD4164SIQjsthVMhGNx2t+jym+roilWAkit+E7NDctEZo+ALExdFPbJFaGjqSGaaiJ6TAdaP9rnEa0BZuEbDMQThqCix4qNN9kSm9lbBh3Frs3IJkSOSBr0Z1YcqY6OJtuXvf6BatdHFz8flSyuWXJDwVlEJqjtxhviXRuo2AC+4FouLvsMswRl8X4S5bhQfE3SRhlasbT+VFlgXV9QBguK0nlKiiA5NeusAaNIvb9mTsxRqdsAqX8eikuqKe3z3eQiWki1t3im2obREkG3cdj69G3+vnHJQRZcc+n0lEE9AyqumT6lqs6j0YssYjqzInEv2RyR68O+3EW7AhnLOHfym2Ggl5b8BA6TuTf4Z/vp+Z4hWhXTvSHebppfhtrxBPVHFfvyybzZs4s0qQuBoy7AuT43f3HxjBv59piOPpJH02Rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(6506007)(6512007)(26005)(53546011)(31686004)(83380400001)(31696002)(316002)(2906002)(36756003)(186003)(5660300002)(86362001)(8676002)(8936002)(2616005)(41300700001)(966005)(66946007)(66556008)(66476007)(6666004)(38100700002)(54906003)(4326008)(478600001)(110136005)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGlqTDdVS3NpSGVYVWxWS0FIT2tmaHlQMGFjQ3hwNjZ4Mnc3NkdZVmozcldm?=
 =?utf-8?B?QkEvL3hTODNkWjBPejVmWEQ3S2g2cnBOU0ZkZG9EUk00MDRyTk4wdEs1L2lV?=
 =?utf-8?B?MGx2QUpjYldCdFlOamJIWmo3bjcwVndOUkVSWW5kNm1ERW9WbG01eGd4d1p4?=
 =?utf-8?B?Si9WbE85M0hMQ0ozVmpYNm1aSWFTbXc2VHYvRWhjK0gzcUd2L1k0c2o3by9o?=
 =?utf-8?B?WnJXK2xVTnJRL2NWVCthY3lyeGE0ME05dDhSWTVzUU1sOVNPdVZlQ1ZET01Y?=
 =?utf-8?B?WWdVa2tkUjdMUk9aM1AyYU5LTGNLTHpRRkc2a0dsSE43NlpnaHdrczdvc2Vt?=
 =?utf-8?B?NkIxQzFSUmZLbS9lbWFEMXFGMlRaZmRicWF5UjN2OGdBT1FuWU1lVXJ4UFNV?=
 =?utf-8?B?Ujk1RVNGd1B4cXVWN2ZTNldRaUgvWHJkRVZmKzZkNmhFSnNGL0szZjBVbmo3?=
 =?utf-8?B?Vnprd0JrK1FkTmNRdVVIbG5qYzRERDUyQ3doN3phUG8rL0o1YzlDa1I0OTFP?=
 =?utf-8?B?cHVjWFp3SzF1aTJvcFRTZ2hnZHlkSys3TXdHY2tqL2RzSjJGc09hTTJVR2hU?=
 =?utf-8?B?OFNrVVEyMXZRQytuV1FickdKbnQ5QkY4cEl4LzAzSnk1WHR6MmFvcGptcGt5?=
 =?utf-8?B?VWJVUTMvSEUrQWpxNzZUQ0ppcGwzWlN6ZU1Wd29UTmlqelJvenBjZWlTM2tQ?=
 =?utf-8?B?K09wQUd6REJ1dDFWUjkyVlMrU2RqamQxNnh2K1dSUW1YVnI2SjJwQ2Y5ZDZn?=
 =?utf-8?B?ak5LbG9rZUhvTXNCcDZaOHBCdGN3VHNqZm9NcjNYam9yVjVjSDkyUUNOb3dZ?=
 =?utf-8?B?SWZmdHVtU1o4b3ZzaFJsODFiTUpnaEpVdHNnMmZzZkhDWWMzVmZoNkF0YS96?=
 =?utf-8?B?Uk1BVVBDYjE2MHc0M0dyM04zWnRTaUswT09ueFpadHNRalYvYVhQZHVqTS9V?=
 =?utf-8?B?Ujk4V3VUYnIwYVJUTmI3dVA3d0VUT1RWc0VBaWh3ZlVUeUJyZ1NXVzR6LzRM?=
 =?utf-8?B?NkN1NGoxdUNYY0p5SjNIYjNyeGk0R3RHRXZEbHBGUllmZlowWTlaUmhwdy94?=
 =?utf-8?B?ZUJnUitQb2s5cVJyZTUwaHM3QnBTVGxadFFkL1N4R3dmN0E5dWhLS0RSYVpM?=
 =?utf-8?B?d0M3WkwyMkhzbHpMTWhFMUxMQThwMFBhTXhadGtvT0w4bzRyVEtrK2J3UVdH?=
 =?utf-8?B?MnlZSWFBUnBqYkpBRDc5SDBRclZnazBjRkNPNmdnTTBLQStReHZqbGJGRlFD?=
 =?utf-8?B?YmdBcTIzbVNueTd5c0svQlVCd1FuU3paUHRPdzc0OG9heVhaODl6QWNjMGgw?=
 =?utf-8?B?V3pUVzVOTlVoZU9qcWZYOGFkd1dYQVlDNERnVUNJUVRCTjVFNjJFRnFOU1p4?=
 =?utf-8?B?L0NPdEhLOXJzVlN4ZS82b3ArSVNYQ3I0b3N6L1JrekFna2I4OGlOMXFQbUtJ?=
 =?utf-8?B?QXVuSHNTMnR5T25Md3F1TmtqMU9Rb29qOWlLMU40cVZxZUVoQ0R2aU54N0dP?=
 =?utf-8?B?QXM4eDMwbVVnaTBqZGNXbGtYT2x4QWcrTEQwSDFVcm5rM2xESjg1WWRVS01w?=
 =?utf-8?B?QzdqU0VzZXQrK0MzajIrMlhuNUxLUTR5YkNPYWRPb0FxSWgyVWF2QlpSdlVa?=
 =?utf-8?B?cjJBN1VEbEx1SFVQSU03cXlyZm1FUUhQRmpFNHBoSHRkc0pOLzQybForR3Js?=
 =?utf-8?B?ay9sTTNIOVdjcmNRSER1UjV0SlB6R0JMK3ljQTVubGM5Z2UwZC80SFdkZUxI?=
 =?utf-8?B?bW5sc1FHb3V4aFJqWWdxOVhjMEZzc1ZES2Q3MFRsSDNieURWck81aVdpeXpx?=
 =?utf-8?B?eGNzMGtTcXJYUTRnUDF1VjJweWFJbTlmZm1PMHlIUVR1Y3c4b3hwVXFmMWh0?=
 =?utf-8?B?d1Y4Q1RiNUZCUDA5UCtKOXJTVW1jS3RmU3lsTzJrd0M2VDJYTXVyTHR0cm5w?=
 =?utf-8?B?dFJpTkl3VUsxa1hBaFBUYys4bzBXRXRzbDhJQVlFak84QWtFV1pqQ3NTY25m?=
 =?utf-8?B?UFNqUVBjZ2tDYVIzNlIwT2htYW9uVURlazI2a0RYTHhod0FyUFJpcHR6RzBv?=
 =?utf-8?B?TUJBQm1kdGYrYmV2VEFjZXh2YThYNCsxdGozQm4xZml0SktqWVNUc2lNN2Z6?=
 =?utf-8?Q?1LmtLDsDX5s+XsD2KC0kYuJTR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74357832-a049-4747-0c5a-08db66a23b4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 15:25:16.9492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5u/ByVXP1SGPqxKSWeTcU+EbRDXXq8flYYMrvryIUWT2YM59Gsbg5soCoc51FeA2/PnDu8KOW2J2k0KbIQiS5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5492
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 6/6/2023 3:08 AM, Benjamin Tissoires wrote:
> On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 06.06.23 04:36, Bagas Sanjaya wrote:
>>> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
>>>> Hello,
>>>>
>>>> chiming in here as I'm experiencing what looks like the exact same issue, also
>>>> on a Lenovo Z13 notebook, also on Arch:
>>>> Oops during startup in task udev-worker followed by udev-worker blocking all
>>>> attempts to suspend or cleanly shutdown/reboot the machine - in fact I first
>>>> noticed because the machine surprised with repeatedly running out of battery
>>>> after it had supposedly been in standby but couldn't. Only then I noticed the
>>>> error on boot.
>>>>
>>>> bisect result:
>>>> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
>>>> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
>>>> Merge: a738688177dc 2f7f4efb9411
>>>> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>>>> Date:   Wed Feb 22 10:44:31 2023 +0100
>>>>
>>>>      Merge branch 'for-6.3/hid-bpf' into for-linus
>>> Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
>>> to amd_sfh). Can you repeat the bisection?
>> Well, amd_sfh afaics apparently interacts with HID (see trace earlier in
>> the thread), so it's not that far away. But it's a merge commit, which
>> is possible, but doesn't happen every day. So a recheck might really be
>> a good idea.
> Let's not rule out that there is a bad interaction between HID-BPF and
> AMD SFH. HID-BPF is able to process any incoming HID event, whether it
> comes from AND SFH, USB, BT, I2C or anything else.
>
> However, looking at the stack trace in the initial report[0], it seems
> we are getting the oops/stack traces while we are still in amd_sfh:
>
> list_add corruption. next is NULL.
> WARNING: CPU: 5 PID: 433 at lib/list_debug.c:25 __list_add_valid+0x57/0xa0
> ...
> RIP: 0010:__list_add_valid+0x57/0xa0
> ...
> Call Trace:
>    <TASK>
>    amd_sfh_get_report+0xba/0x110 [amd_sfh 78bf82e66cdb2ccf24cbe871a0835ef4eedddb17]
> ...
>
> If HID-BPF were involved, we should see a call to hid_input_report() IMO.
> Also AMD SFH calls hid_input_report() in a workqueue, so I would expect
> a different stack trace.
>
> I have a suspicion on commit 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors are enabled,
> clean up") because the stack trace says that there is a bad list_add,
> which could happen if the object is not correctly initialized.
>
> However, that commit was present in v6.2, so it might not be that one.
>
> Back to the merge commit: the hid-bpf tree was merged in the hid tree
> while it took its branch during the v6.1 cycle. So that might be the
> reason you get this as a result of bisection because the AMD SFH code in
> the hid-bpf branch is the one from the v6.1 kernel, and when you merge
> it to the v6.2+ branch, you get a different code for that driver.
>
> Cheers,
> Benjamin
>
> [0] https://lore.kernel.org/regressions/f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org/#t
If I'm not mistaken the Z13 doesn't actually have any
sensors connected to SFH.  So I think the suspicion on
7bcfdab3f0c6 and theory this is triggered by HID init makes
a lot of sense.

Can you try this patch?

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c 
b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index d9b7b01900b5..fa693a5224c6 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -324,6 +324,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev 
*privdata)
                         devm_kfree(dev, cl_data->report_descr[i]);
                 }
                 dev_warn(dev, "Failed to discover, sensors not enabled 
is %d\n", cl_data->is_any_sensor_enabled);
+               cl_data->num_hid_devices = 0;
                 return -EOPNOTSUPP;
         }
         schedule_delayed_work(&cl_data->work_buffer, 
msecs_to_jiffies(AMD_SFH_IDLE_LOOP));

