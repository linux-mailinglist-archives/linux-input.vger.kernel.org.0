Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58335A1DBB
	for <lists+linux-input@lfdr.de>; Fri, 26 Aug 2022 02:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235785AbiHZAj4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Aug 2022 20:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiHZAjy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Aug 2022 20:39:54 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA57512D00
        for <linux-input@vger.kernel.org>; Thu, 25 Aug 2022 17:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661474390; x=1693010390;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d/+7ll2ZDE1Gr45lBvEPNnwZGU8Dko9s0nVW54pqu3o=;
  b=JJzViu9kS41PHAjauXY4e4eDxsZ380ujIL44SP6Vx87OZVi0byTyDbVV
   o91l9h1Tnp9r4HXPd5vOcwqZM4zVFufEs5FNENUqy/6SBegvcRQ/Eg9nZ
   6oao6cFmsHawyNkIjcRi6G4VD0SVBWoc77ZDSeDeHYxgKDpzQiansWQod
   XvrRq7C+8Mx6NPR3E+H6HjUq1LWcwZ/Vv6xGKTP0Q5VSDPlckUyquxNNr
   jWF+V1rLZ+IvA/IIi4YI2DvcZ9ywbgfrELxN7CzhYZ/rB6YDHIB6CAMWp
   vZyNXG+efwNnrvzNKVXflqoA42yRhFDaFEqlw+E4AF0EdNteLpzjPVkWK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="291971330"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="291971330"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 17:39:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; 
   d="scan'208";a="671240456"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2022 17:39:46 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 25 Aug 2022 17:39:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 25 Aug 2022 17:39:46 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 25 Aug 2022 17:39:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iOy+czjf9y+uFTt9LJEKsTeppkCFvPCx9AZNyFxq6ipmELKgCEeT3+LSB2ujw/cMDioiNLiBAmc05kiHstEMbv1KLKyGekaU8vli15Iws1mwel7WAN/++rG1Y7VWonR1uLKw0rUTDq0TykJNOFMlQfYnycQ70ngItpfnjl9fvNjPIFhYt5y24MztPHRrRqtV5TySyLQXe1/2vfqiu3tODTgSgUaQ0ZQAD16VFls1xkBsMO+3yaT9K5Znuv8abUseR9HY4g5VnuccR6cOmiRV/m2lnFCfcMvDFnG6UwNyWO+xkN538Cl3QzifYd2xQA+/RbJLKh6e0brJ3bDTBI8eog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/+7ll2ZDE1Gr45lBvEPNnwZGU8Dko9s0nVW54pqu3o=;
 b=nZywaF2tnnAu9s7+IY4pXkcKKoTyZIQLmYnGvGtia9KeTngp0DHE6jFo2zhsRVzQNpBQUqmsaKvE24NfkNU4DwX7UH2sBMLFXRvwtGGShq6OnM2sZIt8EGLQ/WoTqThVdTyMGtm79TkdQb22v5KR28aQb3U1CY+U6GLku54HgOQY00RY5coGi93ds31j99W3MKjEGnwbLtXrfN68u+LiLfBMmWHt+xHW+EwOZw0ddtwVvQV4ObKgiXUYsPMzz32rto+X4dnK9TCMQR2JsyMo46M09U5pPB0JzTEcVPp6LK2FOl2FzWjb/yj1bznW7nVqwRox/K0SSXOudC95oUn3gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2618.namprd11.prod.outlook.com (2603:10b6:5:c0::30) by
 PH7PR11MB7052.namprd11.prod.outlook.com (2603:10b6:510:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 00:39:44 +0000
Received: from DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::3807:da:c431:a4e0]) by DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::3807:da:c431:a4e0%7]) with mapi id 15.20.5546.022; Fri, 26 Aug 2022
 00:39:44 +0000
From:   "Xu, Even" <even.xu@intel.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] hid: intel-ish-hid: ishtp: Fix ishtp client sending
 disordered message
Thread-Topic: [PATCH] hid: intel-ish-hid: ishtp: Fix ishtp client sending
 disordered message
Thread-Index: AQHYp515J+fepnWDtke788E5KPG8Fq2/fQmAgAD8O4A=
Date:   Fri, 26 Aug 2022 00:39:44 +0000
Message-ID: <DM6PR11MB2618133B2DF1A9B20D5C3AA9F4759@DM6PR11MB2618.namprd11.prod.outlook.com>
References: <1659574759-30159-1-git-send-email-even.xu@intel.com>
 <nycvar.YFH.7.76.2208251135480.19850@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2208251135480.19850@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f128cef7-e280-4ca2-629d-08da86fb7883
x-ms-traffictypediagnostic: PH7PR11MB7052:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HUwmBp44WQqNRs7DqI2rPxK0zWNAwrGBwkHtETxHD0CXnoVg22J9Dt+G9He/CIyAlyfMpo40Py57J+bdxpAZU/zxmpUYN6OKz7fpfiOrhoPvGXKeQ6+w3LTa2karBlD0VI6HqvMfxWDsG6+/xLNpqCsjh4eVX3PPTEvBWQWIPEJFRCrtXJfomqBXxaqFoH3Ivx3YjtAYUPyV1sosXVRnCIJ1CQ9vJOPaaXqJ/vVLxdNuZUXmnB6siWAXhADcJsRe/29r8fqtHCMogN1hgQBhpV6DpbOSXye0mV+Oi6+h+27WgVAI0b2QO+bidIk5wuSqtU496yRRupK3odygso+/oyqFd/LmD3M6eQVSsxQVfLmLlpRNK0SrfZYowM9kCkDig6i2vFHQEm7PO8k5NJTx1Dd5HmILHmL2VZTe9ZkpKhJXmsoaeHS7fF3ipngkvnBlHdeNw7OatWfeqBptfbawEXhrVwuhR5CydMwsgFDVLrQQUToKl1U9pzTh9HUuiYFx0pNBKw40/dgp6vMYei5aISoaqZJD0sXUXqVEBF1PpNIdGN4YYUefFiEbhcRY8s6IJGjO2CrK1X9pN6PXS47b4f1s9EMa6JRQDbt2IvEYdSBYRVRFKB9/RIQdq/VBAjYF/SZpQspNyGYluwdX+Io0dmTZwrU/0155TXBFMRY13M57YXMcOfcqEldteJ1rwc4qkBIO63crFVxnPgN/O5EvvWff9rkYCvIQJfdb27zgx6KGpfwGpbNhkybcLo48PKDFYXvuCVNyaHosIAQkeEgFDQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2618.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(396003)(136003)(346002)(376002)(6506007)(83380400001)(2906002)(53546011)(9686003)(26005)(7696005)(33656002)(186003)(82960400001)(86362001)(38070700005)(38100700002)(122000001)(41300700001)(71200400001)(54906003)(6916009)(52536014)(316002)(8936002)(5660300002)(478600001)(66946007)(15650500001)(4326008)(8676002)(64756008)(66446008)(66556008)(66476007)(76116006)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y3CUKY/G7DKCE5S7M/U5LDY03vnvkfGZ2/70U9SNw/sMpDr10NgpUnHsoRV5?=
 =?us-ascii?Q?oR175wG9/bjV2Ac9h9T8hPstaGZe+r/TaIVfFCb6vyoYmxnD/kjeb5LRZOIg?=
 =?us-ascii?Q?dkpdK4zATXLD/39RlhWKSGjgWCEvs+obeGbnbz0KGelq/w4CJLRmU48KE4LR?=
 =?us-ascii?Q?axXPfqGTuOKVBiHP37OkUYaJD7pIK9JSJ83QKyaTR9qMvWuWRlx3TSqpqAU0?=
 =?us-ascii?Q?HnSlXxeNoZZ461uZ/Q6uZBmL88vDqUOTi/ji2HDx1hd+Hjpy5I/DkRrv98oN?=
 =?us-ascii?Q?+3niDbu2JGUpSnBNptLJSG5glQ2o2otHpzgGaX7+RYzuuCSHNu7xzSgre1Ia?=
 =?us-ascii?Q?ynDTvhbYBoxkdFT4nWjuEQ9TrD9VueX4FnqktC7X/uFSOmj/anx1O46C21lb?=
 =?us-ascii?Q?ujxxo3qXCjMwh9xUVLSfMkREkFBo23bv5nEaJIfu5zn+xktPUwaQR9k98kcL?=
 =?us-ascii?Q?27QMfRswjyr9Qy2wcj1vDiLHpJwzh/jZEA5cL1z24ZmLBgvPFRwrJ8oEnRxq?=
 =?us-ascii?Q?8vihx8XmZ30xr9c9t0aLS56No5ii+cBJnbmjAqUElzlgBSB9rFXZDb6YNqv7?=
 =?us-ascii?Q?fcT86KspMPU7SvxpDi7vhhr+gLQuKFkU9ZtxShP1CjpbNSlBcZa/5BX3+adI?=
 =?us-ascii?Q?E5VJej2XfXmctyIT1CuAklrb76mnjRCA2ojUyvTYOdkvpFBtOcZ2T0lalKL8?=
 =?us-ascii?Q?LCj0ECiAEVmIGK06itkfmUxT7pWTRBwUlkvGIecDKvJZRe8rCaHiDT2vRJIp?=
 =?us-ascii?Q?hoQPDkIZuFIetMG9nrQuVr88N1s1vH1KtVmNz2sRMcoHQXHRB5Kzvpqpm0FJ?=
 =?us-ascii?Q?G5nKODQo3WdDEy7kLis4iXU3Ldsd9MoW4WyAdJVhHmNTd7k302mGfuD66GuF?=
 =?us-ascii?Q?Yz8ZulT0N452KiWioRPTrpoSnPs8OILYn91oPoCSrkDsiDUqvraAePKY1Yn0?=
 =?us-ascii?Q?48gX7UEw8c4KX14qsjx5UaJnA0yHwNZWT0m1brWN82+FU/fjAbtX1ru82sqQ?=
 =?us-ascii?Q?7vVN+t0x/0ziWjkTF+m8oujR+Iivw9chK+cRLOe+9oUFtfO6P831Yvom8dPE?=
 =?us-ascii?Q?NPxg9w8TWwqM7mBIW3TKq48VarpXhI2Nk3saF1pKRVxLII58R0bk6x/LP0X3?=
 =?us-ascii?Q?pnawZ9aU2vHbf92K5rTtm/DlcGz6QsuxuYDzoveSFZmHkXjHQgV4hhhq4QlB?=
 =?us-ascii?Q?eVWde5vVEjk83wM+09+zRCu2p+h6n1lZSAKC/WGITPpZxiieAkR/jWE7uqV7?=
 =?us-ascii?Q?fHniWabP0XCqSKpcOYE+W6m/+x/XwS5ZVE/3bbxZ3bneKNFUGL9XzCUL8Kty?=
 =?us-ascii?Q?kou5em7/6qGjMeeyjFV5YpzJxHBIOqOelKpaZUvxW9hFihCcUuwcD7ckmrc3?=
 =?us-ascii?Q?Y0yhTiwlhxfJCqhUwjR0vVFR5/g08GtGojvEAAB6eTIn6hkP8rJBbBSM8H0D?=
 =?us-ascii?Q?qlDyFFydHhAEtzdfq/Tl3TnUKiiAbawQ/KhLh/pte2xO3D4lQPu62Zn6cbBz?=
 =?us-ascii?Q?7wYpSSBIvTqEtcEvRFwuFBm9MdscVo9Vc2nIfGpVJcp3+wOThTsRX8hL83ZI?=
 =?us-ascii?Q?xbGMtSsxfY5oa7+6P04VSVcqwAsIqSj+c40WLhCG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2618.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f128cef7-e280-4ca2-629d-08da86fb7883
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2022 00:39:44.2979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m1/sEv9HY3l7DT1gnw6NRTbnMuWropeb7wCuVa2Q1+PHIcmZYidrWpqnsvrX28WXzcor51OxpMeEAMKEOBww1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7052
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Jiri!

Best Regards,
Even Xu

-----Original Message-----
From: Jiri Kosina <jikos@kernel.org>=20
Sent: Thursday, August 25, 2022 5:36 PM
To: Xu, Even <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com; benjamin.tissoires@redhat.com; lin=
ux-input@vger.kernel.org
Subject: Re: [PATCH] hid: intel-ish-hid: ishtp: Fix ishtp client sending di=
sordered message

On Thu, 4 Aug 2022, Even Xu wrote:

> There is a timing issue captured during ishtp client sending stress tests=
.
> It was observed during stress tests that ISH firmware is getting out=20
> of ordered messages. This is a rare scenario as the current set of ISH=20
> client drivers don't send much data to firmware. But this may not be=20
> the case going forward.
>=20
> When message size is bigger than IPC MTU, ishtp splits the message=20
> into fragments and uses serialized async method to send message fragments=
.
> The call stack:
> ishtp_cl_send_msg_ipc->ipc_tx_callback(first fregment)->=20
> ishtp_send_msg(with callback)->write_ipc_to_queue->=20
> write_ipc_from_queue->callback->ipc_tx_callback(next fregment)......
>=20
> When an ipc write complete interrupt is received, driver also calls=20
> write_ipc_from_queue->ipc_tx_callback in ISR to start sending of next fra=
gment.
>=20
> Through ipc_tx_callback uses spin_lock to protect message splitting,=20
> as the serialized sending method will call back to ipc_tx_callback=20
> again, so it doesn't put sending under spin_lock, it causes driver=20
> cannot guarantee all fragments be sent in order.
>=20
> Considering this scenario:
> ipc_tx_callback just finished a fragment splitting, and not call=20
> ishtp_send_msg yet, there is a write complete interrupt happens, then=20
> ISR->write_ipc_from_queue
> ->ipc_tx_callback->ishtp_send_msg->write_ipc_to_queue......
>=20
> Because ISR has higher exec priority than normal thread, this causes=20
> the new fragment be sent out before previous fragment. This disordered=20
> message causes invalid message to firmware.

I can imagine that this must have been nightmare to debug :)

> The solution is, to send fragments synchronously: Use=20
> ishtp_write_message writing fragments into tx queue directly one by=20
> one, instead of ishtp_send_msg only writing one fragment with=20
> completion callback. As no completion callback be used, so change=20
> ipc_tx_callback to ipc_tx_send.

Applied, thank you.

--
Jiri Kosina
SUSE Labs

