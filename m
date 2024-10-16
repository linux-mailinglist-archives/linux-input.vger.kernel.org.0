Return-Path: <linux-input+bounces-7476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F9499FFE9
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 06:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73301C24427
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 04:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AF818BB89;
	Wed, 16 Oct 2024 04:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="jf2RBX6B"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2099.outbound.protection.outlook.com [40.107.104.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB618A93F;
	Wed, 16 Oct 2024 04:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729051381; cv=fail; b=uQ/PY4Q0Saby45GWDLFu1D9NO47d0hY3XYS6m31qDRkoO3zmzYM8V9mN4tC+QAik9UdehZ4BZidUlsxa0B/mMqmW/gPm1kf6+eCHf3cT8S6hQ2mglrHwAKsp8vrJH/ncGz3b2ac5a5sB4Sw9LjeJfOhOkIvKow7kPVN+jlvcfJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729051381; c=relaxed/simple;
	bh=XWHXrVKqE2CO9WPWm0JSgomvOBlZ7nKTdoLdXMwhYpk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C4RXWm3WkRt8hRiGJkyQG6b03TkXWCHdrC5D75HNfSvvYlz/9akx5fHYC9Imvui9HxnEPBFTVqe6ERSDgbuGgL3PipvcjMYRrsPvU4RgyNxJ6HCeJZUb06IyrLcFR3GJ0AhU+SAQzB4AdeIVjPTY//54EoqmvFAU95xxTZoVcVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=jf2RBX6B; arc=fail smtp.client-ip=40.107.104.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SefXL8PbzSJGaEcsJyLW/nOx2c0rK3o1l+3qYa+tr2RO/vqqHDnVm4FMne5J2LsLK+Ccf12Zt25uATW6voOoJnROuHJBCIenEvy5AVVodTXJ81/5JgwCx6BMfaSp8DkucaDqffFBx59ObrBbuXq4VuyYkB/OTjfZZJwHuntybUyFfgNWObhTK6KeOvJGnx1FQK7c1F2Xyp+uCtPEA4bG1yVkl0xD87wZ7+nshMAUoSALOmQv/4hM8q6nbfVXol05yVL8W6eM62L+KRHMmNElxegSzTnGx9J13agxKl9HQCmooD6AdDUsNjL3+6CbSXaiZQMXfaRD4aA9U4lZ+JRw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMAGtTuTnOUoFkDvbGTrc/5C9LZDKdMlTNViTlbiSRQ=;
 b=ZlYlwRhA5CBmXd+Caz5IKQY9rO5ddLjJ4DDvSu0MP6NsGsfZha2ZeiR0BjcB6aRxyRjcdU1nGL1csshz3zAaRYJmbC3mdfJ4YkMta3caOwzn31vkljGQvgEhPMXqHukAeNs2snyZdJrF7Elxx1fjRfTatjvd7EqeVuaM3lBQIHcXl77/rhzCkvS+wMzNjW4WaIXDaaMId0WmjgtEfJe7i6SqGE4z6KD5cE1znLyfczljNZWpH0URvIGtSOdGd021QawLs/wI3VkT3j8P5EFisU2xVZiG/I1CA1pSsuGNipCixC4ObOZhtqhxp8cu2+2CZAJPw4tUaqeXQgOCdNcNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMAGtTuTnOUoFkDvbGTrc/5C9LZDKdMlTNViTlbiSRQ=;
 b=jf2RBX6BHtDskvUB84e/9hSOUaVFCe27VjQBmAPeeT2q1OFHTeeGxZSjfo7aFsQsqTm76mH+gg8M7qtRLx/kXtEpMSlHcDjN7V6TspMCu2sw+RVIm0xUgO05QnRYxGUjhJHKoAqLyyk6Z2Dm+BqjDeuZbGxWb/GA/u3QuI7vaHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by PAWPR08MB10183.eurprd08.prod.outlook.com (2603:10a6:102:368::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 04:02:51 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 04:02:51 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 16 Oct 2024 06:02:42 +0200
Subject: [PATCH v11 3/4] dt-bindings: input: touchscreen: st1232: add
 touch-overlay example
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-feature-ts_virtobj_patch-v11-3-b292a1bbb0a1@wolfvision.net>
References: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
In-Reply-To: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>, 
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729051368; l=2517;
 i=javier.carrasco@wolfvision.net; s=20240617; h=from:subject:message-id;
 bh=XWHXrVKqE2CO9WPWm0JSgomvOBlZ7nKTdoLdXMwhYpk=;
 b=ZDQYS1QI2o5Q8E4/PyNeXvhlm9If7BAMd/TUA+C7PmIhqysNISDC1G1uIyi5U32OzS+Uzm+nk
 eMFaSVC7kOYA3U6IrYf5eXe2myZnGrjFuOE5+SNibonzNpotXgobvWK
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=hfASRUP6l4lf3Lo2mjLM085/h37dT3m0Qj1HejXDPDc=
X-ClientProxiedBy: VI1PR07CA0154.eurprd07.prod.outlook.com
 (2603:10a6:802:16::41) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|PAWPR08MB10183:EE_
X-MS-Office365-Filtering-Correlation-Id: ffe7a1a6-adb2-452e-d2ef-08dced9767b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2xQdXF1MWZ3dWVBK05zVFhuclpzZEFoc1RNV2UwR3A1UTUzY2ZpM1lFeGF6?=
 =?utf-8?B?U3RqcW95bitUTDNrQlhqM3lJTkJJSjRJYUx4OGVERTRNOGFxUnJtR2RlZW81?=
 =?utf-8?B?dFo4TVJRNnRnakV3ZzNkN00xSStmbTRUTE0yTXlRRG5RcmRodHBhNGxDR2pi?=
 =?utf-8?B?RlE0VHlTUE1XSUEzQW02MmRrY1FhL0Q0bEJNVmE4bzliL0RlcURrYUFYL1Rq?=
 =?utf-8?B?NWlKV20vWkI0SmRuVkNVMFFEeEx5emY0aGw5Q2lCZHc2VFV6bnUwb0dyQyt3?=
 =?utf-8?B?Tm1VVEdIRkpXa3MvRVhtVloxdVRtRnBlV1ExVXRlY3dMYXhqN1oyVWcyNEpB?=
 =?utf-8?B?R2VsT1FuM2VWM2tQaEZpV0c1bVI1aEppSnFNTlpQazA5WmhVRDJJT3R6WE01?=
 =?utf-8?B?ZDdSMEp5YUFTRmIzek9lQVlIRng0bmorZGU4WUFTRE9QbkUzb1FNUHdkdkln?=
 =?utf-8?B?bkhlNTRjdTRiYm5iVnBIY3lFWDQ3akdTclluTjIvSTBHN2h2K0RHQlNPUzhM?=
 =?utf-8?B?UWFEczZ4aVRGOTdsWmRoaU1lUGRKcWhIN3JxQVdneVZBbHFnaFduL3NHUXRk?=
 =?utf-8?B?U3NKOUVSa2ovd1FHNCt6SzNUc1VkMUpyVmVNL1ZjMU5mSW1zVUphU3lROW0y?=
 =?utf-8?B?Q3ZzQ0RvSVM1aEFWN1p2UHBtbHVxSUlEY1d5aW5ibVhSYi9oMkpudzBjQm5Z?=
 =?utf-8?B?anpLalo4bStZbXZZM2gxUDRIbW9jMmxEQ1lvM21qOGVnRFkvL0ExcTN3WjdM?=
 =?utf-8?B?S3hndnNadUd2ZDZCZWIzblZxK3MyQVp3QjBzZnZKOUt4VEhlNXJUSlpWT1hy?=
 =?utf-8?B?QzkrT3lEZG90UG9JMGVjRktBQVJaN2RQdnRCUTZ3ZTh4QTNuSFVnYzZSdUcw?=
 =?utf-8?B?aGhJVkNzK3U4Uldqa0NvS25iMUJiNk12bCtnL2UyK0FZS2Z2ZVJMSG5SREtF?=
 =?utf-8?B?Tksxd3BFVmVCQzUzVGM2ajV1Ym50QVEvbVFJdzdJWXJaMmZ1Qk10OTNScTJL?=
 =?utf-8?B?REJpQjRKMktpRTlsb2svSkNlV0ltalVVTk5aMkdYMm4zVVJxRWMra0lxUllx?=
 =?utf-8?B?RGhTTWV4M2xkTHJkc3FFQzByWW5wYVl6TWV4eDgxS0ZiTk9kSm4wUmUzQjV0?=
 =?utf-8?B?ZzRUNTYvMlFuN0FLMkN1cnBGd2c1NEM3WHR2MlRRejg5RHFNcFdwaWpDRmZ4?=
 =?utf-8?B?aEgwSFRGR1czRlB5TFVhNHJ1QjYwWUx5cEQrWmFYMEIyRVcrOUFzYTV4Qmpo?=
 =?utf-8?B?WStQb1R4aFg4dFFTdU1WckRUZmg1N0E2WVJlZHkwTEN0VDYwRG0wMndUckhW?=
 =?utf-8?B?OHR3YnVISDN0R0lwTzl6OGlyWFlFREg4YzNUTUU4MkxuUVdGakNBWnU3TkNm?=
 =?utf-8?B?NnBlZXVwSkEyUFMrV3d5NVU4NnEvTSsrb24vekFBdG9BREtZUC9sMmFzVkJx?=
 =?utf-8?B?emVLRlJUOGk5UFFqaGZKMGgvcnBSaEV1YkpmTnZlaVdqbm90QXZqVjBCR0FL?=
 =?utf-8?B?OGJNQlRQMnEwWTBWdVN6RlQ4Z1AxVE8wdjhmQ0gzTnVyN3hUTDFBUmxrSmk5?=
 =?utf-8?B?NS94TmFtR0NBWXIxTXRJWXNjbWdZbjdmSHhKWGFGcGFSa2Rnb3pReGxhU1VB?=
 =?utf-8?B?WWdnM0JpK1JacFdnUXB2Q2crMmtPeW5YZU9mSW1ON2E0VG9Yek9tcS9JQUhQ?=
 =?utf-8?B?cHc0Mmt3TkhXV3VleWtQM1pGMk55NDJoZnVKVTBlaWpRZktNemlqZ0JCNUZP?=
 =?utf-8?B?ZWg1QlJNazlORmZiZU5LNHRlV0hvUmlIU1FWU2orNGhYZzhTTk1CYkN3bloz?=
 =?utf-8?B?VGpvR2FYc2VsT3BLbDBIZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGF0VkYrdStpRngwZTJHNzhqZnFqYnNxY1krN3VUVUxBaXRBMnN3VzA4SVJT?=
 =?utf-8?B?WDM1MmxmMTBvcmE4elBYcFB3d09IdnhESURDbU9kZGxJLzhvWkRYbno4cVRS?=
 =?utf-8?B?aTNyeFI1YW51d0o1YlhjN1pHU3hGZTViUzYyRnNUSms4eTNpT3ZvUzBNZHJk?=
 =?utf-8?B?b09JVjNWRGJmb0JHVjBHdFc1TDN5NUlvbWdRdkQyKzdDYWRWUW1SN2xMTWxx?=
 =?utf-8?B?UFUxRTAwNS9aN1FWWFgwTGxVY1VvdkE0NlpVbGpFYyt5UGhPai9lNVBIYTQ0?=
 =?utf-8?B?RHIrR0VvME52V0NxU09GaGZtcUxOZ1krTGtGRkczelpncUFjSitQMXVEbjla?=
 =?utf-8?B?cmZEYnhnVStyZ3lBYnJFZko2bWQ4K0lYdmtkQ1ZTQzg3Smsvby82S3lJenpB?=
 =?utf-8?B?ckZiZFhxSFBWUmtTNTZhVDMxY0NVRFAvRGRtZk4vWmpibGptSDdxZU5hU3VJ?=
 =?utf-8?B?SWphNjE0ZTV0Qnh3QXBhbEkvZzMzN1JrcjdVaExlOHFzSlVsQzZ5Z05uZUVG?=
 =?utf-8?B?ZVV1STg0aHdaa0VjMEFTYlcrby82NE1kdVFUczlCTUI2WWk5WjZrYVA1UlNS?=
 =?utf-8?B?enZtYk9vL3dWUnhWelBMVGIyaWtBM3l6b2w5cjJ6OHdNVjhwVWNUVzVEdjg4?=
 =?utf-8?B?eU1lcUR4cWNRRWIrL3FIdCtNNzQvOW5CSzdjVkEzRHkyS2VsZVdvRUdydGU5?=
 =?utf-8?B?NjZybXBibnRoaERSM0FXN211SjJhY2E2RW9NWThrdU9ORjdUYXVWODVwNTNM?=
 =?utf-8?B?L0I5QmtLekFpQ1RzNVJBK0FiS2RzUFFBNmFtSnI1N1N6WHFleHpZdUFQWG8x?=
 =?utf-8?B?bkFXUE5tSUczTjNnU2R0UCtZaXRlRkc5YjA5NGdlK2ZaelBkejh6dURmempo?=
 =?utf-8?B?TWF5QmlRajcxMnBMclR0c0xaazMybndkS0hoeVNETzAwd3g2T2d2ckw1VG10?=
 =?utf-8?B?dE5TZHR4ZFVnZ1h4WFN4ajNscmwxeGxwbGZSYXUvZjVXKy9yNnBERVAxL28w?=
 =?utf-8?B?MUY3ZXRnam9mV21MenNQbVBxK2E4TlgrMnh5Z3dGSG1XMnhLRUQ0Vk85dVpi?=
 =?utf-8?B?WmlWRzloOFN2MEhoSGtKV00xWTVHbXpUbVl0UkV1SEhicDNYUG5wMTFMbVNv?=
 =?utf-8?B?b2Y5RzVlWHFnZDRqY0U3Um1RQVhIYndBNlF3cDNsUFZ0TzBBSHVUaVFGWklG?=
 =?utf-8?B?MDR4VnB3RWVmaUVNczhjM3hiR3NtYkxYRGdaOTFiUW1NNnp1SXphOXBJMUpq?=
 =?utf-8?B?OSsrZHlJZXlFYmZ0c0hJblovRk5SL0pGRUlOeHJwcm9sa2dSV0JDczhIZFQ0?=
 =?utf-8?B?cGFVQ3FocldUMU41SjVndHpDZHVTOUJqcnhkaGh1ZXZqV054RlhJbU1sdW5n?=
 =?utf-8?B?VktBMVRQVjFrQUcyOEVZTU85b2trekFySnV0dG1qTTRMa05KeUhnRzk3eSt0?=
 =?utf-8?B?TUZJaXZpejFTdU9oeFdFWmZpdE9OdmFQTkc5UEdPV3ROZ0FsMUU2S3N5QVFi?=
 =?utf-8?B?TVhsZG1lM2VVbTJGZVYyRW5UbGRUNGpxeXVHY0FRRzBJdDVybHE1TVZIMmU2?=
 =?utf-8?B?MzJoYUhiakZoYmhWaCswNDhzRG5zRkVjZXlqc1MweGQwNTBFMHVzc3QxS2lD?=
 =?utf-8?B?S3lSeTdhU0Y5bnY5THlPU0JmRnIyTVUwS2l1amNVRVNiWkFrR3o4RVd4Ukk2?=
 =?utf-8?B?d0N6cWpoTU9Bd0tSbGJpcjZVWjBjWnAxN0hsL095S09hdlZCZ2JacjBzN1No?=
 =?utf-8?B?YXFydGN4WnFnQisrS3cwTW9RZDhKTDJsNUU1ZlhkN09RR1puZUNuT1dFMjFW?=
 =?utf-8?B?V2k0L29TdDM3YnFxak1rNmFGdnNrZjk4bnhoMjBXUmEzRjIyYnFDekVubkcz?=
 =?utf-8?B?cDdJSVQrQ05WcndzU1JLaHlkcHZnNGR1ZzU1ZDZMelRBYXFQS1RsQjhMNkFq?=
 =?utf-8?B?K29Yc2tUZ2l3dHlZSVVRbEFINmdxMTJUM2tScnBFTTZvQ3d1ZDJJVWNyM1Rs?=
 =?utf-8?B?TjNHcEF3WGNiSDRGcVZpL3I2QW9kakFmYkUyMTNpL1V5dXFPRHE1a1Y5UjBU?=
 =?utf-8?B?VDczczRyN3U1eHgwLzVzWVhyOFU2UXhLaUgxckpHdGQ0dFhPc2swNXZkd1dO?=
 =?utf-8?B?RGFwUUhPYkpKa0J5NFlIb1lDUXhNVWhqL2l3emJ5dkw1Z3A1TFY1Z3ZJa2Ir?=
 =?utf-8?Q?XCWEs0Tc6BmsHltzw8WNXew=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe7a1a6-adb2-452e-d2ef-08dced9767b3
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 04:02:51.6074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omwnKBAkm0hcze/gc9WIS4qfke7pZ+TzE3n1LjZ7A9F8Oev9DN5MkMildkH6QunHxmmEuBMMFFRD1DMxWkk+QH5rrtRvxK2lum/ZGPjO92g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10183

The touch-overlay feature adds support for segments (touch areas) on the
touchscreen surface that represent overlays with clipped touchscreen
areas and printed buttons.

Add nodes for a clipped touchscreen and overlay buttons to the existing
example.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 .../input/touchscreen/sitronix,st1232.yaml         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
index 1d8ca19fd37a..e7ee7a0d74c4 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
@@ -37,6 +37,7 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/input/linux-event-codes.h>
     i2c {
             #address-cells = <1>;
             #size-cells = <0>;
@@ -46,5 +47,33 @@ examples:
                     reg = <0x55>;
                     interrupts = <2 0>;
                     gpios = <&gpio1 166 0>;
+
+                    touch-overlay {
+                            segment-0 {
+                                    label = "Touchscreen";
+                                    x-origin = <0>;
+                                    x-size = <240>;
+                                    y-origin = <40>;
+                                    y-size = <280>;
+                            };
+
+                            segment-1a {
+                                    label = "Camera light";
+                                    linux,code = <KEY_LIGHTS_TOGGLE>;
+                                    x-origin = <40>;
+                                    x-size = <40>;
+                                    y-origin = <0>;
+                                    y-size = <40>;
+                            };
+
+                            segment-2a {
+                                    label = "Power";
+                                    linux,code = <KEY_POWER>;
+                                    x-origin = <160>;
+                                    x-size = <40>;
+                                    y-origin = <0>;
+                                    y-size = <40>;
+                            };
+                    };
             };
     };

-- 
2.43.0


