Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF6B19E97B
	for <lists+linux-input@lfdr.de>; Sun,  5 Apr 2020 07:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbgDEF02 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Apr 2020 01:26:28 -0400
Received: from mail-oln040092069015.outbound.protection.outlook.com ([40.92.69.15]:1081
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726364AbgDEF01 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 5 Apr 2020 01:26:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGfOD7oN+GK43sVm1OR9smg6S/G2NqsqgF7ZJxZJ57F2kYCtMcum7UyA5YxZj8g7JEWZR7yt0eIyKrxwLnLtdRd3BR+CkoufBnxqcM6ha286fGFCWkmkTQbkaLWm/OETZjM781V/rrtHyRoJr8PrftYcHti26dGMdtJdFPc6DQ0yupmIx3fX/J/QOHl/ig4a9+Fs5Y5SZURLyXld0WpYz/h0Ej6HuF5RJvjjgpskdmRCmyFvmGWYKH4UF0JqDtXJ88fX5IX48XFxLxfRiDFQ3mFzolp1/FJVPk5Cj2NkMAiR+JgbNU1UgN+EPWUsvGOWVOSCx6Wx0TpHM7aXPG4eCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07coV3s7oDniPj0zYs54qcfCIjlB948Wm3LEgIMUYZI=;
 b=Rxxm9DWQ/eIkn/JId+IbG7VckSwM3ERwYhBkCuOYaaKXvPET7pH4eQlAEMBpkEp1SexcrrBpNUi6J65KrteXnPLviyWZ+X2xLMvSgu5H1WvW3nEi0/4qSkQqnKBGbLOwPkzFFKe1Xq9zZUXqVdMYE1FmD42qEIXEF5VQR7VGDtFYCWUInS6OOe2IVI7qbcMvkytuIbcDmvUbDZwDibpAFAaAOp0MZs3XJW6fPiyAJoqYOl5mazpwE923mCnVYFbF+xvAbmVrcttEn0rirHOIuLaCCQcqiQiFjOqeVoig83QwRFQc2yj22p1BNIdB7fSpmh9hPXcrjQ21+nUddwRkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.de; dmarc=pass action=none header.from=hotmail.de;
 dkim=pass header.d=hotmail.de; arc=none
Received: from HE1EUR02FT004.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1d::48) by
 HE1EUR02HT142.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1d::376)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Sun, 5 Apr
 2020 05:26:23 +0000
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 (2a01:111:e400:7e1d::42) by HE1EUR02FT004.mail.protection.outlook.com
 (2a01:111:e400:7e1d::83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend
 Transport; Sun, 5 Apr 2020 05:26:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:C2EF1AABC4CD0BA3C92E11469809FC28BF6E081739A2C53B96090CC9C6F4F167;UpperCasedChecksum:1257E4520E2CA8C8C53B5A9582A74C7CAF8FCC7258CE5E7454227C85F390315F;SizeAsReceived:9468;Count:50
Received: from AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d]) by AM6PR03MB5170.eurprd03.prod.outlook.com
 ([fe80::d57:5853:a396:969d%7]) with mapi id 15.20.2878.018; Sun, 5 Apr 2020
 05:26:23 +0000
Subject: Re: [PATCH v2] Input: elantech - fix x_max/y_max values
From:   Bernd Edlinger <bernd.edlinger@hotmail.de>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "Dave.Wang" <dave.wang@emc.com.tw>, jingle <jingle.wu@emc.com.tw>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Aaron Ma <aaron.ma@canonical.com>
References: <PR2PR03MB517975370D754EEF47E062BFE4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <CAO-hwJ+eua8-fNj9o8CxjFyM0i1+R9ZwPMroF9uLUH6NVu3Tdg@mail.gmail.com>
 <PR2PR03MB51799BF709B3975A08F139F4E4EB0@PR2PR03MB5179.eurprd03.prod.outlook.com>
 <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com>
Message-ID: <AM6PR03MB5170D26019747F5090FE74B5E4C50@AM6PR03MB5170.eurprd03.prod.outlook.com>
Date:   Sun, 5 Apr 2020 07:26:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
In-Reply-To: <AM6PR03MB5170F5FC30556BEF89C775C2E4EB0@AM6PR03MB5170.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR06CA0047.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::24) To AM6PR03MB5170.eurprd03.prod.outlook.com
 (2603:10a6:20b:ca::23)
X-Microsoft-Original-Message-ID: <08f85f61-3940-3569-7a8f-3bb48af998ec@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.101] (92.77.140.102) by AM0PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:208:aa::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15 via Frontend Transport; Sun, 5 Apr 2020 05:26:23 +0000
X-Microsoft-Original-Message-ID: <08f85f61-3940-3569-7a8f-3bb48af998ec@hotmail.de>
X-TMN:  [MOuWNmb5ZKB1lyOQpQ9ByQWPoGN3SGrr]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 62dd915b-9667-4908-562b-08d7d921e165
X-MS-TrafficTypeDiagnostic: HE1EUR02HT142:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +WpV9Q7CgNZ26JYAKsqNo33fbb7iisbQ5Dlt3f49fvfV26lzbyB3DGtL80R6lOGjAZPSbJYeXLW9AEi4KUDTkOKaXR/ep0xC/JMxKVo+X7Lg5BsCoJRIKvQUjDwQ7HHospSob7t9c18ljP7KUAkgtFF6i0OZ9ZKZYIOKDAn0PuTmXtqOSXEHgrOh2YzCd3lV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB5170.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: K1iVXUXNvXBajvv2FBle4p/8FyfOtWhZJ1HbmRyWrbhm45W33ymu3SHvB8Q1xI3Q+3Cv+gh0H8eSnf5R+Qc7yg3HHzxJ9lYOwAQx9i9RgxPzQ5SEKP6Spo3pDqfXM3EDKwKCTpExNCfuNeDU76wRfA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dd915b-9667-4908-562b-08d7d921e165
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2020 05:26:23.8195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR02HT142
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ping...

This patch works fine for me since several weeks,
without it I would not be able to use my laptop any more.

Could you please accept this patch?


Thanks
Bernd.


On 2/27/20 11:03 PM, Bernd Edlinger wrote:
> Since commit 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> moved the querying of the x_max/y_max values from
> elantech_set_input_params to elantech_query_info,
> the returned x_max/y_max values are different than before,
> at least for some firmware versions.
> 
> The reason is likely that this is now done before
> elantech_set_absolute_mode does run.  So it may happen that
> the returned values are exactly half of what they used to be,
> which makes input_report_abs in PS/2 mode report ABS_X values which
> exceed the x_max value, which is very annoying since the mouse stops
> to move then, and ABS_Y value become negative, which is benign.
> 
> This was observed with a MSI GX70 laptop:
> 
> elantech: assuming hardware version 3 (with firmware version 0x250f01)
> elantech: Synaptics capabilities query result 0x18, 0x17, 0x0b.
> elantech: Elan sample query result 05, 0e, 00
> input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio...
> 
> Correct this by doubling the returned x_max and y_max
> value for this specific firmware version.
> 
> Fixes: 37548659bb22 ("Input: elantech - query the min/max information beforehand too")
> 
> Signed-off-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> ---
>  drivers/input/mouse/elantech.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 2d8434b..3399db8 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1720,6 +1720,10 @@ static int elantech_query_info(struct psmouse *psmouse,
>  
>  		info->x_max = (0x0f & param[0]) << 8 | param[1];
>  		info->y_max = (0xf0 & param[0]) << 4 | param[2];
> +		if (info->fw_version == 0x250f01) {
> +			info->x_max <<= 1;
> +			info->y_max <<= 1;
> +		}
>  		break;
>  
>  	case 4:
> 
