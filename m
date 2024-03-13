Return-Path: <linux-input+bounces-2367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D480787B40E
	for <lists+linux-input@lfdr.de>; Wed, 13 Mar 2024 23:02:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 123D51C21009
	for <lists+linux-input@lfdr.de>; Wed, 13 Mar 2024 22:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0145654BF4;
	Wed, 13 Mar 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicksendemail12.com header.i=@quicksendemail12.com header.b="iJ5CQPGK"
X-Original-To: linux-input@vger.kernel.org
Received: from quicksendemail12.com (quicksendemail12.com [51.38.114.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF42854BCF
	for <linux-input@vger.kernel.org>; Wed, 13 Mar 2024 22:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.38.114.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710367328; cv=none; b=eUM1E/3ULvLDu3GevBx5NeBUbVVfFyn1vVAYb7pvRm26PLPsSKAtm3z1sQS+nUPXpb8ETSi7iZeZHQn3FvSUV4FAVUGI2p1cUlujUVHgKrglfL/ZP048NP+IyMmiHrsQyYqw3hv+VYkcF5OhaiOD6LCNfRcdAf5EvT/QQCYdmOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710367328; c=relaxed/simple;
	bh=Q15fz6lzzNe4EYwFl5FQjiNsdVb8Y8Mc2ihtRAeMMGA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ig9tpvOk4UfzAuTqw9BuhlFFGpRxmk4B/1FdbLipcs/VHz5/m8Fo1OWYMYk/1rpU7zV5ucvY7AvuSbCEffnyL2n8WTUc/Ax4XjG/3BZqc2Yd8428lTY5/rrkZN+WI8r5VBsNJFWCn8TwwT+8wN4/zmLsDWkPZWxc36tO/lJ+GqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=quicksendemail12.com; spf=pass smtp.mailfrom=quicksendemail12.com; dkim=pass (2048-bit key) header.d=quicksendemail12.com header.i=@quicksendemail12.com header.b=iJ5CQPGK; arc=none smtp.client-ip=51.38.114.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=quicksendemail12.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicksendemail12.com
Received: from 198-12-114-80-host.colocrossing.com (unknown [198.12.114.80])
	by quicksendemail12.com (Postfix) with ESMTPA id 189B31406D0
	for <linux-input@vger.kernel.org>; Wed, 13 Mar 2024 21:43:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 quicksendemail12.com 189B31406D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=quicksendemail12.com; s=default; t=1710366239;
	bh=Q15fz6lzzNe4EYwFl5FQjiNsdVb8Y8Mc2ihtRAeMMGA=;
	h=Reply-To:From:To:Subject:Date:From;
	b=iJ5CQPGKmAomZgLJ1FrTyURWRFJ3gMyjbilMF7dN1KIB1mYEuH1h5gvuS564mJaIN
	 0xDoAmO1TGU6Ate5NAXciymUrcghvR+Kdmd06wQuD/gih54LVuhYUC7Y5mN2o8LO6A
	 gVU1tvFOwFJD2eAJO1+iCbBMKo5Cu2fTpVVtITlpim2s8Bn6bMqdQNkTbz0FRONSIB
	 HG3XVOf8uRyz+pNODYUbDVVL97UIGg4Uti7w8AU1RdOaJ/Ny5wGU7/iyCfHtFsLODX
	 1h/qsiZ397h6o/OcPW7AXSzppW+C3T+3xuFWkElgI5wIcIGeGfpcKF0R+J/MFEEk1j
	 gwcJEMSOOWliA==
Reply-To: info@gscommoditytradng.com
From: Aminda Sebastian <info@quicksendemail12.com>
To: linux-input@vger.kernel.org
Subject: Enquiry
Date: 13 Mar 2024 17:43:57 -0400
Message-ID: <20240313174356.13A261FC58D0F2B8@quicksendemail12.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Good day .

Please email us your company's most recent catalog. We would like=20
to make a purchase from you.
Looking forward to hearing from you.

Aminda Sebastian
Purchasing and Quality Manager
GSCOMMODITYTRADNG S.R.L
Parque Empresarial V=C3=ADa Norte, C. Quintanavides,=20
21, Building 5, 28050 Madrid, Spain.

