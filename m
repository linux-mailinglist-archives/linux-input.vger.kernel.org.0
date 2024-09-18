Return-Path: <linux-input+bounces-6597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E987B97BB82
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 13:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05A8285AC0
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 11:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9AD17B401;
	Wed, 18 Sep 2024 11:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="WOvyJWgS"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A786291E;
	Wed, 18 Sep 2024 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658430; cv=none; b=p0JocOL+H9+2QDCsGuderc0EAu59F1FvY/jsGSfrX10+7z5GYDNiG9PQ0OL6BiOCqPsyvXC4A9v0z5L4q+uSCW6UUWnH2ubjwt/LkXpyawOsgBKPrMDCgGt2waBQ1qnTAbm82o1yrnQi8fk6hREUaUKumrciUKcsI4+jUMAdTvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658430; c=relaxed/simple;
	bh=SLw96prWwdIteeBRdoRGIG3FdJzEmxsR4lzSza+qWHQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=CVe6yEnAui44PG8OyEd2MbrGgBIXoTroaVIcVIui2EC1psH3ZXClO0fjOAWzkmce+nZLZL8t/wOAbzYDfbvRA69qji8R9c5q/qdBdDbyA1UkJotGijzWqcIwVlMcj+Fg/HWdUpNcAS3Uw9XCLkpmNt4jwSKx72G6Li8Dd0njrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=WOvyJWgS; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726658411; x=1727263211; i=markus.elfring@web.de;
	bh=p1wkSFSKtE4Z4FphoxHKWAIzXM+6wnczSz0f0XKIivU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WOvyJWgSmOFbaPxh42YTvRZeeEa+9Cvo88ac7ZSAK3Jf0cxKjT9ZiWnYfACbIoyn
	 nUg2THHJdwtXdIUBKNwbFWhD8UB2Z6YKuXHq5n8YzYUsy1TXqMWtRheBTH2el2FyK
	 RqdPoRAKR5BzrSq3CSWeWsp1txTAMJqhE88wcBhgQC3zKFnPN3NUEDX2FKAK04Fyt
	 iQ8Syw0AsPfS9I8dOsWuEsr+TIdCWIae61KjSbzEtooy/EfBl7JrOld5ejeoS3Qig
	 8wtPu60roZgtR6PMMnM6n9R3fs1WoHf9I19z3iCwx9qu/mImAHRYRtgjJaQEhKCGm
	 WgJjWsPvLk9fCV7mog==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M91Pe-1svo9F0H3O-00CNv6; Wed, 18
 Sep 2024 13:20:11 +0200
Message-ID: <7f75cfeb-9fdd-4d07-827b-0c76d6679689@web.de>
Date: Wed, 18 Sep 2024 13:20:10 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-input@vger.kernel.org, Basavaraj Natikar
 <basavaraj.natikar@amd.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] HID: amd_sfh: Use amd_sfh_clear_intr(mp2) call only once in
 sfh_init_work()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Vm7C2VUrgtVlwQasPdwL6e9fY0uRv22/9f4O2Elq6aOEDOcASTz
 n3g3X+ioW66WN/6bSpUq/dGeGIZBiSUwAMG20NLDfXyZMey5BiwNj1njCb1eAW2S3UwJxWD
 57Rq7TF61HeMvZUvb15utdAaqiuCOjJSWTgorer543zbhwIDhuVNatt2Ize6rmvBdguQm/2
 GmTvbS6F04IpysLy3sVhA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fam81EeyhrA=;1/6nMGXjTv0Rh0GWsiVsX7jx3Sv
 W5ElGb4VsbgXz65EOtvkOs8r4NaEFG8mUrjQgVp9EZ8RffEJho2dH+LSIiPSMID82PWiqAkwl
 AHPmGAAZxvlfnCkQbFMeWiuSove3bwUDpLRbkr7kuwViNHQK5n/ky/isoLnJKqXSWsu2lBe7i
 avtRABRPY/tT3LChNMUg74NuiwLQwHQ2qECzpaIzdNsY3AdUdgB3px+JNuFs26bajetZDvFv/
 /qAVq8OqBBheRZ9IYHmuc4OIu+795U20fq/C/A3Aw/PNZJC37He1rKHOGmqwbYFpxavNbLBPz
 EkWbvWVHyEN2/mqL00Kq/31DgpASpEGtuj2itEJS+zTXeaFcVG+eKzsPQHVi7iXIf/SBwX8vO
 /0CR22UuLc//M+yWuHePTqwaKCk0nF2HY8Rrqm4lAQEbhU92J0XYdo/q2MiKmQJYX+weDjcsj
 hWdOOvbNA5hbISoyiLgB2I9Svmjj6Ztv3zej29i1Zoji9ulT+2EJGcVilc0qrZmr+1y0l/5rm
 UIBnJNnFWC3xvGQsUOK4lbS4p5/AxaiDWaM5pl8rpdgoHZEO0WMCfQUUCwI+QMkcR4hvSKinU
 1k7tUgLMxPyDB/tIKhkCIefgpxy8rhtVyxgWKWKQ0auEFEviEhIm966bUIJPGztsgNv8g5qLc
 8oGz3JTm/8OBY+tJhnK7WFYrenqS5EKmeNjAs1Pn9fEBah9wPdb9LviosfYj84Kp2DtwYI/L4
 /bV6ghb6PiNKiBgm0E4IjA6oQppauEy6/hu3noDYulnSugp1bDASloWio90sXIKWlInYgctH4
 BDrRWNaiSxkE7wOKVH4pRrpA==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2024 13:11:00 +0200

A amd_sfh_clear_intr(mp2) call was immediately used after a return code
check for a amd_sfh_hid_client_init() call in this function implementation=
.
Thus use such a function call only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-=
hid/amd_sfh_pcie.c
index 0c28ca349bcd..2322555e5181 100644
=2D-- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -350,13 +350,12 @@ static void sfh_init_work(struct work_struct *work)
 	int rc;

 	rc =3D amd_sfh_hid_client_init(mp2);
+	amd_sfh_clear_intr(mp2);
 	if (rc) {
-		amd_sfh_clear_intr(mp2);
 		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed err %d\n", rc);
 		return;
 	}

-	amd_sfh_clear_intr(mp2);
 	mp2->init_done =3D 1;
 }

=2D-
2.46.0


