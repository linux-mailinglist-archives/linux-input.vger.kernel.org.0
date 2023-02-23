Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A6F6A0CED
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 16:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233926AbjBWPaF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 10:30:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbjBWPaD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 10:30:03 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9EA557D38
        for <linux-input@vger.kernel.org>; Thu, 23 Feb 2023 07:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLl8YTF/P3fXThQ7Ki4RdXuNtlapXYyBR877x2VDiQC+h5pPgUBljVqnAok8lbul2cy+hTvllsa0c3QmZroLCPareomb+cGJxcEwdeCdi2wGSS/J4ghREr1QmCHlCLmif/IDtmz1SKj8dQhFNoh48Tg/+Cfd5kG9yVDk6ZR5Lf38s9iLqkOAd/GuqfQH6NWRY5DE1Htlnwqgz47by2PzdWTIoI268AEh1vnfb164JS4zqGymlsjuufp/OzBY/491elY0AgFMF/S5uGDtglOCl/KB3+PIT3PBADX55OdFUs8cL5e2ncP82sDv91TTQ3DEf3HNxH1s6o1As6HhVlZu7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9lv2OSBxYsJTbGIS4Sg4b8j0f9ucN7981Yii1P+EuA=;
 b=Djf5YzZEEXHHN0iHyfcAJ7AKiiJ7XhUes3fTNqfGwjluGYLINO7NIQ5p1otLpCn+Q/r7q6VKfZMgDDpopXjbH+adM089G6otTN/+LyM6HfOQGUeyXfw/s2Xajqx6TK8LvhOTwva4eT1yKaayR+d1tYVAVh4wtsVXl2GwehU7Wo40bAVYcak7jjxyDcYya87l4FJgAFSICV175A12l6VEpUJwyi3VwBSLAy0vVYPgWJtwjm0TZ38zTjp32HCBTqnrloh2eLXDtAZhQJDEzt4AafiDezrMwU/TRoSPICkRNM2cp8Gel6C5Jaxp7k7y3jVBm/8NmQHGwrvJ/YLynUKQSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9lv2OSBxYsJTbGIS4Sg4b8j0f9ucN7981Yii1P+EuA=;
 b=YDZNeFPy+X782lIyxMLLb1w5/GwlE0bLuGYC9VlY2C4HWGbf9PyR/7aXd+L02dIFe0PAWyC9YYkXGsweOST9fWEvRNwezopsTqbSKKKpBsTsTy10bCAsKwFL9XdYS8ZqFC80tKVrWSeqJzqqVdexAXPHur7718Md3hDLKc2fQfI=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 15:29:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::a59e:bafb:f202:313c%5]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 15:29:08 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        "ping.cheng@wacom.com" <ping.cheng@wacom.com>,
        "jason.gerecke@wacom.com" <jason.gerecke@wacom.com>
Subject: "proximity" attribute for input devices
Thread-Topic: "proximity" attribute for input devices
Thread-Index: AdlHmxaRH1CSqlUwT36VLjEkDO6MiA==
Date:   Thu, 23 Feb 2023 15:29:08 +0000
Message-ID: <MN0PR12MB6101F4408960BDB9CF63DD53E2AB9@MN0PR12MB6101.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-02-23T15:29:07Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=e886a2b3-4a9d-4ebf-b326-78fe3039b62b;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2023-02-23T15:29:07Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: cacf787f-8785-4a35-89d5-7fb04fa548bc
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|BL0PR12MB4932:EE_
x-ms-office365-filtering-correlation-id: 1a45c235-987c-453a-b6f3-08db15b2b4ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IChTVNEq6sIBR/kLiLoVmru1mhBy5IzIWWldpSLiSr6I+J3KIXHBLqW4sQ80nHa632ciMrl3k0quFsu5raxbdW8VURh1OG2Pa46TFg+wNCENSSpCbTXC+IP1syHgOZso16y5si4oFxZSAZU+pvaSxHNCYVIibNsfCVPvEdI/uVFkYQdZ7JRycepzAarOmMQECZk295QpJOq90jZ3TJQEj9K3HWOdQ35yewwOGvpExa93COaNy3uYeIR9GCmBlopjC8gzx4Nqj+30Q0RXxPJW3+me6QQV1JNZ67gJJPQoI07pF0UOvPqtnNlbZdY8MAByCdkfnvYMM+UJb/bfce1URriwbfo8vX/hLdvNeslNrMMczaLNr1J32XFSAhNwFjEZxfEj8OPDH/U/2chsBXOvymet1LNmSR8WF+c0BBkoA0hYBf5lPv0RTeRh+iWjvkSedw2kMoVlH8BMmaAFfcAsDTSgPCk1XQk1mpAie4lP2i+Otv+7DLr0tGifo4J6OY/+NoJ8sD5U6VUISPjvPjiSDe7ZGlV1+OuZeu0hmiQpayh0EA3IcAjJdiqHiI1ydfdIuDVZB/BD6FByHN+pMrukSnuVAgaiSpxeOS0Akuiu2LBVyvDY76erOho/urZAhWKKK++t2snfxuD7FZWJMG6ntLf0wltryVEz+w1aNrguNI0mOMwzyv/pPFMRIpYgW7wn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199018)(4744005)(86362001)(2906002)(38100700002)(122000001)(478600001)(966005)(33656002)(71200400001)(7696005)(9686003)(26005)(186003)(55016003)(38070700005)(66946007)(66446008)(64756008)(66476007)(66556008)(76116006)(110136005)(41300700001)(6506007)(52536014)(8936002)(316002)(8676002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gGwyLam9kXA0sAK7tpAsfNKSok+VWppA5n2yXwbE6OKjwbXUu5HUYCv1dWVq?=
 =?us-ascii?Q?xtUDdEaISi7+lQ9h41GeYRFEKJp3josFBxYHLYsStgoIhml1vd6VgWqTCmHV?=
 =?us-ascii?Q?ciwlbwefFaYl0gppoyG41i/DGqHsfNQDLHNpn0+52HYmbJ+BLYyVuQnTaqV4?=
 =?us-ascii?Q?+FCWC3qmCx4zEFc7h8Jh6cHloH7by7MmY2sVRibvwTdtYhSKGYU890ewQ4Pz?=
 =?us-ascii?Q?43+Z9zW7+lzIhFv+SBO4Y2L2hseNZZoMDWp8ACjOGVXJac+Drd6dEQS0Ovrn?=
 =?us-ascii?Q?vU12V95W6yZvXi1swEHZ1X6BL7k9kannjok3XyW0b7WWf0SkND3iu1uIY+J7?=
 =?us-ascii?Q?q5ov09YcZEcVwGPq6TeVAMXRbeopfysMJZr4XBns9g4k58QnmeAlwRmUBvD8?=
 =?us-ascii?Q?3AACbs2TkSMZeX92L03JhzBTBGR1qWBWLDbGYNvccT/bDjbvpCaEkpyioMpT?=
 =?us-ascii?Q?EmuWBSxT18cW+6DJ9+zVEBZpff/tcTtEs4ME/xnzuO4Iu04S2Y7xF4pIMHzV?=
 =?us-ascii?Q?9tMYv4sloA3lN7MiS8rMRyXRfqOVDq8ltuCcfkNoqbPPKFmAf0jws8qjtf7q?=
 =?us-ascii?Q?cIrZFlTk8vE81T9QMfZSd/7UxGoDaDRMWQEiCmm+xJUx/g1Do9m+8gd2hs9N?=
 =?us-ascii?Q?2P+Lrz0mA8+gPd8odituripwVE2Bdl8d+W86joM42HJWtsA0aY85FIT1pmtT?=
 =?us-ascii?Q?mMQJiXe3PxrT82W0g8hoR5P6/MFWVXOEs2Vuw4PZ7tLF9pqN4hK3QX0R2D4k?=
 =?us-ascii?Q?c1aTBtCcTMqL5IKL1mIKfdROCq3rdwsawM/JBBJq8eIglNIVxuoVtdzH2YCz?=
 =?us-ascii?Q?+Zgmv/PzMgM1fF0d05Tk1JUGIQXDMQBTFQAkWS0lc7K4rxK0hsSsDjInOnxF?=
 =?us-ascii?Q?Cn4UCqamQqrM+PAIuNUC2hyL2ye8G8E8NswC3fGG/TcC+zwjEtLZ4Swfg2ru?=
 =?us-ascii?Q?H7Li39/x8FoHy2g/DDcCq4p4q/IQz6TJcUctZUU6bHyo09TnB/f/yC1ZZrQb?=
 =?us-ascii?Q?A49bD4ltZjrYZQXrL1TGJAcDdBvNWdBD1aVoD+kATXXXceLVSKoXMMSFgtLt?=
 =?us-ascii?Q?UKRwCG47EZ4dNnKk5kPqLivmWWudYLTk1msLAuravE2sBJZ3iP6gOdW7JSG4?=
 =?us-ascii?Q?tCFvZG3ekQtGQ64+n2a3VZDFNgjoK0Q8khCKa5M+Fh0VJFf//nVMLecbdH7D?=
 =?us-ascii?Q?bWRRCGzo/2DFFsAmukrEaNesAHN+YvRN1AxtC8GJMWTbfMZT70zzwkV+LD5k?=
 =?us-ascii?Q?f9Bt/bhVmkx0tzBO7PVq03E/W7xSZx6IXO+bFeSIE0h9c9L0za0hlgJz1knH?=
 =?us-ascii?Q?8e8d/WrU5MR+NTNmnSdk8ocHiQmfNiWEotBsi2CREECj59uK0ZVyMJXf/LGh?=
 =?us-ascii?Q?G/wjrmKOVOK8lwgetbOGAZHL7I84GvG5mVkM65TruYMYiZmy+3d/UlP6kMLS?=
 =?us-ascii?Q?Ha47zKCM+hAbs+xCwylKYYej9lBoUuPHOpbmhcEGMsQ5sKA9ASX0Prye5XhW?=
 =?us-ascii?Q?oR757i4qmq/sMpxL4Kw1H7ddBmV62hU0lJePxFW0Q2EvgdaWyd9x6KNOfdkB?=
 =?us-ascii?Q?hqdmYimm2wOnnyW0J0s=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a45c235-987c-453a-b6f3-08db15b2b4ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 15:29:08.5919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U7lXaSJwHfmNLd4SlOP6XDO4zKvkLd9w/2ixbMSyhbYlzXeU75bC+oIuOIUU8R5MdxqWZIwewk/CqXFrQetb4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Public]

Hello,

A problem was found that a Wacom device's stylus battery showed up in GNOME=
 even though the stylus wasn't near by.
As part of discussing how to handle it Bastien proposes a new sysfs attribu=
te "proximity" to let userspace know this.

He asked[1] to start the discussion on Linux-input ML.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D217062#c7

Thanks,=
