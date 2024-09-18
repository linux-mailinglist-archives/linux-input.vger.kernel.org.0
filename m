Return-Path: <linux-input+bounces-6600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02497BBD7
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 14:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A7A2B2301A
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B44018594F;
	Wed, 18 Sep 2024 12:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="DQyEe+/6"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3B017837E;
	Wed, 18 Sep 2024 12:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726660839; cv=none; b=oxzoRY3BPoJbhz/tI+rpGiJEmap7Brlr72bVwUphdwgBzexBQLc7XbTthwDjUpdkiCrvTLfgD+p0NNuOvkZyPO/JW/20Q4k+mg6irZOamAXwEFftyQ/xjykzSN6ndZbWIYIjtH9Eh78NiCPNWS9MLvmnHKC5qWmmqGLMKRorr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726660839; c=relaxed/simple;
	bh=3tR/IOeSqrpHFyvBhs8OnciF3zB7uP8uP59YMBjOgOE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=I69rgDjt0Moes9YdwA84LxYFTR5MXz1L0LtZTcggzvkfnC3QTZEGnzv+1DFD/m3bdIUF+L3HR1EHLJXDvw7+K4RRiLbWS0JAy/K21YjGLT3YQ3fmjCn/k7W2xfTUD3Jw4a3oWLiyIY9qnAncUMGi2vwd+YBAf4E/WAWEOqNBfLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=DQyEe+/6; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726660820; x=1727265620; i=markus.elfring@web.de;
	bh=frAse2uYJkdGq/c/XelvrZMT/tRnxPlt0GMx9SfWw9g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DQyEe+/6dWyb/tIrNge0l5oZV+pS33y82ru/3rUGlEZ5Wsk/u6qtdcW0mTdbYn2k
	 5AzDAaplbz6Rte+Fh7KzgeH1OGG7iD8nYfh9Hh2WauI39/HoMBiqNBdgy8Mg1J3dx
	 S6tsqcFs3VlTTY82tY5+ZOM9raNEB6g2sDJ9Uc9R/8/t7esfTkTeb5SVv73+mtFIN
	 wJiICmIYByo6tspXBrpTpp5HOKV+1I1AU0nrGVAx0F36pezW35mtojVgEygZ+OMLV
	 ERUBF0JMHndcjm6ULK+nSYsajWxiCw+FlgOrSq5o/NA6kmVR9uYEvNzBV6x6epS3e
	 kJfj2pIND9ZB3z6J1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N7xaR-1rvGhL0Khv-00tFEP; Wed, 18
 Sep 2024 14:00:20 +0200
Message-ID: <d7dd0c6c-a840-4a90-8b80-b1cb36941bf6@web.de>
Date: Wed, 18 Sep 2024 14:00:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 David Rheinsberg <david@readahead.eu>, Jiri Kosina <jikos@kernel.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] HID: wiimote: Improve error handling in two functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KpOrsgrjp0wkaTr6Rg//Yrv7t60FVGMZLJXkLOmvmnua+w7Qjx2
 uAY43psf3aKTYSh2vx24C9mPj52G0Yc2WUif1iOlbFV/oVYhYrH3gkR/BOVjLuVy7HuhKKA
 goqsOFIBIWNuSyw+ghrVTwssNLZFZsGnQkNIIQyWAC89fGDoi35KF01l592Y6dAPXo/N7+S
 WVBdaZuwRCMFtEmObee9Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nfc8sSsvyNY=;2HoQQf17aXMW2qIS7Yo3FE2M6JE
 2RzPqM5VZ3eZJVn8FVQg7y0Lt4VSIz/Mc8Qi/BVwb4SrZK4h28i0E/AKKa6rZlchccz2hYIos
 kdvrQogNFqp5AlDfj/P1CwvV4gWIPBRQFdRCfDsElKRCoVno9ymoJ4iAWLXrHCqnd//ooL9Jp
 cn4boLxqYYMQp/yXxN1CJjdT6hxwD5RKB202eugBGLg0waari8sQ4R7vVUm7WJDp97x0RyxHv
 egLFRZkgy0upDPBZ5Yd2YW/vYV3CsOiz5yHWB24hk30z7w3e+MN9XC2LLSxYjVbvhjq/XneO8
 6aZfTlML1YAwAvhnRGUnBxEkjoLbjOAsTxPtRNMP/O6SSBf7YpFtvvD60hCV8xLTZlmZWZuIe
 bdvDoEK4An2wT8YTzzdB0PU5Z50Js4pcjP1Z9r6g0wy3FoVHI30cZPGXpX9PmOK5dw48l84kJ
 I/djwwlJ87h4hI4hq/H8XrnZh9ZJqd+eKf9rnzJKBCn6E+rJz8Sj2LUs3USEEDYEYsuhi6u92
 64x3C52y37AnDdylsaWHjcrV6xmxUuUTWTMW13C+RmQP1OWuH8lQVoXugGp+DkBbO82lCdXH8
 zOMPGcp/KJYrX/sJP3IJfy0JrMjSiskv96zEIEs5xIqO0Kf7ZkQXJkHPnzrg4/NDxMPZiGB6F
 eWQUFArq4U29ZUi9WCP8DnklORa1xNkGB33K9tLTbn6Q3/BsVCxkHG8eSU2NCqoWadAmBCTEI
 Rx0DC7QWPDeh6BKPUezOdg4jhx6BSBDNs3csOg10nLuQRcia+pgM0Yk5uG1HycOSupt4nWxgP
 ZjlNcybYfHQNHVuakan0LvlQ==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2024 13:51:29 +0200

Add jump targets so that a bit of exception handling can be better reused
at the end of two function implementations.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/hid/hid-wiimote-modules.c | 34 ++++++++++++++++---------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/hid/hid-wiimote-modules.c b/drivers/hid/hid-wiimote-m=
odules.c
index dbccdfa63916..3c10b1c68984 100644
=2D-- a/drivers/hid/hid-wiimote-modules.c
+++ b/drivers/hid/hid-wiimote-modules.c
@@ -1424,15 +1424,12 @@ static ssize_t wiimod_bboard_calib_show(struct dev=
ice *dev,
 		return ret;

 	ret =3D wiimote_cmd_read(wdata, 0xa40024, buf, 12);
-	if (ret !=3D 12) {
-		wiimote_cmd_release(wdata);
-		return ret < 0 ? ret : -EIO;
-	}
+	if (ret !=3D 12)
+		goto release_wdata;
+
 	ret =3D wiimote_cmd_read(wdata, 0xa40024 + 12, buf + 12, 12);
-	if (ret !=3D 12) {
-		wiimote_cmd_release(wdata);
-		return ret < 0 ? ret : -EIO;
-	}
+	if (ret !=3D 12)
+		goto release_wdata;

 	wiimote_cmd_release(wdata);

@@ -1460,6 +1457,10 @@ static ssize_t wiimod_bboard_calib_show(struct devi=
ce *dev,
 	}

 	return ret;
+
+release_wdata:
+	wiimote_cmd_release(wdata);
+	return ret < 0 ? ret : -EIO;
 }

 static DEVICE_ATTR(bboard_calib, S_IRUGO, wiimod_bboard_calib_show, NULL)=
;
@@ -1473,15 +1474,12 @@ static int wiimod_bboard_probe(const struct wiimod=
_ops *ops,
 	wiimote_cmd_acquire_noint(wdata);

 	ret =3D wiimote_cmd_read(wdata, 0xa40024, buf, 12);
-	if (ret !=3D 12) {
-		wiimote_cmd_release(wdata);
-		return ret < 0 ? ret : -EIO;
-	}
+	if (ret !=3D 12)
+		goto release_wdata;
+
 	ret =3D wiimote_cmd_read(wdata, 0xa40024 + 12, buf + 12, 12);
-	if (ret !=3D 12) {
-		wiimote_cmd_release(wdata);
-		return ret < 0 ? ret : -EIO;
-	}
+	if (ret !=3D 12)
+		goto release_wdata;

 	wiimote_cmd_release(wdata);

@@ -1546,6 +1544,10 @@ static int wiimod_bboard_probe(const struct wiimod_=
ops *ops,
 	input_free_device(wdata->extension.input);
 	wdata->extension.input =3D NULL;
 	return ret;
+
+release_wdata:
+	wiimote_cmd_release(wdata);
+	return ret < 0 ? ret : -EIO;
 }

 static void wiimod_bboard_remove(const struct wiimod_ops *ops,
=2D-
2.46.0


