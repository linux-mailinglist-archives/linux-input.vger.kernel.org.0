Return-Path: <linux-input+bounces-6020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2579662D4
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 15:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DEBB1C235EC
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 13:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFF8179652;
	Fri, 30 Aug 2024 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aloisio@gmx.com header.b="FGk9kxuC"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5D8199952
	for <linux-input@vger.kernel.org>; Fri, 30 Aug 2024 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725024245; cv=none; b=AHUAq8GN8oaGhAwcv3I7MMdxEbLF9JEQQFOrA9g1sheYK/k4MtBrdIaiifeEUOED3jdRP+lW7N7dJThmy+Jl0nYEkv1aSOpu7+/w9H38SnumyWy/IMySLg9afeQfiwk3weKnOq/GDD3k17TOM7M+5Rhzr0Ytk5qkukrAlQIRqw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725024245; c=relaxed/simple;
	bh=alkXXliIvrPqNJdORoYbqa2xI4tj+lKeqJUtmJkDRyc=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date; b=ck4fG31oN6Bw1QG8yOrxTUxg8sINcwEQFqaxU/ZMsA53P6f1XIveFePe4PPh/Ct5y4SpRaDUrrbnVfMZHe4HbAabDmR1zzLK0Itc9/2WHxVCLNB6EAlxkR1OW+OIg1+1qB/2W4G4h9d85GOf2M2DtbHg8xHQ95tyJGOrchaRLvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aloisio@gmx.com header.b=FGk9kxuC; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1725024240; x=1725629040; i=aloisio@gmx.com;
	bh=eHLPMZfKiucgpaqQjfGORBQpODzvnsnoabaYsRoXsEw=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=FGk9kxuCgxnNIc84Q3MgNHJhr+46iTmsAV82dJkUwSR31zMNao9moxPlCNbllegz
	 iR6Lga1lcxlxxg8rr9svyLxDwGAOMBdTAMIDuL06lovNmkwGdaNSDNgLM9Zt9x/V+
	 rFH7H+ZhrOGDxOfTgWwRUtvSUyRjOhxp33GsB3r2iv4eBiT5jpVYsKHj900Ie9TkA
	 7Jl8SK0Dsk6Js7a7rPchfyBtvQkFWPYwbg9qjMybHZcyHLZY+lYYvI02A7dqtWFFA
	 dkMnHh3HLeflXponE4Kh+Q/yxib8lZFRkuvqWkU5o+CqawV6cR+/LhyeKSDDyFNwE
	 LNs1EHvwBnum2i5ngg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.104.255.168] ([80.104.255.168]) by web-mail.gmx.net
 (3c-app-mailcom-bs11.server.lan [172.19.170.179]) (via HTTP); Fri, 30 Aug
 2024 15:23:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-449b8dc4-ceb8-4098-ae8d-74fcdedb9d04-1725024239914@3c-app-mailcom-bs11>
From: Luigi Baldoni <aloisio@gmx.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>, Stephane Chatty
 <chatty@enac.fr>
Subject: Lenovo Ideapad and hid-multitouch
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Aug 2024 15:23:59 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:HwhN7foJbLgY698/fo4FDaImOQaXXtgk48scTbVlNbF84uyB8ss8FIYq5AwRTNaAn1MzU
 N4eP8Zp6D1c4jikgIrnC/W2pBY0Mom6hkdPA9bOzGB5vf38sCRX+5fGAWGyVTBgTBCpWujhp8Kdk
 hbs5qHIRIrmpoAYnM6gUf5+G1v0YX6yShsEz6BPGxDDh4VEexiWVNQ84GmXsb5jjlrjKD21kZ/l6
 tgocE2FwKHPWd3ynyCdLNQN7Cy3i4PhTu8R9gxa771Ol0jkwCnewgct68XVZR3cGr96aCV1vmcXp
 18=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PGz1iTtWlbo=;x87ldu21kGPIL7P2qFXTisXNoGW
 OV58fjrung7V6qcY60rGiFBltDPlFRB2PkFWCJ1mEAelxQDbaGYn9SGIPPlOaKTksVNz1FpEH
 rtgg/QxRlYOLiiDpXhso/JVuetup0Biq2VPf/XPvHPt4V7AfNKHtpOWbkPVsoorduJ3QGkcJW
 2w+9ztreVQ/wGdTILEnAnzsiVGGaFKHfpwpemvYLP8BZvJNAvB+OSSm0zPkhtjni5sHLVA7lU
 bdpzQJZ7b24FzO4CArcOiBedArOrJ337wGMFF+b7LoclOZ1r2tovcUcredVIIM1mP6abr2I8d
 J8RAvoeSSQvRcORjwndZQO8aA8aTpXYlKG1oMJF436iMa9LwL+WBaJnPYVOxnPLgI+CD3+lGY
 yFHFrVGCGdl75zcOOu7YmtX9M309UVM7NhCN3PMga69GUKhY+dYjswZxn4QI2kHnw4TmaM7+9
 qGAx2hzaQnqLJqrgEljWNIuJgfAtQFV2zdsTJJrBb2eFuhSOGq9ntE+UL5VLGi84v1I8MkB37
 KYQFafWeIHjgKOI+z2XJvSSSEV0nVZqyMtILKxz5KCaQjB0SHjFDCG5vHE0Je3ARegobwtwKX
 iViWUAA7qdWqOEREGuVEw5M2aDasNL6nz9n28lUxiIR0OsTTOpW8rzVdsDqJcGOXCvy4YxaTC
 cQekH5S1uTXlwXr3SEjQNvIfEFTWEcQhA1ARn5HKBQ==

  Hello everyone,
I've had a problem with the touchpad on my Lenovo Ideapad laptop since buying it, namely
it's way too sensitive and this results in fake clicks and jumpy behaviour overall.
Libinput people told me there's nothing they can do (https://gitlab.freedesktop.org/libinput/libinput/-/issues/946)
and referred me to this mailing list.

Do you see a potential margin of improvement here?

If there's any further test I could run or experimental drivers to try, please tell me.

Thanks


