Return-Path: <linux-input+bounces-13529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529DB0441E
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83E6817E136
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3751427280C;
	Mon, 14 Jul 2025 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b="CVJFg0LD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail1.khirnov.net (quelana.khirnov.net [94.230.150.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518FC2727F1;
	Mon, 14 Jul 2025 15:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.230.150.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752506906; cv=none; b=rqUrd/ye0cAiJZ0W0nHNsGe1TmoOTwj4B3hy/xK4CYWkDbEyDilupFFO/GoA4VS5ZTxov1wkZUsXeWLwxDE5OnjWb6X9e5COy1MM3+H5nUzv8IqNAfxlpQFH3RAHCCICGZCtI6QKuplZ9oG/Ovtt3e0EMUF/8XJU5tsgsytVmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752506906; c=relaxed/simple;
	bh=oOZ+zXXrtgE2QAMRfW6IPyZXEHJY2yckp2/zynTwPNM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lGtcBWM3f/kMeMlN1t07ETtoa+QLxbQwtHlkrmdIct+LOXhCFlwDuK62jcAJOvUe0x562dSRGwuHmh5My8GP1UujSLk6SQnJ69hHulMz1qAdA2gsPr8PeOBR8heFgoFrsYtgscy/rGdFXI7XqrnPA2TxR6jcNqAi9Km2oj8O/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net; spf=pass smtp.mailfrom=khirnov.net; dkim=pass (2048-bit key) header.d=khirnov.net header.i=@khirnov.net header.b=CVJFg0LD; arc=none smtp.client-ip=94.230.150.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=khirnov.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khirnov.net
Authentication-Results: mail1.khirnov.net;
	dkim=pass (2048-bit key; unprotected) header.d=khirnov.net header.i=@khirnov.net header.a=rsa-sha256 header.s=mail header.b=CVJFg0LD;
	dkim-atps=neutral
Received: from localhost (mail1.khirnov.net [IPv6:::1])
	by mail1.khirnov.net (Postfix) with ESMTP id E0D153E56;
	Mon, 14 Jul 2025 17:20:09 +0200 (CEST)
Received: from mail1.khirnov.net ([IPv6:::1])
 by localhost (mail1.khirnov.net [IPv6:::1]) (amavis, port 10024) with ESMTP
 id RE9fEx6enYrq; Mon, 14 Jul 2025 17:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=khirnov.net; s=mail;
	t=1752506404; bh=oOZ+zXXrtgE2QAMRfW6IPyZXEHJY2yckp2/zynTwPNM=;
	h=From:To:Cc:Subject:Date:From;
	b=CVJFg0LD1nOrMYi1LtD1ABH/Ersc9XU7P1uVQrkFxNHY5lclByOre3psK8wAASVDU
	 o2k8IH7lN03aD2JkZOE3Eyj60Iyvk9Rhlzly7qmil5RZri1UbUlKUDLQW2/vdvRVxg
	 HiYcW4hJetDfSmU92YjraKY2bhp+kNyU5hlFW12HWRkk71E001CxQhFe4+4SqpMvEF
	 o09cP/WDadIxUFytfS9n+v7LPYb24KHRPMHvvKtGjJ2EjpG143xl1xz/Waeeaz0Cro
	 Xcf7PBJorJMiHXztEBsAXYlV0chmFVFMpPoa8UCmLrWLNYkWO1Ai5lFat8ednAzDVU
	 uuv60XjMHrQcA==
Received: from dev0.khirnov.net (dev0.khirnov.net [IPv6:2a00:c500:561:201::6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "dev0.khirnov.net", Issuer "smtp.khirnov.net SMTP CA" (verified OK))
	by mail1.khirnov.net (Postfix) with ESMTPS id A407E3301;
	Mon, 14 Jul 2025 17:20:04 +0200 (CEST)
Received: by dev0.khirnov.net (Postfix, from userid 1000)
	id E0F39404E95; Mon, 14 Jul 2025 17:16:58 +0200 (CEST)
From: Anton Khirnov <anton@khirnov.net>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: asus-wmi: map more keys on ExpertBook B9
Date: Mon, 14 Jul 2025 17:07:55 +0200
Message-Id: <20250714150756.21197-1-anton@khirnov.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
second version of the set [1], changed according to review by Hans de
Goede.

Now allocates a new keycode KEY_FN_SPACE for Fn+space.

The key mappings now are:
* Fn+space              -> FN_SPACE
* Fn+f                  -> FN_F
* <noise cancel>        -> F13
* Fn+<noise cancel>     -> F14

[1] https://lore.kernel.org/platform-driver-x86/20250702070231.2872-1-anton@khirnov.net/



