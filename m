Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAFB92C19DD
	for <lists+linux-input@lfdr.de>; Tue, 24 Nov 2020 01:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgKXAP3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 19:15:29 -0500
Received: from mail-eopbgr760050.outbound.protection.outlook.com ([40.107.76.50]:7808
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725287AbgKXAP0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 19:15:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3pMOGb/+Td64l+71bvUeTBhdLR2k+18u77xNGVFTiBbjG4PtBxMBWcg2rUTwRl4E6px9zAjZc1nJ+RYT4Yah28eotlcUxRJguGo4YR5xHQdEFQvaFHpMfTxVyNykYWe67SZRrxPXExeeGXKRn+5iyaQpxjVssdcgfLVntp1kJJsXpGyhHhOoKlFot2UpZVsAuAp82Z0k2pmaONrD3Ql7e9HqpbokTcc0H6nf2X/u4LS1YZ7eVzgAPE/XwBy1VilTvCxk3/RgWO+4SWY6B52ax0MpyWLhfEfqUjQUNgeeesluzk6zCJUf2eoHEHdN2uwPcGTRCk7cic78FaRoIGztA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAI7Y5OrlurO1PSv12ucNaIuUWcVDQZLHrnvWkhomuc=;
 b=Nwp3LC5v9Z82OPT4saxKKCU6zKb3qyeIJKOyHSfMOijvmhOs6ZGxoKGuXlfDL61GCxPH14G8qoCZxQNaoz9+T/7rpk4nUqn+iOfBwkjHm0vQh5QfNzvvcbr7Bw6OMN4BIr8mlCEwNKdlTgAD7VaOEvK2RsWLEPCyq1+bcY7QtlprCKmG2z/tnSWmEkceXlYFD0+nPRcqAjjYzS4JAEHdh182w18cGDdZ0CYDy8gAhb94JoKSPjicmraETp5qEWgWgmAgTDMRWYbFN72PI5T0GvqxSwL+GKZEwIIzJNot8w9oMg8KlbOnw0iGd1VekU0hnDVJbxVSvyPWKbxACyLTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAI7Y5OrlurO1PSv12ucNaIuUWcVDQZLHrnvWkhomuc=;
 b=KZbmzKHzou5alJY1doAZylsFpA+d8C0Klmtwi38Gxf4r9fpeY1VcaCeoSnolz22Zw0fgU5MvVSXGMVXyU1/ZC1deqJ5UpGLkTNkeD+DEut+syxsdQgQrsku8etJay4OfyGDy8i0Nw03N0TND/GbTqrzjYXGo6XfSBSMYulhf87w=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6538.namprd08.prod.outlook.com (2603:10b6:806:11d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 24 Nov
 2020 00:15:22 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2%7]) with mapi id 15.20.3564.035; Tue, 24 Nov 2020
 00:15:22 +0000
Date:   Mon, 23 Nov 2020 18:15:16 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: Add support for Azoteq IQS626A
Message-ID: <20201124001516.GA6249@labundy.com>
References: <1606084748-4097-1-git-send-email-jeff@labundy.com>
 <1606084748-4097-3-git-send-email-jeff@labundy.com>
 <20201123070307.GE2034289@dtor-ws>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123070307.GE2034289@dtor-ws>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: DM5PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:3:115::25) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by DM5PR11CA0015.namprd11.prod.outlook.com (2603:10b6:3:115::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Tue, 24 Nov 2020 00:15:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9f49d1b-934a-45ad-9b5d-08d8900e087f
X-MS-TrafficTypeDiagnostic: SA2PR08MB6538:
X-Microsoft-Antispam-PRVS: <SA2PR08MB65386B1BB650AFF487F1E73CD3FB0@SA2PR08MB6538.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABtgjytFhSk+IvvcauZZGhaaiRIL2vvYxF2XYyLxCzW50h0N3pEbQjgv1gQVy7JPn36AKrj/myxowfaA6qAS0A0WARNGN7ulBXpdC7BqmoqRvbv/rZ0KEnw2jzgBN/e6G88fkSupTMMCt9yaN9bG1PsJXyrhKwSGb1KxfPMU+b8h4/RJTPrulgDJAQYdgMmuOSyyOZV4Vyekgg7m97EBDJ/q/g1tqeqTKMKx/A4RHEhmK/nOHQgqn8q2krf6CSQuBCwYyrhRU4dJJNT56aG4Md0TRikSFqKiAWvvl+RBVjE9W8sNcqMDuu6TL5e9BTqEM/QDa50ZP9kccxoXkXclJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(39830400003)(346002)(376002)(6916009)(5660300002)(4326008)(956004)(2616005)(55016002)(316002)(33656002)(186003)(478600001)(36756003)(6666004)(26005)(66946007)(8676002)(66476007)(86362001)(66556008)(8886007)(16526019)(52116002)(7696005)(8936002)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: qsqF5OI71ja65R8J50smRIC4ZOSlZ4TJWJOZB1a8kMIVq8l+HsHkC8915ThiNJSz+XMSWWFKAcy8QX9a5A3syhC07OhMO6WK1Iqc7E3scQiwKu154sBOjKnW5QbSPMe9maIz/e67UPgR6iocQudUIBJCgwPdL5vdKBB5tZQQLe/EzsmJ8iVLtNWajN2pZNpsNtrBQ6ZJVxMeR3f08UQVQw12mCjFsIGg/0QfMvtJq4Sc3he0QU2VmRuSYPqhk05qTFIN4iitauXzwMyqjOTCqr7wqoHr1UgkTokhfBTnNx0Ya+wELdrdo1P7AeCRuTWRS/RySa3jV/ciBjV/9ynIRyBVD0aYg4QUtg9BKp4mzJ5/G22qvLXQ5DwVP/PLNyZlkEDAeOU1DIbTOrdR46dNOqWFOcQNzYMFsIkD5gvNJy6r0M0CHJz1Wiy1TA5Y8j2wkFkRw2TYk4l67AVJ48H2B4GrhRpZOV3MsdaaYJ/bzgltfLOaaI2wDUDbDr7vrCNLKAra0wqLEPQ0qt3QWb6vhySUH5zL0PT9uRtuxNxmBwPd0aaiWYr4rNmg/MQ0S8kFs9+a34y9i7tBL+6NMonATDGi1IeEZM4jlukn4ZDQKCmiBIsz0Yby+1mPXOz/BZRCkWWwBQSLhpAVNfHMFRYxIV5XCV3wnoCXLy4T6fsjKzXJcbkFkqME83NF514nUl9VRLLqyC0iCh+O/9zKCGZm49UNrpePRq19dgVSVPxjzE4S0icdGlv9Fr4+ThdGJZW28nfjNGoCigjjl8ECG/HgyUpbUzaqmflE3+l2xG68dbSToGdR9WmIv5+N2itIy836s/wqsYy+nsfMI97sf65zlr6Wn0LpiVORnriWvTi02n8p26VaMar8YThCqFiWruJGYGSfAivHgN5DuYa2XpoOVg==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9f49d1b-934a-45ad-9b5d-08d8900e087f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 00:15:22.2226
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hV4v8wtHjsPXgt7+C0vruIlobqo6Ep0ciWfj/ze5q1wrHShNF6/mGmgf/oH1Oh9f2nFlW/ChT1wHpqqqe5q8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6538
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thank you for taking a look.

On Sun, Nov 22, 2020 at 11:03:07PM -0800, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sun, Nov 22, 2020 at 04:39:08PM -0600, Jeff LaBundy wrote:
> > +
> > +		if ((sys_reg->active & tp_mask) == tp_mask)
> > +			input_set_abs_params(iqs626->trackpad,
> > +					     ABS_X, 0, 255, 0, 0);
> > +		else
> > +			input_set_abs_params(iqs626->trackpad,
> > +					     ABS_X, 0, 128, 0, 0);
> > +#ifdef CONFIG_TOUCHSCREEN_PROPERTIES
> > +		touchscreen_parse_properties(iqs626->trackpad, false,
> > +					     &iqs626->prop);
> > +#endif /* CONFIG_TOUCHSCREEN_PROPERTIES */
> 
> This should not be separately selectable from CONFIG_INPUT, so there is
> not need to have this guard.
> 
> The reason it is a separate symbol is historical - it used to depend on
> OF in addition to INPUT. I suppose I can drop it now.

Without these guards, the build fails if CONFIG_INPUT_TOUCHSCREEN=n and
I felt it too heavy-handed to add a 'depends on' for what is ultimately
a corner-case of sorts for this device.

The touchscreen helpers are useful for more than just touchscreens, and
we can extend them to all of input with something like the patch below.
If it looks OK to you, I can insert it into v2 after I collect feedback
from Rob for the binding.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy

diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index e356509..d050974 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,6 +7,7 @@
 
 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
+input-core-y += touchscreen/of_touchscreen.o
 
 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_POLLDEV)	+= input-polldev.o
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe7..4c33278 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -12,10 +12,6 @@ menuconfig INPUT_TOUCHSCREEN
 
 if INPUT_TOUCHSCREEN
 
-config TOUCHSCREEN_PROPERTIES
-	def_tristate INPUT
-	depends on INPUT
-
 config TOUCHSCREEN_88PM860X
 	tristate "Marvell 88PM860x touchscreen"
 	depends on MFD_88PM860X
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541..80cd241 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -7,7 +7,6 @@
 
 wm97xx-ts-y := wm97xx-core.o
 
-obj-$(CONFIG_TOUCHSCREEN_PROPERTIES)	+= of_touchscreen.o
 obj-$(CONFIG_TOUCHSCREEN_88PM860X)	+= 88pm860x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_AD7877)	+= ad7877.o
 obj-$(CONFIG_TOUCHSCREEN_AD7879)	+= ad7879.o

