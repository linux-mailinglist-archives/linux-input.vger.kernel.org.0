Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85041AAEEF
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 18:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1416340AbgDOQ5r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 12:57:47 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:6045
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1416336AbgDOQ5p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 12:57:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMwdD/g/g4ofbxc8CqDaF/4KUrg09nWZU1RcPY+uuQJtwlpUXiNINesBWKZwM2nHk3BWrsETnk8z7o/uwVahFj74eaw7DBOafMSDc+FZMQubglNSMj+GnOvp/fYg4V6NK08RgxJ3QJu4WR0/9MC1KuteplHeVcIJvCjLrUdDKxGx7ZHNQtDKY9FJyXwlGhkdTzsBVasqoD+vOTvI5yiqLBOjdJ+iPsNYUIXoyaKrnB+Sn4QnByP+QrwEPix6MT7jkxLMT6kpY0HgLtVw0/vt4YuQYeM64UYOgVZGOgYS653ORSOHMHtHCrEVWVCXc4lLNZpe9Jfi3crPUPJ3XCy5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uiJAnAt3Zl/mTOT9ytV+2KEBbFreL5o0Ha78CUVw9A=;
 b=Rr7SSwIuZzSrRaFG5DLZ3zUvrh5W6Ll1pvgTewIQ2rU/lSbruK3mVxFB/ltLGfDCEj1ii76geVlNEd7IPqtCfHjBQqyf8JKiLRdfVggticsfZBkndS0HRgPstKoQg6I6YVEWVzt2cBfO+myWrOvMyV8RX5pl2mAcccFxMX4gkHpkL6ECtb8WPAjYbm3AG0yBmBljPOTubSpmjlAyPZHF9YRYAmzcR7NtK9fOrsj2vtmcC0jqqmTiNMcQF7V10ZfLnXV3O2/9OybBsza4Q5AbMd49qmjuJqkOJpCJyL1Y35n0Ek2XIYq1h0A0BI1/6AzHEyyDqkZNrjm4ugyuvE+dxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uiJAnAt3Zl/mTOT9ytV+2KEBbFreL5o0Ha78CUVw9A=;
 b=m0OikrsD0QbMwlkxO4QnQiPM8RUihLcW1HR76/f6B9U8atNbBWosQuhA5xwWcHlJsFD/1u1rDuk19datJIlU1e5KC5BBu8o6RLtDruAJ9IzUTglXxf7Uvrcjy1abA8EJ/kkuy/t9LUbeXTGZEWqHrs500R9YHZpBHMGC0jgv4AY=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (2603:10a6:803:7::25)
 by VI1PR0402MB2910.eurprd04.prod.outlook.com (2603:10a6:800:b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Wed, 15 Apr
 2020 16:57:40 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::751e:7e8d:ed4:ef5f]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::751e:7e8d:ed4:ef5f%7]) with mapi id 15.20.2900.028; Wed, 15 Apr 2020
 16:57:40 +0000
Subject: Re: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
From:   =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
To:     Adam Ford <aford173@gmail.com>,
        =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Robin Gong <yibin.gong@nxp.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
References: <20200225161201.1975-1-git@andred.net>
 <20200225161201.1975-6-git@andred.net>
 <VI1PR0402MB3485A743C94442533B6840F298E70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <CAHCN7x+NJLaKF9SfHw9sDpw6zDUGs_TuD_co7USjQ5hgFDeaHg@mail.gmail.com>
 <fd36d0ae-f3fa-6608-9179-3e7562068433@nxp.com>
Message-ID: <ad07da3c-19c4-67cd-b819-63cf3746caf6@nxp.com>
Date:   Wed, 15 Apr 2020 19:57:36 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <fd36d0ae-f3fa-6608-9179-3e7562068433@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::15) To VI1PR0402MB3485.eurprd04.prod.outlook.com
 (2603:10a6:803:7::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by AM0P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.16 via Frontend Transport; Wed, 15 Apr 2020 16:57:38 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5913c546-319c-417f-d52a-08d7e15e1b79
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2910:|VI1PR0402MB2910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB29109A9D9D64EFBBD112F7B298DB0@VI1PR0402MB2910.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 0374433C81
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3485.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(16576012)(53546011)(966005)(478600001)(16526019)(26005)(7416002)(4326008)(81156014)(31686004)(36756003)(86362001)(8676002)(66556008)(6486002)(8936002)(66946007)(66476007)(5660300002)(2906002)(956004)(2616005)(6636002)(316002)(31696002)(54906003)(186003)(52116002)(110136005);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r8rfUuqtdyQIwPzA6+bw+IMYavnOs1FssBjHp/b09AxxLDzOxjimnh5DiS/31cRGNIMEf/nwEKIf5LC/XBohe0hTZcbX7t0xalv0tWW1FL+JgxVgOwq75mQdk8Z1GCibTsm+bXSigOqAe1XyBSRBvl50PPNTzYpk6nqfm8MVpHMMzVEoeWXLVxW9+caYbhOUndZP2mmo2mkDMcMmFdNy2Hxsd/W8kp4alBRtSkJn4aBovdpvCACSLE4h7Ahm908xhUgsQFos3XB3ad13DWdbew5pPRi6WzPzMIGkfYBOj95uNr8QJZwBE09JyMMYYztbaYbu5wu9MRz85mPWYuETio/wW/bpmyaKF4+FHA82j5/DcTzIGgT2kX7V6fLytFHiBYRMQfl+aMSZZz8mw3aISgftxkGxx0g4nkcqjcqa4LSO1EjFyUhkeb//1R/p85mo+JbaH7ppJ3BqGoLejWsZsEbDbRjo4xWQWRmahiJAI3RE6IcEVIya9Ap4tjveSh4c4/XjgoGpCI9xNh/HIezwcw==
X-MS-Exchange-AntiSpam-MessageData: 04n3zeKF2X3sjudQLttXVQAMC9CIJmHsDn4222SluwsMvB8da/tpQt0hjmQD+zvyD+VyXW5XJPO+4+yaWkvJXhAooldyM/Zj81JG6Ri0VO0NFnFgqp9N+nZzf/fpz2tVAIqAK4A7kyiZ6UdzAghn7w==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5913c546-319c-417f-d52a-08d7e15e1b79
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2020 16:57:40.4426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/6yRHg1XJd/R2RMBwAWGvOfe6WO2jmfNZI1Xft2DYPKZ8JDpqoX22Zditk+5PMLfZIwA2AThE5AkRibqxwI2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2910
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Herbert, Dmitry,

On 4/1/2020 11:58 AM, Horia Geanta wrote:
> On 3/28/2020 5:43 AM, Adam Ford wrote:
>> On Mon, Mar 2, 2020 at 3:22 AM Horia Geanta <horia.geanta@nxp.com> wrote:
>>>
>>> On 2/25/2020 6:12 PM, André Draszik wrote:
>>>> The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
>>>>
>>>> This driver here should only return IRQ_HANDLED if the status register
>>>> indicates that the event we're handling in the irq handler was genuinely
>>>> intended for this driver. Otheriwse the interrupt subsystem will
>>>> assume the interrupt was handled successfully even though it wasn't
>>>> at all.
>>>>
>>>> Signed-off-by: André Draszik <git@andred.net>
>>>> Cc: "Horia Geantă" <horia.geanta@nxp.com>
>>>> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
>>>> Cc: Herbert Xu <herbert@gondor.apana.org.au>
>>>> Cc: "David S. Miller" <davem@davemloft.net>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>>> Cc: Fabio Estevam <festevam@gmail.com>
>>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>> Cc: Anson Huang <Anson.Huang@nxp.com>
>>>> Cc: Robin Gong <yibin.gong@nxp.com>
>>>> Cc: linux-crypto@vger.kernel.org
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-input@vger.kernel.org
>>> For patches 2-6:
>>> Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
>>>
>>> Also imx8mn.dtsi and imx8mp.dtsi will have to be updated.
>>
>> Is there an update coming for the 8mn family?  I am seeing it not wake
>> from the power key, and I was hoping to resolve that before i make a
>> push to submit a new 8MN board for review.
>>
> Starting with linux-next next-20200320, there's commit
> arm64: dts: imx8mn: Add snvs clock to powerkey
> 
> Could you confirm you've tested with a tree including it?
> 
Seems that from this series:
https://lore.kernel.org/linux-crypto/20200225161201.1975-5-git@andred.net/T/
only DT patches (2,3,4) were applied.

Would it be ok to go via crypto tree with:
[PATCH v2 1/6] dt-bindings: crypto: fsl-sec4: add snvs clock to pwrkey

and via input tree with:
[PATCH v2 5/6] Input: snvs_pwrkey - enable snvs clock as needed
[PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own events
?

Thanks,
Horia
