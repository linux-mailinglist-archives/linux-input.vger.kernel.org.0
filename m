Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846CE2AC1D7
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 18:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbgKIRJO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 12:09:14 -0500
Received: from mail-eopbgr760047.outbound.protection.outlook.com ([40.107.76.47]:49890
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730103AbgKIRJO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 12:09:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UgWrxV7wp16UyofBVbgMBAuUiGzGRJwxFy98oQtrJJyz8LRUpiCimeUAwXZWDrh1oi53OOC8fKuINNyQr2ulf1actqahkUhlWgNV8enBWj6eAy+Fe7YInme6pGv+8UFNaDYtAV0r3eEJLFDmORKiRGXd2tOYmlyFgVXQrjcuzyw1L9Lokxkwp+RkM8p/ac26NxO99Ls4RwXJUKRClDaw6zAmqlLsg/gM2R3HfzfsfxLQBI9Hlc7Zn1SNtUeXe9EOw21ktKVTQZzrxb+ZcmNeoWroekmU/yt+x8QmZvd+I7Q3cJvqeR5wEySR07IzIDo8t7ots+ekKmctAQZ5vmnxeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZiGgbV0PnxdPu5ms5amOn1OFfoJ9BsQsRMZVYWcqrU=;
 b=mFRixwCvWfH3Hc9N3bNxtPnoJYedEOcSy3O8XgVpEq/mbWtPJq+tpC+kYDlebAM41eGUKspT80CzcOjktpZl2N0FSloRGXalgAHr1gUqgyQ8XFvx+GkFH5grf+VnTfXrDhFx/i3B3dIKTbXgOkOAf487ePs0/9+bkZt+HjyhsmQ7Zk6gvoxp0R+4I/iEL7sy4fz4tcfoW+Tu/ruIddPw9PM7wTdDDROTGcDPbhAS4tEhzTwrzFZwIRbHWbIw4wLfmEaL0gC30arvO03KdFqh3DTSbXF+Rhyz+PSzt1BMFG5Aw6C0ek8CumSEUL8biSptoYb+mDL3mfUPC0uW2R4maw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZiGgbV0PnxdPu5ms5amOn1OFfoJ9BsQsRMZVYWcqrU=;
 b=e+3h0VxuYL7Shu3iaCBah3/VbDbVDUn43rqWWvk8Ar47HsQmPPR3xLWBRO3xFgHTnj5N2dxHTnoKMLSsfGTYN1+8EtP8HpKtzyGPtue6RXZq15yyksGbKSc0QHqWGUYbQdUdHbssXOaUrtK/0b+sQCZ7CQtcCwy6cmOEsODWKRo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4098.namprd12.prod.outlook.com (2603:10b6:a03:205::8)
 by BY5PR12MB3748.namprd12.prod.outlook.com (2603:10b6:a03:1ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.24; Mon, 9 Nov
 2020 17:09:11 +0000
Received: from BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d]) by BY5PR12MB4098.namprd12.prod.outlook.com
 ([fe80::e1a3:69b7:a02d:a74d%6]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 17:08:53 +0000
Subject: Re: [PATCH][next] SFH: fix error return check for -ERESTARTSYS
To:     Colin King <colin.king@canonical.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201030143002.535531-1-colin.king@canonical.com>
From:   "Singh, Sandeep" <ssingh1@amd.com>
Message-ID: <9cc9cf14-4f71-c691-caee-268c9f29ac4e@amd.com>
Date:   Mon, 9 Nov 2020 22:38:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
In-Reply-To: <20201030143002.535531-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::32) To BY5PR12MB4098.namprd12.prod.outlook.com
 (2603:10b6:a03:205::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.81.223] (165.204.159.242) by BM1PR01CA0092.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 17:08:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 61fe7cd2-d1d0-4196-9682-08d884d22249
X-MS-TrafficTypeDiagnostic: BY5PR12MB3748:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB37483D10EB36D1219A774BF4E0EA0@BY5PR12MB3748.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nL5c+jEkO/qOTqZS77rovLBBaetmaCKtBXdGQsh2ebglMW7eN8YsqP5blFBxfQEPWPTP02BNrm9d5tPa3G6WP1T60dZpS5nnbtpSgXP8OhAcFR9Py4vD7CcH/4xQM3VfUvv3xeU0k09iJF3pOAalrAfLp4s/8LOvCrQCkUgxa0NLqoLvNOy6onG8wl6WFMPyRl9kzab50h55qbJn432ZTLlHKlfAbu4lTnpfaVFzXYHNyXRSH+LWU2Gk0DZYKcwHju7eD6CjRWrcT1FMXEDARzNtNce0C1uQ83QByA+Mam03c3oYt4eCRg57swxOYTYQd8QuSGMOHOLy1ZvemBMHoQ/MJUMtJGtv1LaKzP3cn2xBoNVT/tlOhWFmNAgUlI0n
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4098.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(16576012)(6666004)(186003)(26005)(110136005)(31686004)(316002)(956004)(4326008)(6486002)(478600001)(52116002)(2616005)(31696002)(16526019)(2906002)(66946007)(8676002)(53546011)(36756003)(5660300002)(83380400001)(8936002)(66476007)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: M5rejV/pXT0yhxgkD9P3WWkg8c2nc7EonWlY6k9JX254ruGdKuov+ZJ0k/BGG/oIUZZnE3YejoroE9SGYLvH+hDE291dcKpxWhd+ccqxQbRFLETL4tlNvfvratrDKbVFYhI3HBIWdg+uQ9IHFlDKYDI+AKuy6M+Xgm/h9kDUb4cfAiVQuLKu6GNoQEcc+g9x+2JY/GfImN0tDcTmYlocInEENYB4UYxFS10dLXLh7a5JVXykwBb89B9KYn/6xyjVAken5eaJOD1irlQ1YdJN9g1A0pEfLqYoegcy0Z5oaaVAUReEF0trGjtz+XCcNSFeWZmtLlQ2xUHoBKZ+/TTn8IMBfCqcnmFqiUhEpWvKwpcL69Rbga3FAe3DjvSrMeQNku//2Npi9FTSPuul8QQxkgmtpvzMJ4BfoIM9++EAkmZtDl12BLiMe40n/A8D3Z3qsKPaiy0JijyyQcQfhw3xwLy+JYsOJwAGYBMc2LCQGLH5+ry4M46e2xJsVNKbw/AiiHLIzm87LhfqYX7/+WN2Kd/utf7KomF7kZ4sNCVjDGN26CjFEw+r/sC7WpL2NbLMTRF5LdNlMkXOe8YNF/L3ZKOOVXzUGiwf2GfcYQulqZWFZZ1PoOlWmFRAngZIYP2LHgnJb/LgavOsJrMEvS9T6xrhSK4dvVsSvgfWC7MryN54sfF0VkYY54wNIGfOev7QdPvLV5IKBjMc848OVTQCKJ84/2ZfP2qBuKBKaDno5fM+b2dHcH/Dl81gXnHqoFX+rElbALubvfh6H7/P4CxoTAr2RLQbYmH/XdJwnYCjJlXIDJuY7hEjmzInydJr3+5Rox40KnNti8Su3Ovby2NfdOGYd3M8r7lIUZ9tCxabhgNYpBa+Po0ozIbnyqoDQ26oyauA1hTxKDQgRVvsr6ZOuw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fe7cd2-d1d0-4196-9682-08d884d22249
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4098.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 17:08:52.7028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jp5TmCHzI69Ubv0GueqtN1h0G3cipZZ07Ne9KpF7Z9TxupXh+4eD3c937lH18B5w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3748
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 10/30/2020 8:00 PM, Colin King wrote:
> [CAUTION: External Email]
>
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently the check for the error return code -ERESTARTSYS is dead code
> and never executed because a previous check for ret < 0 is catching this
> and returning -ETIMEDOUT instead.  Fix this by checking for -ERESTARTSYS
> before the more generic negative error code.
>
> Addresses-Coverity: ("Logically dead code")
> Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")

Thank you for the patch ..looks good to me.

Reviewed-by: Sandeep Singh <sandeep.singh@amd.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/hid/amd-sfh-hid/amd_sfh_hid.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> index a471079a3bd0..4f989483aa03 100644
> --- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.c
> @@ -88,10 +88,10 @@ static int amdtp_wait_for_response(struct hid_device *hid)
>                  ret = wait_event_interruptible_timeout(hid_data->hid_wait,
>                                                         cli_data->request_done[i],
>                                                         msecs_to_jiffies(AMD_SFH_RESPONSE_TIMEOUT));
> -       if (ret < 0)
> -               return -ETIMEDOUT;
> -       else if (ret == -ERESTARTSYS)
> +       if (ret == -ERESTARTSYS)
>                  return -ERESTARTSYS;
> +       else if (ret < 0)
> +               return -ETIMEDOUT;
>          else
>                  return 0;
>   }
> --
> 2.27.0
>
