Return-Path: <linux-input+bounces-4313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA915904973
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D9472860BB
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 03:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8402214AB4;
	Wed, 12 Jun 2024 03:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="OQ7cf4T+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA67257D
	for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 03:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162473; cv=none; b=u+536NAHH7a0zJ07/cu+M2iMsG/WLTtEotYqqEmTVVl+qk4wLoECjnVZqhNu8HKYa4wd5rV6YFXrlBZ6LqH96T5Isp5a6TJYbsicE1dlq7WzQs3zkli+DrGGnA5EHFhA6UnhY412jnHyx5emC14BwP1m1czjm5Ybj0mYDyYJP7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162473; c=relaxed/simple;
	bh=xoraK43U16pXlakxdHI1pgYWCBDNzBssPxameDeDePM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YVhdnkq6cV0QJvfrDP8tvvuJs+ROKk0E31JrFssFTnBWKyzQHLtSfj9Lof+8HH9svLw8SqWyGsaa1UZMbw7YieZH1SkdcciEAUYVz0z4NEPLR8ak4EEcz4nEwlwJbW9CM0t2wxpT+NS3O6Cs8Gto6Hu4MgdDmPsYF81riJQnMmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=OQ7cf4T+; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1718162461; x=1718421661;
	bh=xoraK43U16pXlakxdHI1pgYWCBDNzBssPxameDeDePM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OQ7cf4T+ezoHkxugoTjXFGbL/7XU5YYbdCLpT+YpfPoylRZ7MH6zbOCpA1WovWgR/
	 V8kDC/KQgIe9a2rc7PBZsPwrldsQxKehqGz49jx67/tdoOpEsJKMgJGyFTuTpC7k7U
	 MXCkz/9q0bsJwNgVkVtS96+ICSkkvgEmIYMa452kBAOp1NuaPzcdagl+q7e8dqHpfX
	 vSBnyScC5b66E+GgGJxp3hpLS3WZ0nm3W/6OWTbx9ke3D7qrKgbn140hEalPCSVEM8
	 A4wqGH3BW6h6LAFaFzv+mEA87iQJPR8a4Lz4cgppLp3XLLN5avkX8iweaPGYc2SeGM
	 3aypE1wsaDX7g==
Date: Wed, 12 Jun 2024 03:20:55 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/3] Add support for Imagis IST3038 and clarify the usage of protocol_b
Message-ID: <20240612032036.33103-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 30ee4ca33747296f4316c28bf11e4877e14966c1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 is another variant of Imagis IST3038 IC, which has
a different register interface from IST3038C (possibly firmware defined).

Unlike IST3038C/IST3032C, IST3038 has different registers for commands,
which means IST3038 doesn't use protocol B.
Similar to IST3032C and maybe the other variants, IST3038 has touch keys
support, which provides KEY_APPSELECT and KEY_BACK.

Add support for IST3038 with touch keys.

protocol_b is a property, which tells Imagis panel to use a different
format for coordinates.

IST30XXC series is known for using protocol B, while the other series
aren't. Note this could be confusing, unlike the model name implies.

Adjust the usage of protocol_b to avoid confusion.


