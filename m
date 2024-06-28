Return-Path: <linux-input+bounces-4709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA0F91C4B8
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 19:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0FAA1F232C4
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19701C9ED3;
	Fri, 28 Jun 2024 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="kbMcgn20"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8D1DDCE;
	Fri, 28 Jun 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595290; cv=none; b=osuwn7nF7t3PAJCqUfRDidNrkf8PYO4VXnqDqmNC43GrFbbs8MdtlsQhYWAuWM8Z/ZbKA94kVomYfk24eujupznGoXO8s8ATXBF9IWnzFijimixTPvq5dEV7IvJ2LvmHbKO5wXyjLJQQ7BDO85LEf/hGep9K8DXO71zh0QZmSYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595290; c=relaxed/simple;
	bh=NbOS8wtvU7uKZD7BIvMjlCuVnUcuWUyNlr4dVg1GJ5w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=Whx5V12RGS9g9fMMhYdmsOzqLNBfD9INUISPaM0rdO2j8sKPD0VSKShirVXnN4O91f7cxwhDL9XuxjZtYV75+VujXaqrRCS4WVklAmnF0RDdu/+J4TL5B8gHMv5E93hRfwPHP7Kpn/1qR/iBGzyIcZFmsW5bmJGx2kZaCyOlq7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=kbMcgn20; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1719595214; x=1720895214;
	bh=NbOS8wtvU7uKZD7BIvMjlCuVnUcuWUyNlr4dVg1GJ5w=; h=From;
	b=kbMcgn20SSqY+/JxddiLXwHe9sRBJ9BKqp4uHpNCQLh5PZrbZvIQO1XMKrGNPI2PT
	 HpY0OkPKM4Ui8kXeCfb1+coH564dkDDw6PkYgz6EkKrSWIh1TNtu9LryK4YUuzb1a4
	 9LBh6/yHSWk+3RqJjtVf8iafrA4dSQFqerg7nD5eRfhMJbbfswm9us0YK7jrzY5dlr
	 bZCM6C6Vv+kGGfBI5WA+olaLCjIVuoFMEfSoQkxuhkagIsOwjZGbqg8kOklomUq0OP
	 3My/2ZHjF+yi2Nc1qL7dRtCXCFihkSLm6X8xKW9kyfOF/iD0nyhI2XMioUWg1En8Md
	 u7jQLsnSNXIfA==
Received: from localhost (cdwifi-a110.cd-t.cz [213.235.133.110] (may be forged))
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 45SHKBZq057515
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 19:20:13 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Jun 2024 19:20:50 +0200
Message-Id: <D2BTN4CHSFO0.1H59EH2PH7HAG@matfyz.cz>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v7 0/5] initial support for Marvell 88PM886 PMIC
To: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20240531175109.15599-1-balejk@matfyz.cz>
 <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>
In-Reply-To: <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>

Lee Jones, 2024-06-28T15:41:39+01:00:
> On Fri, 31 May 2024 19:34:55 +0200, Karel Balej wrote:
> > the following implements basic support for Marvell's 88PM886 PMIC which
> > is found for instance as a component of the samsung,coreprimevelte
> > smartphone which inspired this and also serves as a testing platform.
> >=20
> > The code for the MFD is based primarily on this old series [1] with the
> > addition of poweroff based on the smartphone's downstream kernel tree
> > [2]. The onkey and regulators drivers are based on the latter. I am not
> > in possesion of the datasheet.
> >=20
> > [...]
>
> Applied, thanks!

Thank you and thank you and everybody else for all the feedback and
reviews, I appreciate it.

K. B.

