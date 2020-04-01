Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22B7E19A80E
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 10:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730333AbgDAI7D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 04:59:03 -0400
Received: from mail-eopbgr60088.outbound.protection.outlook.com ([40.107.6.88]:25664
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727322AbgDAI7C (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Apr 2020 04:59:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AwxntRDI7TxZM+zpsLTtSepxEf2ahUXXNizTr2V8Nd+vKnU0HRtgGjlDCS8Xntz43a/VKRYb4Qd889zR3v0LysTCQr+yYseIcW/K6ze6xe1y57gloKfg/TdWpJNXEFVvgsXsjIFNDvdowC65iCGOcnVO11VUp2+PXSNHxUFUVxPI4M109ZUh+BkpBWOKi5gsBcwXrfNhK+ZyW4tEDTc3XyjeoN3PMz8gNFuEiHkxKU0D1o3C3LwRzQBkHTw0J9tG+dP02o+4mrb470MUPpKqVRRlnHTlMtcQac+eqG+B+56chxKw03y/K8DJZJ44O11tpD7sRfuCCUl2yKLaNuf5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dCXclmoe09oER1oJZd9I98HtlHBLiKLFEkdikmAuAY=;
 b=j3uBsamZDODSovvhELaCNYw+XFEINiBMMFiCvx9xEhcyfkyNBQWz3I+57MfTN6k6I0tcNrmddyOvNZpgK06I4V5jNWwsNb6VFuUqE7FqXUeUOlRnlEAVAR84ekL2N6GWIn4MzFMHcoPUIq2uTc6+R33V7f7aZyM9YXCHrzgtyhYLVpS38SSSGaW5f+R0DEI6kLQhqUE8ZBKtmqQyCfVT/F9yzaSgRgKzXyGxWLQBDs+GA1gwOHQia/GiDBdiUmzY1Eww+1XNWodjNBKCZbQTziTSbKm2H0JtDjStKowFz5Z7ZBQCFFn/JvFG44k9BDIh0qYmXyakrvIlAy5W/NWRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dCXclmoe09oER1oJZd9I98HtlHBLiKLFEkdikmAuAY=;
 b=QjJ6X4icK3kWqTAe992Ein8yi2zz+nKyXEwTl8kW7DIBeQaFyYm6HKuEXzJiIUXelFNWvX5ap7zSXm8E221gDMQDoHh7aKcn+vQ2rJtgMzwOl+U+Kz2JBfvNhT9GKVPdpolr98Relu17ppw6xAJXZJKA/W/myq4fhgRL4wAyebM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=horia.geanta@nxp.com; 
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com (52.134.3.153) by
 VI1PR0402MB3759.eurprd04.prod.outlook.com (52.134.15.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.19; Wed, 1 Apr 2020 08:58:54 +0000
Received: from VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::751e:7e8d:ed4:ef5f]) by VI1PR0402MB3485.eurprd04.prod.outlook.com
 ([fe80::751e:7e8d:ed4:ef5f%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 08:58:54 +0000
Subject: Re: [PATCH v2 6/6] Input: snvs_pwrkey - only IRQ_HANDLED for our own
 events
To:     Adam Ford <aford173@gmail.com>
Cc:     =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Anson Huang <anson.huang@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Robin Gong <yibin.gong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
References: <20200225161201.1975-1-git@andred.net>
 <20200225161201.1975-6-git@andred.net>
 <VI1PR0402MB3485A743C94442533B6840F298E70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
 <CAHCN7x+NJLaKF9SfHw9sDpw6zDUGs_TuD_co7USjQ5hgFDeaHg@mail.gmail.com>
From:   =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Message-ID: <fd36d0ae-f3fa-6608-9179-3e7562068433@nxp.com>
Date:   Wed, 1 Apr 2020 11:58:49 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
In-Reply-To: <CAHCN7x+NJLaKF9SfHw9sDpw6zDUGs_TuD_co7USjQ5hgFDeaHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR05CA0074.eurprd05.prod.outlook.com
 (2603:10a6:208:136::14) To VI1PR0402MB3485.eurprd04.prod.outlook.com
 (2603:10a6:803:7::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.129] (84.117.251.185) by AM0PR05CA0074.eurprd05.prod.outlook.com (2603:10a6:208:136::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20 via Frontend Transport; Wed, 1 Apr 2020 08:58:51 +0000
X-Originating-IP: [84.117.251.185]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 27305df6-7ca2-470a-24c1-08d7d61ae760
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3759:|VI1PR0402MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB37592A16063B44B016E8B46598C90@VI1PR0402MB3759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-Forefront-PRVS: 03607C04F0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3485.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(4326008)(186003)(16526019)(8936002)(81156014)(6486002)(26005)(31696002)(86362001)(53546011)(478600001)(6916009)(66946007)(66476007)(66556008)(31686004)(16576012)(7416002)(81166006)(2906002)(36756003)(316002)(52116002)(5660300002)(2616005)(54906003)(8676002)(956004);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JO6pIwXd0qdU6IzMGQtsgDwesKM3UxUCOLdQe0xqgbRIdr+sEEs6w5y1hVgVqJecOq9sGsQSK5BWyPaSMLu1tTWHdGsGcVtDJnKg8CTBloPmAI/ujln1edKRWFHfyjX857H+1EvPHqMazBuM5dfviu4KYMGmefLR8xcl3LUl9qxDc4eeyJ8Hzgazhz7ap+IljkyfNPU1wrsyQv+JCzhKfiA78KEvkMpnACgadIZln2yqG1dM68cS4BarUA9kgWCGy1rp4fvGPB3TwUtEArmCdRiZGfW/b/lqj8pK+Eorrc281O+Txi2jU20uYPtvu7T30/3gSnBvznP28lKpzfhTyiXrSgMN+gm0bCS3fN3flgFrGKTwR/+nPWCbbEpER4nrEoXd4VT2WGdCKzitaWOJtmf4jTWTANKYZJ2Qsg9Jn2dQICITmhA+rZCMysv1q5l4
X-MS-Exchange-AntiSpam-MessageData: fLfHbKW1xRbXVWKiTgFwa051hZJdfQ/fS0B8G+MqeGYa8W4MzN19imQnmb2g0rjCcnnEAydQmixvPQ5HwuaHZYlEnSjThnJE660FbYoBca5VzN1BVVZGWToy9pXb71tut5ZsHpN05MQ5g++rtZ10eg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27305df6-7ca2-470a-24c1-08d7d61ae760
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2020 08:58:54.0053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROF+O8SaSxI/sFxwpD/QQWEHUmCECmlzsMKk5O+AXdhIVFlDbULwLLKIRB/ku5tuE+r7NJtkxu/BdKOSIPhLnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3759
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 3/28/2020 5:43 AM, Adam Ford wrote:
> On Mon, Mar 2, 2020 at 3:22 AM Horia Geanta <horia.geanta@nxp.com> wrote:
>>
>> On 2/25/2020 6:12 PM, André Draszik wrote:
>>> The snvs_pwrkey shares the SNVS LPSR status register with the snvs_rtc.
>>>
>>> This driver here should only return IRQ_HANDLED if the status register
>>> indicates that the event we're handling in the irq handler was genuinely
>>> intended for this driver. Otheriwse the interrupt subsystem will
>>> assume the interrupt was handled successfully even though it wasn't
>>> at all.
>>>
>>> Signed-off-by: André Draszik <git@andred.net>
>>> Cc: "Horia Geantă" <horia.geanta@nxp.com>
>>> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
>>> Cc: Herbert Xu <herbert@gondor.apana.org.au>
>>> Cc: "David S. Miller" <davem@davemloft.net>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Mark Rutland <mark.rutland@arm.com>
>>> Cc: Shawn Guo <shawnguo@kernel.org>
>>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>>> Cc: Fabio Estevam <festevam@gmail.com>
>>> Cc: NXP Linux Team <linux-imx@nxp.com>
>>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> Cc: Anson Huang <Anson.Huang@nxp.com>
>>> Cc: Robin Gong <yibin.gong@nxp.com>
>>> Cc: linux-crypto@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-input@vger.kernel.org
>> For patches 2-6:
>> Reviewed-by: Horia Geantă <horia.geanta@nxp.com>
>>
>> Also imx8mn.dtsi and imx8mp.dtsi will have to be updated.
> 
> Is there an update coming for the 8mn family?  I am seeing it not wake
> from the power key, and I was hoping to resolve that before i make a
> push to submit a new 8MN board for review.
> 
Starting with linux-next next-20200320, there's commit
arm64: dts: imx8mn: Add snvs clock to powerkey

Could you confirm you've tested with a tree including it?

Thanks,
Horia
