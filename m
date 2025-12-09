Return-Path: <linux-input+bounces-16506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BEECAFD08
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 12:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AA43302628E
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 11:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57F12E0417;
	Tue,  9 Dec 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=q.tanaka@gmx.com header.b="tW93z8RA"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234972E0406
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765280581; cv=none; b=JL/AyHVtRBhA2AOt+FIgaQtlHo4yeywhn0cgGviyGURU+mw1UMZ6gHsiiON59tE3H7+oD8fIezjwE/9BRXVV0T6sCOGCMdxw6EERVvVP27ai6ihHY/+NPxLryFGFEdjAnB/Z3a8lCwdarZwuAUZNloxqZLSw1+8AmpxOrIcEiuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765280581; c=relaxed/simple;
	bh=uNEyN1pid2b6ypWoaYEFomutWg+Fvsh9WkaMjm+aE7U=;
	h=Date:Message-Id:To:Subject:From:Mime-Version:Content-Type; b=BnvSpVSej1Q0H1ERkcuCviuF80MHRvNOyH8JigTqITbJ9eXEYg20UMvMrkvTC7bTPaZ41hUq+qVPI/tJbzeBISb1WBECQSaWSW9SPaUBHj6gsEy4HqvmQD9h3ynmBNux/qIK6PygL4PV0tPICOkuxP2sVBx+gZ+xOfeYCq/GknY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=q.tanaka@gmx.com header.b=tW93z8RA; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1765280577; x=1765885377; i=q.tanaka@gmx.com;
	bh=EJaMx06KAbIQFKW4fMY4TwMk3+ATJjOcUH2V/SPtIPs=;
	h=X-UI-Sender-Class:Date:Message-Id:To:Subject:From:Mime-Version:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tW93z8RAcT2xrt4CbmR/fS7+9e0UQOdWwPRajT1It0aGC1zLA5XLQ+zpTYVtP0GN
	 25WMgP3eRlDJcM9bg4WPjfDF+97sr7owuoouVtMuWZb7IvWF6Z4+1keo7FKGpcQWH
	 T52dimLfkXOx0WYVg+lMIFE/oikUZgBpXidBwbY5pOGgU0ERlaf8pmdRNTzUzjFxl
	 poClwd7Yer4/pnMABCywskM2clCQAFca87dLBau5AyZCMmNLUTNdw1njK9HETXA1T
	 okfGAmDu4Gh2vh/Lu5D7vgehMJVwi62g3G+AgTj1WVCEtrA5dnHG2VMhcQ1ND1psj
	 oeuNttmDS3ZnVvtbaA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([180.11.86.228]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1M3DO3-1vS6dp2OVx-008pge; Tue, 09
 Dec 2025 12:42:57 +0100
Date: Tue, 09 Dec 2025 20:38:55 +0900 (JST)
Message-Id: <20251209.203855.2206306135633660546.q.tanaka@gmx.com>
To: linux-input@vger.kernel.org
Subject: joydev/xpad.c: Add the pad "Nova 2 Lite" from GameSir
From: Qbeliw Tanaka <q.tanaka@gmx.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
 boundary="--Next_Part(Tue_Dec__9_20_38_55_2025_347)--"
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DPCgz2ahsd5KwZso4aQzzxSP4C1Ga3Vd6IuCz2zeJrPOviRxIcq
 F8TcGs3MSKePN+MRg0QqlP0rJDxkTzi98UxMlpdJxaIqV+HUNP6Jz7WgLLMF/ecYqSiqO4d
 X8b0EFLmgqAXU0RSbJ1Hl7AA9bgVlvHlnFG17CnXMDePvUEzNUytNzWD+Ofqawu55VAB9u5
 KSIA92Mg2m2R+SPhy73cA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ctwKMvCUhDQ=;uhkSWh8eZQricoDN+0Hr9zJRE7E
 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
 JNabfjVU=

----Next_Part(Tue_Dec__9_20_38_55_2025_347)--
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

In xpad.c, the gamepad "Nova 2 Lite" made by GameSir works as an xbox-360 controller. I attached a patch. (Sorry, diff -u format, and you have to cd drivers/input/joydev .)

You can use this tag:
Reported-by: Qbelio Tanaka <q.tanaka@gmx.com>

Thank you very much.


----Next_Part(Tue_Dec__9_20_38_55_2025_347)--
Content-Type: Text/X-Patch; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="a.patch"

--- xpad.c.orig	2025-12-01 19:46:09.000000000 +0900
+++ xpad.c	2025-12-08 16:59:39.789039265 +0900
@@ -419,6 +419,7 @@
 	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
 	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
 	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
+	{ 0x3537, 0x100f, "GameSir Nova 2 Lite", 0, XTYPE_XBOX360 },
 	{ 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
 	{ 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },

----Next_Part(Tue_Dec__9_20_38_55_2025_347)----

