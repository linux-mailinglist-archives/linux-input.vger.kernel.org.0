Return-Path: <linux-input+bounces-3986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DE8D61AE
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 14:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EAC31C23CE7
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 12:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70691586CD;
	Fri, 31 May 2024 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="ZuTSZMJe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2F39FF3;
	Fri, 31 May 2024 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717158343; cv=none; b=GNaWJVw7e2M0N/UctZhd+v3q6BkjFfAkDBL7WbcimOSplnAS9aaQHAJL+Ez3vatMsvKi/oBZQPsMBBgAmc/NbFZLbgDkHAkBtjmOsD4SnKwOVZU76mpOY/tKp7hILogWIpCgSEotHuKNO7JnqN9/wdYe6Vj1Xcl7azlcrOO0cbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717158343; c=relaxed/simple;
	bh=j3zELr11wAr2T/LDeGR4AWOm8DUZXiiI/tAHtsZJGPY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Cc:Subject:To:
	 References:In-Reply-To; b=CcdDjGYXDFCfV5xFavtaXGSjFX8VyjV/OLihfAwD2CI+mprW31huf/AxqbhgHKIaj4V7ckw5wsfWm6lFJkUUsNKdnGKH4g0MAm1fD88YxYAbtS2dT6O3Ph5uk5jL3NFa+f5BsfVFfmQH8GYIOPeq2KG3iKpO1KT4rrgnMKXhxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=ZuTSZMJe; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1717158298; x=1718458298;
	bh=j3zELr11wAr2T/LDeGR4AWOm8DUZXiiI/tAHtsZJGPY=; h=From;
	b=ZuTSZMJet4i9VeXGsgo6zjXsySY2GbUUibTJC7Ft3KWuulP+uEAjcRIVaR7yd0rWS
	 pQZiAX0yX3t2C3tjqCVbpjVj9Sgj+CmTwmtrE4qai92Ft1BH9smPUNoxQjFj9NVfQ5
	 cClmSeUjBJTEOfUUCJBkkFBrvjf1IB+hRpV5DHwInaGLREbDFNMjvLdb3IQuNJnjUy
	 WA+sFZEZgggocfo044c45cOFkBnjadDcFtKkHthi3QDR+r3rMmv4oet2gA39RuBNjr
	 Q/46nAXZ2whnqDJoo1RnF0cewzUE83si5m4xubDbf1tFChkiImtzQqlIdtn3Uu0q+4
	 HbD8YLenRzV5g==
Received: from localhost (koleje-wifi-0030.koleje.cuni.cz [78.128.191.30])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 44VCOusK091417
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 14:24:58 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 31 May 2024 14:25:35 +0200
Message-Id: <D1NTTT150IQO.CG5KVUTS4BU7@matfyz.cz>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>,
        "Liam Girdwood"
 <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        =?utf-8?q?Duje_Mihanovi=C4=87?=
 <duje.mihanovic@skole.hr>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v6 2/5] mfd: add driver for Marvell 88PM886 PMIC
To: "Lee Jones" <lee@kernel.org>
References: <20240504194632.2456-1-balejk@matfyz.cz>
 <20240504194632.2456-3-balejk@matfyz.cz>
 <20240531102409.GB1005600@google.com>
In-Reply-To: <20240531102409.GB1005600@google.com>

Lee Jones, 2024-05-31T11:24:52+01:00:
> Are you planning on seeing to Mark's review comments?

Indeed, I'm hoping that I will be able to send it over the weekend.

K. B.

