Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFC31752C0C
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 23:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjGMVUu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 17:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjGMVUu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 17:20:50 -0400
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A061C2D54
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 14:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hyperx.com;
        s=mimecast20221008; t=1689283201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OLwCPSjl934AIoHmB5+4t67U9lwKDgojKohhX3+/bRc=;
        b=gbG5OnoR4s0iGz9KEZaCEC7XvE2mb6J/2UT2tzuwVloNmkyxDn14gSv6A1NVaVaB8aB7iB
        W5voKQZUV4uIq4YDgD4eOl1Ufbkq8wLTl0F1zfcYkWYEOzI0myZUMnAVzYeXU04ged24GK
        SbXB+Eo2tvXv26U4BFx98q3qf057MjU=
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-9O4z38ysPb2P5wF5Vhh5Wg-1; Thu, 13 Jul 2023 17:18:40 -0400
X-MC-Unique: 9O4z38ysPb2P5wF5Vhh5Wg-1
Received: from MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b3::10)
 by PH0PR84MB1357.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:16f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Thu, 13 Jul
 2023 21:18:37 +0000
Received: from MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d070:eeda:c3d1:9971]) by MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d070:eeda:c3d1:9971%3]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 21:18:37 +0000
From:   "Nguyen, Max" <maxwell.nguyen@hyperx.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] Input: xpad - add support for HyperX Game Controllers
Thread-Topic: [PATCH] Input: xpad - add support for HyperX Game Controllers
Thread-Index: AdmxO7SKOKq1YFE3Qj+lw7yIOJJAOgCJOumAAHCPnjAAI3hGAAAHq1ng
Date:   Thu, 13 Jul 2023 21:18:37 +0000
Message-ID: <MW4PR84MB178010F3A35DFF92FE8CC909EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
References: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZKxVBULWtM30ZJ7D@google.com>
 <MW4PR84MB1780BBFAD855717EB1EA86A9EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZLA2cE+ojFwCLO+2@google.com>
In-Reply-To: <ZLA2cE+ojFwCLO+2@google.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR84MB1780:EE_|PH0PR84MB1357:EE_
x-ms-office365-filtering-correlation-id: 4c15354f-2bca-4c7c-66f7-08db83e6b943
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: 9vHFhy3UGKSx5VwZlNGwCCOaAyXazGbjsZVGcxMdQqQ1xSo62UV3JWA0FsktwQw1X7IQs7cAw3sLlK4gpvGSu4uHTOGxQ9idcYRfhm9YXlExanMTdX9jdZMb6drXgAhoidpwMtAolr4mbhmSVjrO2I11XqYo/6lYsuteFnDhaUQdEJL3wrECZPt6Fa1ujN4fuAc0gMYQy2ambs4zgO4JjCFe2jzcKYvo2Dq9t92GyVtaJMw98U8Hvcd+Yed/+ByE8xIklqdGZfbc+C8ha1iCMsd/EByotMkcEMeEVgkZHzct9iRmMJJLxB8MQAxZArOd7fROD7U6tD59L4QOIBUVlRpOK+Mxba5xSEzksSwuRA2bMnALWZ7zMJFVe2dAos7Kopnc63YXAS89yO8jdE6bWM2TH/RkWaQNlV7PCfoQV/pXEVM4UJ/Ytzx2LosnJm3UFgrUB8662fUZ5paAO72ltIdq3xquHjI+7jnIX9mmH4/Q84zm93IFy63VRazlNfALX8zhIK58AWcnoaPuolFMWqXxV7Ey7B4wVCDGOPNDy/luP0iAtCwASdwZkiTKF2fv1es45dz32UTQKk0d53F4kIWAnKQzdIiCbDIW97M6gjE2TuMsfUGJkvlMZS6GzRQB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(8936002)(5660300002)(82960400001)(4744005)(83380400001)(8676002)(2906002)(122000001)(38100700002)(41300700001)(186003)(53546011)(38070700005)(316002)(64756008)(26005)(66476007)(6916009)(66556008)(66946007)(9686003)(66446008)(86362001)(76116006)(6506007)(52536014)(33656002)(45080400002)(478600001)(7696005)(4326008)(71200400001)(55016003);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fLatyAqXqmjrCKShxQlAmdIG55PpSF/kTRzJrNkZSbAuWdRgfYc9ZQnmp4sc?=
 =?us-ascii?Q?kI+m+MUqNF7K0CCmxriuOPoONpaUK0LjxM255pAE20ftY7AeBHubDNE6B9ym?=
 =?us-ascii?Q?tQr6SkIUG6gjcShsJuPYURtrF1e3Ee2QHEjUu2o5IRXa8l5uXaQCqx1TUJm6?=
 =?us-ascii?Q?se1+2FpWa0/3PsZiwlQqCWFwnO94qC+aLMDaEHcEBxGnDWzdkacuVBSpOvKG?=
 =?us-ascii?Q?/63FTGll9wL9uei2GRqgFJIGDOFwWwIG1uOQ72e4ayj72Ytqfp4YQX9wnMoO?=
 =?us-ascii?Q?UqzBR0VNTQj4JX+AjLFFEMngU+nd/4So3Hud+1yAF16VgwmvDNVuEbQsmP/4?=
 =?us-ascii?Q?uSjr8jpTIPX5+DeOxguFWfkg+N2K8P6eijT7fjcnXI4D7pqimRkUTSc/SlQ9?=
 =?us-ascii?Q?we5al44HgnplZrKwPc8ZBcoxz5RPxPgIxdG3jjZ8c+BCupbw0WS8TWnDH/0Y?=
 =?us-ascii?Q?Q8OuaSQFFXPerAQcswDl0qhIj0YAF0qOnqLSufUV6TZy71xbLcPheh9Wrz2w?=
 =?us-ascii?Q?xW7BTXXZn8/vGwuEecHWSy3nmuSISlhzbh++hZtFGZSFq5veHY8xAKkAOH8h?=
 =?us-ascii?Q?hzjBRjZhQ3RLlDYrjIfMIbWhWl3kFReMEEU2LdrmGPMxt/GTVyyOx/xPLivg?=
 =?us-ascii?Q?Hm8UZyTW5Npdcx/vTns2OJ3UO8rfIaBWSeZlywwZAMzRwUiGhYv8gRfbJLw1?=
 =?us-ascii?Q?dPCOSJs79pSEzVi+6SdrtiqBy+GJic5AUv1oJAz05hrEAZi+vdAzquGA3oTO?=
 =?us-ascii?Q?ECp7fqpG4BIpfADYAsJkL6TebiGzXuLlq9i6+/OeWmr0yzpyfyTfClwQhsgV?=
 =?us-ascii?Q?49eDn46/v9ocIbvuWhW3i3IUYxny5Rk7It6bWwOJixHgeAZbbksCiygh2yi2?=
 =?us-ascii?Q?XDIcDfAUKZC4DLUovENarplNAfIQkvakQ4gSLv/am3WEBHrdDdZh3Id1kyK9?=
 =?us-ascii?Q?hy+T45AUWIc4QL1D2kKGENAMy6Dct6IhhC312637GlEJKPrLC0cg3HsVQ4ul?=
 =?us-ascii?Q?b4dH4ocbjUYQhALxX/jn8a5JGP4IBYIYsEqf9MPircIuz808ZuAi0EXGbGI7?=
 =?us-ascii?Q?2Db0c8yRLK1PdrdT/bdvaCNcf+FzCoXlNTZ/4uiHhi4C6PvSBs7GvCjRBWbp?=
 =?us-ascii?Q?xccnihKybfqQOikhnB8ZC+10hHCtq96pv9+8T5cj8Q70YTQMISpwCL9J8yzL?=
 =?us-ascii?Q?LqFBLrdFlLMWYpJVnY6GkXSwDzJfN3abXcjqBw6AtHdrkV5mJlsRoCf7hpdV?=
 =?us-ascii?Q?2lDnxB6hCurqJ8L9QxQFVYS6kuOiuewSgQM77Jg4F8DznBjT6wmdA/n4OvL9?=
 =?us-ascii?Q?FgNqoeomA5QlnKpVGJkiDgBz+rVW+ukFwrrQwlAEGuUTAtw71UDVJPCO7bmF?=
 =?us-ascii?Q?TK6s2iqyRNneU4XekUbXUc7W5mRSb2BLZ8Lp6/Q7pX3H0d0m6M4n9H4BMXEq?=
 =?us-ascii?Q?/Yvd9BlkuKjhJz3lX3WeeElhYjwKAKAiWAQcaA98m1h46qhScFdocacnzJmK?=
 =?us-ascii?Q?ZMKgeueUm+BcRQO7+hG63Ye63JscXitHPWyAb51LKzVyCbIBfFp1V8IT3C88?=
 =?us-ascii?Q?oXQ4dRRNPzdnsVbjk+XuOevLQ8X+ZN15CSWgEUtw?=
MIME-Version: 1.0
X-OriginatorOrg: hp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c15354f-2bca-4c7c-66f7-08db83e6b943
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2023 21:18:37.6771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ca7981a2-785a-463d-b82a-3db87dfc3ce6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A6iuIhwxC+nN/n8hun+xE4pTQ8Sgc912jKd5T8XR97e3xdElUcpgauCwMZ49cVip7J6WSmcB1FGdYlTN79UgGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1357
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hyperx.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

There is an option on outlook to change outbound mails to plain text instea=
d of HTML.  Would this work?

Regards,
Max

-----Original Message-----
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>=20
Sent: Thursday, July 13, 2023 10:38 AM
To: Nguyen, Max <maxwell.nguyen@hp.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers

CAUTION: External Email

Hi Max,

On Thu, Jul 13, 2023 at 12:43:19AM +0000, Nguyen, Max wrote:
> Hi Dmitry,
>
> I have sent over a new patch.  Let me know the whitespace-damage issue is=
 resolved.  I will need to adjust the acks since I had missed it.
>

It looks like you are using Outlook, and it will not work. It sends a mix o=
f HTML and plain text, and it mangles the plain text.

You need to look into setting up "git send-email" or mutt or something else=
 besides Outlook to send kernel patches.

Thanks.

--
Dmitry

