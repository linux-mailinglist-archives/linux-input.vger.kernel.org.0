Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7434E32F8
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 23:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbiCUWr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 18:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiCUWrN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 18:47:13 -0400
Received: from mail1.bemta33.messagelabs.com (mail1.bemta33.messagelabs.com [67.219.247.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44C4396330;
        Mon, 21 Mar 2022 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1647901149; i=@lenovo.com;
        bh=qZZ3X9sfQls/0LTpsXGTzKuTJcqMs18ukzHPQ5itzmE=;
        h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
         In-Reply-To:Content-Type:Content-Transfer-Encoding;
        b=aaXNLO1h9WYo0OBV8wUxaJAoj1WYtUOEi9c3iVnlqrThN/vnqWYPPTsKeCDdisb6R
         og5F2TP3N2gE/Sq6rUyY44ai4Bfh9gTAJ8xL4xV8F/y/MsbTZIRKc9sGmN9Bt3uKMj
         GqprgvV7fW/BZZ7Q1HiW4MM36zNVZ8KxS43uRVgxf8WT1dwn6xMQnrdn5vqdFTWNin
         l1Er4/urlsdJlMkdnQCLNKwY+MO6157a/7g70Pb7M2KDZgLKuHs31DD4iYa8/AeCh2
         OggnDV6HrYtTh2IOGA0e+L1hOHztpzQhIPbc1BEBwtls0biJjCsU0yDqjp1z2CD3lJ
         p52shAXYRQXWA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHJsWRWlGSWpSXmKPExsWSoS+lpXv3p0W
  SwYZ9jBaHNhxgsujunstk8eb4dCaLm5++sVos2HOazaLlySNmi9V7XjBbLPr4hM3i7Z3pLBZH
  Vq1jduDymDRzBrPHzll32T02r9Dy2LSqk83j/b6rbB6fN8kFsEWxZuYl5VcksGYs33ONreAfZ
  8WRaz9ZGhhbOboYuTgYBZYyS7RO62GEcBaxStzpe8sC4XQySSzqnskG4ggJzGaSuDD/MpRzgE
  ni4rHTTF2MnBwSAscZJbpXuUMkOhkldm/9AVU1gUni0POtLCBVQgJPGCVW3ImFSDxilFh2Yw4
  rSIJXwFZi0sa/7CA2i4CqxOcrH1gg4oISJ2c+AbNFBcIluvfvB6sXFrCW2HRhLzOIzSwgLnHr
  yXwmkKEiAlsYJR439jCDOMwC5xgldrRfZodYXSzx6882sElsAtoSW7b8YgOxOQXsJE796oCap
  CnRuv03O4QtL7H97RxmiF5liV/954FsDqBHFSRWf5WH+DlBonnKUUYIW1Li2s0L7BC2rMTRs3
  NYIGxfiQ/LVkHDSFfi/MUJrBB2jsTltXeh6uUkTvWeY5rAqDsLyc+zkPw2C8l1s5Bct4CRZRW
  jdVJRZnpGSW5iZo6uoYGBrqGhia6Zua6RibleYpVuol5psW5qYnGJrpFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZg0kspcv6+g/Hcqp96hxglOZiURHlfPLRIEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBO/87UE6wKDU9tSItMweYgGHSEhw8SiK8/B+A0rzFBYm5xZnpEKlTjLocV7bt3cssxJKXn5
  cqJc6b8wOoSACkKKM0D24ELBtcYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wMyhSczrwR
  u0yugI5iAjtBnNQM5oiQRISXVwHRFNbvs3bNCdy/m0t0ybzU28U9gapiWrLOdtaJ84wLfm8vm
  8Tw88O9Mhc11nx11Xf09/xw2H458LBF6QC1/+5H0DLkpXvle8/eHvnJ7PPlkE5fGpzCP3tmTJ
  hU9CU65/fz0wv2zE3nZThSdXnbLq4wtq0dq/QyX6TsOmJvH5G64cf2efE2t7f7v7XLae+2kl5
  XGTfEpOuf74uhBCTmzFHHrS071isqn47/vcra4ErTRIoJJ78rfibt6E7KYhByVt5x60MivMXF
  fXMmGq0kZfvrGZaU/+7U+LTUKO690beeawN8Pu21iGnSbWc41s7Ybnvna/HT2gqVia9/skXp0
  M3qHNGP7TPYj7A+jVGO/LVFiKc5INNRiLipOBAD9fOxvgQQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-22.tower-635.messagelabs.com!1647901147!12789!1
X-Originating-IP: [104.47.26.42]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27565 invoked from network); 21 Mar 2022 22:19:08 -0000
Received: from mail-psaapc01lp2042.outbound.protection.outlook.com (HELO APC01-PSA-obe.outbound.protection.outlook.com) (104.47.26.42)
  by server-22.tower-635.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Mar 2022 22:19:08 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOWB6q5ASXIZSLzt1XtjN3E1GA2t0KxW/kZC3di0NglMQCar++iQbdMOoBxaTXJvmJ4MUz2NeJsEjxxD/dOawNMkQU7kTe7WUM/v93OUP/5MPvN0+3fCwF9f7L0/yseCfjYkwXH4QzzL49dLzY844pDpz94EUDh4srPOUwrvrpRcQqy0VzfoAjI0PVHB3oRjEq6zV7KeTYvEmCOvz2GCsUd70B/sOSyWxzVRz0WGybo4G2yz2/W1rtwBh43NREXX/3dRmnJmkFt8l4suoJh6eoGKdUoVxhICPGXJEyLb7qE6feHjGC85A3LJXJ43o5ZS3wyHKMniT9TzCVj24OqkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZZ3X9sfQls/0LTpsXGTzKuTJcqMs18ukzHPQ5itzmE=;
 b=XYOC2NrgniTdSuy1zZqpQ0+3C7aSDvsRJg9VO4GKUAK46bg4yOd7BkG1OV+I5A5guj6JeYEr6t1nPupc06J6vTp8nHYFrO17wPjEfrxYNUyaMFe6+hQXB5C6IRUTKR1TmOvh8hO/FSzttPGM1KG+TCsp0/rjWY+m5N8VQfjdtbaB45bKp7SFgQ8V4AaUo0xFCpCpbzj/vDg6W44ii8+VdY2Oo40s2CqdVYJ8jptRbPJmSm6jBF5uG7Gz0y5+MpyfjQTr+XiDRdCUucUMZXuPjhAvFHMZZltSog4E9uOM4bx4qM07E8SohDpQGUrK06l9h+VILpGiezYVfndQRYBtMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=redhat.com smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from SG2PR02CA0117.apcprd02.prod.outlook.com (2603:1096:4:92::33) by
 HK0PR03MB3761.apcprd03.prod.outlook.com (2603:1096:203:77::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.8; Mon, 21 Mar 2022 22:19:06 +0000
Received: from SG2APC01FT0003.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::93) by SG2PR02CA0117.outlook.office365.com
 (2603:1096:4:92::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Mon, 21 Mar 2022 22:19:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 SG2APC01FT0003.mail.protection.outlook.com (10.13.36.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Mon, 21 Mar 2022 22:19:05 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 21 Mar
 2022 18:19:03 -0400
Received: from [10.46.54.105] (10.46.54.105) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2308.27; Mon, 21 Mar
 2022 18:19:01 -0400
Message-ID: <225c5a10-59a8-d33e-abac-5fbb4341a6eb@lenovo.com>
Date:   Mon, 21 Mar 2022 18:18:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [External] Re: Dell laptop touchpad disabling?
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        <linux-input@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <Dell.Client.Kernel@dell.com>
CC:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
 <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
In-Reply-To: <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.54.105]
X-ClientProxiedBy: reswpmail01.lenovo.com (10.62.32.20) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77421399-edfb-450d-edd3-08da0b88cfe4
X-MS-TrafficTypeDiagnostic: HK0PR03MB3761:EE_
X-Microsoft-Antispam-PRVS: <HK0PR03MB37617A520F0EC801BAFF862CC5169@HK0PR03MB3761.apcprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgO6s2+AzUM0ROCNnwbhptUtQ2qtCPre+AJos6T2RIKUVuYGoSfUYXUMlpnA1VAm5Eba7rhZRKvH/SQz5J+IyxYiCiRMbRU4x8FwURqMFgnj95VXeMFFyAgoaxKioP/sJfEBx9Aw9RhXQEx67iEW1LIraTXIlh/6FW89lcnsNgws7Jcf65IEOxdKWbzg2u1QxiOOqMRLMxzsParJ43NMbIU+bndBWI1fj6ESI8aR+lwyjPAabEzgmPWYgpp2Q0SBSix3epmxD1qCGjqpBgDr43au0DNap5Qmqb6Zw+FYslSjIAGA3+O7e+EGwy9pBzypoasM44nfN4eba47Iqi+r7ZM1gl3w0gAo7t5w7MDW8tMzYQgksgQiThTGbRekTXB/6OvWEN4wilbl/TNKhYwy9541vboXfk2fOIygdNwb1RV77znIYODyxNtyri4bZLQXXepkgiA25OMrW4eKKkfwfLIAwj01bk6Fah4MNI0uZPkjXVOS8lm/f1pFqa2vshrMLQgINh9wZqeTGX5I5XVk1miAPWRxDB8GPUJUXHpgNrGj7HhaCPehMHM5INqkvtF3gZ/dBP3BdkfPyP6EBIyyr93kawDY7e8R7gDj3UMbalNfI0rJglVgMpz1kwUhu2i8L4ldWQTa6ipbGE30tMT5J2n0EdQtY4xD7x0AUpYEumyfom4OBkUrGKHYbFLCzALLxVfeZmePzz/q1rMxZJawc4nJhZefLEdKFt2QgX2IwdnNcbh1s+mI0j2vBmnkPjbBfZ0XF/wc3W6OUejx9meieQ==
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(70206006)(8676002)(82960400001)(70586007)(47076005)(4326008)(316002)(31696002)(86362001)(508600001)(53546011)(6666004)(16526019)(36906005)(16576012)(54906003)(2616005)(110136005)(186003)(426003)(336012)(356005)(81166007)(36756003)(2906002)(8936002)(40460700003)(7416002)(31686004)(36860700001)(5660300002)(26005)(82310400004)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 22:19:05.2535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77421399-edfb-450d-edd3-08da0b88cfe4
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT0003.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3761
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Apologies if this is thread hijacking...but I've got a similarish
problem on Lenovo laptops that we have on the todo list to investigate
so wanted to jump in with a somewhat related question...

On 3/18/22 04:54, Hans de Goede wrote:
> 
> Regardless of the method, the kernel's responsibility here is
> to make sure the touchpad gets seen as a touchpad and after that
> "disabling" it is a userspace problem.
> 

The issue on our platforms is that if you disable the touchpad in the
BIOS it doesn't actually disable the touchpad. It sets a flag in the EC
registers to let the OS know the touchpad is not supposed to be enabled
(I only just found out this is how it is supposed to work).

I'm not 100% sure the reasons for this - I think it's to do with keeping
the trackpoint usable (maybe).

So just curious on the comment above - is there a standard way to let
user space know to ignore the touchpad or disable it by default?

I'm obviously being lazy here as I've been meaning to go and read code
but I was flicking thru the mailing list and this caught my eye....and
if there's a shortcut to the answer that would be awesome.

I've no idea if this is a Lenovo specific issue or more generic - but
this thread made me wonder if it's actually a common/standard problem?

Mark
