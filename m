Return-Path: <linux-input+bounces-10342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AD4A44272
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 15:21:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B611A1881C77
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 14:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E69720F076;
	Tue, 25 Feb 2025 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="XNJXo7Ce"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDEB256C62;
	Tue, 25 Feb 2025 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740492960; cv=none; b=WSncl+DLGXVUjxHDvraJHxpp+c3QSVblwu3e2WdTD/K42KiYhCV7tEa09jlbcbwII5bV8Bro+2D3Nhd7MMt0fjIq6+GHd5v16XYdStdv0uObq3aOzXrcRcN74v0mv9UJ5EO2hV8ICoq6bJvsKi7rpxk3fhu4drer8ViWUCHKHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740492960; c=relaxed/simple;
	bh=7HGNsoOe7a343v2XLXWbyMjsn29tQHWh8GwQaE3GIPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blJHxwFD9EXNKcIymjB9hiBP8FgKHPbM2aGF00fFE4mB9x2M7MBjITdpul98/nTSQG3MIeIaWStl/fPqvp1/7iZw0f/m7nVb8db/lBCBG2jvnze+R7NdBShGqcgXP5jWpPZAP8ZKYTJQhrCgGpOh7BwMtYEJB2V8lLoFNvdKVjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=XNJXo7Ce; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id E2F332E08A04;
	Tue, 25 Feb 2025 16:15:50 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740492952;
	bh=7HGNsoOe7a343v2XLXWbyMjsn29tQHWh8GwQaE3GIPU=; h=From:To:Subject;
	b=XNJXo7CeWNO0QRudVo2lZ9XNNmiHhaIcO0ymhXQMZsuwHHSnfCXs4Wv2Er+Hs7EGV
	 x81kSNUkhwt1fL/KT+1jAIvjia3BtVhyaK7KANPjRmdz5NYgYcudvTgzBZsfjhMzhr
	 /dohhnff2EUPgDihbleIOGI5jUQBXev44PlGmmiY=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: luke@ljones.dev
Cc: bentiss@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: RE: [PATCH 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
Date: Tue, 25 Feb 2025 15:15:49 +0100
Message-ID: <20250225141549.11165-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225081744.92841-3-luke@ljones.dev>
References: <20250225081744.92841-3-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174049295187.4817.13207375220037046238@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Luke,
setting MCU powersave too close to the boot-up sequence can cause the
controller of the original Ally to malfunction. Which is why you created
this little init sequence in which you call CSEE manually. In addition,
MCU powersave (which is called Extreme Standby in Windows and you named
incorrectly in asus-wmi), causes a very large 8 second delay in the resume
process. It should under no circumstance be set enabled by default.

Users that want it can enable it manually. Following, distributions that
want it and lack the appropriate configuration interface can use a udev
rule with an 8 second delay to enable it, and then, the udev rule should
first check if mcu_powersave is disabled before enabling it. This is
because writing to it even with the same value causes an issue regardless.

Therefore, please remove both parts of it from the second patch in your
series and produce a v2, which contains no hints of CSEE. When you do:

Suggested-by: Antheas Kapenekakis <lkml@antheas.dev>

Following, when you do finish the new Asus Armoury patch series, please
rename MCU powersave to extreme standby, and add a suggested-by in the
appropriate patch. Since to avoid user confusion, the names should match
their windows branding.

During our testing of the controller, we found that the lack of a delay
causes the RGB of both the Ally and the Ally X to malfunction, so this is
a small nack for me (the old quirk is preferable in that regard). But then
again, this patch series is not getting anywhere close to our users even
if it is accepted, so you can do as you wish (given appropriate attribution).

Best,
Antheas

