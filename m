Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608F4551940
	for <lists+linux-input@lfdr.de>; Mon, 20 Jun 2022 14:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239526AbiFTMsK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jun 2022 08:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237161AbiFTMsI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jun 2022 08:48:08 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DBE2C3;
        Mon, 20 Jun 2022 05:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/fwlIZfHsQJ5LhHHCd5AZWFKUTG+D68fJAE/f9g5GL9iepCUK0YCtVzghFBsAPzt8ph6yvHHoAnHjc1oAY/0jlks2aCFPTJfZ6bvI8/CvjBKjvSSaIvDsDkvZuNDOlVVJwYHTe9Umgp22NI6/acBorh8hKvHVlXio7w2mPtsgsG3snd/EjZxyI61XfZgGz6RAp/p3lR61MEtoAl16gEvVnMRJFg9BlUMUWjt0FgKp49TYdpG+LWmOreXWByX/C3x9f+B+0HKaPrbbET2osQN8pl4ctTz+BwRQQ99QxfKk41toWL3WB3l+U/TGI088qYNlIBYdFZnJoX2pvjEIQgNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbY2mtt7/mtyT9ItQ4kCY1xu8mDW3CtZOY5qG18lcgM=;
 b=ALhK677tF8z3uOBGvUfqa0Kt6HXcYqKZ0gkvoX13vwr7gxVzgWfUKxp6Kqk1ZUwiHmUNHRoXqlDr1+T2pVdJclwnXT+DPNy4zovhpA1Ttnp6cGTKHvvGM8FBnnnjYvifYuKuJCtrs0kMADDOJnQTHFyBxFutm8l4cW2+9UQMzon2S/998Rg0aY5g7zT8dQvPomBXxeVM3yBGodaJxIMRo0mwi7tZB0em80rG1qNa1YRBgd5c+ZHeAikdu5SgwEZf9yONxbEcsv4B7lghzzyZfBQkfzE7A48CPZEbkRBEBzBOXcBsRU/cUxxXsWiRiMWFYziZoQoknPCADu2Mx++ETQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbY2mtt7/mtyT9ItQ4kCY1xu8mDW3CtZOY5qG18lcgM=;
 b=fCxjNtQyW2r4TDCQ/gApTKgrZ7R1tPCCmYtzZSkqk1r1OzW+1v0UaRdjvhJvmB+FrvYTmL34Skdyldgd4j4pfkRPCWfPFqPh5pix4LNRGxhr2acPCMLlWwMTJyDlhlsl9zjHqBvRwwsC93/dc311wacweXSIdMEP3cQQz0P7rV8uRl0J/REfAKq69Q3n6eUv9u/QW/yImHCKh3oCfvPQdhIGhZVxViHt5KS0wzhZ2Q/MaVXSgbGaBsqTR9teuwWbnWidQ2KYrAbGqrqdTNLKXOnNHj1PHLJRbk337OYU09Z9GVlTFy8GzpG3flKmsZy+23GD8McY9yo1gHT9j0Q9aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by DB9PR04MB9281.eurprd04.prod.outlook.com
 (2603:10a6:10:36f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 12:48:04 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::21d5:a855:6e65:cf5d%12]) with mapi id 15.20.5353.021; Mon, 20 Jun
 2022 12:48:04 +0000
Message-ID: <d7f6c510-d367-718c-64b2-e368ef5486fc@suse.com>
Date:   Mon, 20 Jun 2022 14:48:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     dmitry.torokhov@gmail.com
Cc:     jkosina@suse.com, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>
From:   Oliver Neukum <oneukum@suse.com>
Subject: doubts concerning locking and signals in input_register_device()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0522.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::18) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47bdec04-8c2f-4517-66e5-08da52bb1df3
X-MS-TrafficTypeDiagnostic: DB9PR04MB9281:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DB9PR04MB92816CCD88EBDDFB7A065167C7B09@DB9PR04MB9281.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A1SlNcM77vrSD26cA7ot1Lo1ZKIjw79PMTNpFuI7c4CDxx6kijzNlul7L3kM/xRT04t3OLUeY7CuB9W9WGsYj9DxImQJSQnEA9Q+HcM3vI8HozWhdaqwgFfdata1m9FJAvNfQM7raWt8m1phEm2m7js5o2upT/haK6Gc58tCEm/90MI1HIEp7SKHgERBnbeUp6yG7Ntkw+IIMwTPsui6k+JRIbl73tZB0fciGVj0+KobxXQBfJzfEUN6b+XR8tQEXF506hDPxY9FS9PPQmMCxRp2Hn8dZDWO5U5bhWtgfD6XHsm2R/tJU5CPy1AZskCBP67hr5efFvnwqSY9wtyypQCjsU10+erh2ylFBrI3W8v6YZzlSteedrq54LXrezXzmC4gd5//eB/YFeVXD43zmeBb/u/mJFJ/TpMXYXHTaKm0AT79J6HgGhS1m1wybCvpehaNXT0n12bx6l78ycAEYb3HzgdpY7ctsJoczlsFG4+39GM9KoNg1Gi5MMXJo2s9e9nFnBrFSJTi3ZBgz1qEvDnBQxZaAR1fePhggqd6KCBwGcORVJJFcRpckCMyg9zNKdUcqUU663DQbjsC+BAD9Eqj94ipagOOIcNr3kbtiDQMhB6AoZsHws6fJ+y9n8QuUE3Uy51TBFeIiz0TVDS4/4g2so+Cie2EmbuT0plaa15qisPxx/P/WF7tQKUHCqST0sxB5yC8inOKx+fGFoJ67l99P7stNlLDIrR5UuVuUJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(38100700002)(6486002)(6506007)(66476007)(83380400001)(66946007)(2616005)(4326008)(5660300002)(2906002)(316002)(31686004)(6916009)(186003)(54906003)(4744005)(31696002)(36756003)(8936002)(86362001)(6666004)(6512007)(8676002)(66556008)(498600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS82RWcrRk5GaXhpeXlJK2EvcGxldzJTZlYxL2ZGTDJ4STZSWVVJVHRhRTk1?=
 =?utf-8?B?dDhaUDE0ODF3WE9kYlhsVitpaWZGZU9CRzlDeVM0N1Yxa1ZFNE5uenVPVTRs?=
 =?utf-8?B?dXZkRmtLNWlEQmQzWUxTQXNuWFA5R1RPZk1zNGZyVEplUk50N0xnd2o2RzBI?=
 =?utf-8?B?eE01MzhtdjZRVFB3d1FiVnpHakxOY1dIQkhLTUx4WFdVeWp0RXVLU2NLaHV2?=
 =?utf-8?B?Z2p0aG8wZXhkZjFobGNXOFl6R3I2TEg0Zk9MVURsdCtNK3B3SEtCZVd4a1F3?=
 =?utf-8?B?cnF1TWRCc2pRQ3ZjbnArZmJjVDB6b3V3dy9TQThRN1E3VERWZ3RKZ1Z6NEJR?=
 =?utf-8?B?VlA4bVlTd3EvSG13ZUE0dWhIb0EyTXpaUjJUTjlkZFZ6QTJGNzBadVhnVS9y?=
 =?utf-8?B?eTVpOUlTWDFlT1pXdGFPZGZkVGQ3elRNSFFrOHNKblArTmp3Mi9SYXR3c0RN?=
 =?utf-8?B?ZEIyaEFkNmwxcVBXbzZNQWtFb2ZrcmEycHZ2Z1l0cnh2aDk2blhlVHBJU3FS?=
 =?utf-8?B?V09Lbms4dmIzZ0MrdWxxM0tJcEhJS1JXaUZSK21qMHVzNkJybkIxOHBXdnZP?=
 =?utf-8?B?eHRQbmpCa1ozSC9yUWV5TzdPWEpqVzlmRGxSZ3huQU14WEY0NzZQaU9JS3d6?=
 =?utf-8?B?NXVaeVlIZXlPMmJpeXFoZGJNa1JWVG5LTUM5MkU0TFFCSW9CYXNxQy8zOUZv?=
 =?utf-8?B?V090cUlta2ZZaGJ1VjB1QzRmMTBySloram01WEFWdUpQQzRCRlVqMG40YTVY?=
 =?utf-8?B?WWF1ckJYVS85UmNrWFQxd0tCV3IzblR3VlcvbERuRzhGczJlL0JrcERmUVZj?=
 =?utf-8?B?NCtqakdiV1V3QzR5VTlIekdDN3NCZDYyQTFLaUJScjVWUGEwbG8yTDVEeFpO?=
 =?utf-8?B?dGF5LzQ2ZDcva0xrZ0xwWXBqMUxUdCtNVHVaV2JzOU54TjBLTmNZUHdWcStq?=
 =?utf-8?B?bWZFRk1jTVhGQXh2cnU2UXAwZ2VhZWorSGdmMGQwMjhBR3hISERCZmRWSWU5?=
 =?utf-8?B?OW5kNWpZT1ByRmdDOEZIZ0N4ZEdOUlVSeDFXaUZTL2UrdVlIU05wcjZ0VEtU?=
 =?utf-8?B?M2NkVys3QlprUTBrUy9UNW5xZEFxOXJLMlBpaW1memJGb2lrUURHaFBnT2Rj?=
 =?utf-8?B?TlliSFJmWCtpelhGVXlPTjFDcEZvcCtnOHY2dU5kQzhwM3RFLzlFMXMwN0p3?=
 =?utf-8?B?S292dkxzTUJWVElhbkozTTJOQmNkdVhUTE41NFBQb2NxSlIyc0xIai9hbkhR?=
 =?utf-8?B?My84RjQ1bnlPNWgvM2l0M29pZmxjcnZ5RG45K01yYWllOGhvcGJ3QkNIRUVX?=
 =?utf-8?B?TzlNSVpVSHpGY2toS2NxQlZmbDdLa3BYVVoxRS9GZDdVdlNrQ3BRVHo3RlFN?=
 =?utf-8?B?OFBKWlgwL3g5aSt0dVpvcnEvL1NORUZINytYdUU1MzVSdkpuaFc0dC9yWTQr?=
 =?utf-8?B?ejB5dlBDSnJTUGMzbTVFKzB0RlNiM3J1NDIxSnNyTUh6ZFJjMm0wM1ExNW1E?=
 =?utf-8?B?Q1lzbDExQ2RQaDF6RDEwajVkZTFuWEpobno5bS9iRFk2OTVPTFlSTW9FZGF4?=
 =?utf-8?B?ejRKSG1XYlZXZUFiSzZEenhGZzNMZXhPTG5qbmFRZVBCdTJxNzFYRGVZMmtJ?=
 =?utf-8?B?VmNPRDlRbURJMlUyeEUvVjgxc1daOGtnQ1gxVnRKcTE2cHZlSytJMWs5RUJs?=
 =?utf-8?B?cGNrbFlLSzZMZEVUbzZtd3VNdlBOMWJCVFdBenViVllGaUIwZFBwVDVZeTR2?=
 =?utf-8?B?TVFKNUYwWTJiMWx5S1dPRkdoWlQ2L0Mwdi9SaHFLemhDdVdxYWhlcnBtSUE4?=
 =?utf-8?B?czRoZXh1dmM2ZGFrdThOejlqWDRpdVFjUVRJVHZXdGg5cXBhSm42eHJhZ2pu?=
 =?utf-8?B?QmhKUE5LSzdJa2NaSzk0Ym9maTdXWGFvR3E0N3BlV3dQY0RXTldwMDliNWlu?=
 =?utf-8?B?U2JOLzJvNHBiOTQreHZJRGlkeVErQ29nMWhLby9yS3VjN0J2TFAyWm1YN3BT?=
 =?utf-8?B?ZzYraHh0L01mN3Q0MDhReE1MOFdnVG1hS2tSNUhxVGJ0VjVuWHZVTG96UlM5?=
 =?utf-8?B?MFk1R1BuSkJveUZkcSt0UzRKK2hVSThpRHVuck1HdDI0Z0s4OG9iRjU2SzB0?=
 =?utf-8?B?d0J2Mm8yejJBTjBtSjRBT3lJOEU3Wm9HQXN1RHh2b0oxalp2UEI0UG1Dakts?=
 =?utf-8?B?WGx6dGp1TFpkajhGdWJ6dXgyeWlaZzVJTFBSZTBydzQwakZiQzFBc0FvcVBX?=
 =?utf-8?B?VVRSaHJMcmM1bDQyZWZNajMyR0FMaDhWVU11YnIvQmk3YnVNelpITHdoZjhi?=
 =?utf-8?B?VzdmMG4yL1hta3RTd3dGL05xTUZTM0lyVG1xbXZuOXhiUmhiTlo3cnhZQkVr?=
 =?utf-8?Q?ekbiHbv1QCXTMPuhD5AMOMvuNR/Hy4wahIPHbGNNJ1Zgn?=
X-MS-Exchange-AntiSpam-MessageData-1: 4s2pgLq0rpV53Q==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bdec04-8c2f-4517-66e5-08da52bb1df3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2022 12:48:04.2605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ROn2gzpzUSEffqK1vcf46GWX6KyJ30uITEppOvrypjmebcJeVvP6yyGUwL8+9w1NyRRlUyrQtuwV4/F1QWdww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I am looking at this code in input_register_device():

        error = mutex_lock_interruptible(&input_mutex);
        if (error)
                goto err_device_del;

The problem is not the scope of the locking, but how the
lock is taken.
AFAICT this code will be called in the context of an
ordinary task when you set a configuration through usbfs.
usb_set_configuration() has to probe all interfaces
of a device under its new configuration and does not
handle -EINTR, which input_register_device() will
return when a signal interrupts taking the mutex.

Hence there is a window for a race during which a
mistimed harmless signal will cause a failure of probe()

Now, as this is fairly core code I'd rather ask what
you think before I make the simple fix of taking
the mutex with uninterruptible sleep. What is to be done?

	Regards
		Oliver
