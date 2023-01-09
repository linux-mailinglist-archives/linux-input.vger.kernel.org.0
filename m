Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79DFE661BB3
	for <lists+linux-input@lfdr.de>; Mon,  9 Jan 2023 02:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjAIBAM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Jan 2023 20:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjAIBAL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 8 Jan 2023 20:00:11 -0500
Received: from CO1PR02CU002-vft-obe.outbound.protection.outlook.com (mail-westus2azolkn19010003.outbound.protection.outlook.com [52.103.10.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2782E0EF
        for <linux-input@vger.kernel.org>; Sun,  8 Jan 2023 17:00:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8xgI0o2li8+hpgR7jP2y1VUshNTyszL9c+Dj55mvEScwCRyN6AsFOJ7MgHQXHzp18c/h9JBErVHpComYw1Qe13XNcs05I8bk9owvzBu21Qwu58Wfc8CTd9hYKLLQKzUjKHZGeGUfg0kI+Vw5IExqCBFGJhki4w9F9gUjxW1VWa2qhQ7q4m8hVIyA/4e1ilGcIgMUs7IO1AV+Jfa+PT8hBJ35BORDN/9eAmJ3p4xQYmDDVC+natsCtnVjbo/fggY90Pf0nKV3ny7JLUR6KC+zjq1U/7Q79c/+aj1Bx50Yt1ETUMHqiuIeZZb422/mTIr9KUpOSNKU07PbkvM+YTyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iB6dc9f+Ip6Dz1D6eZQL6c7mzKUvmQohkBkYnZe1Kvc=;
 b=DRnqkgXen6GxgooMI0z4xmP3LEyU9vak5PXOcS1wzGnFyZpIP6BFBC5ZouWDS4AnHn7XGsXj04Z1elLKSwLXozKeDhIrU6xE9YqHRkP4WUy4JyBJ2hiHg9u9PtOOjn3Qa8zdPxevkIJe5UvujNnO/KL7SFYB41Llnbx50RwiExYN6oGnIpyVkgc5U4lZ8O5Uc/D2Sd/yiBDvNbBCPbE+Nwsw0Bu4w+XQIUNi9pOy/aZujLN9rwRJXF4tXmLEGQKayXs4T184hagxUZd+pA9rgv45o4S9uJr/5lDlDwJpi9BwJFsMzEMMIhQjKML+RAJxmvD9txvKWmM76d8/SGT2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iB6dc9f+Ip6Dz1D6eZQL6c7mzKUvmQohkBkYnZe1Kvc=;
 b=Ce4F1IBD5KARDu5AluRg1Dduj5keG6xuXTWfzSo94yY16p40H0A+nyhUNkbJC/3BqLHERDKEzwaAJp01m9GXLIcq1wWlYwV5z9tadkppsYOtlRX3gQJuI3q2+CSWonGIf3fFcRgi6GklTr9qPXZsp12z79Om8u0PLIizcyP7pd9A3JKV+sH6wkDMGN83hotxSt1N2OEowlWZ5f17LcKsnQv//j3b7ntY3UNLY04jupXWpDc9D3SfFxl0p6IXteXJbxWY1TmSgTZWj771FQJKZkW2wgffk+gk8gSK29QPXkr6zyjyABX0MNofR3cPsaq3Y/T3ERDgBxGAzttC35NH1A==
Received: from BYAPR05MB4855.namprd05.prod.outlook.com (2603:10b6:a03:4f::26)
 by BN8PR05MB6547.namprd05.prod.outlook.com (2603:10b6:408:52::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 01:00:09 +0000
Received: from BYAPR05MB4855.namprd05.prod.outlook.com
 ([fe80::6e35:ee2f:8d5b:e602]) by BYAPR05MB4855.namprd05.prod.outlook.com
 ([fe80::6e35:ee2f:8d5b:e602%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 01:00:09 +0000
From:   Vanduir Volpato Maia <jackmcslay@hotmail.com>
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [HID] Fixing support for USB joystick Hat
Thread-Topic: [HID] Fixing support for USB joystick Hat
Thread-Index: AQHZI7C1CVF3iToXMEi8urhfOlgl+q6VMgWvgAAQ5U0=
Date:   Mon, 9 Jan 2023 01:00:09 +0000
Message-ID: <BYAPR05MB48557C0D6BAB6ABF2C464DC4C5FE9@BYAPR05MB4855.namprd05.prod.outlook.com>
References: <BYAPR05MB4855BAFFBAB3618D2E7A4418C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
 <BYAPR05MB48556359FC6E116CE9D63696C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
In-Reply-To: <BYAPR05MB48556359FC6E116CE9D63696C5F99@BYAPR05MB4855.namprd05.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [u6zl/sgoDsRVWTnkN6BdJjYQF/5PyKUc]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR05MB4855:EE_|BN8PR05MB6547:EE_
x-ms-office365-filtering-correlation-id: 6f060dcd-f919-4776-202d-08daf1dcdad8
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yPxb/uEeUowPCeWHjDjh8218VSoa7yIyC7Sijma16zQrA21bC5DSrdUvk4zcoXzH4T0HfuIF2mkJ3MCQ3LIAuDL8SSJZcGf5WVd8pTFc6yQLrPfzV8viLaKZqwOseiAaqfthsVtBfnaEOehKV7KLknZBp/McxktB8jcw7KtaCbPbov8lmtNO5T4p4nt8lTX/ixavkoIWLucp0/XtAimhUPRp8s4pmVnl0R97ktn4tTkvhEVfhBxPuj8/Q49hKwQLCAQYgrQSj0wpK0E6GgVHhtaQlsvsI130bzPds/mTJHtm6GtwtmqcWHd95yxKtO2h78vwge8X/AjMz4ufYoPJB92mkavyGsN67VUy0eHCraVY60iT7MbaHm2aj9+oo+paJcb2GxI96bWhOzfj/Q6fAAztjniiBQtroVBGAErJPOeALre4c0yVW3N8sSVQR+1NT8mP0yoXUEaw9hQi8cqeY0SL8RzrJfHt/tK+gQfq2RmZuuIC+LgYXPdw2CaMOwn1VuUWaAAiZ60lmcOz4XtCM/k1bQKS+QAqoBFwuCuCoI62mv1K3mAoHnCVxSjlF129XlM0oHReFEXgLlzeRM+zC+8kXCsVds+J9ha8xMD+DH+Jiu9MP/tMIvclP6hY+DlPviDztdGARzDJd3EQwcDwJg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjlkczVXL0NYMnVhOHFSeFR2WnhDTXpKZGhzazBSd0NKalZ2SDFtYnlQU2cr?=
 =?utf-8?B?Mm1aUm9JdGNzbW9QZ3V4aUR3dDFqNGhkNFBDc3YxdjE4cXI0ejJDR01mQ3hG?=
 =?utf-8?B?Q2VTRHNmUS8xdUVMR09KMTNrU3NSNU5raXVSZ3Q1dEU3THl0RWdiQmtaeGgr?=
 =?utf-8?B?c2FKUVdQTXdmOXRKK0E3UmM5WUN0SEZOOEVMa1Rtb0tGNitZOEs0bEdDaHRn?=
 =?utf-8?B?cGFZVGh3NGkvdjlvYkV6ZVBsdE1vYStlS3RkTHVwdFVSeFgwOWhzQlgwWHpP?=
 =?utf-8?B?eWdTSGQzejBoOE9DTmFKSmVESGJyVmNpVmtkK0dicE5PWFhlZjM5OXp6NStF?=
 =?utf-8?B?ZzBneHQxRzJ2ZGxndDlJYUUrREIwVVg1NkZ1V2loU1NvdXhKb3orYjRmU1lj?=
 =?utf-8?B?TFFsMEx1YnZWT1RTNTY3cnRXTFMxZUVQQ0ZQOG5vWDIzM21ZcXoxVXJLL3cv?=
 =?utf-8?B?VnRNMStReVBEdmd3OHNTVVE5SG92OVBlcmFSNkNYSVhSajkxYWxsRG8vSWZV?=
 =?utf-8?B?SGozVzB3SVZrWVkrVzcyaDhyWkwxZ3ZiNk53NmdrTlB6OXZNSVpwTis2NEpT?=
 =?utf-8?B?TTE2SE1wdCs0RWRpVFd3emg4KzlFaXMwNTBxa0hRaEt4UGkrNHA2N0ZnMzRJ?=
 =?utf-8?B?UWpoUUFxc01nTEZMVUcrSEtxbjFxbk9nQ05SU0FjTjhrRXlnT2FIVDN1VmZY?=
 =?utf-8?B?SXhkZU9yNDBjUXk4NUhRQXhIZzNYditJWitodURQT0xtWkVIeVFXeHdYbGdh?=
 =?utf-8?B?K0VGV1hsQ001OGk1YzFWdUhrRkthSmovbndtRnhvWmJCcnFxUngvZmxqSU1K?=
 =?utf-8?B?eG4rZUxyMjZPR2RmcFNyWTIwZitzQmsrRDN0aWJjRFF5V3NYNlBZWEdYSy8x?=
 =?utf-8?B?UWZuSzJ4Y1ZsbndFbkRIVjFzS0dRbEVCcVJ5WWNMT3hPclI5Ny9CVXFaeWRv?=
 =?utf-8?B?RFVkay9UM0JqZ0NIbU90dG5BaGVVYU5rMm5ESEhyNFd5MkVjc0J1OWtob1dj?=
 =?utf-8?B?R1kzTEZzMmoxQjd2RTNmTUdFVFRKNE9CbmM3eTYyZUFIM1RiZG1XWU5pMHFV?=
 =?utf-8?B?OU8wL2FOV1h1RkVoSmttVFF5QlBGZW4yN3Fid0JCd0o0bVBJZ1BpK1h3dFN2?=
 =?utf-8?B?UmJ5SEZCUzlVTHorL0xxTk5WOG0wL21wUy93TnBLZjFjYWExZDlCaFpvVkUy?=
 =?utf-8?B?elhKWmFzZURLWG1XTU9nM2JuS04yMy9zVjFmeTg5SXpxbjhLRHVIR1A5bGpJ?=
 =?utf-8?B?U0lHY2RNYzVUOU1LTmZaSmlNU3lFYUwyeW8vM2pYM2UxNGlLc0JNZ0ZTcGRy?=
 =?utf-8?B?a2xCV3hwSEg3WFdrSFBUZ05uY1ZBd2hCa1dqVFdEWW9lUVhYY1NiWkVuZERo?=
 =?utf-8?B?MFVHK0hhc1R3eUZOS2pac1hqRUhTOXVweWNFd3habERjaHRTUEpmK1A2MXZL?=
 =?utf-8?B?TFQxU1AwR1ZoUVBvRWU3d3I3TkhVVHNOc3ZkQ0pPdGtxYTdkbVMxaHVoUjRO?=
 =?utf-8?B?WjdNL0h1SHgyT2VJV0g2akxPVEhvS1RTNjBQcEoxOFhwS2FraitkOFFvN2JG?=
 =?utf-8?B?ZVNXSFkzNzZZdGQzVE1JVkxiSk1ROWUrSlhDSG92YytBeTFWcTlWSjJodFM3?=
 =?utf-8?B?YXhuVXZCTDkxTnVIQ2Q0T2hrZjVmTDZSRnBxa3V5V1o4UjV0TzVOSGw3RGkv?=
 =?utf-8?B?SWszbHBmMVJQbDJ3M2tDZmJqQmc4aHR2SktYQXdnV2dBdG1JT3BXQWZnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4823-7-msonline-outlook-84f76.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB4855.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f060dcd-f919-4776-202d-08daf1dcdad8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 01:00:09.2886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR05MB6547
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Q29ycmVjdGluZyBteXNlbGYsIHRoZSBoYXQgcmVwb3J0cyBhIHdob2xlIGJ5dGUsIHdpdGggdGhl
IGRpcmVjdGlvbnMgYXMgZm9sbG93czoKaWRsZQkweEYwCiDihpEJMHgwMArihpLihpEJMHgxRQri
hpIJMHgzQwrihpLihpMJMHg1QQog4oaTCTB4NzgK4oaQ4oaTCTB4OTYKIOKGkAkweEI0CuKGkOKG
kQkweEQyCkFwcGFyZW50bHkgaXQgcmVwb3J0cyB3aXRoIGEgaGlnaGVyIHJlc29sdXRpb24gdGhh
biBub3JtYWwuIEkgZ3Vlc3MgdGhhdCBtYWtlcyB0aGUgZHJpdmVyIHRoaW5rIGl0J3MgYW4gQXhp
cz8KCgoKRGU6IFZhbmR1aXIgVm9scGF0byBNYWlhIDxqYWNrbWNzbGF5QGhvdG1haWwuY29tPgpF
bnZpYWRvOiBkb21pbmdvLCA4IGRlIGphbmVpcm8gZGUgMjAyMyAyMDo1NgpQYXJhOiBsaW51eC1p
bnB1dEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZz4KQXNzdW50
bzogW0hJRF0gRml4aW5nIHN1cHBvcnQgZm9yIFVTQiBqb3lzdGljayBIYXQgCsKgCkkgaGF2ZSBi
b3VnaHQgYSBGbGFzaGZpcmUgQ29icmEgVjYgYW5kIGl0IHR1cm5zIG91dCB0aGUgaGF0IGRvZXMg
bm90IHdvcmsgcHJvcGVybHkgdW5kZXIgbGludXguIFRoZSBoYXQgcmVwb3J0cyBhcyBpZiBpdCdz
IGEgc2luZ2xlIGF4aXMgdGhhdCByZW1haW5zIGF0IGEgZ2l2ZW4gdmFsdWUgZGVwZW5kaW5nIG9u
IHRoZSBkaXJlY3Rpb24gSSBwcmVzcywgd2l0aCBIYXQwWSBiZWluZyBtaXNzaW5nLiBJJ3ZlIGlu
dmVzdGlnYXRlZCB0aGUgSS9PIG9mIHRoZSBqb3lzdGljayB3aXRoIFdpcmVzaGFyayBhbmQgd29y
a2VkIG91dCB0aGUgb3V0cHV0IGZyb20gdGhlIGpveXN0aWNrIGZvciBlYWNoIGhhdCBkaXJlY3Rp
b246IAp1cDogMHg4IAp1cC1yaWdodDogMHhDIApyaWdodDogMHg0IApkb3duLXJpZ2h0OiAweDUg
CmRvd246IDB4MSAKZG93bi1sZWZ0OiAweDMKbGVmdDogMHgyCnVwLWxlZnQ6IDB4QSAKaWRsZTog
MHgwCldoaWNoIHNlZW1zIGNvbXBsZXRlbHkgZGlmZmVyZW50IGZyb20gZXZlcnkgb3RoZXIgVVNC
IGpveXN0aWNrIEkndmUgdHJpZWQgdGhhdCBzZWVtcyB0byBnbyBmcm9tIDB4MCB0byAweDcgd2l0
aCAweEYgYmVpbmcgaWRsZS4gCgpDYW4gc29tZW9uZSBwb2ludCBtZSB3aGVyZSBkbyBJIGxvb2sg
YXQgdGhlIHNvdXJjZSB0byB0cnkgdG8gZml4Pw==
