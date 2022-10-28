Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D799611C8C
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 23:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiJ1Vna (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 17:43:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ1Vn1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 17:43:27 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2065.outbound.protection.outlook.com [40.92.42.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3ADD24B332;
        Fri, 28 Oct 2022 14:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpAheyfP50r0ZMsbXZnBYv4YcQaW3hflxvC9pERmbCarmUtYkkOnCd1LShN1pfpoDct/MYjhGe3IGoP1zrGD1HJCrG2LW2rUOY5u2Ia85z8gNPenun54Sd9WonQyu5oWlvpmsyPjIg4DA/Y5x1wL7ryEcEyjEl4JwYy5jEHfrcFSKDysq4BKH+Dy+GRrNwGAyKmDkN1cIXXMJHWwqV6RkoRHIq0FStOK7Xavv6IlyRCyqEvzRyLXocVYkb1pAR85surlQVgFkOI/bejvg5fJOD0MiN9V8EhCFxq0feYI1VucvLC9o9VVHWO9NaDTgV9exgciVbS5pTtOGhIw9ne10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMTTbsKpFtfUHMUrzZDjBajnfKCTdggyXDut1go0A94=;
 b=Wjkj8cntY6QOCyLUDkhd7qQWjzi6/vCJcOJYa3TL614dPFFYSfsF+AlJyQMmfdlNFaBNXoCauegRoQ6gIYV/Y3AXrypWXu48FtoYbFTJy6XhpRFK1joeR2Cp67sSl31Iz9JNPlEcxTaPztk4qyfbXdTeSJo2q428nv5g7vv3It50OkUHw03ofQ0MTtOWQvqsqtttaAcO32E1NY24OIrVeKhpaZ08RB9t4lbkbLoS+t+q+UexmETP0YZa2AGXLqyD5viiRpg4LPklrpTOtZtmhPCr2+MaLaI4chpzFk1nJ9ms7dP95wDmsqi9JzMU1OjKT69slv1ewPZjCQpCiox8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMTTbsKpFtfUHMUrzZDjBajnfKCTdggyXDut1go0A94=;
 b=at0+dbQZR3dJ1Dc3JUGvm1NV+j3UzBhEGA3V+gID4qqFNh18Dh3KD1jiPv09z1wPAsIERqX8gGi7eSAoYzl1t/ce/kU9hHodzIQC0KNOZ4+DCYWPGl8hvJV7eKg7NqueGRAfzq/RrEgWQ6mdbQCHC9Dw+7gDF5PPXo3+g6lyHZW1RIk9JXZgo2S1DSokZcmWOcmQENx8hPEW+Ymv+uhcIRwdivKHE92q6k4L+UNoMdcsmjF4LpSSay4VVFZIIYqNKN9i15zD92OEMH51oOWtxTO+YUC+JoOFtgm5hRO90YHgwhv/gPJsOMVeWY+0NTPVChOs0RiMv8eIOS/F9/mPvg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BN7PR06MB4098.namprd06.prod.outlook.com (2603:10b6:406:92::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.27; Fri, 28 Oct
 2022 21:43:20 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::b849:682e:6222:2b2d%5]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 21:43:20 +0000
Date:   Fri, 28 Oct 2022 16:43:16 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        mkorpershoek@baylibre.com
Subject: Re: [PATCH V4 3/3] input/touchscreen: Add Hynitron cstxxx touchscreen
Message-ID: <SN6PR06MB5342E823C4FF82E974724AF3A5329@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20221028202636.14341-1-macroalpha82@gmail.com>
 <20221028202636.14341-4-macroalpha82@gmail.com>
 <Y1xGIykG5H5QmtZa@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1xGIykG5H5QmtZa@google.com>
X-TMN:  [tpf/OQMaexVbEvpjy04fD1a20b7B7GLC]
X-ClientProxiedBy: SA0PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:806:d3::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20221028214316.GA20830@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|BN7PR06MB4098:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c65a5ed-5731-49ef-9302-08dab92d6e55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHn7jMrCiLv4k+Fj4voIX0BZBqqk1qZ14TR4/0P33A2MS+ch1H5JP99HaSxLFnf0hU1KH1/C9smzqH+tL5O6NPwdrDpLSFAHJSinM+BitR6bgBhptWKXQGQHgqX3EQ9yfl+d0spbcRfyDzjmQVI3w7SRXtmx9UOB0KXjMFf2pOLsZB1kzBIFHoUZiPDHV6O85UuMPkAGwKS+OHQAOjnLzlYb7RlUMbTFHVsFzbR+mVFZtGhf0B9SdMKLYBId2LKJ0HE3AuMmngEEnZ7WvSb1wGOGcRe0EKZ0NdADRYEIGLLmGCZqjIYMlm3TEucGY27v7+7SnkPUCnuW5xtmkW7zdUOLjuskyrGt+nNvTGnZZ6R0HSQP/CiuvVdP7Y7a3eeKG1h4+FcUpiz/70EnMtUiqCpPsVq1uAVUphYZs0B5xZyp836CVYBhddCVdZBndkBMZx1oawY3h2R/hRYa0a/veOHOHhX0Vs6TNOBis9U7IezJCGxoPgZxPf9+tRylvQIiOYm5huT5RBdMyT5cLw0/kKVvRE8C/BlDrnob+jsSpNkwVCfQHB+CX5TYsmzpZYXII4+8uz45FUbx3L7COUl2WSFyIp+l4iRr3qtN857JIqX0fctnVpU3hAVrcZxo7Npfjab5KTwhLipG7BrtvoOMm+Rdos9tF7e+2Ll3ZfGXbnzmQuJtIu8jjlZIKL1ljo6X
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqB6n8kDl7Ug4QqnJECsYxFZexTok7xUs9NP7dOuA7Pxxi/OJe1nuD6xDr/m?=
 =?us-ascii?Q?nB2kdXiMX7/SK75NPm1rVhiNKbNdvetVPVivFWESdXn+j6zLZM5SgfLEBDLR?=
 =?us-ascii?Q?TPIgCt/vtOPF1G3nldcZ7GL6cHAGQ4OqlfoZaPTCoc3Mq2stKPPDy5ExKUMc?=
 =?us-ascii?Q?1OryKOzZPLYvIIObOJGf/xjBMXrighs4xBIEQaYD1xrIN0E0igHpe/pZuiR4?=
 =?us-ascii?Q?+vkbrIV1wGJapVTvfgtSDNFRJE3qYAL1lHQxS2l7zuvfZs3UbjFCyM7SC88J?=
 =?us-ascii?Q?VaSlUvda9TpJiTIrb4kXnGactxTs7+WJUxQUGpcpoUy9QW+Ogmv39R7fP2ub?=
 =?us-ascii?Q?b4QxW5L00NjjjrIDqUFE64L9MlMmf6rDnBycOruspeSGFx4W0/cbOxKbFIig?=
 =?us-ascii?Q?JAJ+IbxWqOSBH2+4rSCuLR7Eom6/yp5lPUrvBtdmdu3JCqvZbqoCsyD4Lvez?=
 =?us-ascii?Q?SSZsaH4H75B+M1IFtHJP5KWkxLzfs/pDEaH5dNGG8rlUgfUTZlgSJdEAbCHZ?=
 =?us-ascii?Q?GYhBnu6qVZtFm1I7nQAkOC64znz23CWRyTCzcpN68iD1GdUhBjkFbc8nzWBY?=
 =?us-ascii?Q?/6inaXwyW5Jqg3XzxjgUFIYK8JdzydY2wZqhZXyhxVwTRGHgSNKjE99/DrqI?=
 =?us-ascii?Q?YpNsnIAcvCEhk158JncJOoUUbQ1HkH1MiCOK1ZudE+xIlOMemaGAFo0/XjyK?=
 =?us-ascii?Q?zcuaunKtjXUKeFbGN8V7YidA0APxRrd13bGESQYUN6SwGzLrW8sIMjYftWq6?=
 =?us-ascii?Q?Die0tQlofIOwxI4HV1ozIYbT8sGf4pkLrZTfRBNgq72tDRtP616Ez532xx4b?=
 =?us-ascii?Q?5IPnABxWYZwHvMVKXz/6PHLoeZ6g0bTZXIX2v19vHDAXpVlZTTpZ6IjYYXLm?=
 =?us-ascii?Q?O8BuYNZVPY/Q7T5BGd2M1X469KXQsq1gu+3/Ibi90yEdo2jhhdCBS/AlRPtP?=
 =?us-ascii?Q?3/rZS4kRc7ABeSzxVTIfYaN4HGCkwkjYiNWWLogMZ1ktoY1UD5jIyBX9S1eO?=
 =?us-ascii?Q?RiFzeeo9gv+erlXNbkoSf00jCeXCdNxpByOvgsdcRVR3AitzcEayQCx3MNwj?=
 =?us-ascii?Q?sIP7mVNtdADDiZ+ZLfG/556NtKSCLeHMCEbo+VFTJJrhAKRRXY9LgQvjnNbz?=
 =?us-ascii?Q?2aPE2DZbLpAHHMXd2tT9mB1fOngSI33UPKWW2dgNFZBTIRM4X3Mh42nF4R4b?=
 =?us-ascii?Q?RX4DxrN/FYXqVAbRPKzHaOXigk6tJg/etr83xIyQyQADQRiLoEo+pENDT+2+?=
 =?us-ascii?Q?aiOeP3cHR2SIxSVStAqysYijOybRpgy/q3JvDrG8XQ=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c65a5ed-5731-49ef-9302-08dab92d6e55
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 21:43:20.5708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB4098
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 28, 2022 at 02:14:11PM -0700, Dmitry Torokhov wrote:
> Hi Chris,
> 
> On Fri, Oct 28, 2022 at 03:26:36PM -0500, Chris Morgan wrote:
> > +static void hyn_reset_proc(struct i2c_client *client, int delay)
> > +{
> > +	struct hynitron_ts_data *ts_data = i2c_get_clientdata(client);
> > +
> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 1);
> > +	mdelay(20);
> > +	gpiod_set_value_cansleep(ts_data->reset_gpio, 0);
> > +	if (delay)
> > +		mdelay(delay);
> 
> Just wanted to ask - you do not really want to spin for 20+ msecs here,
> right? I think changing mdelay() to msleep()/usleep() should be OK
> throughout the driver...

I just tested changing all instances of mdelay to msleep and msleep works
just fine. Do you want me to resubmit or can you change that as well?

Thank you.

> 
> Thanks.
> 
> -- 
> Dmitry
