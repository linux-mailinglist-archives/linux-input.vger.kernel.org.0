Return-Path: <linux-input+bounces-12487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B005ABEA13
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 04:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E96873ADC0C
	for <lists+linux-input@lfdr.de>; Wed, 21 May 2025 02:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09FF220681;
	Wed, 21 May 2025 02:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iGM8/VRs"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2043.outbound.protection.outlook.com [40.107.21.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970401632D7;
	Wed, 21 May 2025 02:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795991; cv=fail; b=u9+Eo1epoOxIyI+bgWNi76MiOZLppKuemfSRX1wka5+fIlEpM1jUieC2KS+FBtqY28NGB9aq7yjsKrhFJHMkheTLz8ptNvFnEv2j10IbXWraZcDNIxWxLQf9zMyzKtl79ogx/kRxlJgLpmVqBEXlkhLkfrzbAk46NIj/yLiiOVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795991; c=relaxed/simple;
	bh=5NMH7jqp7w1l18vYSd4aLc5ElOsCSBnb/CR4KYrIIHw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=llT8lPK79f88sVt6irF0SctovDrl4MQEB4OxkKIOyZjQxJsVj1fM2KszJqxZGEFL6Zaq4fXaFc9V0nL8pr894RnulUL2g8Q3EzDuizBTLwaRzLFRHY4fRh8mlMoiHrMuiSFf0NrLKnyjhBk6aEYQl3WP/h7Z7fv7PnGJOF/+1BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iGM8/VRs; arc=fail smtp.client-ip=40.107.21.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERrQldUqW6rzYyBlxy3nem9FQl9AknrrxG/C+MjvhKSwP6aKbGHLpK2i1QxTRxeKVnQ9rmw4aalz1tYRNll7J/k7Q3/1RoDa60McmGpDZnYO+morkSVcGRBTFuVdn5i6+ZDPg6E+q1sNac309GaW8d8hTUoxVd4Dr8LRvw2t58Gw3vDPlz1DbiTzMDsQaFmQ2nKM7/7Q8uTLCdg9GkZnDr0uLQ6nR1sP7X79t1uWtZR51fwgWpTpYPf+gcm9zmubBc0lcgcgCmXgDAdTi/zino1QIelqNdW6j5211kz0neqs8k9SZBojL1l63EEZrMJj1md8q9Ol7qn7FpiJsX+lHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NMH7jqp7w1l18vYSd4aLc5ElOsCSBnb/CR4KYrIIHw=;
 b=XucsRkQt3yQpOLLZSuJ/F7Z5iWiyNKWlnEMA+bjIphBO9Aos7wzy7t+LltzAQSejw8pbzTFW9LZRJkdsppVYKBHwAtkth+cuhXDBle9dHgcJyAcMNIYUg5KLI3lOZHSht44lT49aV2JBFCAMMYUzobYA0eT1LhxMpRg/r88aPGYRonl/wvBWERcsuvUQ6DpPLoMy+w869Umb+qX84N+D02nRnNdZsFzhQtDz4hUXgZ53ahvMAqtWFOT/Gxob9HNsDOQJkW+/q0hn4Xg8UJfjlS+6J5PforKyY/2RRPpH1Fn4wTDdQgImxrV9SxiYRosFp4G2oQVvT5/9djK1Zq/Tlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NMH7jqp7w1l18vYSd4aLc5ElOsCSBnb/CR4KYrIIHw=;
 b=iGM8/VRsZb+rWm8QSa2G+U7Xm2b8XSk1MdBi0+YZis2HavXhygQ064L3GzXCRhrlrhGLttzxdSSg1KqNFeKqcLdfllbFFvfoLsi+tztnFxVjhesLX7tWsaqCf1qBVpPV+Gr8FePmyj5F7MuVGc7aD4uF7UABEawe/FD9G83jHWc29wpgXKbhUFzscyCNlRcP8af/1XchgG3WTpL2mMvW3sP4doSpdLTcSgitMIbcGQU+9TRCqyzZ1P44sQxcwVoLlVcIPkmkVb0KeP5mKWT277ibAm6PwER2E+2Q6v80gRBo23OmxAv73M39AxlmcztxqSkBnp2LkIv4pZ4KQQFVIw==
Received: from DB8PR04MB6939.eurprd04.prod.outlook.com (2603:10a6:10:11d::8)
 by PA2PR04MB10312.eurprd04.prod.outlook.com (2603:10a6:102:414::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 02:53:06 +0000
Received: from DB8PR04MB6939.eurprd04.prod.outlook.com
 ([fe80::cfc9:8c5b:b1ae:59c2]) by DB8PR04MB6939.eurprd04.prod.outlook.com
 ([fe80::cfc9:8c5b:b1ae:59c2%4]) with mapi id 15.20.8722.027; Wed, 21 May 2025
 02:53:06 +0000
From: Joseph Guo <qijian.guo@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	"open list:GOODIX TOUCHSCREEN" <linux-input@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject:
 =?gb2312?B?u9i4tDogW0VYVF0gUmU6IFtQQVRDSF0gaW5wdXQ6IGdvb2RpeDogYWRkIHBv?=
 =?gb2312?Q?ll_mode_for_goodix_touchscreen?=
Thread-Topic: [EXT] Re: [PATCH] input: goodix: add poll mode for goodix
 touchscreen
Thread-Index: AQHbyJwhnx/iWHPL5UuSZe7czBuDT7PaI16AgAJByUA=
Date: Wed, 21 May 2025 02:53:06 +0000
Message-ID:
 <DB8PR04MB6939C50490CA40E037A8857C949EA@DB8PR04MB6939.eurprd04.prod.outlook.com>
References: <20250519085744.3116042-1-qijian.guo@nxp.com>
 <t6umftlzqhpiwtq3oi2xgtmmvxc7o4ab2bjxqywvwrp25jpi5a@vlryb74pcvxi>
In-Reply-To: <t6umftlzqhpiwtq3oi2xgtmmvxc7o4ab2bjxqywvwrp25jpi5a@vlryb74pcvxi>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB6939:EE_|PA2PR04MB10312:EE_
x-ms-office365-filtering-correlation-id: 3b39a1bb-f7fd-40ff-32f3-08dd98129d0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?dW1HQUJmQ0xMVWNGb2NHVUdaSEtHeGhoYTdqenJ5MmFjWlpFZGJCUW94SmNK?=
 =?gb2312?B?MVdkTUdTVHNvaHVad1dKbGd3S2hEczZqMnhUcno3TGMyaWdpQ2hOOHp6TTJG?=
 =?gb2312?B?ZE1vbmp2QmswVnJzNXFjQVVnSVpXUTRTRnlJQ2NqdnRWZDh2SjBDUTg0MHF6?=
 =?gb2312?B?MjJSRFR0NmFMcjIzN1ZIWHEreFZpVFpLV1pHQ3ZyaVhxRW1nNS9JRFRrc0dL?=
 =?gb2312?B?c0FBNkhLNWxvbkpOQ3FSRWIwV213bWlKN0E4blo1ZGJmM0czUVVJOTdUQjFF?=
 =?gb2312?B?ZWJkdlFJWmVRdEtDU21hVWF3RjRsYWRLdXZ2a2d6R1B1cmt2M3ZXTjNhUFZ2?=
 =?gb2312?B?cDBHSkRvbGV6YTlHSFM5Y0pCZ1lUT3BOMXRrRXhCM2ZDNnF5ejZxRmpLN1g3?=
 =?gb2312?B?TndETEhVQVQ4cktuN2lBcW9CWEFHWEwveUIyWUpaRVNObWIvT1UweDJNZEhK?=
 =?gb2312?B?RXh4dy9BZm1PM0QwN2M1dWpTaU03MHg2dHhrTGwyd3BLdmYwZXVlbG9DSGFx?=
 =?gb2312?B?aDlLTks3QnRyTWVrbjJmcjhRTXBIV21KYUdSZVNoUUo5MGtCVjErUjNSVU9p?=
 =?gb2312?B?MHJqTkczdWdrdnExUm9BMkkzWnBCTEhJbkUxUk5XQzNqT3ZWUDRiTWJ0OWF3?=
 =?gb2312?B?UkkwT3lXZHZzWnFFQlIrT0pESGc4VktsWjczdGhCMFA3dGg3b1Q2TysvOEkr?=
 =?gb2312?B?TGcwMGpLanlKVzlLVFVqaklPMHFNd2l2d0ZDRDlUMGEzYlhxZ3Z6MjRIL3Ro?=
 =?gb2312?B?NTJSNzI4OUtEcEZqaWVSNkF3NkZZcDNCd1VIenlPSDlDR1pmVjliM040TmJT?=
 =?gb2312?B?ZHJHTUxtY2h6dnozVzhMMFdYWUNsT2o2bUNZVzdPWTg0RFp6NVplYjVjUlpt?=
 =?gb2312?B?UlRnT05nbG5heXBjZ2xTU01aYjZDbkJjdnZUSXRSMldKMnJ0M3BGWmdEdit6?=
 =?gb2312?B?aXZLQW94ZmQ0RlRaYUJlMkI2R1ZGazNzYjduSGxjQkVObmRCN2N3VXh2VG1O?=
 =?gb2312?B?VksyczZ0cFJoUzBTWFVWS3NSSENweDFkU3ZLTnV6dnBCZHNJVEZ4VDNWazBy?=
 =?gb2312?B?Q1ZYVGduMVV1ci9xaUdFUUN0V3M5cVNxbkhCOS9tVkdjSUhleTk1d0hSRU93?=
 =?gb2312?B?ZGFSTm42NUd6MDQwL0E5MStBaFI0TGlyV2t1TTFBU2xFN3ZrRm9BTFkrOVdp?=
 =?gb2312?B?SmNjSDZmN3I3WEZyL2lQUmtodWxzeUxEYnRVSXZhb0lobjZ3SDZROHN6TERh?=
 =?gb2312?B?MG16bEhPU0NqMk1vQmFjWXJ2YStzdUQ5ZEVRdjRraStZdDB6L0RZZmlCWi9T?=
 =?gb2312?B?QmV2bTVGS0duNlRmdG5XajVRMUpMVW13UUtFcDRBdjk5a2tSU1BzbS9vT2Jl?=
 =?gb2312?B?Y3ByYTJmWG1wTHdKWGF6L0tJcUJNSDFHS0FQQnhsUnJVdUYyR0xZNmw1dm9s?=
 =?gb2312?B?QmprQmlOeTBIRVcvQTRNbFU2YVZFU0d6cC9ReWlzbFh6akZkeVA3dDRMTFQz?=
 =?gb2312?B?Vld6VUdQRHpCT2dvL01BcEl1Wm9manBKTDNwYkE2TTFTWlg1Qnp5dGJRci9Y?=
 =?gb2312?B?RUd0ak5mRGtWWS9nRlNQTmtUK3RqSFg3eHMxK3JwNHNrRUhJdGgvN1NIMnd4?=
 =?gb2312?B?aG11cktzMi9MdVdJc2c4ZmoweTlFQ2VnNSt0ai9qeDhjbS9GM1hTS1dRa0NN?=
 =?gb2312?B?NmNzQlNHdHA2cTNjOS9rT0tFRm9jaGNZSXYzcWlGUjRtRG9iNXpJQjg0NHhT?=
 =?gb2312?B?RWMzRnJRS3FURUFSWFBEcHUwSlcwWWYxQlpiV3E1UEZmTTR4bHBYd3QyTGtM?=
 =?gb2312?B?T0lDWjVCNTJMQ2JMbHI1bDNkS1R0ZHRjcmFZVDdSMi9ER0NjVm9qeVVEVnNq?=
 =?gb2312?B?bVJ1K0Z0NHBaQktpbzNHdFFPTzFXRVBkNVFrUjBhaG5jWCsrdTBseE9jMmky?=
 =?gb2312?B?OGNqYU9vb3gwaDBxUnZLU090WUtRNnQxMkltNlBRQTJNYlBDT1Y2eml0NlRG?=
 =?gb2312?B?QUZQWDdHWVRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6939.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?M3dPaWdNV0J4WWMxT0FVdlNlQm5TZlJ1eE00NGhBWk9mK1B5MzFPS2VERVp0?=
 =?gb2312?B?RjFiWk0vNjZvbm9UTVFSVFJIa0w2UDQrbll6NEU1MGpSakh0bTJXQTUyRmJr?=
 =?gb2312?B?WHQ3UytzTndIVUFYZ0wybXBMWlRQd0ZRWC85LytFZnNDK3Rpblc0TjNrVHFE?=
 =?gb2312?B?UFBhaEtNbmxXZE5jYi9IcHgwTzFkL21XYThMUzVnaE03Tkw5UTlQd2RaK09V?=
 =?gb2312?B?WkVIc2xISVQ1algyVDhXZ1R2Z3ZsaHhZQTJTb0JDTTBqSDF2VHgzSU5LbEdw?=
 =?gb2312?B?WC9Ed05Fd0R1MHkrRzBTandDU0dtYytta3NqMTBzdmJ6RllKRTk3enFZSytm?=
 =?gb2312?B?Nmt5M1lYQXJBekdldHZUZm1QMzd4MGVma0NFbzUzTldRYkV4Nnp3cVhzMnFH?=
 =?gb2312?B?U1g5TWpCdi9iZVN5eExybjFKcTJhQjFrSGlDM0ZISlB1L1RtQnZNeUFWUnkv?=
 =?gb2312?B?M1JvdVNRMGVJRWpvNElkbVhBbCtQUlg0M3BYc2N1Y3BwYklEYTRXaUpPSXpP?=
 =?gb2312?B?SEJKakZYejR4MllVSlJmaHdSbUcyN1lZNHZTM3ozWjB1UVNabjgvZTFzZ0Ez?=
 =?gb2312?B?UlhpOW0wdkJjOEIxYnB2dU16VG4vZG9YVk9PMk5KTzFTUk42WVJpYU5IRFYx?=
 =?gb2312?B?Z0dCYWhOWWxmTzZ0eDJJdk83Q0JpWUFyanpGM1BMakhsSDAxY0FoRnJSUzhn?=
 =?gb2312?B?dnRLY20vR2ZJanh6cks1VWhjZmFTM3p0WXJFNUc0UEFzV3NHZ2x0cFNybmFz?=
 =?gb2312?B?YU5xaDV0dFhkekRsYUk2NTFjYTA2YWdvMCtaUUY1dlljajVLV0krWUNYUWVp?=
 =?gb2312?B?TzBHMXVrK25lR0VEOXVySHBwY2RWSXVZTjNOV2dYNk4wMG4rL0M5VlBWRXpv?=
 =?gb2312?B?aG41czNGNlNncDhQRG5hUkhKNzhEMkhDVW5sZGpaL1BwcnM0UVNJUEh5RE5S?=
 =?gb2312?B?WTUyMTBEKy9PMTZqcmdPV2I2MzBHVm82NXAycjRFOTBKSmRRZW1Md0FkTDVU?=
 =?gb2312?B?c2NLTExWUlhMQ2ZCV1I0TTNaSTFSb25Eb2oxU000MEZrOTRISXU5Z1FmeWNB?=
 =?gb2312?B?dW9udkxIVVpiVnc1V21rK0dmRU40MGMyb2w4bzlXK2d1c1E4a0c4S1pISnNF?=
 =?gb2312?B?V09ld2xIWkRKNFBXdzNxS3BtYmlXNnZZQXVpZ3VPSHRqQkczSHkwMlZmY2d4?=
 =?gb2312?B?Y1lYZm5uT1NCLy9MWTFQSG1aQ2FIOGVFY056WnprMEJkaStNUnhVOW5HR2Ra?=
 =?gb2312?B?R0QwanVybTZWb05CVG9HMkJ5c0p3a2pMc3BXdExqbnQxSklxRUlyaGdpTjFL?=
 =?gb2312?B?UTIxZmtyV1YrdlZvVjV3UXRUd1Y0d21JZmFOb1RTcjNjVm0rNEFhd09iTFFS?=
 =?gb2312?B?KzdvZnM0bzN5cjBaQXhQbjl0RlJ2V1ZLb2VwdG83Tk9zME5ySk9TWXpRRzJm?=
 =?gb2312?B?Zm9nUFRCS2lkc1E5ckEyalliYkxPclowbDRxa014eTUrdHkxNmdSVFhaVWhN?=
 =?gb2312?B?Y09kYzBBM21VTVdORzdlM1pzbzNsWVdUOXRqUUtjS3lHV2Zyc1NRZDFDN0VY?=
 =?gb2312?B?MkJlZ1h2SVpvVkZSazkvNHBnQ1VOeFlNeXA4OGVVVU9BVGIvNElGM3JLMjNI?=
 =?gb2312?B?TjM0b3NHZUFKWHJ5SGQ1QzJmSHByY0h3VHhwY2NGTHpaODNHUHZpbmVPUWwv?=
 =?gb2312?B?bEZTT3dxS3o3dEgyRTBnd1JqZ0xWRXlyYzJ3dEtKQjlzc3R1S3lBeUlaTlY2?=
 =?gb2312?B?bGRRSFQxMGEwZndoeUV6Y0ZWTDBldUJ6UmZRQmRWZERndW9mamRiZnpaZVgw?=
 =?gb2312?B?aHBKeXZSS3NWcUl0bVpTSmVmaytnbkhHdkF2YmdGNmZaUHJhSENESU9HQ25H?=
 =?gb2312?B?VmNLL2NISi9LcXV1Z0xzRGszUGF3Uy9LdFkwa3M2a0c4Q3RRVkRWc1pJVzVu?=
 =?gb2312?B?QzBnNkE2ejltU2FIVjd1RXVpU3RBQ2VZZmhyNzBSMVQ3M1NZSnU0TFhudTRz?=
 =?gb2312?B?MU1lZUIzTUJVR2ZYOTR0RmJUKzJHbzZIK3BpRUlUT0EzMEhVbi9NdURJZ1FE?=
 =?gb2312?B?SHV6bll4UGVuS25COG5xcm4wRDhyVm45NFBoRVdTOEEzbFA2bVlvaDgrZm9i?=
 =?gb2312?Q?bHSA=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b39a1bb-f7fd-40ff-32f3-08dd98129d0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 02:53:06.7796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XRKlQ3aEnr1CuU2duQinj9zNd/y7DKH9Z3+XdIwAp7vmnfKW+4jrdPdDIIqFh1kCwktwvj0ILsIdsFuq4gh0Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10312

SGkgRG1pdHJ5LA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCkkgZGlkbid0IG5vdGljZSB0
aGVyZSBpcyBwb2xsaW5nIGluZnJhc3RydWN0dXJlIGJlZm9yZS4gVGhhbmtzIGZvciB0aGUgcmVt
aW5kLiBJIGFscmVhZHkgY2hhbmdlIHRvIHVzZSBwb2xsaW5nIGluZnJhc3RydWN0dXJlIGluIHYy
Lg0KDQpCZXN0IFJlZ2FyZHMuDQpKb3NlcGgNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6
IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4gDQq3osvNyrG85Dog
VHVlc2RheSwgTWF5IDIwLCAyMDI1IDEyOjIzIEFNDQrK1bz+yMs6IEpvc2VwaCBHdW8gPHFpamlh
bi5ndW9AbnhwLmNvbT4NCrOty806IEJhc3RpZW4gTm9jZXJhIDxoYWRlc3NAaGFkZXNzLm5ldD47
IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+OyBvcGVuIGxpc3Q6R09PRElYIFRP
VUNIU0NSRUVOIDxsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuIGxpc3QgPGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQrW98ziOiBbRVhUXSBSZTogW1BBVENIXSBpbnB1dDog
Z29vZGl4OiBhZGQgcG9sbCBtb2RlIGZvciBnb29kaXggdG91Y2hzY3JlZW4NCg0KW1lvdSBkb24n
dCBvZnRlbiBnZXQgZW1haWwgZnJvbSBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tLiBMZWFybiB3
aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklk
ZW50aWZpY2F0aW9uIF0NCg0KQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxl
YXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yIG9wZW5pbmcgYXR0YWNobWVudHMu
IFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlz
IGVtYWlsJyBidXR0b24NCg0KDQpIaSBKb3NlcGgsDQoNCk9uIE1vbiwgTWF5IDE5LCAyMDI1IGF0
IDA1OjU3OjQzUE0gKzA5MDAsIEpvc2VwaCBHdW8gd3JvdGU6DQo+IGdvb2RpeCB0b3VjaHNjcmVl
biBvbmx5IHN1cHBvcnQgaW50ZXJydXB0IG1vZGUgYnkgZGVmYXVsdC4NCj4gU29tZSBwYW5lbHMg
bGlrZSB3YXZlc2hhcmUgcGFuZWwgd2hpY2ggaXMgd2lkZWx5IHVzZWQgb24gcmFzcGViZXJyeSBw
aSANCj4gZG9uJ3QgaGF2ZSBpbnRlcnJ1cHQgcGlucyBhbmQgb25seSB3b3JrIG9uIGkyYyBwb2xs
IG1vZGUuDQo+IFRoZSB3YXZlc2hhcmUgcGFuZWwgN2luY2ggcGFuZWwgdXNlIGdvb2RpeCBndDkx
MSB0b3VjaHNjcmVlbiBjaGlwLg0KPg0KPiBVcGRhdGUgZ29vZGl4IHRvdWNoc2NyZWVuIHRvIHN1
cHBvcnQgYm90aCBpbnRlcnJ1cHQgYW5kIHBvbGwgbW9kZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTog
Sm9zZXBoIEd1byA8cWlqaWFuLmd1b0BueHAuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaW5wdXQv
dG91Y2hzY3JlZW4vZ29vZGl4LmMgfCA2OSANCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5oIHwgIA0KPiA0ICsrDQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDY3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+DQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2dvb2RpeC5jIA0KPiBiL2RyaXZl
cnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4LmMNCj4gaW5kZXggYWFmNzlhYzUwMDA0Li44Nzk5
MWI1NjQ5NGQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4vZ29vZGl4
LmMNCj4gKysrIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9nb29kaXguYw0KPiBAQCAtNDcs
NiArNDcsNyBAQA0KPiAgI2RlZmluZSBSRVNPTFVUSU9OX0xPQyAgICAgICAgICAgICAgIDENCj4g
ICNkZWZpbmUgTUFYX0NPTlRBQ1RTX0xPQyAgICAgNQ0KPiAgI2RlZmluZSBUUklHR0VSX0xPQyAg
ICAgICAgICA2DQo+ICsjZGVmaW5lIFBPTExfSU5URVJWQUxfTVMgICAgICAgICAgICAgMTcgICAg
ICAvKiAxN21zID0gNjBmcHMgKi8NCj4NCj4gIC8qIE91ciBzcGVjaWFsIGhhbmRsaW5nIGZvciBH
UElPIGFjY2Vzc2VzIHRocm91Z2ggQUNQSSBpcyB4ODYgDQo+IHNwZWNpZmljICovICAjaWYgZGVm
aW5lZCBDT05GSUdfWDg2ICYmIGRlZmluZWQgQ09ORklHX0FDUEkgQEAgLTQ5Nyw2IA0KPiArNDk4
LDIzIEBAIHN0YXRpYyB2b2lkIGdvb2RpeF9wcm9jZXNzX2V2ZW50cyhzdHJ1Y3QgZ29vZGl4X3Rz
X2RhdGEgKnRzKQ0KPiAgICAgICBpbnB1dF9zeW5jKHRzLT5pbnB1dF9kZXYpOw0KPiAgfQ0KPg0K
PiArc3RhdGljIHZvaWQgZ29vZGl4X3RzX2lycV9wb2xsX3RpbWVyKHN0cnVjdCB0aW1lcl9saXN0
ICp0KSB7DQo+ICsgICAgIHN0cnVjdCBnb29kaXhfdHNfZGF0YSAqdHMgPSBmcm9tX3RpbWVyKHRz
LCB0LCB0aW1lcik7DQo+ICsNCj4gKyAgICAgc2NoZWR1bGVfd29yaygmdHMtPndvcmtfaTJjX3Bv
bGwpOw0KPiArICAgICBtb2RfdGltZXIoJnRzLT50aW1lciwgamlmZmllcyArIA0KPiArbXNlY3Nf
dG9famlmZmllcyhQT0xMX0lOVEVSVkFMX01TKSk7DQo+ICt9DQoNCldoeSBhcmUgeW91IG5vdCBz
dWluZyB0aGUgZXhpc3RpbmcgcG9sbGluZyBpbmZyYXN0cnVjdHVyZSAoaW5wdXRfc2V0dXBfcG9s
bGluZygpKT8NCg0KVGhhbmtzLg0KDQotLQ0KRG1pdHJ5DQo=

