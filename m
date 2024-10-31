Return-Path: <linux-input+bounces-7819-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A67D09B8490
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 21:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9ABD1C216A6
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 20:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7130E1A76D5;
	Thu, 31 Oct 2024 20:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b="lnRqlTAz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00154904.pphosted.com (mx0a-00154904.pphosted.com [148.163.133.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E591411EE;
	Thu, 31 Oct 2024 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.133.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730407558; cv=fail; b=l0olSmYEqfO3e6/CgMx5dnimxP6N3CEeYgANDkGeAAhsyyVE72pjtCTRrumKjnO/M2eaA7n3wDQdQ8vyYEefUiwxr0MuPE0qGFZNcWjIfr0ToAfDsBA3dq9Qvc43zl5UxBTlmKyvjETcOjdb+Mgj15pgm/EuUGPlp09Im1H1tso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730407558; c=relaxed/simple;
	bh=mXJ4BiQU6X07JZcXTLQo05C79CkKdgu0qRZ7+n8GevY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l5VLtALKzEagfCBUNEVIQ7piYoRoJn2wpYfn9B/eTUxYRKSPSiGkBewhv5rjBjIp7zrKB1HSIME2NwNxYzUNHga0g1F8y8m4AzP1EqugUlmsaRD1Iq9bAVZKid8wud96WPYeojcTsC0ge/6WTlcYfgpP7k6jfAuDHskryi9+1Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com; spf=pass smtp.mailfrom=dell.com; dkim=pass (2048-bit key) header.d=dell.com header.i=@dell.com header.b=lnRqlTAz; arc=fail smtp.client-ip=148.163.133.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dell.com
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
	by mx0a-00154904.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VDUcfs012556;
	Thu, 31 Oct 2024 12:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=smtpout1; bh=q
	pFxhnoB7hyUB9uGcF7sy/s08l1RGS7l6AM7u97jMlc=; b=lnRqlTAzh+K3nSUSf
	HJ8OsMY6P++d/bdu402rliQemPEbKwB8E5jPidOoH0XF/qs4b6myTYjYVLEyKOlg
	3ynNOdSdtXdqiy6Ldpp0QVleCDImvIXEl369Nq+ubDFRML7XU3JXiJb0v6Nors2V
	5gmij6ldcl9VweSP7wZWb7kvOZ8yxyJFTCDwaaEdrVVDmQ7c2N+CugkEIgsJlkaz
	UONCfiEjFdr2yzS/TTojYmu6zBO1QkEeTtvxlbN43h02+HKUGAKhB2AFrBzT0Vg4
	IP/0jEiDYXWTUsM8fKkh2WGzNmrYgZ375EJB6PpyxV9pof0eDejiqUUI4TPfNLyF
	0vy3w==
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
	by mx0a-00154904.pphosted.com (PPS) with ESMTPS id 42jwv7dy0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 12:27:03 -0400 (EDT)
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
	by mx0b-00154901.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49VFowkM035758;
	Thu, 31 Oct 2024 12:27:02 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0b-00154901.pphosted.com (PPS) with ESMTPS id 42kuw2wjee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 12:27:01 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIJRlcEqIPQLeVOjF8zDohctcZAnq8ZgrPkKOAj7mE80teuxnvckCya48ZBb17xflWtSwIkh7rPc/WAVqXAWfUTlTpC3KyGMWHzxUNrdTbffGDvSWvR8Z6+9bXS4CFmdd6Q9rkhcrOz21cgkeEsM6LR2+S61IMY50NYLjru0JPlrNM9ZnnoCS3gzHZIn3bMpmKkWEYGYZFMpGyigGyQX5EqMiYWyyIPva/Zo2j/PQHWA/MZvVaZNSoDAOI9QMPVOpdEOXPaJQmlTW/lTbkK5dBVnXqZdyOcj2cNa13oxmhhBIP1Flydug+TKLH2OYf27wGAoaz38/hzjFMImusjqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpFxhnoB7hyUB9uGcF7sy/s08l1RGS7l6AM7u97jMlc=;
 b=x2FzwIjvD35vdFcxGRQ4STY1XlZlHHWwTybaAE8EHZ1kszWAtrSJJeqbbn2PlLTpDZZJFboxhoI47y75aDtxm5qy7DHYCKnuC8On+GDwNojSqUFYhXZ1SrMP7CSooaWSzUMORvWpDY32CJ+8gf0vwmDdDGLa1Fu4ayBtDv3H7cqTWRz3EO4Od+ZOi7itnpvkqfn93A5AY5Vi/8b5zmfUBglLpc8760webHRcUxT1QZkcX/AP0TgoJjnJsfORzQTqQUJw3W/fKgQZtIhT30JnZnQSkT4xYTJPxlYWZkd8qI/sxLzuxIgCLuY8gJA+WPJ4rRRbewCCQ82YPYYLH7K+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from CY5PR19MB6147.namprd19.prod.outlook.com (2603:10b6:930:c::14)
 by PH7PR19MB7025.namprd19.prod.outlook.com (2603:10b6:510:204::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 16:26:57 +0000
Received: from CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743]) by CY5PR19MB6147.namprd19.prod.outlook.com
 ([fe80::d390:13bd:b078:f743%6]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 16:26:57 +0000
From: "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Jiri Kosina
	<jikos@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Benjamin Tissoires <bentiss@kernel.org>,
        "Kemp, Bryan"
	<Bryan.Kemp@dell.com>
Subject: RE: [PATCH v2 0/2] HID: i2c-hid: re-power-on quirk for QTEC kbrd
Thread-Topic: [PATCH v2 0/2] HID: i2c-hid: re-power-on quirk for QTEC kbrd
Thread-Index: AQHbK2dYVKT/BgUzOkmUXOtnw/HRbLKhC6Gg
Date: Thu, 31 Oct 2024 16:26:56 +0000
Message-ID:
 <CY5PR19MB614758F6060B4B07D06158D0BA552@CY5PR19MB6147.namprd19.prod.outlook.com>
References: <20241031073419.9189-1-alex.vinarskis@gmail.com>
In-Reply-To: <20241031073419.9189-1-alex.vinarskis@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ActionId=c013b248-8b0b-4194-8554-7f44d2bea28f;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_ContentBits=0;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Enabled=true;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Method=Standard;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_Name=No
 Protection (Label Only) - Internal
 Use;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SetDate=2024-10-31T16:23:28Z;MSIP_Label_73dd1fcc-24d7-4f55-9dc2-c1518f171327_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR19MB6147:EE_|PH7PR19MB7025:EE_
x-ms-office365-filtering-correlation-id: d6e08f8d-a0d8-4f5d-bfd9-08dcf9c8d6a9
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-7?B?ZlJkdFViV0xubVNZL05ucnRFTjNBNUdnT1VzU0t4QnA0a0xRNjF0VjMxWVR1?=
 =?utf-7?B?WGdFYmY3M0R2RDRaWEpPYkkxbjVycVhOWFNmeXdBL1NWQ0svN2taVmdTVWI5?=
 =?utf-7?B?WlRsMlliejhaczlnWWZ5bi9QZzMzNFFzbWI1M1NLUVR2MjRyekJiOE1FdXlW?=
 =?utf-7?B?ZGtwem4rLTdGRjRVNnlOTTl0eVg5NHdLR0VpeHcxdzBOKy1RaGtjaDhCRURE?=
 =?utf-7?B?UXRocVlpVXUrLVZFcVhsMEswUTlReDVVRVhPclVPbk91Ky1WbHl6R1dsbzlV?=
 =?utf-7?B?RjduenFJaklETjFsT2JNMCstNHNVbElKSDVqRmt5azg5YTA1ZzROM01RR2Fl?=
 =?utf-7?B?ekdTNkpGZEVjb2lOQjlJT2g4Q1VnYkN5c3pUVFJxQmlnUUNZUEU3N1kwRlZM?=
 =?utf-7?B?d1Zsc0NKaXNpTkIzSEpEUlg2aExldlF6aC9WNzhCeWJZMEYvYXk3d2JSZmFj?=
 =?utf-7?B?eDkrLWg2ZFpJdjlXbXZHRUY1YUxUbEpLUE5LazdiUld6Tmg4dFIyU0JSWjVz?=
 =?utf-7?B?NGtxN2JhNHZJckpGcW1HM0tobkN6Q2dQSUlHMTNUTVdNZWNiV25nUnJHbkNp?=
 =?utf-7?B?MEFXOFlzaCstdjBMZGI1ajJDNistQ0VKZVhhQWNOMVY3N2xEYjNDalUvN0c=?=
 =?utf-7?B?Ky1zY2VNSHRIQS9lYVVERGJnOVJHVUl6cCstZGY5QUxOOUZaMk8xWGRqckh2?=
 =?utf-7?B?b3p2aXZFaUZHV0swbU5aak96REliMW5MSm1ETm12dHA5RE1NS05wNlVYekJX?=
 =?utf-7?B?UFc4ZDF0WGQ3dlJKRi8ySjRQOTM1bmZzVUNCYkZzVUQ2dk5xVlhnb1VPaXY1?=
 =?utf-7?B?clFTTWhSZGRFNk5vV2w5VGtFQ2NJbWM3T0Q1a0dJKy1EUVFyM3cwU3A0Wjd5?=
 =?utf-7?B?SUVUSDY5V1FWM2h2ZWhLMWErLVFrVUgyZWRQcVVzWXkydFFyaFpkbXRsYUNX?=
 =?utf-7?B?WjJBVE12YUZ1ZkZVZkJsbHVZdE9DWW5ta3BZNHN1ajhPZFBoajdIRUYvUzdO?=
 =?utf-7?B?YlRWbmE5ci9SOW9rbFJ0YkVQM0JJOFNnMDI2QzJpd2VobklXSEpobnFFOWkv?=
 =?utf-7?B?TFFBeUczSlFQQnc5R2xpVlZRbi9vWEkwWFJIalRjMTZBUG9ubHRESXBJTW9x?=
 =?utf-7?B?Z3F3V1lhckZ6WGd6MDJmS2RkemxhTVlyN1Fzdnp1cE9id3NGUGVRYkd2SUZE?=
 =?utf-7?B?ajUyUWhMY3ZvMkpId25qMFhKSmFGdklvYWlabzl4TGVyTEh4SXRiVllXUFRT?=
 =?utf-7?B?THMvbDl4Wm1ZMjJ1VkNCODVYRHZmME5TSGVUcngwamNhbFcrLTFaOGw1dnRr?=
 =?utf-7?B?ZldzakhHZmU2bGJXN3JmYXNZKy1wblN2YWdFY0RQaUdWa1pGKy15NzlkTUgy?=
 =?utf-7?B?WTV0Ui9Qa0JabUtJOGdPRDlIcDlpVDBNeWQ1OEYzaVVYdHdWeERhOEk0cXZk?=
 =?utf-7?B?YzIwalZhWlU4UEtOTnNlYVMzKy1oRFNaTkFKZ1IzZjNqaVB6eDdtSHdTb011?=
 =?utf-7?B?M2tZL2wxdVhaRWVvdkNnejh3a3ExcEVCUndCaWRJVFU2eEM1YUZHVXpEb2h3?=
 =?utf-7?B?aXl2SzBGVDNTRlU3YW8vQ1MvelpKWDNlTzJKYXErLVQ1R3duSystQWZob2ds?=
 =?utf-7?B?ZmZmTDQ1SDlzcDdlSGlHNmkyRXA1b3BPdEJWeTg0QUdjemZmOXBQWWJXa2pX?=
 =?utf-7?B?WWkzZElwS3ExL015RGNuRDZMOTQxQ1c2YlZjU3V5QXNEUnpNYzhsckV5aWtE?=
 =?utf-7?B?SmdOT0p3OEdja1JNemRBZUkrLTBzT0pubHNoNEw5bWdjN0xJV1lLa2Y2S3E2?=
 =?utf-7?B?NGo2RnRRei9MRUFEZEQ=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR19MB6147.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-7?B?UlJESkhrTGxubmYzd1hOTFdnZ0E0QzFyc3VGd2dSRnFYNXRwSEptSlFsc3VM?=
 =?utf-7?B?Zng2Ky14YkNuL1JNT3Q3Y0Z2R0xvT2RTRWNxaEp4RXhyaVpRVE9RajM1UFp2?=
 =?utf-7?B?bGtzT0g4bFlQVG9RWDkyWlpCRXZYMnlxbmJsZlRIZjlDSnpUNlJMSnBpSnUw?=
 =?utf-7?B?anZRUUxGMFZ4LzBqa01udEx5T0MxNmlZNmFZd2kyNWRsOHdLVldaYzVmN1pU?=
 =?utf-7?B?YjYyZzNZKy11dnEyVVRIcktiUThFZlU2UlpENnNVejJuUmZBWUZsUEVSTHdQ?=
 =?utf-7?B?eWRmaDViZzlmWXlFa04vYm1VVlFTL2J5M251b0pvL21GKy04NUxWREM0Zi9z?=
 =?utf-7?B?ODdqaThCdWlQSDlaeERlUEVSKy1XNGZDZHFkOEdjUi9Ob2hYOWJRdWIydnIw?=
 =?utf-7?B?SmIxcnRjN2h2elF2THkrLUFDYndRWFlvV243eTZ1YktSQmJ3cEVPYUIzNWVW?=
 =?utf-7?B?eXJrRE5mWWtHN043eWFGalFWWUNXQXdOZHFvbWlnQ1lNcDducDZHTkhNM1ZS?=
 =?utf-7?B?Ky13WWFvUW9kQ0NmaE1WUDA4c1lldkJHbSstaVVHcmxPZVRCYlUvSUl6M29V?=
 =?utf-7?B?RExzVXJpcEI1Ky1jc2NrOXF0TWxDcm12ZnYyN3ZYMjZoR3hqL1FHZXljbHlI?=
 =?utf-7?B?dTF5Y3hFVnNNaXMrLUZiL3VZamE4VUxEVjE4ejFBOU5TN2RtdlNVUE9EVzJT?=
 =?utf-7?B?cVhnQW1LOVFzOFRzZklWSXJGaVFna2FzOUhmNWx5SkppeWdCV0llRGVuMDZo?=
 =?utf-7?B?eWtPUkpFQmFITXR1d1RjZWJwMzhBZTRvN3dpejExd3ovZVU1d1N1WXVxMVZu?=
 =?utf-7?B?UHZWWU91cngrLTlCRU1MemJQWGNhZFl6dFlWYVE0R1huTHZDelNhbDlJY05p?=
 =?utf-7?B?YTRyTEt4V0M1clR5QW45dU1VMTZmYng5b01CaldxVnVOUjdIMDBhdWo0WHdM?=
 =?utf-7?B?alFLN0tZRkRzY0pHaGNxanYrLXBiaUFlcVp6TTUrLU5QZTJ1a2xJQ0tvV2Nh?=
 =?utf-7?B?bHhSMzBQVHltV1lxNXlUVHhQQVYycHJ0VzRhRjFRUURJQkhuRGprL0dXakZ4?=
 =?utf-7?B?cHliVlpUYUUwNTA4SmF3Ky1ZNistWHpBTk13NXpFeGZzYWE1WjRSWFhod0E4?=
 =?utf-7?B?ZU1JT2NJdGFXRlVTUkJpWlJOTVJYMjlsKy16YkxxS2lKUlhET0NJdGZ5bzQ4?=
 =?utf-7?B?U2RjNFBjUXVIUTJuUkdLajdZWVp4ck5uM0xNNy9hVjFLc3lZR2pSWGtKVE81?=
 =?utf-7?B?TEt3SUF6Skh6ZEpaR1VYV0V3b0RRSmZzUWJKV3pWYTltZTRMdVU0TnBzNHZL?=
 =?utf-7?B?TUdsNkg3RXcwL2RYVzhKb3RmUjg4dzJIY0xYUEhmVEJLQ0dMVWtmL3Q3cVAv?=
 =?utf-7?B?NDR6VXhZZUE4OWpWR05kd2huOVZqczRGcWExcnZiR3QvTDU1L1J0Ky1tOGdM?=
 =?utf-7?B?YlN4YkcrLTd6MTZBV3JWSG53dDB1RHpyQldJMmlOcnMvOCstMFVNNjNXQVVv?=
 =?utf-7?B?ZU5tZXduM0JqS1krLTF6STRvczJ2WUczOVBHWUpHSWd0VFc3MWdNSGt0bEpv?=
 =?utf-7?B?NjRYRDVzQUlic0NWSGR6UnpSb1VyNHRYeVUvRisteU1OV216MFBwL1ViTFRn?=
 =?utf-7?B?RnhsWHRXMzYrLTNsTFJ5VHNBSGpVWVJacistb0JnY2gzeWFXWjRYZ3ZzZTk0?=
 =?utf-7?B?TThRcG5Sd0d5Tzh6N0dLWTRuSDVtV2JndXNHamRzYlhlVENVL3NUMmJ3MXZT?=
 =?utf-7?B?YnF0cTN3S01LNjgxM2dNblZ3ZzFrakdteSstdHhQeHE1ZkdQZ3k2ZlpPNTdE?=
 =?utf-7?B?dk1xNGtoTk5UaDI3dVJpM2k4OC9KNUYyaTlmcEpMRzZIMDhnUkx5L3Z0NUdy?=
 =?utf-7?B?ZDBNWGhLcVk3NVhySWJsM3hhNFZqTnBIUXRUZGdId3lFME50UFNYb1MzR0J5?=
 =?utf-7?B?YnJvYmo4VkR4NHJUeG5sWTJFNnlSNXh5V2JhSTJmdmExY0tJMGxKZE9BSGdu?=
 =?utf-7?B?eHNIQndTUEkwbkt6UXhleElSY2lkWFNCSkdVZDM2NDhhY0hId2d6UEh6cU1a?=
 =?utf-7?B?YTQvbkhkOERySzRNeTVnUFhRR2YvSnlxYjdmTmVGT2R6OEcvM3VHNlQweTM0?=
 =?utf-7?B?Z0hLME4xQ21xR2t1OVhFcmExTHNCVHhKL3RqcG5nSkdUQnNmNm55cVViZHpY?=
 =?utf-7?B?aUVP?=
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR19MB6147.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e08f8d-a0d8-4f5d-bfd9-08dcf9c8d6a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 16:26:56.9807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTkfyTIW+U+twa5MbwS4ZBKGbSOnSRHdX4+8wOukMiDOjnlRwjsUqcb869ue1/ZvZxTbBgXAWGkE4Nk5/086a8Pb8fl72JKBcA1Oq+MKJXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7025
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-27_02,2024-09-26_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=936 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310124
X-Proofpoint-ORIG-GUID: yAL_XSKwVHL3Sou8PYgcX6G_OG3le2rk
X-Proofpoint-GUID: yAL_XSKwVHL3Sou8PYgcX6G_OG3le2rk
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=895
 impostorscore=0 bulkscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310124




Internal Use - Confidential
+AD4- -----Original Message-----
+AD4- From: Aleksandrs Vinarskis +ADw-alex.vinarskis+AEA-gmail.com+AD4-
+AD4- Sent: Thursday, October 31, 2024 9:32 AM
+AD4-
+AD4- Resolve keyboard not working out of the box for Dell XPS 9345 13+ACI-
+AD4- codenamed 'tributo'. X1E80100-based laptop's initial support is curre=
ntly being
+AD4- upstreamed +AFs-1+AF0-.
+AD4-
+AD4- In present state, keyboard is succesfully initialized, however attemp=
t to type
+AD4- anything throws 'incomplete report' errors. When utilizing
+AD4- I2C+AF8-HID+AF8-QUIRK+AF8-BAD+AF8-INPUT+AF8-SIZE quirk the error is g=
one, however raw data
+AD4- coming from the keyboard is always the same, no matter the key presse=
d. Issue
+AD4- 'resolves' itself when suspending and resuming the device.
+AD4-
+AD4- It appears that calling power on command one more time after device
+AD4- initialization before finishing off the probing fixes this weird beha=
vior, and
+AD4- keyboard works right away.
+AD4-
+AD4- Introduce a new quirk for such behaviour, and enable it for particula=
r
+AD4- keyboard.
+AD4- Vendor is shown as 'QTEC', however device id is reported as 0000. Giv=
en that
+AD4- vendor was not present before, using HID+AF8-ANY+AF8-ID to match the =
device should
+AD4- be okay in this case.
+AD4-
+AD4- In v1 it was suggested to make a dedicated i2c-of-qtec driver, but I =
was not sure
+AD4- how to proceed at the time. I have now drafted a dedicated driver, an=
d it really
+AD4- is just probe method being extended to call powerup command again. Gi=
ven
+AD4- that a similarly 'ugly' quirk was just merged to i2c-hid-core.c for a=
 Goodix
+AD4- device +AFs-2+AF0-, and that (IMO) creating a dedicated driver for su=
ch a small change
+AD4- without any plan on extending it will be just polluting, I am asking =
you to
+AD4- consider this change again. Alternatively, if it is yet still strongl=
y preferred to
+AD4- have a dedicated driver to include this quirk, please let me know so =
I can
+AD4- proceed accordingly.
+AD4-
+AD4- --------

For the series:

Reviewed-by: Laurentiu Tudor +ADw-Laurentiu.Tudor1+AEA-dell.com+AD4-
Tested-by: Laurentiu Tudor +ADw-Laurentiu.Tudor1+AEA-dell.com+AD4-

---
Thanks +ACY- Best Regards, Laurentiu

+AD4- Changes to V1:
+AD4- +ACo- Rebase on top of latest linux-next
+AD4- +ACo- Update coverletter's reasoning and links
+AD4- +ACo- link:
+AD4- https://urldefense.com/v3/+AF8AXw-https://lore.kernel.org/all/2024092=
5100303.911
+AD4- 2-1-
+AD4- alex.vinarskis+AEA-gmail.com/+AF8AXwA7ACEAIQ-LpKI+ACE-hTYUmNdAbx06nnU=
3DlrMQn9PGzi4y9Ne
+AD4- SOTjPf2SPO67ore1XymZjywoQN19RvKaVHbNs5VLc9+AF8-77mwvQAT8em7dODeJ
+AD4- +ACQ- +AFs-lore+AFs-.+AF0-kernel+AFs-.+AF0-org+AF0-
+AD4-
+AD4- Aleksandrs Vinarskis (2):
+AD4-   HID: i2c-hid: introduce re-power-on quirk
+AD4-   HID: i2c-hid: introduce qtec vendor, enable re-power-on quirk
+AD4-
+AD4-  drivers/hid/hid-ids.h              +AHw-  2 +-+-
+AD4-  drivers/hid/i2c-hid/i2c-hid-core.c +AHw- 12 +-+-+-+-+-+-+-+-+-+-+--
+AD4-  2 files changed, 13 insertions(+-), 1 deletion(-)
+AD4-
+AD4- --
+AD4- 2.45.2


