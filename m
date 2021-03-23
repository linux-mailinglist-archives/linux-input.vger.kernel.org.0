Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB628345FAB
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 14:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhCWN3a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 09:29:30 -0400
Received: from mail-db8eur05on2094.outbound.protection.outlook.com ([40.107.20.94]:43525
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229693AbhCWN3T (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 09:29:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBj8Bm7w6eU97xXLladuB5cu/XHp4dYMVzXaAyUQw45an6FXYRmtKcz21d0NDWE/QMn12Dsp+1xpSpoSEKrEoIc8tVuAcsF8Qf6mpox+oW16HOJzamLpwHQpAU5Bb6B5Uv5VlY3d7DtBgOgZKEz1eP4Qw/NTXptRBdzSnBDD8fr7KauCMiuwA/wlqMKkezyg5PUmGeyKyHxOGen0iRtK7J/ydXxQ22YVuifyA7ASYFbzuyV/6jtUFhpSKOka77MhsBk1cX83fIsGRtzZsQBQfaAu7qmxhI5NXUuwFiB8RRHuyqhEVEJnmTaOqUSEw8QyOBsyOZGqKKuDVHAgutCGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUs1ThKyuoDp1l6+iNd4BloA8qkZ0haQPf7x5Povdj8=;
 b=bqZftFCbwByiuZOjhdgvglIedGxPXYSbFgCLhJQnz387CL5jY/SIAZCl5NlC4CNpE25OLF+JElhWRXbQ2QlVL3Cv/GBdopmWQV4lbJmJbhQK2/57vVsGL0XN7Zua/jniqrljNQqPXxu3VtMR1+Z0/7hu2izKofe5fCRhnt4cvPSILaP1z4YXOasjiC/0x83B6cxUM8urZPcZUlJVRDeUDP7D5PzRTlkIX4BoeiB8WX+jKdOEPhtn3lGKKpfHEC6aPA6t5RX6+6zYoezgTd4KQKlfZ+lvI5yEEPgOW/Z5tENbMcD/x7kgXzq6Ihs7FOpnaJg3XKoMqOGAuZ8FDVC6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUs1ThKyuoDp1l6+iNd4BloA8qkZ0haQPf7x5Povdj8=;
 b=RhJedaLyM6+co3kE9efl0nNILeAvQt6ZnRhiYsHpcxCtJQuQSaxwhXNbcYYkoUJc1a+bIwIMrClaZPkvudMcfsCOPJtsU9FR+FZEWdpD/oEU9XB9iAL+FIf4xsUf4ibx+/tEJ10GKZrj9LdLWzOZAqE3qasKiGSQFAF6N7/3TIM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM8PR10MB4644.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:367::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 13:29:17 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::58b2:6a2a:b8f9:bc1a%3]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:29:17 +0000
Subject: Re: [PATCH] Input: analog - fix invalid snprintf() call
To:     Arnd Bergmann <arnd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210323131456.2600132-1-arnd@kernel.org>
From:   Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Message-ID: <a87d99c0-4527-1430-996b-b30826ecc752@prevas.dk>
Date:   Tue, 23 Mar 2021 14:29:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210323131456.2600132-1-arnd@kernel.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [80.208.71.248]
X-ClientProxiedBy: AM0PR02CA0194.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::31) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.71.248) by AM0PR02CA0194.eurprd02.prod.outlook.com (2603:10a6:20b:28e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 13:29:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3cfbbbc-458a-4a54-6bbd-08d8edffa846
X-MS-TrafficTypeDiagnostic: AM8PR10MB4644:
X-Microsoft-Antispam-PRVS: <AM8PR10MB464490C6DF6872ECF6BC295293649@AM8PR10MB4644.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +14oGhGe1Edk8BEI0SltrNnXZD0Y0Wd9lE+FtpcwLbA+WfYL96sD4pW8QxcSrLJCk18iU41jveSNKXBuckqGgAp6gXco78WZkpXCF1ewpfPdKFpfKVfWVlUfwRMb2ebqhByDyGycFfZ1nfbxQatIOjVr9UB180Fv+T9jg7Ch6swYnYN4nAX8zMYbNMuTSBFuDuWg/1/kqRRuBDC1U6w0GGmMQvN1nAcjQ779plYYmw523t3hUfZrca7dB6mY5hlVAha2uQ5eYxryhfIQxh3fK1DavcBaoPDZnIZEBH5zpfSKGHoTNRDR+O0FDnvmMtpPnQvgwqLscr9bI8UreZgEIW5jQkUZ2E9gsJjY7UN1fc89lpQE0hG28Gb4ab8XDJyqSjMOpOC6nH5KO51yS2Pg9kgUpxIhsYOywqfoq2qrdjMoFLICxJRxispc0V32EAZMcWlHoSaUlSpASNPWgwJyWZaMogrh3T1nXvxTu38YW8ZekmK+BA/h4RCPZop9ap6CDo5VDBC0w+9V9dgOYtr9gVMMuEZy1qcGOuPwsDQV6gcKgw1d9OMUevoBEDgT+IkYZ9DsBLpKShFSCJzWw5ANp820Pl3CiQLWEs/3gO2j/f8417RIbwIyodTSx0HILnmuN9bXWk16TPyN+WI7vOxpml0w+inMrKGLgAfv92zXI9CKuWx3IZX80Sbe2QVNYIkWH3sGoqNEDCeNHDJ4G0pv2IYGjQ2XYyKgWIkrlv37aPMiH3KtgCy6pPzWIF7p/4uz9YyiSEWqe03u6ZUR27+in6aCrgSEEYe/mmzg4LkxNaA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(136003)(39850400004)(366004)(16526019)(186003)(478600001)(26005)(110136005)(54906003)(8936002)(86362001)(5660300002)(38100700001)(52116002)(66946007)(31686004)(4326008)(316002)(16576012)(966005)(8976002)(956004)(44832011)(36756003)(83380400001)(66556008)(6486002)(31696002)(66476007)(2616005)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?DZncI9Ij4EJZWsJcM1aWhnqDthDYFtpNluyiCyOfLEFjaneP4lXca9BZ?=
 =?Windows-1252?Q?upCBygz1Fis06YrFC8cxk7AKU2fJlvbVhTC+V1apCmJPhbbmVEtJxzuN?=
 =?Windows-1252?Q?oSWhn4/+7yP3SVF/m3v049FWsOv6BR8fKxcOz5Ws8sJx1bFdCvQbe0j7?=
 =?Windows-1252?Q?0bwPxcIOYB6xtK2XLlHYp//z1Xc2fHjyOvzS44AdJO1F49uc1pN3UTK0?=
 =?Windows-1252?Q?arxYRpZna+3/IpmiQenS3gSl7F+N5va9fRTRuGibDDbrt03o0t6/JqKY?=
 =?Windows-1252?Q?FYPNCkdfFRT6wgzTuoAPVrK2NCtHI4XuP3+2zHgO1u2H2KPnVCfZTTsv?=
 =?Windows-1252?Q?x+g+vg73cBHLJZaAp0FZ1zWrTf+jaEmZvL/2zqaAjzNTQpt56Ki2HYBo?=
 =?Windows-1252?Q?pvmaOKVf85LUF/GkhomIh3UMipommyUkcu2dcKNMH5iP5aOBfDZjR7C5?=
 =?Windows-1252?Q?olffVifwrdhlsseMHzzNblOW3LgiqxXVTKkFV5Eb8ts4lReWzpW+xkWv?=
 =?Windows-1252?Q?2LImYsLJnlTo/TiGHRDCu4hVMPdn9r2ltoBbrJSBBJa90AD8oLhVufCu?=
 =?Windows-1252?Q?UfoJS3cM3aD5k3FibEJ3F89sMfCgZil1NH5Xqwc6hIjcjkETtEkU0CJm?=
 =?Windows-1252?Q?wR3uDXrw8lm4THj6SHSSTaPFijCFL12d6KDTjO77vg6rS37VOIjVjrX3?=
 =?Windows-1252?Q?ul6vmImaKk/bbVHS8eeJqv8KWv+Y6DSwglEpSWhaKuyZmCR3O/66CXRN?=
 =?Windows-1252?Q?CxcWpvrZ5MPbc0nxsSi7qCzx3x/HZZXo0AQetxP8xlVAp96gmr+2sbEJ?=
 =?Windows-1252?Q?6E4gbhmYaxoIR5H2lCq7Qz05y12ee9syq1CP2OBQRKrn5QP6NZ+/jeYE?=
 =?Windows-1252?Q?Y5CwJLY1+SeYykt75GFwRa+BahQT7mxepRyd1Yd8cJ5FZfwxNGh1fBdu?=
 =?Windows-1252?Q?/FWm9OmehA7kMggLyGufkqM43mTbrer1thGNhpkVdAX7/hSRjdBpUwMP?=
 =?Windows-1252?Q?dCai1hTYb0iwkuxQdPQ6R49li+7xdpHfXKYpwlGEFTFR0fx6IsTPTtV7?=
 =?Windows-1252?Q?/c9VTCYdj3zMvt8jr/6rmcpFlLXl+ZqSslMuCcY4sv+PkRc+E8Ujs6tB?=
 =?Windows-1252?Q?/LXE8rtzNAf01gb8/ejZWH6Cn8nxFF1Q05VngYyiNVZFBv7VHOspeUPz?=
 =?Windows-1252?Q?zDSzfj7OqyvasPzPGghltNFIGlmQdOAc9f39YZ/SLLzkIzhXA2aOuRCN?=
 =?Windows-1252?Q?sVWvC1FuA5Wf+qdFNwTN6CzMMo11lZhgcHakY8UxA8KJ3vQvKXBw9A4I?=
 =?Windows-1252?Q?9GkIdFGT3gg9xI9LgfX4kIKL4UwdXOmE9j2TxnEhUr39NrQ8Ojin7bcx?=
 =?Windows-1252?Q?q+poSKUaFJw/0sFhS9H/6qRj1RhDMFQwhoyfbb7geIO8KKetjanbC8Tq?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cfbbbc-458a-4a54-6bbd-08d8edffa846
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:29:17.1194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvTsPu1j6HKBytqcWHKMs7De/WIfQXFnabHGI4rvoewWFw6fOpLHRYltCfX76IE1kuMHLWiFf6AlpCoTRr8J9qpDqk9Tyu8q5ulk5ZcaJjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4644
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23/03/2021 14.14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> overlapping input and output arguments to snprintf() are
> undefined behavior in C99:
> 

Good luck:
https://lore.kernel.org/lkml/1457469654-17059-1-git-send-email-linux@rasmusvillemoes.dk/

At least 5 years ago the consensus from old-timers was that "the
kernel's snprintf supports this use case, just keep it working that way".

> diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
> index f798922a4598..8c9fed3f13e2 100644
> --- a/drivers/input/joystick/analog.c
> +++ b/drivers/input/joystick/analog.c
> @@ -419,14 +419,16 @@ static void analog_calibrate_timer(struct analog_port *port)
>  
>  static void analog_name(struct analog *analog)
>  {
> -	snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
> +	int len;
> +
> +	len = snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
>  		 hweight8(analog->mask & ANALOG_AXES_STD),
>  		 hweight8(analog->mask & ANALOG_BTNS_STD) + !!(analog->mask & ANALOG_BTNS_CHF) * 2 +
>  		 hweight16(analog->mask & ANALOG_BTNS_GAMEPAD) + !!(analog->mask & ANALOG_HBTN_CHF) * 4);
>  
>  	if (analog->mask & ANALOG_HATS_ALL)
> -		snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
> -			 analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
> +		len += snprintf(analog->name + len, sizeof(analog->name) - len, "%d-hat",
> +			 hweight16(analog->mask & ANALOG_HATS_ALL));

Use scnprintf, this is too fragile and hard to verify. If the first
snprintf overflows, the second passes a huge size_t to snprintf which
will WARN.

Rasmus
